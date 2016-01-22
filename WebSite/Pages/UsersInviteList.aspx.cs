using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Pages_UsersInviteList : System.Web.UI.Page
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

        int userid = Convert.ToInt32(Session["UserID"]);

        DataClassesDataContext context = new DataClassesDataContext();


        var query = (from u in context.Users
                     join r in context.Regeants on u.UserId equals r.InvitedId
                     where r.RegentId == userid
                     select new { u.FirstName, u.LastName, u.Email }).ToList();

        if (query.Count != 0)
        {


            StringBuilder sb = new StringBuilder();


            sb.AppendLine("<ul dir='rtl' class='FormLabel'>");
            foreach (var item in query)
            {
                sb.AppendLine("<li>نام: " + item.FirstName + " " + item.LastName + "<br />پست الکترونیک: " + item.Email + "<br />&nbsp; </li>");
            }
            sb.AppendLine("</ul>");
            Literal1.Text = sb.ToString();

        }
        else
        {
            PanelNoInvite.Visible = true;
        }


    }
}