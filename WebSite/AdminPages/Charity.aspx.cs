using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_Charity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Charity");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }


        if (!IsPostBack)
        {
            switch (Request.QueryString["Mode"])
            {
                case "NewsAdd":
                    {
                        PanelNews.Visible = true;
                        Page.Title = "Salestan : اخبار خیریه";
                        ImageButtonNewsSubmit.ImageUrl = "~/images/Buttons/add-off.png";

                        LabelDate.Text = DateTime.Now.ToShortDateString();
                        break;
                    }
                case "OrganizationsAdd":
                    {
                        PanelOrganizations.Visible = true;
                        Page.Title = "Salestan : موسسات خیریه";
                        ImageButtonOrganizations.ImageUrl = "~/images/Buttons/add-off.png";
                        break;
                    }
                case "NewsEdit":
                    {
                        PanelNews.Visible = true;
                        Page.Title = "Salestan : اخبار خیریه";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_charityNewsInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@NewsId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["NewsId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        if (dt.Rows.Count == 0) //news doesn't exist
                        {
                            //LabelName.Text = "خبری با این شناسه موجود نمی باشد!";
                        }
                        else //news exists
                        {
                            TimeClass tc = new TimeClass();
                            LabelDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["SubmitDate"].ToString()));

                            TextBoxNewsSubject.Text = dt.Rows[0]["Subject"].ToString();
                            TextBoxNewsBrief.Text = dt.Rows[0]["Brief"].ToString();
                            TextBoxNewsBody.Text = dt.Rows[0]["Body"].ToString();
                            //Location
                            DropDownListLanguage.SelectedValue = dt.Rows[0]["Language"].ToString();
                            ImageButtonNewsSubmit.ImageUrl = "~/images/Buttons/edit-off.png";
                        }
                        sda.Dispose();
                        sqlConn.Close();

                        break;
                    }
                case "OrganizationsEdit":
                    {
                        PanelOrganizations.Visible = true;
                        Page.Title = "Salestan : موسسات خیریه";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_charityOrganizationsInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@OrganizationId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OrganizationId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        if (dt.Rows.Count == 0) //news doesn't exist
                        {
                            //LabelName.Text = "موسسه ای با این شناسه موجود نمی باشد!";
                        }
                        else //news exists
                        {
                            TextBoxName.Text = dt.Rows[0]["Name"].ToString();
                            TextBoxAbout.Text = dt.Rows[0]["About"].ToString();
                            TextBoxEmail.Text = dt.Rows[0]["Email"].ToString();
                            TextBoxWebsite.Text = dt.Rows[0]["Website"].ToString();
                            TextBoxPhone.Text = dt.Rows[0]["Phone"].ToString();
                            TextBoxFax.Text = dt.Rows[0]["Fax"].ToString();
                            TextBoxAddress.Text = dt.Rows[0]["Address"].ToString();
                            ImageButtonOrganizations.ImageUrl = "~/images/Buttons/edit-off.png";
                            //Location
                        }
                        sda.Dispose();
                        sqlConn.Close();

                        break;
                    }
            }
        }
    }
    protected void ImageButtonNewsSubmit_Click(object sender, ImageClickEventArgs e)
    {
        switch (Request.QueryString["Mode"])
        {
            case "NewsAdd":
                {
                    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
                    SqlCommand sqlCmd = new SqlCommand("sp_charityNewsAdd", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@Subject", SqlDbType.NVarChar).Value = TextBoxNewsSubject.Text;
                    sqlCmd.Parameters.Add("@Brief", SqlDbType.NVarChar).Value = TextBoxNewsBrief.Text;
                    sqlCmd.Parameters.Add("@Body", SqlDbType.NVarChar).Value = TextBoxNewsBody.Text;
                    sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = "0,";
                    sqlCmd.Parameters.Add("@Language", SqlDbType.VarChar).Value = DropDownListLanguage.SelectedValue;

                    sqlConn.Open();
                    sqlCmd.ExecuteNonQuery();

                    sqlCmd.Dispose();
                    sqlConn.Dispose();

                    LabelNewsMessage.Visible = true;
                    LabelNewsMessage.Text = "خبر اضافه گردید.";
                    LabelNewsMessage.CssClass = "SuccessMessage";

                    break;
                }
            case "NewsEdit":
                {
                    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
                    SqlCommand sqlCmd = new SqlCommand("sp_charityNewsEdit", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@NewsId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["NewsId"]);
                    sqlCmd.Parameters.Add("@Subject", SqlDbType.NVarChar).Value = TextBoxNewsSubject.Text;
                    sqlCmd.Parameters.Add("@Brief", SqlDbType.NVarChar).Value = TextBoxNewsBrief.Text;
                    sqlCmd.Parameters.Add("@Body", SqlDbType.NVarChar).Value = TextBoxNewsBody.Text;
                    sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = "0,";
                    sqlCmd.Parameters.Add("@Language", SqlDbType.VarChar).Value = DropDownListLanguage.SelectedValue;
                    sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = 1;

                    sqlConn.Open();
                    sqlCmd.ExecuteNonQuery();

                    sqlCmd.Dispose();
                    sqlConn.Dispose();

                    LabelNewsMessage.Visible = true;
                    LabelNewsMessage.Text = "مشخصات خبر تغییر یافت.";
                    LabelNewsMessage.CssClass = "SuccessMessage";

                    //insert log
                    AdminLogInsert ali = new AdminLogInsert();
                    ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1302, Convert.ToInt32(Request.QueryString["NewsId"]), "0");

                    break;
                }
        }
    }
    protected void ImageButtonOrganizations_Click(object sender, ImageClickEventArgs e)
    {
        switch (Request.QueryString["Mode"])
        {
            case "OrganizationsAdd":
                {
                    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
                    SqlCommand sqlCmd = new SqlCommand("sp_charityOrganizationsAdd", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = TextBoxName.Text;
                    sqlCmd.Parameters.Add("@About", SqlDbType.NVarChar).Value = TextBoxAbout.Text;
                    sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = TextBoxEmail.Text;
                    sqlCmd.Parameters.Add("@Website", SqlDbType.NVarChar).Value = TextBoxWebsite.Text;
                    sqlCmd.Parameters.Add("@Phone", SqlDbType.VarChar).Value = TextBoxPhone.Text;
                    sqlCmd.Parameters.Add("@Fax", SqlDbType.VarChar).Value = TextBoxFax.Text;
                    sqlCmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBoxAddress.Text;
                    sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = "0,";

                    sqlConn.Open();
                    sqlCmd.ExecuteNonQuery();

                    sqlCmd.Dispose();
                    sqlConn.Dispose();

                    LabelOrganizationsMessage.Visible = true;
                    LabelOrganizationsMessage.Text = "موسسه اضافه گردید.";
                    LabelOrganizationsMessage.CssClass = "SuccessMessage";

                    break;
                }
            case "OrganizationsEdit":
                {
                    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
                    SqlCommand sqlCmd = new SqlCommand("sp_charityOrganizationsEdit", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@OrganizationId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OrganizationId"]);
                    sqlCmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = TextBoxName.Text;
                    sqlCmd.Parameters.Add("@About", SqlDbType.NVarChar).Value = TextBoxAbout.Text;
                    sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = TextBoxEmail.Text;
                    sqlCmd.Parameters.Add("@Website", SqlDbType.NVarChar).Value = TextBoxWebsite.Text;
                    sqlCmd.Parameters.Add("@Phone", SqlDbType.VarChar).Value = TextBoxPhone.Text;
                    sqlCmd.Parameters.Add("@Fax", SqlDbType.VarChar).Value = TextBoxFax.Text;
                    sqlCmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBoxAddress.Text;
                    sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = "0,";

                    sqlConn.Open();
                    sqlCmd.ExecuteNonQuery();

                    sqlCmd.Dispose();
                    sqlConn.Dispose();

                    LabelOrganizationsMessage.Visible = true;
                    LabelOrganizationsMessage.Text = "مشخصات موسسه تغییر یافت.";
                    LabelOrganizationsMessage.CssClass = "SuccessMessage";

                    //insert log
                    AdminLogInsert ali = new AdminLogInsert();
                    ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1305, Convert.ToInt32(Request.QueryString["OrganizationId"]), "0");

                    break;
                }
        }
    }
}