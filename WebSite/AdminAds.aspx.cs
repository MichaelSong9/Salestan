using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminAds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Ads");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1200, 0, "0");
        }

        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_ads", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.Fill(ds);
            dt = ds.Tables[0];

            //Top
            CheckBoxTop.Checked = Convert.ToBoolean(dt.Rows[0]["Active"].ToString());
            TextBoxTopLink.Text = dt.Rows[0]["Link"].ToString();
            TextBoxTopImage.Text = dt.Rows[0]["Image"].ToString();
            //Bottom
            CheckBoxBottom.Checked = Convert.ToBoolean(dt.Rows[1]["Active"].ToString());
            TextBoxBottomLink.Text = dt.Rows[1]["Link"].ToString();
            TextBoxBottomImage.Text = dt.Rows[1]["Image"].ToString();
            //Fold
            CheckBoxFold.Checked = Convert.ToBoolean(dt.Rows[2]["Active"].ToString());
            TextBoxFoldLink.Text = dt.Rows[2]["Link"].ToString();
            TextBoxFoldImage.Text = dt.Rows[2]["Image"].ToString();
            //Offers
            CheckBoxOffers.Checked = Convert.ToBoolean(dt.Rows[3]["Active"].ToString());
            TextBoxOffersLink.Text = dt.Rows[3]["Link"].ToString();
            TextBoxOffersImage.Text = dt.Rows[3]["Image"].ToString();
            //Coupons
            CheckBoxCoupons.Checked = Convert.ToBoolean(dt.Rows[4]["Active"].ToString());
            TextBoxCouponsLink.Text = dt.Rows[4]["Link"].ToString();
            TextBoxCouponsImage.Text = dt.Rows[4]["Image"].ToString();
            //Login
            CheckBoxLogin.Checked = Convert.ToBoolean(dt.Rows[5]["Active"].ToString());
            TextBoxLoginLink.Text = dt.Rows[5]["Link"].ToString();
            TextBoxLoginImage.Text = dt.Rows[5]["Image"].ToString();

            sda.Dispose();
            sqlConn.Close();
        }
    }
    protected void LinkButtonManage_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = true;
        LinkButtonManage.Enabled = false;


    }
    protected void ImageButtonTop_Click(object sender, ImageClickEventArgs e)
    {
        Ads ads = new Ads();
        ads.editAd("Top", CheckBoxTop.Checked, TextBoxTopLink.Text, TextBoxTopImage.Text);
    }
    protected void ImageButtonBottom_Click(object sender, ImageClickEventArgs e)
    {
        Ads ads = new Ads();
        ads.editAd("Bottom", CheckBoxBottom.Checked, TextBoxBottomLink.Text, TextBoxBottomImage.Text);
    }
    protected void ImageButtonFold_Click(object sender, ImageClickEventArgs e)
    {
        Ads ads = new Ads();
        ads.editAd("Fold", CheckBoxFold.Checked, TextBoxFoldLink.Text, TextBoxFoldImage.Text);
    }
    protected void ImageButtonOffers_Click(object sender, ImageClickEventArgs e)
    {
        Ads ads = new Ads();
        ads.editAd("Offers", CheckBoxOffers.Checked, TextBoxOffersLink.Text, TextBoxOffersImage.Text);
    }
    protected void ImageButtonCoupons_Click(object sender, ImageClickEventArgs e)
    {
        Ads ads = new Ads();
        ads.editAd("Coupons", CheckBoxCoupons.Checked, TextBoxCouponsLink.Text, TextBoxCouponsImage.Text);
    }
    protected void ImageButtonLogin_Click(object sender, ImageClickEventArgs e)
    {
        Ads ads = new Ads();
        ads.editAd("Login", CheckBoxLogin.Checked, TextBoxLoginLink.Text, TextBoxLoginImage.Text);
    }
}