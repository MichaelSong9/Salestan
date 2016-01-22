using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Support : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //check login status
            CheckLogin cl = new CheckLogin();
            bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
            if (LoginStatus)
            {
                HiddenFieldUserType.Value = "1";
                ImageUserTpe.ImageUrl = "~/images/TypesImages/SupportUserType1.png";
                PanelUser.Visible = true;

                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                SqlDataAdapter sda = new SqlDataAdapter("sp_userMenuRemindersCount", sqlConn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
                sda.Fill(ds);
                dt = ds.Tables[0];

                if (Convert.ToInt32(dt.Rows[0]["SupportRequestsCount"].ToString()) != 0)
                {
                    LabelRequestsNewCount.Visible = true;
                    LabelRequestsNewCount.Text = "(" + dt.Rows[0]["SupportRequestsCount"].ToString() + " درخواست پاسخ داده شده)";
                }
                else
                {
                    LabelRequestsNewCount.Visible = false;
                }

                sda.Dispose();
                sqlConn.Dispose();

            }
            else
            {
                HiddenFieldUserType.Value = "0";
                ImageUserTpe.ImageUrl = "~/images/TypesImages/SupportUserType0.png";
                PanelUser.Visible = false;
                PanelSend.Visible = true;
                LinkButtonSend.Enabled = false;
            }

            SqlDataSourceTopics.SelectParameters["UserType"].DefaultValue = HiddenFieldUserType.Value;
        }
    }
    protected void GridViewTopics_SelectedIndexChanged(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (LoginStatus)
        {
            if (HiddenFieldUserType.Value == "1")
            {
                PanelRequest.Visible = true;
            }
            else
            {
                Response.Redirect("~/Support.aspx");
            }
        }
        else
        {
            if (HiddenFieldUserType.Value == "0")
            {
                PanelRequest.Visible = true;
            }
            else
            {
                Response.Redirect("~/Support.aspx");
            }
        }

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_supportTopicInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@TopicId", SqlDbType.Int).Value = GridViewTopics.SelectedDataKey.Value;
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //topic doesn't exist
        {
            Response.Redirect("~/Support.aspx");
        }
        else //topic exists
        {
            LabelTopic.Text = dt.Rows[0]["Topic"].ToString();
            LabelDescriptions.Text = dt.Rows[0]["Descriptions"].ToString();
        }
    }
    protected void ImageButtonRequest_Click(object sender, ImageClickEventArgs e)
    {


        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            int UserId = 0;

            if (HiddenFieldUserType.Value == "1")
            {
                UserId = Convert.ToInt32(Session["UserId"]);
            }

            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd = new SqlCommand("sp_supportRequestAdd", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@UserType", SqlDbType.Int).Value = HiddenFieldUserType.Value;
            sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
            sqlCmd.Parameters.Add("@TopicId", SqlDbType.Int).Value = GridViewTopics.SelectedDataKey.Value;
            sqlCmd.Parameters.Add("@Conversation", SqlDbType.NVarChar).Value = "درخواست کاربر:\n" + TextBoxRequest.Text;
            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();


            PanelRequest.Visible = false;
            PanelSent.Visible = true;
        }
    }
    protected void LinkButtonHistory_Click(object sender, EventArgs e)
    {
        PanelHistory.Visible = true;
        PanelSend.Visible = false;
        LinkButtonHistory.Enabled = false;
        LinkButtonSend.Enabled = true;

        if (GridViewRequests.Rows.Count == 0)
        {
            LabelRequestsNoRecord.Visible = true;
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_supportRequestsAllRead", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void LinkButtonSend_Click(object sender, EventArgs e)
    {
        PanelHistory.Visible = false;
        PanelSend.Visible = true;
        LinkButtonHistory.Enabled = true;
        LinkButtonSend.Enabled = false;
    }
    protected void GridViewRequests_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_supportRequestInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@RequestId", SqlDbType.Int).Value = GridViewRequests.SelectedDataKey.Value;
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //topic doesn't exist
        {
            Response.Redirect("~/Support.aspx");
        }
        else //topic exists
        {
            PanelRequestInfo.Visible = true;
            LabelRequestRequestId.Text = dt.Rows[0]["RequestId"].ToString();
            ImageRequestStatus.ImageUrl = "~/images/TypesImages/SupportStatus" + dt.Rows[0]["Status"].ToString() + ".png";
            TextBoxConversation.Text = dt.Rows[0]["Conversation"].ToString();
        }
        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonAnswer_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_supportRequestAnswer", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@RequestId", SqlDbType.Int).Value = GridViewRequests.SelectedDataKey.Value;
        sqlCmd.Parameters.Add("@Conversation", SqlDbType.NVarChar).Value = "پاسخ کاربر:\n" + TextBoxAnswer.Text + "\n\n------------------------------\n\n" + TextBoxConversation.Text;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = 1;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();

        SqlDataAdapter sda = new SqlDataAdapter("sp_userMenuRemindersCount", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (Convert.ToInt32(dt.Rows[0]["SupportRequestsCount"].ToString()) != 0)
        {
            LabelRequestsNewCount.Visible = true;
            LabelRequestsNewCount.Text = "(" + dt.Rows[0]["SupportRequestsCount"].ToString() + " درخواست پاسخ داده شده)";
        }
        else
        {
            LabelRequestsNewCount.Visible = false;
        }

        DataTable dt2 = new DataTable();
        DataSet ds2 = new DataSet();

        SqlDataAdapter sda2 = new SqlDataAdapter("sp_userMenuRemindersCount", sqlConn);
        sda2.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda2.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda2.Fill(ds2);
        dt2 = ds2.Tables[0];

        if (Convert.ToInt32(dt2.Rows[0]["SupportRequestsCount"].ToString()) != 0)
        {
            LabelRequestsNewCount.Visible = true;
            LabelRequestsNewCount.Text = "(" + dt2.Rows[0]["SupportRequestsCount"].ToString() + " درخواست پاسخ داده شده)";
        }
        else
        {
            LabelRequestsNewCount.Visible = false;
        }

        sda2.Dispose();
        sda.Dispose();
        sqlCmd.Dispose();
        sqlConn.Dispose();

        GridViewRequests.DataBind();
        PanelRequestInfo.Visible = false;
    }
    protected void ImageButtonArchive_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_supportRequestArchive", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@RequestId", SqlDbType.Int).Value = GridViewRequests.SelectedDataKey.Value;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        GridViewRequests.DataBind();
        PanelRequestInfo.Visible = false;
    }
    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_supportRequestDelete", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@RequestId", SqlDbType.Int).Value = GridViewRequests.SelectedDataKey.Value;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();

        SqlDataAdapter sda = new SqlDataAdapter("sp_userMenuRemindersCount", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (Convert.ToInt32(dt.Rows[0]["SupportRequestsCount"].ToString()) != 0)
        {
            LabelRequestsNewCount.Visible = true;
            LabelRequestsNewCount.Text = "(" + dt.Rows[0]["SupportRequestsCount"].ToString() + " درخواست پاسخ داده شده)";
        }
        else
        {
            LabelRequestsNewCount.Visible = false;
        }

        sda.Dispose();
        sqlCmd.Dispose();
        sqlConn.Dispose();

        GridViewRequests.DataBind();
        PanelRequestInfo.Visible = false;
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}