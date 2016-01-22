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

public partial class CharityNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Charity"))
        {
            Response.Redirect("~/Error.aspx?Code=NoAccess");
        }

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
            Response.Redirect("~/Charity.aspx");
        }
        else //news exists
        {
            LabelTitle.Text = dt.Rows[0]["Subject"].ToString();
            DateTime NewsDate = Convert.ToDateTime(dt.Rows[0]["SubmitDate"].ToString());
            PersianCalendar pc = new PersianCalendar();
            string year = pc.GetYear(NewsDate).ToString();
            string Mounth = pc.GetMonth(NewsDate).ToString();
            string Day = pc.GetDayOfMonth(NewsDate).ToString();

            LabelDate.Text = year + "/" + Mounth + "/" + Day;

            LabelBody.Text = dt.Rows[0]["Body"].ToString();
            ImageImage.ImageUrl = "~/images/charity/news/" + Request.QueryString["NewsId"] + ".png";
            Page.Title = "Salestan : اخبار خیریه : " + dt.Rows[0]["Subject"].ToString();


            HyperLinkShareFacebook.NavigateUrl = "http://www.facebook.com/share.php?u=" + Request.Url.AbsoluteUri + "&t=" + dt.Rows[0]["Subject"].ToString();
            HyperLinkShareTwitter.NavigateUrl = "http://twitter.com/home?status=" + dt.Rows[0]["Subject"].ToString() + " " + Request.Url.AbsoluteUri;
            HyperLinkShareEmail.NavigateUrl = "mailto:?subject=" + dt.Rows[0]["Subject"].ToString() + "&body=" + Request.Url.AbsoluteUri;
            HyperLinkSharePrint.NavigateUrl = "~/Print.aspx?Mode=CharityNews&ItemId=" + Request.QueryString["NewsId"];
        }
        sda.Dispose();
        sqlConn.Close();
    }
}