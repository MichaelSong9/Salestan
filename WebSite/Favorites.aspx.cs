using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Favorites : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Favorite");
        }

        LabelOffersNoRecord.Visible = false;
    }

    protected string FormatRemainedTime(object StartDate, object Deadline)
    {
        int Days = Convert.ToInt32(Deadline);
        DateTime startdate = Convert.ToDateTime(StartDate);
        DateTime EndDate = Convert.ToDateTime(StartDate).AddDays(Days);
        TimeSpan span = TimeSpan.Zero;

        if (DateTime.Now >= startdate && DateTime.Now <= EndDate)
        {
            span = EndDate.Subtract(DateTime.Now);
        }
        else if (DateTime.Now > EndDate)
        {
            span = TimeSpan.Zero;
        }



        return Convert.ToString(span.Days) + " روز " + "," + Convert.ToString(span.Hours) + " ساعت " + "," + Convert.ToString(span.Minutes) + " دقیقه ";
    }
    protected string OfferState(object StartDate, object Deadline)
    {
        string State = "";
        int Days = Convert.ToInt32(Deadline);
        DateTime startdate = Convert.ToDateTime(StartDate);
        DateTime EndDate = startdate.AddDays(Days);


        if (DateTime.Now >= startdate && DateTime.Now <= EndDate)
        {
            State = " فعال ";
        }
        else if (DateTime.Now > EndDate)
        {
            State = "غیر فعال";
        }

        return State;
    }
    protected void LinkButtonOffers_Click(object sender, EventArgs e)
    {
        PanelOffers.Visible = true;

        if (GridViewOffers.Rows.Count == 0)
        {
            LabelOffersNoRecord.Visible = true;
        }
    }
}