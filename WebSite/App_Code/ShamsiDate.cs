using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for shamsiDate
/// </summary>
public class ShamsiDate
{
	public string getShamsiDate(DateTime Date)
	{
        PersianCalendar pc = new PersianCalendar();
        string year = pc.GetYear(Date).ToString();
        string Mounth = pc.GetMonth(Date).ToString();
        string Day = pc.GetDayOfMonth(Date).ToString();

        string shamsiDate = year + "/" + Mounth + "/" + Day;

        return shamsiDate;
	}
}