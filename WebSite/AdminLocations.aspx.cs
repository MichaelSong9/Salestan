using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminLocations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Locations");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1700, 0, "0");
        }
    }
    protected void LinkButtonLocations_Click(object sender, EventArgs e)
    {
        PanelLocations.Visible = true;
        PanelLanguages.Visible = false;
        LinkButtonLocations.Enabled = false;
        LinkButtonLanguages.Enabled = true;
    }
    protected void LinkButtonLanguages_Click(object sender, EventArgs e)
    {
        PanelLocations.Visible = false;
        PanelLanguages.Visible = true;
        LinkButtonLocations.Enabled = true;
        LinkButtonLanguages.Enabled = false;
    }
    protected void ImageButtonLocationAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (!captchaLocation.Decide())
        {
            captchaLocation.message = "پاسخ اشتباه است!";
        }
        else
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_locationAddCheckExists", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add("@LocationId", SqlDbType.VarChar).Value = TextBoxLocationId.Text;
            sda.SelectCommand.Parameters.Add("@LocationName", SqlDbType.NVarChar).Value = TextBoxLocationName.Text;
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count == 0) //user doesn't exist
            {
                SqlCommand sqlCmd = new SqlCommand("sp_locationAdd", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@LocationId", SqlDbType.VarChar).Value = TextBoxLocationId.Text;
                sqlCmd.Parameters.Add("@LocationName", SqlDbType.NVarChar).Value = TextBoxLocationName.Text;

                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();

                GridViewLocations.DataBind();

                sqlCmd.Dispose();
                sqlConn.Dispose();
                sda.Dispose();

                LabelAddLocationMessage.Visible = true;
                LabelAddLocationMessage.Text = "موقعیت با مشخصات وارد شده اضافه گردید.";
                LabelAddLocationMessage.CssClass = "SuccessMessage";
            }
            else //user exists as an admin
            {
                LabelAddLocationMessage.Visible = true;
                LabelAddLocationMessage.Text = "موقعیت با مشخصات وارد شده موجود می باشد.";
                LabelAddLocationMessage.CssClass = "ErrorMessage";

                sda.Dispose();
                sqlConn.Close();
            }
        }
    }
    protected void ImageButtonLanguageAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (!captchaLanguage.Decide())
        {
            captchaLanguage.message = "پاسخ اشتباه است!";
        }
        else
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_languageAddCheckExists", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add("@LanguageId", SqlDbType.VarChar).Value = TextBoxLanguageId.Text;
            sda.SelectCommand.Parameters.Add("@LanguageName", SqlDbType.NVarChar).Value = TextBoxLanguageName.Text;
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count == 0) //user doesn't exist
            {
                SqlCommand sqlCmd = new SqlCommand("sp_languageAdd", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@LanguageId", SqlDbType.VarChar).Value = TextBoxLanguageId.Text;
                sqlCmd.Parameters.Add("@LanguageName", SqlDbType.NVarChar).Value = TextBoxLanguageName.Text;

                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();

                GridViewLanguages.DataBind();

                sqlCmd.Dispose();
                sqlConn.Dispose();
                sda.Dispose();

                LabelAddLanguageMessage.Visible = true;
                LabelAddLanguageMessage.Text = "زبان با مشخصات وارد شده اضافه گردید.";
                LabelAddLanguageMessage.CssClass = "SuccessMessage";
            }
            else //user exists as an admin
            {
                LabelAddLanguageMessage.Visible = true;
                LabelAddLanguageMessage.Text = "زبان با مشخصات وارد شده موجود می باشد.";
                LabelAddLanguageMessage.CssClass = "ErrorMessage";

                sda.Dispose();
                sqlConn.Close();
            }
        }
    }
}