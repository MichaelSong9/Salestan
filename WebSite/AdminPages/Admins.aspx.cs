using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_Admins : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Admins");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        if (!IsPostBack)
        {
            switch (Request.QueryString["Mode"])
            {
                case "Edit":
                    {
                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_adminInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["UserId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        if (dt.Rows.Count == 0) //admin doesn't exist
                        {
                            LabelName.Text = "کاربری با این شناسه موجود نمی باشد!";
                        }
                        else //user exists
                        {
                            LabelUserId.Text = Request.QueryString["UserId"].ToString();
                            LabelName.Text = dt.Rows[0]["FullName"].ToString();
                            DropDownListStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
                            CheckBoxListPremissions.Items[0].Selected = Convert.ToBoolean(dt.Rows[0]["PremAdmins"].ToString());
                            CheckBoxListPremissions.Items[1].Selected = Convert.ToBoolean(dt.Rows[0]["PremAds"].ToString());
                            CheckBoxListPremissions.Items[2].Selected = Convert.ToBoolean(dt.Rows[0]["PremAgencies"].ToString());
                            CheckBoxListPremissions.Items[3].Selected = Convert.ToBoolean(dt.Rows[0]["PremBlog"].ToString());
                            CheckBoxListPremissions.Items[4].Selected = Convert.ToBoolean(dt.Rows[0]["PremCharity"].ToString());
                            CheckBoxListPremissions.Items[5].Selected = Convert.ToBoolean(dt.Rows[0]["PremCompanies"].ToString());
                            CheckBoxListPremissions.Items[6].Selected = Convert.ToBoolean(dt.Rows[0]["PremContent"].ToString());
                            CheckBoxListPremissions.Items[7].Selected = Convert.ToBoolean(dt.Rows[0]["PremCoupons"].ToString());
                            CheckBoxListPremissions.Items[8].Selected = Convert.ToBoolean(dt.Rows[0]["PremCredit"].ToString());
                            CheckBoxListPremissions.Items[9].Selected = Convert.ToBoolean(dt.Rows[0]["PremCurrencies"].ToString());
                            CheckBoxListPremissions.Items[10].Selected = Convert.ToBoolean(dt.Rows[0]["PremLocations"].ToString());
                            CheckBoxListPremissions.Items[11].Selected = Convert.ToBoolean(dt.Rows[0]["PremNewsletter"].ToString());
                            CheckBoxListPremissions.Items[12].Selected = Convert.ToBoolean(dt.Rows[0]["PremOffers"].ToString());
                            CheckBoxListPremissions.Items[13].Selected = Convert.ToBoolean(dt.Rows[0]["PremSettings"].ToString());
                            CheckBoxListPremissions.Items[14].Selected = Convert.ToBoolean(dt.Rows[0]["PremStats"].ToString());
                            CheckBoxListPremissions.Items[15].Selected = Convert.ToBoolean(dt.Rows[0]["PremSupport"].ToString());
                            CheckBoxListPremissions.Items[16].Selected = Convert.ToBoolean(dt.Rows[0]["PremUsers"].ToString());
                            HyperLinkEditLog.NavigateUrl = "~/AdminPages/Admins.aspx?Mode=Log&UserId=" + Request.QueryString["UserId"].ToString();
                        }
                        sda.Dispose();
                        sqlConn.Close();
                        PanelEdit.Visible = true;
                        Page.Title = "Salestan : تغییر اختیارات ادمین";
                        break;
                    }
                case "Log":
                    {
                        PanelLog.Visible = true;
                        Page.Title = "Salestan : فایل لاگ ادمین";
                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_adminInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["UserId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        if (dt.Rows.Count == 0) //admin doesn't exist
                        {
                            LabelLogName.Text = "کاربری با این شناسه موجود نمی باشد!";
                        }
                        else //user exists
                        {
                            LabelLogUserId.Text = Request.QueryString["UserId"].ToString();
                            LabelLogName.Text = dt.Rows[0]["FullName"].ToString();
                            HyperLinkLogEdit.NavigateUrl = "~/AdminPages/Admins.aspx?Mode=Edit&UserId=" + Request.QueryString["UserId"].ToString();
                        }
                        sda.Dispose();
                        sqlConn.Close();
                        break;
                    }
            }
        }
    }
    protected void ImageButtonSubmit_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_adminAddCheckExists", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(LabelUserId.Text);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            LabelEditMessage.Visible = true;
            LabelEditMessage.Text = "ادمین با شناسه وارد شده وجود ندارد!";
            LabelEditMessage.CssClass = "ErrorMessage";

            sda.Dispose();
            sqlConn.Close();
        }
        else //user exists as an admin
        {
            SqlCommand sqlCmd = new SqlCommand("sp_adminEdit", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@PremAdmins", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[0].Selected;
            sqlCmd.Parameters.Add("@PremAds", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[1].Selected;
            sqlCmd.Parameters.Add("@PremAgencies", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[2].Selected;
            sqlCmd.Parameters.Add("@PremBlog", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[3].Selected;
            sqlCmd.Parameters.Add("@PremCharity", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[4].Selected;
            sqlCmd.Parameters.Add("@PremCompanies", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[5].Selected;
            sqlCmd.Parameters.Add("@PremContent", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[6].Selected;
            sqlCmd.Parameters.Add("@PremCoupons", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[7].Selected;
            sqlCmd.Parameters.Add("@PremCredit", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[8].Selected;
            sqlCmd.Parameters.Add("@PremCurrencies", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[9].Selected;
            sqlCmd.Parameters.Add("@PremLocations", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[10].Selected;
            sqlCmd.Parameters.Add("@PremNewsletter", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[11].Selected;
            sqlCmd.Parameters.Add("@PremOffers", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[12].Selected;
            sqlCmd.Parameters.Add("@PremSettings", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[13].Selected;
            sqlCmd.Parameters.Add("@PremStats", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[14].Selected;
            sqlCmd.Parameters.Add("@PremSupport", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[15].Selected;
            sqlCmd.Parameters.Add("@PremUsers", SqlDbType.Bit).Value = CheckBoxListPremissions.Items[16].Selected;
            sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(LabelUserId.Text);
            sqlCmd.Parameters.Add("@Status", SqlDbType.TinyInt).Value = DropDownListStatus.SelectedValue;

            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();
            sda.Dispose();

            LabelEditMessage.Visible = true;
            LabelEditMessage.Text = "تنظیمات ادمین مورد نظر تغییر یافت.";
            LabelEditMessage.CssClass = "SuccessMessage";

            //insert log
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1102, Convert.ToInt32(LabelUserId.Text), "0");
        }
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}