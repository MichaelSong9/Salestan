using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminAdmins : System.Web.UI.Page
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

        //Page Title
        string[] siteInformation = new string[] { };
        SiteInformation si = new SiteInformation();
        siteInformation = si.getInformation();

        Page.Title = siteInformation[0] + " : مدیریت ادمین ها";

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1100, 0, "0");
        }
    }
    protected void LinkButtonManage_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = true;
        PanelAdd.Visible = false;
        LinkButtonManage.Enabled = false;
        LinkButtonAdd.Enabled = true;
    }
    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = false;
        PanelAdd.Visible = true;
        LinkButtonManage.Enabled = true;
        LinkButtonAdd.Enabled = false;
    }
    protected void ImageButtonUserId_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_userFullNameByUserId", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxUserId.Text);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            LabelName.Text = "کاربری با این شناسه موجود نمی باشد!";
        }
        else //user exists
        {
            LabelName.Text = dt.Rows[0]["FullName"].ToString();
        }
        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonAdd_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_userFullNameByUserId", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxUserId.Text);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            LabelAddMessage.Visible = true;
            LabelAddMessage.Text = "کاربری با این شناسه موجود نمی باشد!";
            LabelAddMessage.CssClass = "ErrorMessage";
        }
        else //user exists
        {
            DataTable dt2 = new DataTable();
            DataSet ds2 = new DataSet();

            sda = new SqlDataAdapter("sp_adminAddCheckExists", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxUserId.Text);
            sda.Fill(ds2);
            dt2 = ds2.Tables[0];

            if (dt2.Rows.Count == 0) //user doesn't exist as an admin
            {
                SqlCommand sqlCmd = new SqlCommand("sp_adminAdd", sqlConn);
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
                sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxUserId.Text);
                sqlCmd.Parameters.Add("@Status", SqlDbType.TinyInt).Value = 1;

                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();

                GridViewAdmins.DataBind();

                sqlCmd.Dispose();
                sqlConn.Dispose();
                sda.Dispose();

                LabelAddMessage.Visible = true;
                LabelAddMessage.Text = "کاربر با تنظیمات وارد شده به عنوان ادمین اضافه گردید.";
                LabelAddMessage.CssClass = "SuccessMessage";

                //insert log
                AdminLogInsert ali = new AdminLogInsert();
                ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1101, Convert.ToInt32(TextBoxUserId.Text), "0");
            }
            else //user exists as an admin
            {
                LabelAddMessage.Visible = true;
                LabelAddMessage.Text = "کاربر با شناسه وارد شده قبلاً به عنوان ادمین اضافه شده است!";
                LabelAddMessage.CssClass = "ErrorMessage";

                sda.Dispose();
                sqlConn.Close();
            }
        }
    }
}