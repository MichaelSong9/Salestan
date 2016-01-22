using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

/// <summary>
/// Summary description for TimeClass
/// </summary>
public class TimeClass
{
    public DateTime ConvertToIranTime(DateTime Date)
    {
        string zoneId = "Iran Standard Time";
        TimeZoneInfo tzi = TimeZoneInfo.FindSystemTimeZoneById(zoneId);
        DateTime result = TimeZoneInfo.ConvertTimeFromUtc(Date, tzi);
        return result;
	}
    public string ConvertToIranTimeString(DateTime Date)
    {
        //string zoneId = "Iran Standard Time";
        //TimeZoneInfo tzi = TimeZoneInfo.FindSystemTimeZoneById(zoneId);
        //DateTime result = TimeZoneInfo.ConvertTimeFromUtc(Date, tzi);

        Date = Date.AddMinutes(-150);

        PersianCalendar pc = new PersianCalendar();
        string year = pc.GetYear(Date).ToString();
        string Month = pc.GetMonth(Date).ToString();
        string Day = pc.GetDayOfMonth(Date).ToString();
        string Hour = pc.GetHour(Date).ToString();
        string Minute = pc.GetMinute(Date).ToString();

        if (Month.Length == 1)
        {
            Month = "0" + Month;
        }
        if (Day.Length == 1)
        {
            Day = "0" + Day;
        }
        if (Hour.Length == 1)
        {
            Hour = "0" + Hour;
        }
        if (Minute.Length == 1)
        {
            Minute = "0" + Minute;
        }

        return year + "/" + Month + "/" + Day + " " + Hour + ":" + Minute;
    }
}