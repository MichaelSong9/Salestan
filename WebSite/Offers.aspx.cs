using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using System.Data.Linq.SqlClient;
using System.Web.Script.Serialization;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Offers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Offers"))
        {
            Response.Redirect("~/Error.aspx?Code=NoAccess");
        }

        PanelError.Visible = false;

        SqlDataSourceOffers.SelectParameters.Add("Date", DateTime.Now.ToString());
        SqlDataSourceOffers.SelectParameters.Add("Language", "fa");
        SqlDataSourceOffers.SelectParameters.Add("Location", "0");

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlDataAdapter sda = new SqlDataAdapter("SELECT OfferId, EndDate FROM Offers WHERE (EndDate > GETDATE()) AND (ShowDate < GETDATE()) ORDER BY ShowDate", sqlConn);
        sda.SelectCommand.CommandType = CommandType.Text;
        sda.Fill(ds);
        dt = ds.Tables[0];

        StringBuilder sb = new StringBuilder();
        sb.AppendLine("<script type=\"text/javascript\">");
        sb.AppendLine("    jq17(document).ready(function () {");

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sb.AppendLine("        jq17(\"#time" + dt.Rows[i]["OfferId"].ToString() + "\").countdown({");
            sb.AppendLine("            date: \"" + getEndDate(dt.Rows[i]["EndDate"].ToString()) + "\",");
            sb.AppendLine("            onComplete: function (event) {");
            sb.AppendLine("                jq17(this).html(\"&#1662;&#1575;&#1740;&#1575;&#1606; &#1740;&#1575;&#1601;&#1578;\");");
            sb.AppendLine("            },");
            sb.AppendLine("            leadingZero: true");
            sb.AppendLine("        });");
        }
        sb.AppendLine("    });");
        sb.AppendLine("</script>");

        LiteralTimes.Text = sb.ToString();

        if (dt.Rows.Count == 0) //offer doesn't exist
        {
            PanelError.Visible = true;
        }
    }
    protected string FormatRemainedTime(object EndDate)
    {
        DateTime offerEndDate = Convert.ToDateTime(EndDate);
        TimeSpan span = TimeSpan.Zero;
        string Result = "";

        span = offerEndDate.Subtract(DateTime.Now);
        Result = Convert.ToString(span.Days) + " ,               " + Convert.ToString(span.Hours) + "  : " + Convert.ToString(span.Minutes) + "  : " + Convert.ToString(span.Seconds);

        return Result;
    }
    protected string getEndDate(object EndDate)
    {
        DateTime offerEndDate = Convert.ToDateTime(EndDate);

        string month = " ";
        switch (offerEndDate.Month.ToString())
        {
            case "1":
                {
                    month = "january";
                    break;
                }
            case "2":
                {
                    month = "february";
                    break;
                }
            case "3":
                {
                    month = "march";
                    break;
                }
            case "4":
                {
                    month = "april";
                    break;
                }
            case "5":
                {
                    month = "may";
                    break;
                }
            case "6":
                {
                    month = "june";
                    break;
                }
            case "7":
                {
                    month = "july";
                    break;
                }
            case "8":
                {
                    month = "august";
                    break;
                }
            case "9":
                {
                    month = "september";
                    break;
                }
            case "10":
                {
                    month = "october";
                    break;
                }
            case "11":
                {
                    month = "november";
                    break;
                }
            case "12":
                {
                    month = "december";
                    break;
                }
        }
        string Result = month + " " + offerEndDate.Day + ", " + offerEndDate.Year + " " + offerEndDate.Hour + ":" + offerEndDate.Minute;

        return Result;
    }
}