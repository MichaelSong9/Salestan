using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Content");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1500, 0, "0");
        }
    }
    protected void LinkButtonContent_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = true;
        LinkButtonContent.Enabled = false;
        PanelSeo.Visible = false;
        LinkButtonSeo.Enabled = true;
    }
    protected void LinkButtonSeo_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = false;
        LinkButtonContent.Enabled = true;
        PanelSeo.Visible = true;
        LinkButtonSeo.Enabled = false;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_seoInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        TextBoxKeywords.Text = dt.Rows[0]["SeoKeywords"].ToString();
        TextBoxDescriptions.Text = dt.Rows[0]["SeoDescriptions"].ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonContent_Click(object sender, ImageClickEventArgs e)
    {
        PanelContent.Visible = true;
    }
    protected void ImageButtonKeywrods_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_contentSeoKeywordsEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Keywords", SqlDbType.NVarChar).Value = Convert.ToInt32(TextBoxKeywords.Text);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        //insert log
        AdminLogInsert ali = new AdminLogInsert();
        ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1502, 0, TextBoxKeywords.Text);
    }
    protected void ImageButtonDescriptions_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_contentSeoDescriptionsEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Descriptions", SqlDbType.NVarChar).Value = Convert.ToInt32(TextBoxDescriptions.Text);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        //insert log
        AdminLogInsert ali = new AdminLogInsert();
        ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1503, 0, TextBoxDescriptions.Text);
    }
}