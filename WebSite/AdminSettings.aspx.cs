using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Settings");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1900, 0, "0");
        }
    }
    protected void LinkButtonInformation_Click(object sender, EventArgs e)
    {
        PanelInformation.Visible = true;
        PanelAccess.Visible = false;
        PanelAppearance.Visible = false;
        LinkButtonInformation.Enabled = false;
        LinkButtonAccess.Enabled = true;
        LinkButtonAppearance.Enabled = true;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_settingsInformationInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        TextBoxSiteName.Text = dt.Rows[0]["SiteName"].ToString();
        TextBoxSiteUrl.Text = dt.Rows[0]["SiteUrl"].ToString();
        TextBoxDefaultTitle.Text = dt.Rows[0]["DefaultTitle"].ToString();
        TextBoxSocialFacebook.Text = dt.Rows[0]["SocialFacebook"].ToString();
        TextBoxSocialTwitter.Text = dt.Rows[0]["SocialTwitter"].ToString();
        TextBoxSocialYoutube.Text = dt.Rows[0]["SocialYoutube"].ToString();
        if (dt.Rows[0]["SocialFacebook"].ToString().Length > 0)
        {
            CheckBoxSocialFacebook.Checked = true;
        }
        if (dt.Rows[0]["SocialTwitter"].ToString().Length > 0)
        {
            CheckBoxSocialTwitter.Checked = true;
        }
        if (dt.Rows[0]["SocialYoutube"].ToString().Length > 0)
        {
            CheckBoxSocialYoutube.Checked = true;
        }

        sda.Dispose();
        sqlConn.Close();
    }
    protected void LinkButtonAppearance_Click(object sender, EventArgs e)
    {
        PanelInformation.Visible = false; 
        PanelAccess.Visible = false;
        PanelAppearance.Visible = true;
        LinkButtonInformation.Enabled = true;
        LinkButtonAccess.Enabled = true;
        LinkButtonAppearance.Enabled = false;
    }
    protected void LinkButtonAccess_Click(object sender, EventArgs e)
    {
        PanelInformation.Visible = false; 
        PanelAccess.Visible = true;
        PanelAppearance.Visible = false;
        LinkButtonInformation.Enabled = true;
        LinkButtonAccess.Enabled = false;
        LinkButtonAppearance.Enabled = true;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_accessInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        RadioButtonListAccessGeneral.SelectedValue = dt.Rows[0]["SectionGeneralStatus"].ToString();
        RadioButtonListAccessOffers.SelectedValue = dt.Rows[0]["SectionOffersStatus"].ToString();
        RadioButtonListAccessCharity.SelectedValue = dt.Rows[0]["SectionCharityStatus"].ToString();
        RadioButtonListAccessRegister.SelectedValue = dt.Rows[0]["SectionRegisterStatus"].ToString();
        RadioButtonListAccessLogin.SelectedValue = dt.Rows[0]["SectionLoginStatus"].ToString();
        RadioButtonListAccessCredit.SelectedValue = dt.Rows[0]["SectionCreditStatus"].ToString();
        RadioButtonListAccessPurchase.SelectedValue = dt.Rows[0]["SectionPurchaseStatus"].ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void LinkButtonDefault_Click(object sender, EventArgs e)
    {
        File.Copy(Request.PhysicalApplicationPath + "images\\default\\background.png", @Request.PhysicalApplicationPath + "images\\background\\background.png", true);
        File.Copy(Request.PhysicalApplicationPath + "images\\default\\bottom.png", @Request.PhysicalApplicationPath + "images\\bottom.png", true);
        File.Copy(Request.PhysicalApplicationPath + "images\\default\\top.png", @Request.PhysicalApplicationPath + "images\\top.png", true);
        File.Copy(Request.PhysicalApplicationPath + "images\\default\\logomain.png", @Request.PhysicalApplicationPath + "images\\logomain.png", true);
        File.Copy(Request.PhysicalApplicationPath + "images\\default\\Styles.css", @Request.PhysicalApplicationPath + "Styles\\Styles.css", true);

        //insert log
        AdminLogInsert ali = new AdminLogInsert();
        ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1906, 0, "0");

        Response.Redirect("~/AdminSettings.aspx");
    }
    protected void ImageButtonLogo_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUploadLogo.HasFile)
        {
            if (System.IO.Path.GetExtension(FileUploadLogo.FileName) == ".png")
            {
                try
                {
                    FileUploadLogo.SaveAs(Server.MapPath("~/images/logomain.png"));
                }
                catch (Exception ex)
                {
                    
                }
                ImageLogo.ImageUrl = "~/images/logomain.png";
                LabelMessageLogo.Text = "فایل لوگو تغییر یافت.";
                LabelMessageLogo.CssClass = "SuccessMessage";

                //insert log
                AdminLogInsert ali = new AdminLogInsert();
                ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1901, 0, "0");
            }
            else
            {
                LabelMessageLogo.Text = "لطفاً فایلی با فرمت PNG انتخاب نمایید.";
                LabelMessageLogo.CssClass = "ErrorMessage";
            }
        }
        else
        {
            LabelMessageLogo.Text = "لطفاً فایل مورد نظر را انتخاب کنید.";
            LabelMessageLogo.CssClass = "ErrorMessage";
        }
    }
    protected void ImageButtonBackground_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUploadBackground.HasFile)
        {
            if (System.IO.Path.GetExtension(FileUploadBackground.FileName) == ".png")
            {
                try
                {
                    FileUploadBackground.SaveAs(Server.MapPath("~/images/background/background.png"));
                }
                catch (Exception ex)
                {

                }
                ImageBackground.ImageUrl = "~/images/background/background.png";
                LabelMessageBackground.Text = "فایل پس زمینه تغییر یافت.";
                LabelMessageBackground.CssClass = "SuccessMessage";

                //insert log
                AdminLogInsert ali = new AdminLogInsert();
                ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1902, 0, "0");
            }
            else
            {
                LabelMessageBackground.Text = "لطفاً فایلی با فرمت PNG انتخاب نمایید.";
                LabelMessageBackground.CssClass = "ErrorMessage";
            }
        }
        else
        {
            LabelMessageBackground.Text = "لطفاً فایل مورد نظر را انتخاب کنید.";
            LabelMessageBackground.CssClass = "ErrorMessage";
        }
    }
    protected void ImageButtonTop_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUploadTop.HasFile)
        {
            if (System.IO.Path.GetExtension(FileUploadTop.FileName) == ".png")
            {
                try
                {
                    FileUploadTop.SaveAs(Server.MapPath("~/images/top.png"));
                }
                catch (Exception ex)
                {

                }
                ImageTop.ImageUrl = "~/images/top.png";
                LabelMessageTop.Text = "فایل تصویر بالا تغییر یافت.";
                LabelMessageTop.CssClass = "SuccessMessage";

                //insert log
                AdminLogInsert ali = new AdminLogInsert();
                ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1903, 0, "0");
            }
            else
            {
                LabelMessageTop.Text = "لطفاً فایلی با فرمت PNG انتخاب نمایید.";
                LabelMessageTop.CssClass = "ErrorMessage";
            }
        }
        else
        {
            LabelMessageTop.Text = "لطفاً فایل مورد نظر را انتخاب کنید.";
            LabelMessageTop.CssClass = "ErrorMessage";
        }
    }
    protected void ImageButtonBottom_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUploadBottom.HasFile)
        {
            if (System.IO.Path.GetExtension(FileUploadBottom.FileName) == ".png")
            {
                try
                {
                    FileUploadBottom.SaveAs(Server.MapPath("~/images/bottom.png"));
                }
                catch (Exception ex)
                {

                }
                ImageBottom.ImageUrl = "~/images/bottom.png";
                LabelMessageBottom.Text = "فایل تصویر پایین تغییر یافت.";
                LabelMessageBottom.CssClass = "SuccessMessage";
                
                //insert log
                AdminLogInsert ali = new AdminLogInsert();
                ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1904, 0, "0");
            }
            else
            {
                LabelMessageBottom.Text = "لطفاً فایلی با فرمت PNG انتخاب نمایید.";
                LabelMessageBottom.CssClass = "ErrorMessage";
            }
        }
        else
        {
            LabelMessageBottom.Text = "لطفاً فایل مورد نظر را انتخاب کنید.";
            LabelMessageBottom.CssClass = "ErrorMessage";
        }
    }
    protected void RadioButtonListAccessGeneral_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessGeneral.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessGeneralPassword.Visible = false;
                    ImageButtonAccessGeneralPassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessGeneralPassword.Visible = false;
                    ImageButtonAccessGeneralPassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessGeneralPassword.Visible = true;
                    ImageButtonAccessGeneralPassword.Visible = true;
                    break;
                }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessGeneralEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessGeneral.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void RadioButtonListAccessOffers_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessOffers.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessOffersPassword.Visible = false;
                    ImageButtonAccessOffersPassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessOffersPassword.Visible = false;
                    ImageButtonAccessOffersPassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessOffersPassword.Visible = true;
                    ImageButtonAccessOffersPassword.Visible = true;
                    break;
                }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessOffersEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessOffers.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void RadioButtonListAccessCharity_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessCharity.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessCharityPassword.Visible = false;
                    ImageButtonAccessCharityPassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessCharityPassword.Visible = false;
                    ImageButtonAccessCharityPassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessCharityPassword.Visible = true;
                    ImageButtonAccessCharityPassword.Visible = true;
                    break;
                }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessCharityEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessCharity.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void RadioButtonListAccessRegister_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessRegister.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessRegisterPassword.Visible = false;
                    ImageButtonAccessRegisterPassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessRegisterPassword.Visible = false;
                    ImageButtonAccessRegisterPassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessRegisterPassword.Visible = true;
                    ImageButtonAccessRegisterPassword.Visible = true;
                    break;
                }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessRegisterEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessRegister.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void RadioButtonListAccessLogin_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessLogin.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessLoginPassword.Visible = false;
                    ImageButtonAccessLoginPassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessLoginPassword.Visible = false;
                    ImageButtonAccessLoginPassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessLoginPassword.Visible = true;
                    ImageButtonAccessLoginPassword.Visible = true;
                    break;
                }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessLoginEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessLogin.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void RadioButtonListAccessCredit_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessCredit.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessCreditPassword.Visible = false;
                    ImageButtonAccessCreditPassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessCreditPassword.Visible = false;
                    ImageButtonAccessCreditPassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessCreditPassword.Visible = true;
                    ImageButtonAccessCreditPassword.Visible = true;
                    break;
                }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessCreditEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessCredit.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void RadioButtonListAccessPurchase_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessPurchase.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessPurchasePassword.Visible = false;
                    ImageButtonAccessPurchasePassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessPurchasePassword.Visible = false;
                    ImageButtonAccessPurchasePassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessPurchasePassword.Visible = true;
                    ImageButtonAccessPurchasePassword.Visible = true;
                    break;
                }
        }

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessPurchaseEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessPurchase.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void ImageButtonAccessGeneralPassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessGeneralEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessGeneralPassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessGeneralPassword.Visible = false;
        ImageButtonAccessGeneralPassword.Visible = false;
    }
    protected void ImageButtonAccessOffersPassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessOffersEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessOffersPassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessOffersPassword.Visible = false;
        ImageButtonAccessOffersPassword.Visible = false;
    }
    protected void ImageButtonAccessCharityPassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessCharityEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessCharityPassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessCharityPassword.Visible = false;
        ImageButtonAccessCharityPassword.Visible = false;
    }
    protected void ImageButtonAccessRegisterPassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessRegisterEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessRegisterPassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessRegisterPassword.Visible = false;
        ImageButtonAccessRegisterPassword.Visible = false;
    }
    protected void ImageButtonAccessLoginPassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessLoginEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessLoginPassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessLoginPassword.Visible = false;
        ImageButtonAccessLoginPassword.Visible = false;
    }
    protected void ImageButtonAccessCreditPassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessCreditEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessCreditPassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessCreditPassword.Visible = false;
        ImageButtonAccessCreditPassword.Visible = false;
    }
    protected void ImageButtonAccessPurchasePassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessPurchaseEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessPurchasePassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessPurchasePassword.Visible = false;
        ImageButtonAccessPurchasePassword.Visible = false;
    }
    protected void RadioButtonListAccessCoupons_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonListAccessCoupons.SelectedValue)
        {
            case "0":
                {
                    TextBoxAccessCouponsPassword.Visible = false;
                    ImageButtonAccessCouponsPassword.Visible = false;
                    break;
                }
            case "1":
                {
                    TextBoxAccessCouponsPassword.Visible = false;
                    ImageButtonAccessCouponsPassword.Visible = false;
                    break;
                }
            case "2":
                {
                    TextBoxAccessCouponsPassword.Visible = true;
                    ImageButtonAccessCouponsPassword.Visible = true;
                    break;
                }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessCouponsEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Convert.ToInt32(RadioButtonListAccessCoupons.SelectedValue);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected void ImageButtonAccessCouponsPassword_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_accessCouponsEditPassword", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = TextBoxAccessCouponsPassword.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        TextBoxAccessCouponsPassword.Visible = false;
        ImageButtonAccessCouponsPassword.Visible = false;
    }
    protected void ImageButtonInformation_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_settingsInformationEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@SiteName", SqlDbType.NVarChar).Value = TextBoxSiteName.Text;
        sqlCmd.Parameters.Add("@SiteUrl", SqlDbType.NVarChar).Value = TextBoxSiteUrl.Text;
        sqlCmd.Parameters.Add("@DefaultTitle", SqlDbType.NVarChar).Value = TextBoxDefaultTitle.Text;
        if (CheckBoxSocialFacebook.Checked)
        {
            sqlCmd.Parameters.Add("@SocialFacebook", SqlDbType.NVarChar).Value = TextBoxSocialFacebook.Text;
        }
        else
        {
            sqlCmd.Parameters.Add("@SocialFacebook", SqlDbType.NVarChar).Value = "";
        }
        if (CheckBoxSocialTwitter.Checked)
        {
            sqlCmd.Parameters.Add("@SocialTwitter", SqlDbType.NVarChar).Value = TextBoxSocialTwitter.Text;
        }
        else
        {
            sqlCmd.Parameters.Add("@SocialTwitter", SqlDbType.NVarChar).Value = "";
        }
        if (CheckBoxSocialYoutube.Checked)
        {
            sqlCmd.Parameters.Add("@SocialYoutube", SqlDbType.NVarChar).Value = TextBoxSocialYoutube.Text;
        }
        else
        {
            sqlCmd.Parameters.Add("@SocialYoutube", SqlDbType.NVarChar).Value = "";
        }

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        LabelInformationMessage.Visible = true;
        LabelInformationMessage.CssClass = "SuccessMessage";
        LabelInformationMessage.Text = "مشخصات با موفقیت تغییر یافت.";
    }
}