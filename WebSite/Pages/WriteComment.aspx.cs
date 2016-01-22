using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Pages_WriteComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("~/Pages/FirstLogin.aspx");
        }
    }
    protected void ImageButtonSubmit_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            int Type = 0;
            switch (Request.QueryString["Mode"])
            {
                case "Offers":
                    {
                        Type = 1;
                        break;
                    }
                case "Coupons":
                    {
                        Type = 2;
                        break;
                    }
                case "Blog":
                    {
                        Type = 3;
                        break;
                    }
            }

            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd = new SqlCommand("sp_commentAdd", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
            sqlCmd.Parameters.Add("@Type", SqlDbType.Int).Value = Type;
            sqlCmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["ItemId"]);
            sqlCmd.Parameters.Add("@Comment", SqlDbType.NVarChar).Value = TextBoxComment.Text;
            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();

            PanelSuccessful.Visible = true;
            PanelComment.Visible = false;
        }
    }
}