using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Notifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Notifications");
        }

        if (GridViewNotifications.Rows.Count == 0)
        {
            LabelNoRecord.Visible = true;
        }


        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_notificationsAllRead", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}