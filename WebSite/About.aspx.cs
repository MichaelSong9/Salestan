using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] siteInformation = new string[]{};
        SiteInformation si = new SiteInformation();
        siteInformation = si.getInformation();

        //Page Title
        Page.Title = siteInformation[0] + " : &#1605;&#1593;&#1585;&#1601;&#1740; &#1587;&#1575;&#1740;&#1578; &#1608; &#1582;&#1583;&#1605;&#1575;&#1578;";

        if (Request.QueryString["Show"].ToString() != null)
        {
            switch (Request.QueryString["Show"].ToString())
            {
                case "Gift800":
                    ImageImage.ImageUrl = "~/images/about/Gift800.png";
                    break;
                default:
                    Response.Redirect("~/Error.aspx?Code=NotFound");
                    break;
            }
        }
        else
        {
            Response.Redirect("~/Error.aspx?Code=NotFound");
        }
    }
}