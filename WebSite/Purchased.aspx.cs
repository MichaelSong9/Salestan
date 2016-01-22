using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Purchased : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Purchased");
        }

        LabelOffersNoRecord.Visible = false;
    }
    protected void LinkButtonOffers_Click(object sender, EventArgs e)
    {
        PanelOffers.Visible = true;
        LinkButtonOffers.Enabled = false;

        if (GridViewOffers.Rows.Count == 0)
        {
            LabelOffersNoRecord.Visible = true;
        }

        //DataClassesDataContext context = new DataClassesDataContext();
        //if (Session["UserId"] != null)
        //{
        //    int uid = Convert.ToInt32(Session["UserId"]);
        //    var query = context.PurchasedItems.Where(u => u.UserId == uid);
        //    if (query == null)
        //    {
        //        LabelNoRecord.Visible = true;
        //    }

        //}
        //else
        //{
        //    Response.Redirect("Login.aspx");
        //}
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}