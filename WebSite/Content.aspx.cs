using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        switch (Request.QueryString["Page"])
        {
            case "About":
                {
                    LabelTitle.Text = "درباره ما";
                    Page.Title = "Salestan : درباره ما";
                    ImageIcon.ImageUrl = "~/images/icons/information48.png";
                    PanelAbout.Visible = true;
                    break;
                }
            case "Suggestions":
                {
                    LabelTitle.Text = "نظرات و پیشنهادات";
                    Page.Title = "Salestan : نظرات و پیشنهادات";
                    ImageIcon.ImageUrl = "~/images/icons/idea48.png";
                    PanelSuggestions.Visible = true;
                    break;
                }
            case "Partnership":
                {
                    LabelTitle.Text = "همکاری با مشاغل";
                    Page.Title = "Salestan : همکاری با مشاغل";
                    ImageIcon.ImageUrl = "~/images/icons/shop48.png";
                    PanelPartnership.Visible = true;
                    break;
                }
            case "Contact":
                {
                    LabelTitle.Text = "ارتباط با ما";
                    Page.Title = "Salestan : ارتباط با ما";
                    ImageIcon.ImageUrl = "~/images/icons/conversation48.png";
                    PanelContact.Visible = true;
                    break;
                }
            case "Rules":
                {
                    LabelTitle.Text = "قوانین و مقررات";
                    Page.Title = "Salestan : قوانین و مقررات";
                    ImageIcon.ImageUrl = "~/images/icons/rules48.png";
                    PanelRules.Visible = true;
                    break;
                }
            case "Privacy":
                {
                    LabelTitle.Text = "حفظ حریم شخصی";
                    Page.Title = "Salestan : حفظ حریم شخصی";
                    ImageIcon.ImageUrl = "~/images/icons/panel48.png";
                    PanelPrivacy.Visible = true;
                    break;
                }
            case "Jobs":
                {
                    LabelTitle.Text = "فرصت های شغلی";
                    Page.Title = "Salestan : فرصت های شغلی";
                    ImageIcon.ImageUrl = "~/images/icons/usergroup48.png";
                    PanelJobs.Visible = true;
                    break;
                }
        }
    }
}