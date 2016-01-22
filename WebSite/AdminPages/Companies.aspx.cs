using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_Companies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Companies");
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
                        Page.Title = "Salestan : تغییر مشخصات مشاغل";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_companyInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@CompanyId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CompanyId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        TextBoxOwnerId.Text = dt.Rows[0]["OwnerId"].ToString();
                        TextBoxName.Text = dt.Rows[0]["Name"].ToString();
                        TextBoxAbout.Text = dt.Rows[0]["About"].ToString();
                        DropDownListType.SelectedValue = dt.Rows[0]["TypeId"].ToString();
                        DropDownListField.SelectedValue = dt.Rows[0]["FieldId"].ToString();
                        TextBoxPhone.Text = dt.Rows[0]["Tel"].ToString();
                        TextBoxFax.Text = dt.Rows[0]["Fax"].ToString();
                        TextBoxMobile.Text = dt.Rows[0]["Mobile"].ToString();
                        TextBoxEmail.Text = dt.Rows[0]["Email"].ToString();
                        TextBoxWebsite.Text = dt.Rows[0]["Website"].ToString();
                        TextBoxAddress.Text = dt.Rows[0]["Address"].ToString();
                        TextBoxGoogleMap.Text = dt.Rows[0]["GoogleMap"].ToString();


                        break;
                    }
                case "Info":
                    {
                        PanelInfo.Visible = true;
                        Page.Title = "Salestan : مشخصات مشاغل";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_companyInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@CompanyId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CompanyId"]);
                        sda.Fill(ds);
                        dt = ds.Tables[0];

                        if (dt.Rows.Count == 0) //admin doesn't exist
                        {
                            LabelMessage.Text = "شغلی با این شناسه موجود نمی باشد!";
                            LabelMessage.CssClass = "ErrorMessage";
                            LabelMessage.Visible = true;
                            PanelInfo.Visible = false;
                        }
                        else //user exists
                        {

                            LabelMessage.Visible = false;
                            PanelInfo.Visible = true;

                            LabelInfoOwner.Text = dt.Rows[0]["OwnerName"].ToString();
                            LabelInfoName.Text = dt.Rows[0]["Name"].ToString();
                            LabelInfoType.Text = dt.Rows[0]["TypeName"].ToString();
                            LabelInfoField.Text = dt.Rows[0]["FieldName"].ToString();
                            LabelInfoAbout.Text = dt.Rows[0]["About"].ToString();
                            LabelInfoPhone.Text = dt.Rows[0]["Tel"].ToString();
                            LabelInfoFax.Text = dt.Rows[0]["Fax"].ToString();
                            LabelInfoMobile.Text = dt.Rows[0]["Mobile"].ToString();
                            LabelInfoEmail.Text = dt.Rows[0]["Email"].ToString();
                            HyperLinkInfoWebsite.Text = dt.Rows[0]["Website"].ToString();
                            HyperLinkInfoWebsite.NavigateUrl = dt.Rows[0]["Website"].ToString();
                            LabelInfoAddress.Text = dt.Rows[0]["Address"].ToString();
                            LabelInfoGoogleMap.Text = dt.Rows[0]["GoogleMap"].ToString();
                            if (Convert.ToBoolean(dt.Rows[0]["Photo"].ToString()))
                            {
                                ImageInfoLogo.ImageUrl = "~/Files/companies/" + Request.QueryString["CompanyId"].ToString() + ".png";
                                ImageInfoLogo.Visible = true;
                            }
                        }
                        sda.Dispose();
                        sqlConn.Close();

                        HyperLinkInfoChange.NavigateUrl = "~/AdminPages/Companies.aspx?Mode=Edit&CompanyId=" + Request.QueryString["CompanyId"];

                        break;
                    }
            }
        }
    }
    protected void ImageButtonEdit_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_companyEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@CompanyId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["CompanyId"]);
        sqlCmd.Parameters.Add("@OwnerId", SqlDbType.Int).Value = TextBoxOwnerId.Text;
        sqlCmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = TextBoxName.Text;
        sqlCmd.Parameters.Add("@About", SqlDbType.NVarChar).Value = TextBoxAbout.Text;
        sqlCmd.Parameters.Add("@TypeId", SqlDbType.VarChar).Value = DropDownListType.SelectedValue;
        sqlCmd.Parameters.Add("@FieldId", SqlDbType.VarChar).Value = DropDownListField.SelectedValue;
        sqlCmd.Parameters.Add("@Tel", SqlDbType.VarChar).Value = TextBoxPhone.Text;
        sqlCmd.Parameters.Add("@Fax", SqlDbType.VarChar).Value = TextBoxFax.Text;
        sqlCmd.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = TextBoxMobile.Text;
        sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = TextBoxEmail.Text;
        sqlCmd.Parameters.Add("@Website", SqlDbType.NVarChar).Value = TextBoxWebsite.Text;
        sqlCmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBoxAddress.Text;
        sqlCmd.Parameters.Add("@GoogleMap", SqlDbType.VarChar).Value = TextBoxGoogleMap.Text;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        LabelEditMessage.Visible = true;
        LabelEditMessage.Text = "مشخصات شغل مورد نظر تغییر یافت.";
        LabelEditMessage.CssClass = "SuccessMessage";

        //insert log
        AdminLogInsert ali = new AdminLogInsert();
        ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1402, Convert.ToInt32(Request.QueryString["CompanyId"]), "0");
    }
    protected void ImageButtonOwner_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_userFullNameByUserId", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxOwnerId.Text);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            LabelOwnerName.Text = "کاربری با این شناسه موجود نمی باشد!";
        }
        else //user exists
        {
            LabelOwnerName.Text = dt.Rows[0]["FullName"].ToString();
        }
        sda.Dispose();
        sqlConn.Close();
    }
}