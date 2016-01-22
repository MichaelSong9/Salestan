using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPages_Credit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Credit");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        switch (Request.QueryString["Mode"])
        {
            case "Log":
                {
                    PanelLog.Visible = true;
                    Page.Title = "Salestan : تغییر اختیارات ادمین";
                    break;
                }
            case "UserLog":
                {
                    PanelUserLog.Visible = true;
                    Page.Title = "Salestan : فایل لاگ ادمین";
                    break;
                }
        }
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}