using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using ImageManager;
using System.Text;

public partial class AdminPages_Offers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Offers");
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
                        PanelEdit.Visible = true;
                        Page.Title = "Salestan : تغییر مشخصات پیشنهاد";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_offerInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        //Descriptions
                        StringBuilder sbDescriptions = new StringBuilder(HttpUtility.HtmlEncode(dt.Rows[0]["Descriptions"].ToString()));
                        sbDescriptions.Replace("<", "&lt;");
                        sbDescriptions.Replace(">", "&gt;");
                        string descriptions = sbDescriptions.ToString();
                        //Highlights
                        StringBuilder sbHighlights = new StringBuilder(HttpUtility.HtmlEncode(dt.Rows[0]["Highlights"].ToString()));
                        sbHighlights.Replace("<", "&lt;");
                        sbHighlights.Replace(">", "&gt;");
                        string highlights = sbHighlights.ToString();
                        //Details
                        StringBuilder sbDetails = new StringBuilder(HttpUtility.HtmlEncode(dt.Rows[0]["Details"].ToString()));
                        sbDetails.Replace("<", "&lt;");
                        sbDetails.Replace(">", "&gt;");
                        string details = sbDetails.ToString();


                        DropDownListCompany.SelectedValue = dt.Rows[0]["CompanyId"].ToString();
                        TextBoxTitle.Text = dt.Rows[0]["Title"].ToString();
                        TextBoxBrowserTitle.Text = dt.Rows[0]["BrowserTitle"].ToString();
                        DropDownListCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                        TextBoxHighlights.Text = highlights;
                        TextBoxDetails.Text = details;
                        TextBoxDescriptions.Text = descriptions;
                        TextBoxPriceOffer.Text = dt.Rows[0]["PriceOffer"].ToString();
                        TextBoxPriceNormal.Text = dt.Rows[0]["PriceNormal"].ToString();
                        TextBoxPriceGift.Text = dt.Rows[0]["PriceGift"].ToString();
                        TextBoxPriceOurs.Text = dt.Rows[0]["PriceOurs"].ToString();
                        TextBoxPricePercent.Text = dt.Rows[0]["PriceDiscountPercent"].ToString();
                        TextBoxMinBuy.Text = dt.Rows[0]["MinBuy"].ToString();
                        TextBoxMaxBuy.Text = dt.Rows[0]["MaxBuy"].ToString();
                        TextBoxMinUser.Text = dt.Rows[0]["MinUser"].ToString();
                        TextBoxMaxUser.Text = dt.Rows[0]["MaxUser"].ToString();
                        LabelShowDateValue.Text = dt.Rows[0]["ShowDate"].ToString();
                        LabelEndDateValue.Text = dt.Rows[0]["EndDate"].ToString();
                        DropDownListLanguage.SelectedValue = dt.Rows[0]["Language"].ToString();
                        TextBoxLink1Name.Text = dt.Rows[0]["Link1Name"].ToString();
                        TextBoxLink1Url.Text = dt.Rows[0]["Link1Url"].ToString();
                        TextBoxLink2Name.Text = dt.Rows[0]["Link2Name"].ToString();
                        TextBoxLink2Url.Text = dt.Rows[0]["Link2Url"].ToString();
                        //locations
                        for (int i = 0; i < CheckBoxListLocations.Items.Count; i++)
                        {
                            if (dt.Rows[0]["Locations"].ToString().Contains(CheckBoxListLocations.Items[i].Value + ","))
                            {
                                CheckBoxListLocations.Items[i].Selected = true;
                            }
                        }

                        sda.Dispose();
                        sqlConn.Dispose();

                        break;
                    }
                case "Buyers":
                    {
                        PanelBuyers.Visible = true;
                        Page.Title = "Salestan : فهرست خریداران پیشنهاد";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_offerBuyers", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        LabelBuyersCompanyName.Text = dt.Rows[0]["Name"].ToString();
                        LabelBuyersCompanyId.Text = dt.Rows[0]["CompanyId"].ToString();
                        LabelBuyersOfferId.Text = Request.QueryString["OfferId"];
                        LabelBuyersTitle.Text = dt.Rows[0]["Title"].ToString();
                        LabelBuyersSold.Text = dt.Rows[0]["PurchasedCount"].ToString();

                        TimeClass tc = new TimeClass();
                        LabelBuyersDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["ShowDate"].ToString()));

                        sda.Dispose();
                        sqlConn.Dispose();

                        break;
                    }
                case "Photos":
                    {
                        PanelPhotos.Visible = true;
                        Page.Title = "Salestan : تصاویر پیشنهاد";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_offersPhotos", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        LabelPhotosCompanyName.Text = dt.Rows[0]["Name"].ToString();
                        LabelPhotosCompanyId.Text = dt.Rows[0]["CompanyId"].ToString();
                        LabelPhotosOfferId.Text = Request.QueryString["OfferId"];
                        LabelPhotosOfferTitle.Text = dt.Rows[0]["Title"].ToString();

                        if (dt.Rows[0]["MainPhoto"].ToString() == "0")
                        {
                            ImageMainPhoto.ImageUrl = "NoPhoto.jpg"; 
                        }
                        else
                        {
                            ImageMainPhoto.ImageUrl = "~/Files/Photos/" + dt.Rows[0]["MainPhoto"].ToString() + ".jpg";
                        }

                        sda.Dispose();
                        sqlConn.Dispose();

                        break;
                    }
            }
        }
    }
    protected void ImageButtonEdit_Click(object sender, ImageClickEventArgs e)
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
        sbDescriptions.Replace("&amp;quot;", "'");
        sbDescriptions.Replace("&amp;lt;", "<");
        sbDescriptions.Replace("&amp;gt;", ">");
        string descriptions = sbDescriptions.ToString();
        //Highlights
        StringBuilder sbHighlights = new StringBuilder(HttpUtility.HtmlEncode(TextBoxHighlights.Text));
        sbHighlights.Replace("&amp;quot;", "'");
        sbHighlights.Replace("&amp;lt;", "<");
        sbHighlights.Replace("&amp;gt;", ">");
        string highlights = sbHighlights.ToString();
        //Details
        StringBuilder sbDetails = new StringBuilder(HttpUtility.HtmlEncode(TextBoxDetails.Text));
        sbDetails.Replace("&amp;quot;", "'");
        sbDetails.Replace("&amp;lt;", "<");
        sbDetails.Replace("&amp;gt;", ">");
        string details = sbDetails.ToString();


        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_offerEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
        sqlCmd.Parameters.Add("@CompanyId", SqlDbType.Int).Value = DropDownListCompany.SelectedValue;
        sqlCmd.Parameters.Add("@BrowserTitle", SqlDbType.NVarChar).Value = TextBoxBrowserTitle.Text;
        sqlCmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = TextBoxTitle.Text;
        sqlCmd.Parameters.Add("@PriceDiscountPercent", SqlDbType.Int).Value = TextBoxPricePercent.Text;
        sqlCmd.Parameters.Add("@PriceNormal", SqlDbType.Int).Value = TextBoxPriceNormal.Text;
        sqlCmd.Parameters.Add("@PriceOffer", SqlDbType.Int).Value = TextBoxPriceOffer.Text;
        sqlCmd.Parameters.Add("@PriceGift", SqlDbType.Int).Value = TextBoxPriceGift.Text;
        sqlCmd.Parameters.Add("@PriceOurs", SqlDbType.Int).Value = TextBoxPriceOurs.Text;
        sqlCmd.Parameters.Add("@PostPrice", SqlDbType.Int).Value = TextBoxPostPrice.Text;
        sqlCmd.Parameters.Add("@MinBuy", SqlDbType.Int).Value = TextBoxMinBuy.Text;
        sqlCmd.Parameters.Add("@MaxBuy", SqlDbType.Int).Value = TextBoxMaxBuy.Text;
        sqlCmd.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = Convert.ToDateTime(LabelEndDateValue.Text).AddHours(Convert.ToDouble(TextBoxDuration.Text));
        sqlCmd.Parameters.Add("@MinUser", SqlDbType.Int).Value = TextBoxMinUser.Text;
        sqlCmd.Parameters.Add("@MaxUser", SqlDbType.Int).Value = TextBoxMaxUser.Text;
        sqlCmd.Parameters.Add("@Highlights", SqlDbType.NVarChar).Value = highlights;
        sqlCmd.Parameters.Add("@Details", SqlDbType.NVarChar).Value = details;
        sqlCmd.Parameters.Add("@Descriptions", SqlDbType.NVarChar).Value = descriptions;
        sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = Locations;
        sqlCmd.Parameters.Add("@Language", SqlDbType.VarChar).Value = DropDownListLanguage.SelectedValue;
        sqlCmd.Parameters.Add("@CategoryId", SqlDbType.VarChar).Value = DropDownListCategory.SelectedValue;
        sqlCmd.Parameters.Add("@Link1Name", SqlDbType.Int).Value = TextBoxLink1Name.Text;
        sqlCmd.Parameters.Add("@Link1Url", SqlDbType.NVarChar).Value = TextBoxLink1Url.Text;
        sqlCmd.Parameters.Add("@Link2Name", SqlDbType.Int).Value = TextBoxLink2Name.Text;
        sqlCmd.Parameters.Add("@Link2Url", SqlDbType.NVarChar).Value = TextBoxLink2Url.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        LabelEditMessage.Visible = true;
        LabelEditMessage.Text = "مشخصات پیشنهاد مورد نظر تغییر یافت.";
        LabelEditMessage.CssClass = "SuccessMessage";

        //insert log
        AdminLogInsert ali = new AdminLogInsert();
        ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1802, Convert.ToInt32(Request.QueryString["OfferId"]), "0");
    }
    protected void ImageButtonPhotoSave_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_photoAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Type", SqlDbType.Int).Value = 1;
        sqlCmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
        sqlCmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = TextBoxPhotoText.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        SqlDataAdapter sda = new SqlDataAdapter("sp_photoIdGet", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@Type", SqlDbType.Int).Value = 1;
        sda.SelectCommand.Parameters.Add("@ItemId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];

        //use WebManager to get the file, and save it
        IImageInfo img = WebManager.GetImageInfo(FileUploadPhotoNew);
        img.Path = Server.MapPath("~") + "\\Files\\temp\\";
        img.FileName = dt.Rows[0]["PhotoId"].ToString() + ".jpg";

        //now create resized versions, and save them
        IImageInfo imgResize = img.ResizeMe(400, 267);		//constrain to 120 pixels wide
        imgResize.Save("~/Files/Photos/");			//save file in a folder named "large"

        img.FileName = dt.Rows[0]["PhotoId"].ToString() + "t.jpg";
        IImageInfo imgTiny = img.ResizeMe(60, 40);	    //constrain to 16 pixels high
        imgTiny.Save("~/Files/Photos/");

        //dt.Rows[0]["PhotoId"].ToString();

        sda.Dispose();
        sqlConn.Close();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        LabelPhotoMessage.Visible = true;
        LabelPhotoMessage.Text = "تصویر اضافه گردید.";
        LabelPhotoMessage.CssClass = "SuccessMessage";

        GridViewPhotos.DataBind();
    }
    protected void GridViewPhotos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.CompareTo("MainPhoto") == 0)
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd = new SqlCommand("sp_offerMainPhotoChange", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
            sqlCmd.Parameters.Add("@PhotoId", SqlDbType.Int).Value = e.CommandArgument.ToString();

            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();

            ImageMainPhoto.ImageUrl = "~/Files/Photos/" + e.CommandArgument.ToString() + ".jpg";
        }
    }
    protected void GridViewPhotos_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        File.Delete(MapPath("~") + "\\Files\\Photos\\" + e.Keys["PhotoId"].ToString() + ".jpg");
        File.Delete(MapPath("~") + "\\Files\\Photos\\" + e.Keys["PhotoId"].ToString() + "t.jpg");
    }
}