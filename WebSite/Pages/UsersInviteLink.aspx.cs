using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UsersInviteLink : System.Web.UI.Page
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

        String UserId = Session["UserId"].ToString();

        TextBoxShareLink.Text = "www.salestan.ir/Refer.aspx?Id=" + UserId;
        TextBoxHtml.Text = "<a href='http://www.salestan.ir/Refer.aspx?Id=" + UserId + "' target='_blank'><img alt='Salestan' height='96' src='http://www.salestan.ir/images/share96.png' width='96'/></a>";

        HyperLinkFaceBook.NavigateUrl ="http://www.facebook.com/share.php?u=http://www.salestan.ir/Refer.aspx?Id=" + UserId;
        HyperLinkTwitter.NavigateUrl = "http://twitter.com/home?status=http://www.salestan.ir/Refer.aspx?Id= " + UserId;
        HyperLinkSalestan.NavigateUrl = "~/Refer.aspx?Id=" + UserId;
    }
}