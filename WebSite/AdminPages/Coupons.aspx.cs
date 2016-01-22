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

public partial class AdminPages_Coupons : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            switch (Request.QueryString["Mode"])
            {
                case "Edit":
                    {
                        PanelEdit.Visible = true;
                        Page.Title = "Salestan : تغییر مشخصات کوپن";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_couponInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@CouponId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CouponId"]);
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
                        DropDownListCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                        TextBoxHighlights.Text = highlights;
                        TextBoxDetails.Text = details;
                        TextBoxDescriptions.Text = descriptions;
                        LabelShowDateValue.Text = dt.Rows[0]["ShowDate"].ToString();
                        LabelEndDateValue.Text = dt.Rows[0]["EndDate"].ToString();
                        DropDownListLanguage.SelectedValue = dt.Rows[0]["Language"].ToString();
                        DropDownListLink1.SelectedValue = dt.Rows[0]["Link1Type"].ToString();
                        TextBoxLink1.Text = dt.Rows[0]["Link1Url"].ToString();
                        DropDownListLink2.SelectedValue = dt.Rows[0]["Link2Type"].ToString();
                        TextBoxLink2.Text = dt.Rows[0]["Link2Url"].ToString();
                        TextBoxLink3.Text = dt.Rows[0]["Link3Url"].ToString();
                        TextBoxLink3Image.Text = dt.Rows[0]["Link3Image"].ToString();
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
                case "Photos":
                    {
                        PanelPhotos.Visible = true;
                        Page.Title = "Salestan : تصاویر کوپن";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_couponsPhotos", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@CouponId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CouponId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        LabelPhotosCompanyName.Text = dt.Rows[0]["Name"].ToString();
                        LabelPhotosCompanyId.Text = dt.Rows[0]["CompanyId"].ToString();
                        LabelPhotosCouponId.Text = Request.QueryString["CouponId"];
                        LabelPhotosCouponTitle.Text = dt.Rows[0]["Title"].ToString();

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
        //BrowserTitle
        string browserTitle = TextBoxTitle.Text;
        browserTitle.Replace(" ", "-");


        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_couponEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@CouponId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CouponId"]);
        sqlCmd.Parameters.Add("@CompanyId", SqlDbType.Int).Value = DropDownListCompany.SelectedValue;
        sqlCmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = TextBoxTitle.Text;
        sqlCmd.Parameters.Add("@BrowserTitle", SqlDbType.NVarChar).Value = browserTitle;
        sqlCmd.Parameters.Add("@StartCoupon", SqlDbType.NVarChar).Value = TextBoxStartCoupon.Text;
        sqlCmd.Parameters.Add("@EndCoupon", SqlDbType.NVarChar).Value = TextBoxEndCoupon.Text;
        sqlCmd.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = Convert.ToDateTime(LabelEndDateValue.Text).AddHours(Convert.ToDouble(TextBoxDuration.Text));
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

        LabelEditMessage.Visible = true;
        LabelEditMessage.Text = "مشخصات کوپن مورد نظر تغییر یافت.";
        LabelEditMessage.CssClass = "SuccessMessage";

        //insert log
        AdminLogInsert ali = new AdminLogInsert();
        ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1802, Convert.ToInt32(Request.QueryString["CouponId"]), "0");
    }
    protected void ImageButtonPhotoSave_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_photoAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Type", SqlDbType.Int).Value = 2;
        sqlCmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CouponId"]);
        sqlCmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = TextBoxPhotoText.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        SqlDataAdapter sda = new SqlDataAdapter("sp_photoIdGet", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@Type", SqlDbType.Int).Value = 2;
        sda.SelectCommand.Parameters.Add("@ItemId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CouponId"]);
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
            SqlCommand sqlCmd = new SqlCommand("sp_couponMainPhotoChange", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@CouponId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CouponId"]);
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