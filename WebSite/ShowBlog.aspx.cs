using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class ShowBlog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        DataTable dtPervious = new DataTable();
        DataTable dtNext = new DataTable();
        DataTable dtComments = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_blogInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@BlogId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["BlogId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];
        dtPervious = ds.Tables[1];
        dtNext = ds.Tables[2];
        dtComments = ds.Tables[3];

        if (dt.Rows.Count == 0) //news doesn't exist
        {
            sda.Dispose();
            sqlConn.Close();
            Response.Redirect("~/Blog.aspx");
        }
        else //blog exists
        {
            TimeClass tc = new TimeClass();
            LabelDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["SubmitDate"].ToString()));

            LabelTitle.Text = dt.Rows[0]["Title"].ToString();
            LabelCategory.Text = dt.Rows[0]["CategoryName"].ToString();
            LabelBody.Text = dt.Rows[0]["Body"].ToString();
            ImageImage.ImageUrl = dt.Rows[0]["PhotoLink"].ToString();
            Page.Title = "Salestan : بلاگ : " + dt.Rows[0]["Title"].ToString();


            HyperLinkShareFacebook.NavigateUrl = "http://www.facebook.com/share.php?u=" + Request.Url.AbsoluteUri + "&t=" + dt.Rows[0]["Title"].ToString();
            HyperLinkShareTwitter.NavigateUrl = "http://twitter.com/home?status=" + dt.Rows[0]["Title"].ToString() + " " + Request.Url.AbsoluteUri;
            HyperLinkShareEmail.NavigateUrl = "mailto:?subject=" + dt.Rows[0]["Title"].ToString() + "&body=" + Request.Url.AbsoluteUri;
        }

        if (dtPervious.Rows.Count != 0) //news doesn't exist
        {
            PanelPervious.Visible = true;
            HyperLinkPervious.NavigateUrl = "~/ShowBlog.aspx?BlogId=" + dtPervious.Rows[0]["BlogId"].ToString() + "&Title=" + dtPervious.Rows[0]["BrowserTitle"].ToString();
            HyperLinkPervious.Text = dtPervious.Rows[0]["Title"].ToString();
        }

        if (dtNext.Rows.Count != 0) //news doesn't exist
        {
            PanelNext.Visible = true;
            HyperLinkNext.NavigateUrl = "~/ShowBlog.aspx?BlogId=" + dtNext.Rows[0]["BlogId"].ToString() + "&Title=" + dtNext.Rows[0]["BrowserTitle"].ToString();
            HyperLinkNext.Text = dtNext.Rows[0]["Title"].ToString();
        }

        //Comment
        StringBuilder sb3 = new StringBuilder();
        if (dtComments.Rows.Count != 0)
        {
            for (int i = 0; i < dtComments.Rows.Count; i++)
            {
                sb3.AppendLine("<br/>");
                sb3.AppendLine("<div class='FormLabel' style='direction:rtl;'>");
                sb3.AppendLine(dtComments.Rows[i]["Comment"].ToString());
                if (dtComments.Rows[i]["Answer"].ToString() != "")
                {
                    sb3.AppendLine("<br/><br/>");
                    sb3.AppendLine("<img alt='' height='20' src='images/logosmall.png' width='60' /><br/>");
                    sb3.AppendLine("<strong>" + dtComments.Rows[i]["Answer"].ToString() + "</strong>");
                }
                sb3.AppendLine("</div>");
                sb3.AppendLine("<br/>");
                sb3.AppendLine("<hr style='color:#CAE1E6' />");
            }
            LiteralComments.Text = sb3.ToString();
        }

        sda.Dispose();
        sqlConn.Close();
    }
}