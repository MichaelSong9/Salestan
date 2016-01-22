using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Net;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //Page Title
        string[] siteInformation = new string[]{};
        SiteInformation si = new SiteInformation();
        siteInformation = si.getInformation();
        Page.Title = siteInformation[0] + " : " + siteInformation[2];
    }

}