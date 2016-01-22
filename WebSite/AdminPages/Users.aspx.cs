using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Users");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        if (!IsPostBack)
        {
            switch (Request.QueryString["Mode"])
            {
                case "Info":
                    {
                        PanelInfo.Visible = true;
                        Page.Title = "Salestan : مشخصات کاربر";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_userInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["UserId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        if (dt.Rows.Count == 0) //admin doesn't exist
                        {
                            LabelMessage.Text = "کاربری با این شناسه موجود نمی باشد!";
                            LabelMessage.CssClass = "ErrorMessage";
                            LabelMessage.Visible = true;
                            PanelUserInfo.Visible = false;
                        }
                        else //user exists
                        {

                            LabelMessage.Visible = false;
                            PanelUserInfo.Visible = true;

                            LabelUserIdValue.Text = Request.QueryString["UserId"].ToString();
                            LabelEmailValue.Text = dt.Rows[0]["Email"].ToString();
                            LabelFirstNameValue.Text = dt.Rows[0]["FirstName"].ToString();
                            LabelLastNameValue.Text = dt.Rows[0]["LastName"].ToString();
                            LabelBirthValue.Text = dt.Rows[0]["BirthDate"].ToString();
                            ImageGender.ImageUrl = "~/images/icons/gender24" + dt.Rows[0]["Gender"].ToString() + ".png";
                            LabelJobValue.Text = dt.Rows[0]["Job"].ToString();
                            LabelEducationValue.Text = dt.Rows[0]["Education"].ToString();
                            LabelHomePhoneValue.Text = dt.Rows[0]["HomeTel"].ToString();
                            LabelWorkPhoneValue.Text = dt.Rows[0]["WorkTel"].ToString();
                            LabelMobileValue.Text = dt.Rows[0]["Mobile"].ToString();
                            LabelAddressValue.Text = dt.Rows[0]["Address"].ToString();
                            LabelCredit.Text = dt.Rows[0]["Credit"].ToString();
                            LabelGiftCredit.Text = dt.Rows[0]["GiftCredit"].ToString();
                            LabelSpentCredit.Text = dt.Rows[0]["SpentCredit"].ToString();
                            LabelSpendGift.Text = dt.Rows[0]["SpentGift"].ToString();
                            LabelStatsOffersPurchased.Text = dt.Rows[0]["PurchasedOffersCount"].ToString();
                            LabelStatsUsersInvite.Text = dt.Rows[0]["InvitedUsersCount"].ToString();
                            DropDownListStatus.SelectedValue = dt.Rows[0]["Status"].ToString();

                            TimeClass tc = new TimeClass();
                            LabelMemberSinceValue.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["MemberSince"].ToString()));
                            LabelLastLoginValue.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["LastLogin"].ToString()));
                        }
                        sda.Dispose();
                        sqlConn.Close();

                        break;
                    }
            }
        }
    }
    protected void ImageButtonStatus_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_userStatusChange", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["UserId"].ToString());
        sqlCmd.Parameters.Add("@Status", SqlDbType.TinyInt).Value = Convert.ToInt32(DropDownListStatus.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        LabelStatusMessage.Visible = true;
        LabelStatusMessage.Text = "وضعیت کاربر تغییر یافت.";
        LabelStatusMessage.CssClass = "SuccessMessage";

        //insert log
        AdminLogInsert ali = new AdminLogInsert();
        ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 2001, Convert.ToInt32(Request.QueryString["UserId"].ToString()), Convert.ToInt32(DropDownListStatus.SelectedValue).ToString());
    }
}