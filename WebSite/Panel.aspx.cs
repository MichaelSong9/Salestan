using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Panel : System.Web.UI.Page
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

        DataTable dt = new DataTable();
        DataTable dtCredit = new DataTable();
        DataTable dtStats = new DataTable();
        DataTable dtRegeants = new DataTable();
        DataTable dtPurchased = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_userPanel", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];
        dtCredit = ds.Tables[1];
        dtStats = ds.Tables[2];
        dtRegeants = ds.Tables[3];
        dtPurchased = ds.Tables[4];

        LabelInviteCode.Text = "GP800-" + Session["UserId"];

        LabelInvitedCount.Text = dtStats.Rows[0]["InvitedUsersCount"].ToString();
        LabelOffersPurchasedCount.Text = dtStats.Rows[0]["PurchasedOffersCount"].ToString();
        LabelWelcome.Text = "&#1587;&#1604;&#1575;&#1605; " + dt.Rows[0]["FirstName"].ToString() + "! &#1582;&#1608;&#1588; &#1570;&#1605;&#1583;&#1740;&#1583;!";

        LabelGiftCredit.Text = dtCredit.Rows[0]["GiftCredit"].ToString();
        LabelSpentGift.Text = dtCredit.Rows[0]["SpentGift"].ToString();
        LabelSpentCredit.Text = dtCredit.Rows[0]["SpentCredit"].ToString();
        LabelCredit.Text = dtCredit.Rows[0]["Credit"].ToString();
        LabelTotalCredit.Text = (Convert.ToInt32(dtCredit.Rows[0]["SpentCredit"].ToString()) + Convert.ToInt32(dtCredit.Rows[0]["SpentGift"].ToString())).ToString();

        if (dtRegeants.Rows.Count != 0)
        {
        LabelInvitedName.Text = dtRegeants.Rows[0]["RegeantName"].ToString();
        }
        else
        {
            LabelInvitedName.Text = " معرف وجود ندارد";
        }

        if (dtPurchased.Rows.Count != 0)
        {
            ImageLastPurchased.Visible = true;
            LabelLastPurchased.Text = dtPurchased.Rows[0]["Title"].ToString();
        }
        else
        {
            ImageLastPurchased.Visible = false;
            LabelLastPurchased.Text = "وجود ندارد";
        }
        if (Convert.ToBoolean(dt.Rows[0]["Gender"].ToString()))
        {
            PanelFemale.Visible = true;
            dtStats = ds.Tables[5];
            decimal femaleCount = Convert.ToInt32(dtStats.Rows[0]["UsersGenderFemale"].ToString());
            decimal allCount = Convert.ToInt32(dtStats.Rows[0]["UsersGenderMale"].ToString()) + femaleCount;
            int femalePercent = Convert.ToInt32(femaleCount / allCount * 100);
            LabelFemaleStats.Text = femalePercent.ToString() + "%";
        }
    }
}