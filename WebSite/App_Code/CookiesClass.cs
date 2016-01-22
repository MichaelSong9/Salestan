using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Cookies
/// </summary>
public class CookiesClass
{
    public HttpCookie setCookie(string VC, int Days)
    {
        HttpCookie _userInfoCookies = new HttpCookie("VC");
        _userInfoCookies["VC"] = VC;
        _userInfoCookies.Expires = DateTime.Now.AddDays(Days);

        return _userInfoCookies;
	}
}