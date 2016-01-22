using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminCharity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Charity");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1300, 0, "0");
        }
    }
    protected void LinkButtonNews_Click(object sender, EventArgs e)
    {
        PanelNews.Visible = true;
        PanelOrganizations.Visible = false;
        LinkButtonNews.Enabled = false;
        LinkButtonOrganizations.Enabled = true;
    }
    protected void LinkButtonOrganizations_Click(object sender, EventArgs e)
    {
        PanelNews.Visible = false;
        PanelOrganizations.Visible = true;
        LinkButtonNews.Enabled = true;
        LinkButtonOrganizations.Enabled = false;
    }
    protected void LinkButtonEvents_Click(object sender, EventArgs e)
    {
        PanelNews.Visible = false;
        PanelOrganizations.Visible = false;
        LinkButtonNews.Enabled = true;
        LinkButtonOrganizations.Enabled = true;
    }
    protected void LinkButtonMessages_Click(object sender, EventArgs e)
    {
        PanelNews.Visible = false;
        PanelOrganizations.Visible = false;
        LinkButtonNews.Enabled = true;
        LinkButtonOrganizations.Enabled = true;
    }
}