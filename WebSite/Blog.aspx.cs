using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Web.Script.Serialization;

public partial class Blog2 : System.Web.UI.Page
{
    DataClassesDataContext context = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }

}