using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Panel");
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_messagesAllRead", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        if (GridViewMessagesLists.Rows.Count == 0)
        {
            LabelNoRecord.Visible = true;
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
    protected void RepeaterMessages_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.CompareTo("MessageDelete") == 0)
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["SN11ConnectionString"].ConnectionString);
            SqlCommand sqlCmd;

            sqlCmd = new SqlCommand("DELETE FROM [Messages] WHERE ([MessageId] = @MessageId)", sqlConn);
            sqlCmd.Parameters.Add("@MessageId", SqlDbType.BigInt).Value = e.CommandArgument.ToString();
            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlConn.Close();

            GridViewMessagesLists.DataBind();
        }
    }
}