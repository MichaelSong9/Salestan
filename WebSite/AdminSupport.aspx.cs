using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminSupport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Support");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1800, 0, "0");
        }

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_supportRequestsPendingCount", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlConn.Open();
        int RequestsUnreadCount = (int)sqlCmd.ExecuteScalar();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        if (RequestsUnreadCount == 0)
        {
            LabelRequestsNewCount.Visible = false;
        }
        else
        {
            LabelRequestsNewCount.Visible = true;
            LabelRequestsNewCount.Text = "(" + RequestsUnreadCount + " درخواست پاسخ داده نشده)";
        }
    }
    protected void LinkButtonRequests_Click(object sender, EventArgs e)
    {
        PanelRequests.Visible = true;
        PanelTopics.Visible = false;
        LinkButtonRequests.Enabled = false;
        LinkButtonTopics.Enabled = true;

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
    protected void LinkButtonTopics_Click(object sender, EventArgs e)
    {
        PanelRequests.Visible = false;
        PanelTopics.Visible = true;
        LinkButtonRequests.Enabled = true;
        LinkButtonTopics.Enabled = false;
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
            Response.Redirect("~/AdminSupport.aspx");
        }
        else //topic exists
        {
            PanelRequest.Visible = true;
            LabelRequestRequestId.Text = dt.Rows[0]["RequestId"].ToString();
            ImageRequestUserType.ImageUrl = "~/images/TypesImages/SupportUserType" + dt.Rows[0]["UserType"].ToString() + ".png";
            LabelRequestUserId.Text = dt.Rows[0]["UserId"].ToString();
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
        sqlCmd.Parameters.Add("@Conversation", SqlDbType.NVarChar).Value = "پاسخ پشتیبانی:\n" + TextBoxAnswer.Text + "\n\n------------------------------\n\n" + TextBoxConversation.Text;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = 2;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        SqlCommand sqlCmd2 = new SqlCommand("sp_supportRequestUnread", sqlConn);
        sqlCmd2.CommandType = CommandType.StoredProcedure;
        sqlCmd2.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(LabelRequestUserId.Text);

        sqlCmd2.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        GridViewRequests.DataBind();
        PanelRequest.Visible = false;
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
        PanelRequest.Visible = false;
    }
    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_supportRequestDelete", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@RequestId", SqlDbType.Int).Value = GridViewRequests.SelectedDataKey.Value;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        GridViewRequests.DataBind();
        PanelRequest.Visible = false;
    }
    protected void ImageButtonTopicsAdd_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_supportTopicAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserType", SqlDbType.Int).Value = Convert.ToInt32(DropDownListTopicsUserType.SelectedValue);
        sqlCmd.Parameters.Add("@Sort", SqlDbType.Int).Value = Convert.ToInt32(TextBoxTopicsSort.Text);
        sqlCmd.Parameters.Add("@Topic", SqlDbType.NVarChar).Value = TextBoxTopicsTopic.Text;
        sqlCmd.Parameters.Add("@Descriptions", SqlDbType.NVarChar).Value = TextBoxTopicsDescriptions.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        GridViewTopics.DataBind();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        LabelAddTopicMessage.Visible = true;
        LabelAddTopicMessage.Text = "عنوان با مشخصات وارد شده اضافه گردید.";
        LabelAddTopicMessage.CssClass = "SuccessMessage";
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}