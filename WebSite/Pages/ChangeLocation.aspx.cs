using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ChangeLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        switch (Request.QueryString["Mode"])
        {
            case "Location":
                {
                    HttpCookie _locationCookies = new HttpCookie("Location");
                    _locationCookies["LocationId"] = Request.QueryString["LocationId"];
                    _locationCookies["LocationName"] = Request.QueryString["LocationName"];
                    _locationCookies.Expires = DateTime.Now.AddYears(1);
                    Response.Cookies.Add(_locationCookies);
                    break;
                }
            case "Language":
                {
                    HttpCookie _LanguageCookies = new HttpCookie("Language");
                    _LanguageCookies["LanguageId"] = Request.QueryString["LanguageId"];
                    _LanguageCookies["LanguageName"] = Request.QueryString["LanguageName"];
                    _LanguageCookies.Expires = DateTime.Now.AddYears(1);
                    Response.Cookies.Add(_LanguageCookies);
                    break;
                }
        }
        Response.Redirect(Request.UrlReferrer.ToString());
    }
}