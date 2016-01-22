using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class AdminCoupons : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Coupons");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 2100, 0, "0");
        }

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_commentsCouponsPendingCount", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlConn.Open();
        int CommentsUnreadCount = (int)sqlCmd.ExecuteScalar();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        if (CommentsUnreadCount == 0)
        {
            LabelCommentNewCount.Visible = false;
        }
        else
        {
            LabelCommentNewCount.Visible = true;
            LabelCommentNewCount.Text = "(" + CommentsUnreadCount + " نظر پاسخ داده نشده)";
        }
    }
    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = true;
        PanelManage.Visible = false;
        PanelComments.Visible = false;
        PanelCategories.Visible = false;
        PanelStats.Visible = false;
        LinkButtonAdd.Enabled = false;
        LinkButtonManage.Enabled = true;
        LinkButtonComments.Enabled = true;
        LinkButtonCategories.Enabled = true;
        LinkButtonStats.Enabled = true;
    }
    protected void LinkButtonManage_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = false;
        PanelManage.Visible = true;
        PanelComments.Visible = false;
        PanelCategories.Visible = false;
        PanelStats.Visible = false;
        LinkButtonAdd.Enabled = true;
        LinkButtonManage.Enabled = false;
        LinkButtonComments.Enabled = true;
        LinkButtonCategories.Enabled = true;
        LinkButtonStats.Enabled = true;
    }
    protected void LinkButtonComments_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = false;
        PanelManage.Visible = false;
        PanelComments.Visible = true;
        PanelCategories.Visible = false;
        PanelStats.Visible = false;
        LinkButtonAdd.Enabled = true;
        LinkButtonManage.Enabled = true;
        LinkButtonComments.Enabled = false;
        LinkButtonCategories.Enabled = true;
        LinkButtonStats.Enabled = true;
    }
    protected void LinkButtonCategories_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = false;
        PanelManage.Visible = false;
        PanelComments.Visible = false;
        PanelCategories.Visible = true;
        PanelStats.Visible = false;
        LinkButtonAdd.Enabled = true;
        LinkButtonManage.Enabled = true;
        LinkButtonComments.Enabled = true;
        LinkButtonCategories.Enabled = false;
        LinkButtonStats.Enabled = true;
    }
    protected void LinkButtonStats_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = false;
        PanelManage.Visible = false;
        PanelComments.Visible = false;
        PanelCategories.Visible = false;
        PanelStats.Visible = true;
        LinkButtonAdd.Enabled = true;
        LinkButtonManage.Enabled = true;
        LinkButtonComments.Enabled = true;
        LinkButtonCategories.Enabled = true;
        LinkButtonStats.Enabled = false;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsCoupons", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        LabelStatsDate.Text = dt.Rows[0]["CouponsDate"].ToString();
        LabelStatsOffers.Text = dt.Rows[0]["CouponsCount"].ToString();
        LabelStatsActive.Text = dt.Rows[0]["CouponsActive"].ToString();
        LabelStatsPast.Text = dt.Rows[0]["CouponsPast"].ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    public DateTime GetDateTime(string year, string month, string day)
    {
        int Year = Convert.ToInt32(year);
        int Month = Convert.ToInt32(month);
        int Day = Convert.ToInt32(day);

        PersianCalendar pc2 = new PersianCalendar();

        DateTime Date = pc2.ToDateTime(Year, Month, Day, 0, 0, 0, 0);
        //DateTime Date = Convert.ToDateTime(dt);
        return Date;

    }
    protected void ImageButtonAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            // Get Values from CheckBoxList
            String Locations = "";
            for (int i = 0; i < CheckBoxListLocations.Items.Count; i++)
            {
                if (CheckBoxListLocations.Items[i].Selected)
                {
                    Locations += CheckBoxListLocations.Items[i].Value + ",";
                }
            }

            //Descriptions
            StringBuilder sbDescriptions = new StringBuilder(HttpUtility.HtmlEncode(TextBoxDescriptions.Text));
            sbDescriptions.Replace("&lt;", "<");
            sbDescriptions.Replace("&gt;", ">");
            string descriptions = sbDescriptions.ToString();
            //Highlights
            StringBuilder sbHighlights = new StringBuilder(HttpUtility.HtmlEncode(TextBoxHighlights.Text));
            sbHighlights.Replace("&lt;", "<");
            sbHighlights.Replace("&gt;", ">");
            string highlights = sbHighlights.ToString();
            //Details
            StringBuilder sbDetails = new StringBuilder(HttpUtility.HtmlEncode(TextBoxDetails.Text));
            sbDetails.Replace("&lt;", "<");
            sbDetails.Replace("&gt;", ">");
            string details = sbDetails.ToString();
            //BrowserTitle
            string browserTitle = TextBoxTitle.Text;
            browserTitle.Replace(" ", "-");

            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlCommand sqlCmd = new SqlCommand("sp_couponAdd", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@CompanyId", SqlDbType.Int).Value = DropDownListCompanies.SelectedValue;
            sqlCmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = TextBoxTitle.Text;
            sqlCmd.Parameters.Add("@BrowserTitle", SqlDbType.NVarChar).Value = browserTitle;
            sqlCmd.Parameters.Add("@StartCoupon", SqlDbType.NVarChar).Value = TextBoxStartCoupon.Text;
            sqlCmd.Parameters.Add("@EndCoupon", SqlDbType.NVarChar).Value = TextBoxEndCoupon.Text;
            sqlCmd.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = CalendarShowDate.SelectedDate.AddHours(Convert.ToDouble(TextBoxDuration.Text));
            sqlCmd.Parameters.Add("@ShowDate", SqlDbType.SmallDateTime).Value = CalendarShowDate.SelectedDate;
            sqlCmd.Parameters.Add("@Highlights", SqlDbType.NVarChar).Value = highlights;
            sqlCmd.Parameters.Add("@Details", SqlDbType.NVarChar).Value = details;
            sqlCmd.Parameters.Add("@Descriptions", SqlDbType.NVarChar).Value = descriptions;
            sqlCmd.Parameters.Add("@Code", SqlDbType.NVarChar).Value = TextBoxCode.Text;
            sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = Locations;
            sqlCmd.Parameters.Add("@Language", SqlDbType.VarChar).Value = DropDownListLanguage.SelectedValue;
            sqlCmd.Parameters.Add("@CategoryId", SqlDbType.VarChar).Value = DropDownListCategory.SelectedValue;
            sqlCmd.Parameters.Add("@Link1Type", SqlDbType.Int).Value = DropDownListLink1.SelectedValue;
            sqlCmd.Parameters.Add("@Link1Url", SqlDbType.NVarChar).Value = TextBoxLink1.Text;
            sqlCmd.Parameters.Add("@Link2Type", SqlDbType.Int).Value = DropDownListLink2.SelectedValue;
            sqlCmd.Parameters.Add("@Link2Url", SqlDbType.NVarChar).Value = TextBoxLink2.Text;
            sqlCmd.Parameters.Add("@Link3Url", SqlDbType.NVarChar).Value = TextBoxLink3.Text;
            sqlCmd.Parameters.Add("@Link3Image", SqlDbType.NVarChar).Value = TextBoxLink3Image.Text;

            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();

            LabelAddMessage.Visible = true;
            LabelAddMessage.Text = "کوپن با مشخصات وارد شده اضافه گردید.";
            LabelAddMessage.CssClass = "SuccessMessage";
        }
    }
    protected void ImageButtonCategoryAdd_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_couponsCategoryAddCheckExists", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@CategoryId", SqlDbType.VarChar).Value = TextBoxCategoryId.Text;
        sda.SelectCommand.Parameters.Add("@CategoryName", SqlDbType.NVarChar).Value = TextBoxCategoryName.Text;
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            SqlCommand sqlCmd = new SqlCommand("sp_couponsCategoryAdd", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@CategoryId", SqlDbType.VarChar).Value = TextBoxCategoryId.Text;
            sqlCmd.Parameters.Add("@CategoryName", SqlDbType.NVarChar).Value = TextBoxCategoryName.Text;

            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            GridViewCategories.DataBind();

            sqlCmd.Dispose();
            sqlConn.Dispose();
            sda.Dispose();

            LabelAddCategoryMessage.Visible = true;
            LabelAddCategoryMessage.Text = "زمینه با مشخصات وارد شده اضافه گردید.";
            LabelAddCategoryMessage.CssClass = "SuccessMessage";
        }
        else //user exists as an admin
        {
            LabelAddCategoryMessage.Visible = true;
            LabelAddCategoryMessage.Text = "زمینه با مشخصات وارد شده موجود می باشد.";
            LabelAddCategoryMessage.CssClass = "ErrorMessage";

            sda.Dispose();
            sqlConn.Close();
        }
    }
    protected void RepeaterComments_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.CompareTo("CommentReject") == 0)
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd;

            try
            {
                sqlCmd = new SqlCommand("sp_commentVerification", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@CommentId", SqlDbType.Int).Value = e.CommandArgument.ToString();
                sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = 2;
                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                sqlConn.Close();
            }

            RepeaterComments.DataBind();
        }

        if (e.CommandName.CompareTo("CommentVerify") == 0)
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd;

            try
            {
                TextBox answer = e.Item.FindControl("TextBoxAnswer") as TextBox;

                sqlCmd = new SqlCommand("sp_commentVerification", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@CommentId", SqlDbType.Int).Value = e.CommandArgument.ToString();
                sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = 1;
                sqlCmd.Parameters.Add("@Answer", SqlDbType.NVarChar).Value = answer.Text;
                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                sqlConn.Close();
            }

            RepeaterComments.DataBind();
        }
    }
    protected void LinkButtonStatsRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("Coupons");

        ImageStatsRefresh.ImageUrl = "~/images/icons/check16.png";
    }
}