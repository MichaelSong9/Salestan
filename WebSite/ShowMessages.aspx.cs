using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ShowMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Messages");
        }

        if (GridViewMessages.Rows.Count == 0)
        {
            Response.Redirect("~/Messages.aspx");
        }

        DataTable dtUserName = new DataTable();
        DataTable dtOtherName = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_messagesSenderReceiverInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda.SelectCommand.Parameters.Add("@OtherId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["Id"]);
        sda.Fill(ds);
        dtUserName = ds.Tables[0];
        dtOtherName = ds.Tables[1];

        if (dtUserName.Rows.Count == 0 || dtOtherName.Rows.Count == 0) //news doesn't exist
        {
            Response.Redirect("~/Messages.aspx");
        }
        else //news exists
        {
            HiddenFieldOwnerName.Value = dtUserName.Rows[0]["UserName"].ToString();
            HiddenFieldOtherName.Value = dtOtherName.Rows[0]["OtherName"].ToString();
            Page.Title = "Salestan: پیغام ها : " + dtOtherName.Rows[0]["OtherName"].ToString(); ;
        }
    }
    protected string FormatTrStyle(object Unread)
    {
        if (Convert.ToBoolean(Unread))
        {
            return "background-color: #fff9d7;";
        }
        else
        {
            return "background-color: #FFFFFF;";
        }
    }
    protected string FormatPassedDate(object Date)
    {
        string passedDate = Date.ToString();
        TimeSpan span = DateTime.Now.Subtract(Convert.ToDateTime(Date));

        if (span.TotalSeconds < 0)
        {
            passedDate = "0 ثانیه قبل";
        }

        if (span.TotalSeconds < 60 && span.TotalSeconds > 0)
        {
            passedDate = Convert.ToInt16(span.TotalSeconds).ToString() + " ثانیه قبل";
        }

        if (span.TotalSeconds > 60 && span.TotalSeconds < 3600)
        {
            passedDate = Convert.ToInt16(span.TotalMinutes).ToString() + " دقیقه قبل";
        }

        if (span.TotalSeconds > 3600 && span.TotalSeconds < 86400)
        {
            passedDate = Convert.ToInt16(span.TotalHours).ToString() + " ساعت قبل";
        }

        if (span.TotalSeconds > 86400 && span.TotalSeconds < 604800)
        {
            passedDate = Convert.ToInt16(span.TotalDays).ToString() + " روز قبل";
        }

        return passedDate;
    }
    protected string FormatSenderName(object Sender)
    {
        bool SenderType = Convert.ToBoolean(Sender.ToString());

        DataTable dtUserName = new DataTable();
        DataTable dtOtherName = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_messagesSenderReceiverInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda.SelectCommand.Parameters.Add("@OtherId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["Id"]);
        sda.Fill(ds);
        dtUserName = ds.Tables[0];
        dtOtherName = ds.Tables[1];

        if (SenderType)
        {
            return dtUserName.Rows[0]["UserName"].ToString();
        }
        else
        {
            return dtOtherName.Rows[0]["OtherName"].ToString();
        }
    }
    protected string FormatSenderImage(object Sender)
    {
        bool SenderType = Convert.ToBoolean(Sender.ToString());

        if (SenderType)
        {
            return "شما: ";
        }
        else
        {
            return "اون: ";
        }
    }
    protected void GridViewMessages_DataBound(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_messagesRead", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@OwnerId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sqlCmd.Parameters.Add("@OwnerType", SqlDbType.Int).Value = 1;
        sqlCmd.Parameters.Add("@OtherId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["Id"].ToString());
        sqlCmd.Parameters.Add("@OtherType", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["Type"].ToString());

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void ImageButtonSend_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_messagesSendAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@SenderId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sqlCmd.Parameters.Add("@SenderType", SqlDbType.Int).Value = 1;
        sqlCmd.Parameters.Add("@ReceiverId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["Id"].ToString());
        sqlCmd.Parameters.Add("@ReceiverType", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["Type"].ToString());
        sqlCmd.Parameters.Add("@Message", SqlDbType.NVarChar).Value = TextBoxMessage.Text;
        if (TextBoxMessage.Text.Length < 100)
        {
            sqlCmd.Parameters.Add("@Brief", SqlDbType.NVarChar).Value = TextBoxMessage.Text;
        }
        else
        {
            sqlCmd.Parameters.Add("@Brief", SqlDbType.NVarChar).Value = TextBoxMessage.Text.Substring(0, 100);
        }

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxMessage.Text = "";
        GridViewMessages.DataBind();
    }
}