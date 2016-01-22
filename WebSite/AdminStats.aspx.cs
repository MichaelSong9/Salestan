using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminStats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Stats");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }
    }
    protected void LinkButtonUsers_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = true;
        PanelOffers.Visible = false;
        PanelCredit.Visible = false;
        PanelCoupons.Visible = false;
        LinkButtonUsers.Enabled = false;
        LinkButtonOffers.Enabled = true;
        LinkButtonCredit.Enabled = true;
        LinkButtonCoupons.Enabled = true;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsUsers", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        TimeClass tc = new TimeClass();
        LabelUsersDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["UsersDate"].ToString()));

        LabelUsersUsers.Text = dt.Rows[0]["UsersCount"].ToString();
        LabelUsersGenderFemale.Text = "زن: " + dt.Rows[0]["UsersGenderFemale"].ToString();
        LabelUsersGenderMale.Text = " مرد: " + dt.Rows[0]["UsersGenderMale"].ToString();
        LabelUsersLogin.Text = dt.Rows[0]["UsersLoginMonth"].ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void LinkButtonOffers_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = false;
        PanelOffers.Visible = true;
        PanelCredit.Visible = false;
        PanelCoupons.Visible = false;
        LinkButtonUsers.Enabled = true;
        LinkButtonOffers.Enabled = false;
        LinkButtonCredit.Enabled = true;
        LinkButtonCoupons.Enabled = true;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsOffers", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        TimeClass tc = new TimeClass();
        LabelOffersDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["OffersDate"].ToString()));

        LabelOffersOffers.Text = dt.Rows[0]["OffersCount"].ToString();
        LabelOffersActive.Text = dt.Rows[0]["OffersActive"].ToString();
        LabelOffersPast.Text = dt.Rows[0]["OffersPast"].ToString();
        LabelOffersSold.Text = dt.Rows[0]["OffersSoldCount"].ToString();
        LabelOffersAverage.Text = (Convert.ToInt32(dt.Rows[0]["OffersSoldCount"].ToString()) / Convert.ToInt32(dt.Rows[0]["OffersPast"].ToString())).ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void LinkButtonCoupons_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = false;
        PanelOffers.Visible = false;
        PanelCredit.Visible = false;
        PanelCoupons.Visible = true;
        LinkButtonUsers.Enabled = true;
        LinkButtonOffers.Enabled = true;
        LinkButtonCredit.Enabled = true;
        LinkButtonCoupons.Enabled = false;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsCoupons", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        TimeClass tc = new TimeClass();
        LabelCouponsDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["CouponsDate"].ToString()));

        LabelOffersOffers.Text = dt.Rows[0]["CouponsCount"].ToString();
        LabelOffersActive.Text = dt.Rows[0]["CouponsActive"].ToString();
        LabelOffersPast.Text = dt.Rows[0]["CouponsPast"].ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void LinkButtonCredit_Click(object sender, EventArgs e)
    {
        PanelUsers.Visible = false;
        PanelOffers.Visible = false;
        PanelCredit.Visible = true;
        PanelCoupons.Visible = false;
        LinkButtonUsers.Enabled = true;
        LinkButtonOffers.Enabled = true;
        LinkButtonCredit.Enabled = false;
        LinkButtonCoupons.Enabled = true;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsCredit", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

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
    protected void LinkButtonUsersRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("Users");

        ImageUsersRefresh.ImageUrl = "~/images/icons/check16.png";
    }
    protected void LinkButtonStatsRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("All");

        ImageAllRefresh.ImageUrl = "~/images/icons/check16.png";
    }
    protected void LinkButtonOffersRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("Offers");

        ImageOffersRefresh.ImageUrl = "~/images/icons/check16.png";
    }
    protected void LinkButtonCreditRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("Credit");

        ImageCreditRefresh.ImageUrl = "~/images/icons/check16.png";
    }
    protected void LinkButtonCouponsRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("Coupons");

        ImageCouponsRefresh.ImageUrl = "~/images/icons/check16.png";
    }
}