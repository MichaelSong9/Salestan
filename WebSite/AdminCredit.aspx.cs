using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminCredit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Credit");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1600, 0, "0");
        }

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_creditRequestsPendingCount", sqlConn);
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
    protected void LinkButtonUsers_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = true;
        PanelManage.Visible = false;
        PanelLog.Visible = false;
        PanelStats.Visible = false;
        PanelRequests.Visible = false;
        LinkButtonUsers.Enabled = false;
        LinkButtonManage.Enabled = true;
        LinkButtonLog.Enabled = true;
        LinkButtonStats.Enabled = true;
        LinkButtonRequests.Enabled = true;
    }
    protected void LinkButtonManage_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = false;
        PanelManage.Visible = true;
        PanelLog.Visible = false;
        PanelStats.Visible = false;
        PanelRequests.Visible = false;
        LinkButtonUsers.Enabled = true;
        LinkButtonManage.Enabled = false;
        LinkButtonLog.Enabled = true;
        LinkButtonStats.Enabled = true;
        LinkButtonRequests.Enabled = true;
    }
    protected void LinkButtonRequests_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = false;
        PanelManage.Visible = true;
        PanelLog.Visible = false;
        PanelStats.Visible = false;
        PanelRequests.Visible = true;
        LinkButtonUsers.Enabled = true;
        LinkButtonManage.Enabled = false;
        LinkButtonLog.Enabled = true;
        LinkButtonStats.Enabled = true;
        LinkButtonRequests.Enabled = false;
    }
    protected void LinkButtonLog_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = false;
        PanelManage.Visible = false;
        PanelLog.Visible = true;
        PanelStats.Visible = false;
        PanelRequests.Visible = false;
        LinkButtonUsers.Enabled = true;
        LinkButtonManage.Enabled = true;
        LinkButtonLog.Enabled = false;
        LinkButtonStats.Enabled = true;
        LinkButtonRequests.Enabled = true;
    }
    protected void LinkButtonStats_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = false;
        PanelManage.Visible = false;
        PanelLog.Visible = false;
        PanelStats.Visible = true;
        PanelRequests.Visible = false;
        LinkButtonUsers.Enabled = true;
        LinkButtonManage.Enabled = true;
        LinkButtonLog.Enabled = true;
        LinkButtonStats.Enabled = false;
        LinkButtonRequests.Enabled = true;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsCredit", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        PanelManageUser.Visible = true;
        LabelMessage.Visible = false;

        TimeClass tc = new TimeClass();
        LabelStatsDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["CreditDate"].ToString()));

        LabelStatsActiveCredit.Text = dt.Rows[0]["CreditSum"].ToString();
        LabelStatsGiftCredit.Text = dt.Rows[0]["CreditGiftCredit"].ToString();
        LabelStatsSpentCredit.Text = dt.Rows[0]["CreditSpent"].ToString();
        LabelStatsSpentGift.Text = dt.Rows[0]["CreditGiftSpent"].ToString();

        LabelStatsActiveCreditAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditSum"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();
        LabelStatsGiftCreditAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditGiftCredit"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();
        LabelStatsSpentCreditAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditSpent"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();
        LabelStatsSpentGiftAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditGiftSpent"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonManage_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_creditInfoByUserId", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxManageUserId.Text);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            LabelMessage.Visible = true;
            PanelManageUser.Visible = false;
        }
        else //user exists
        {
            PanelManageUser.Visible = true;
            LabelMessage.Visible = false;

            LabelManageName.Text = dt.Rows[0]["FullName"].ToString();
            LabelManageActiveCredit.Text = dt.Rows[0]["Credit"].ToString();
            LabelManageGiftCredit.Text = dt.Rows[0]["GiftCredit"].ToString();
            LabelManageSpentCredit.Text = dt.Rows[0]["SpentCredit"].ToString();
            LabelManageSpentGift.Text = dt.Rows[0]["SpentGift"].ToString();
        }

        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonManageCreditEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonManageCreditEdit.Visible = false;
        ImageButtonManagePlus.Visible = true;
        ImageButtonManageMinus.Visible = true;
        ImageButtonManageCancel.Visible = true;
        TextBoxManageCredit.Visible = true;
        TextBoxManageCredit.Text = "";
    }
    protected void ImageButtonManageCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonManageCreditEdit.Visible = true;
        ImageButtonManagePlus.Visible = false;
        ImageButtonManageMinus.Visible = false;
        ImageButtonManageCancel.Visible = false;
        TextBoxManageCredit.Visible = false;
    }
    protected void ImageButtonManagePlus_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonManageCreditEdit.Visible = true;
        ImageButtonManagePlus.Visible = false;
        ImageButtonManageMinus.Visible = false;
        ImageButtonManageCancel.Visible = false;
        TextBoxManageCredit.Visible = false;

        //add credit
        CreditAdd ca = new CreditAdd();
        ca.addCredit(Convert.ToInt32(TextBoxManageUserId.Text), 2, Convert.ToInt32(TextBoxManageCredit.Text), Convert.ToInt32(Session["UserId"]), " ");

        LabelManageActiveCredit.Text = (Convert.ToInt32(LabelManageActiveCredit.Text) + Convert.ToInt32(TextBoxManageCredit.Text)).ToString();
    }
    protected void ImageButtonManageMinus_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonManageCreditEdit.Visible = true;
        ImageButtonManagePlus.Visible = false;
        ImageButtonManageMinus.Visible = false;
        ImageButtonManageCancel.Visible = false;
        TextBoxManageCredit.Visible = false;

        //add credit
        CreditAdd ca = new CreditAdd();
        ca.addCredit(Convert.ToInt32(TextBoxManageUserId.Text), 5, Convert.ToInt32("-" + TextBoxManageCredit.Text), Convert.ToInt32(Session["UserId"]), " ");

        LabelManageActiveCredit.Text = (Convert.ToInt32(LabelManageActiveCredit.Text) - Convert.ToInt32(TextBoxManageCredit.Text)).ToString();
    }
    protected void RepeaterRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.CompareTo("RequestReject") == 0)
        {
            TextBox text = e.Item.FindControl("TextBoxRequestText") as TextBox;

            //reject
            CreditRequestAction cra = new CreditRequestAction();
            cra.requestAction(Convert.ToInt32(e.CommandArgument.ToString()), 2, text.Text);

            RepeaterRequests.DataBind();
        }

        if (e.CommandName.CompareTo("RequestVerify") == 0)
        {
            TextBox text = e.Item.FindControl("TextBoxRequestText") as TextBox;
            TextBox credit = e.Item.FindControl("TextBoxRequestVerifiedCredit") as TextBox;
            Label userid = e.Item.FindControl("LabelRequstUserId") as Label;
            Label type = e.Item.FindControl("LabelRequestType") as Label;
            int typeCode = 0;

            if (type.Text == "1")
            {
                typeCode = 3;
            }
            else
            {
                typeCode = 4;
            }

            //verify
            CreditRequestAction cra = new CreditRequestAction();
            cra.requestAction(Convert.ToInt32(e.CommandArgument.ToString()), 1, text.Text);

            RepeaterRequests.DataBind();

            //add credit
            CreditAdd ca = new CreditAdd();
            ca.addCredit(Convert.ToInt32(userid.Text), typeCode, Convert.ToInt32(credit.Text), Convert.ToInt32(Session["UserId"]), text.Text);
        }
    }
    protected void LinkButtonStatsRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("Credit");

        ImageStatsRefresh.ImageUrl = "~/images/icons/check16.png";

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsCredit", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        PanelManageUser.Visible = true;
        LabelMessage.Visible = false;

        TimeClass tc = new TimeClass();
        LabelStatsDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["CreditDate"].ToString()));

        LabelStatsActiveCredit.Text = dt.Rows[0]["CreditSum"].ToString();
        LabelStatsGiftCredit.Text = dt.Rows[0]["CreditGiftCredit"].ToString();
        LabelStatsSpentCredit.Text = dt.Rows[0]["CreditSpent"].ToString();
        LabelStatsSpentGift.Text = dt.Rows[0]["CreditGiftSpent"].ToString();

        LabelStatsActiveCreditAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditSum"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();
        LabelStatsGiftCreditAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditGiftCredit"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();
        LabelStatsSpentCreditAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditSpent"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();
        LabelStatsSpentGiftAverage.Text = (Convert.ToInt32(dt.Rows[0]["CreditGiftSpent"].ToString()) / Convert.ToInt32(dt.Rows[0]["UsersCount"].ToString())).ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}