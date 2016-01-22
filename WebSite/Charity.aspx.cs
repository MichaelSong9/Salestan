using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Web.Script.Serialization;

public partial class Charity : System.Web.UI.Page
{
    DataClassesDataContext context = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Charity"))
        {
            Response.Redirect("~/Error.aspx?Code=NoAccess");
        }

        var Lst = context.CharityNews.OrderBy(s => s.SubmitDate).Take(3).ToArray();
   
        HiddenFieldH1.Value=  Lst[0].Subject;
        HiddenFieldH2.Value = Lst[1].Subject;
        HiddenFieldH3.Value = Lst[2].Subject;
        HiddenFieldP1.Value = Lst[0].Brief;
        HiddenFieldP2.Value = Lst[1].Brief;
        HiddenFieldP3.Value = Lst[2].Brief;
        HiddenFieldId1.Value =  Lst[0].NewsId.ToString();
        HiddenFieldId2.Value =  Lst[1].NewsId.ToString();
        HiddenFieldId3.Value =  Lst[2].NewsId.ToString();



      
    }

    //public String GetData()
    //{


    //    var Lst = context.CharityNews.OrderBy(s => s.SubmitDate).Take(3).ToList();
   
    //        JavaScriptSerializer js = new JavaScriptSerializer();
    //        return js.Serialize(Lst);




    //    }
    

    protected string ShamsiDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);

        PersianCalendar pc = new PersianCalendar();
        string year = pc.GetYear(Date).ToString();
        string Mounth = pc.GetMonth(Date).ToString();
        string Day = pc.GetDayOfMonth(Date).ToString();

        string shamsiDate=year + "/" + Mounth + "/" + Day;

        return shamsiDate;
    }

}