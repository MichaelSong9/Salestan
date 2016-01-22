using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for NotificationsClass
/// </summary>
public class NotificationsClass
{
    public void addNotification(int UserType, int UserId, int NotificationType, string Value1, string Value2)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_notificationAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserType", SqlDbType.Int).Value = UserType;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
        sqlCmd.Parameters.Add("@NotificationType", SqlDbType.Int).Value = NotificationType;
        sqlCmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = notificationText(NotificationType, Value1, Value2);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    public string notificationText(int NotificationType, string Value1, string Value2)
    {
        switch (NotificationType)
        {
            case 1:
                {
                    return "تبریک می گوییم! شما به عضویت سایت درآمدید!";
                    break;
                }
            case 2:
                {
                    return "شما پیشنهاد <strong>" + Value1 + "</strong> را خریداری کردید.";
                    break;
                }
            case 3:
                {
                    return "<strong>" + Value1 +"</strong> با دعوت شما به عضویت سایت درآمد. <strong>" + Value2 + "</strong> تومان به اعتبار هدیه شما اضافه گردید.";
                    break;
                }
            case 4:
                {
                    return "<strong>" + Value1 + "</strong> تومان به اعتبار شما اضافه گردید.";
                    break;
                }
            case 5:
                {
                    return "<strong>" + Value1 + "</strong> تومان توسط سایت به اعتبار هدیه شما اضافه گردید.";
                    break;
                }
            case 6:
                {
                    return Value1;
                    break;
                }
            case 7:
                {
                    return "<strong>" + Value1 + "</strong> با درخواست اضافه شدن به فهرست دوستان شما موافقت نمود.";
                    break;
                }
            default:
                {
                    return "";
                    break;
                }
        }
    }
}