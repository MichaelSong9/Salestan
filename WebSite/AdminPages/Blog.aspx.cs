using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_Blog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Blog");
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
                        Page.Title = "Salestan : بلاگ";

                        DataTable dt = new DataTable();
                        DataSet ds = new DataSet();
                        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                        SqlDataAdapter sda = new SqlDataAdapter("sp_blogInfo", sqlConn);
                        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda.SelectCommand.Parameters.Add("@BlogId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["BlogId"]);
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

                            TextBoxTitle.Text = dt.Rows[0]["Title"].ToString();
                            TextBoxBrief.Text = dt.Rows[0]["Brief"].ToString();
                            TextBoxBody.Text = dt.Rows[0]["Body"].ToString();
                            TextBoxPhotoLink.Text = dt.Rows[0]["PhotoLink"].ToString();
                            //Location
                            DropDownListLanguage.SelectedValue = dt.Rows[0]["Language"].ToString();
                        }
                        sda.Dispose();
                        sqlConn.Close();

                        break;
                    }
            }
        }
    }
    protected void ImageButtonEdit_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd = new SqlCommand("sp_blogEdit", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@BlogId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["BlogId"]);
            sqlCmd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = TextBoxTitle.Text;
            sqlCmd.Parameters.Add("@Brief", SqlDbType.NVarChar).Value = TextBoxBrief.Text;
            sqlCmd.Parameters.Add("@Body", SqlDbType.NVarChar).Value = TextBoxBody.Text;
            sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = "0,";
            sqlCmd.Parameters.Add("@Language", SqlDbType.VarChar).Value = DropDownListLanguage.SelectedValue;
            sqlCmd.Parameters.Add("@CategoryId", SqlDbType.VarChar).Value = DropDownListCategory.SelectedValue;
            sqlCmd.Parameters.Add("@PhotoLink", SqlDbType.VarChar).Value = TextBoxPhotoLink.Text;

            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();

            LabelEditMessage.Visible = true;
            LabelEditMessage.Text = "مشخصات مطلب تغییر یافت.";
            LabelEditMessage.CssClass = "SuccessMessage";

            //insert log
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 2202, Convert.ToInt32(Request.QueryString["BlogId"]), "0");
        }
    }
}