using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPages_Newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Newsletter");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_newsletterInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@NewsletterId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["NewsletterId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //admin doesn't exist
        {
            //LabelName.Text = "کاربری با این شناسه موجود نمی باشد!";
        }
        else //user exists
        {
            LabelNewsletterId.Text = Request.QueryString["NewsletterId"].ToString();
            ImageFormat.ImageUrl = "~/images/TypesImages/NewsletterFormat" + dt.Rows[0]["Format"].ToString() + ".png";
            LabelReceiversCount.Text = dt.Rows[0]["ReceiversCount"].ToString();
            ImageReceiversType.ImageUrl = "~/images/TypesImages/NewsletterReceivers" + dt.Rows[0]["ReceiversType"].ToString() + ".png";
            LabelTitle.Text = dt.Rows[0]["Title"].ToString();
            LiteralBody.Text = dt.Rows[0]["Body"].ToString();
        }
        sda.Dispose();
        sqlConn.Close();
    }
}