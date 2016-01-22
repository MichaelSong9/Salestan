using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Users");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 2000, 0, "0");
        }
    }
    protected void LinkButtonManage_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = true;
        PanelSearch.Visible = false;
        PanelStats.Visible = false;
        LinkButtonManage.Enabled = false;
        LinkButtonSearch.Enabled = true;
        LinkButtonStats.Enabled = true;
    }
    protected void LinkButtonSearch_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = false;
        PanelSearch.Visible = true;
        PanelStats.Visible = false;
        LinkButtonManage.Enabled = true;
        LinkButtonSearch.Enabled = false;
        LinkButtonStats.Enabled = true;
    }
    protected void LinkButtonStats_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = false;
        PanelSearch.Visible = false;
        PanelStats.Visible = true;
        LinkButtonManage.Enabled = true;
        LinkButtonSearch.Enabled = true;
        LinkButtonStats.Enabled = false;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsUsers", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        TimeClass tc = new TimeClass();
        LabelStatsDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["UsersDate"].ToString()));

        LabelStatsUsers.Text = dt.Rows[0]["UsersCount"].ToString();
        LabelStatsGenderFemale.Text = "زن: " + dt.Rows[0]["UsersGenderFemale"].ToString();
        LabelStatsGenderMale.Text =  " مرد: " + dt.Rows[0]["UsersGenderMale"].ToString();
        LabelStatsLogin.Text = dt.Rows[0]["UsersLoginMonth"].ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void LinkButtonStatsRefresh_Click(object sender, EventArgs e)
    {
        StatsRefresh sr = new StatsRefresh();
        sr.refreshStats("Users");

        ImageStatsRefresh.ImageUrl = "~/images/icons/check16.png";

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_statsUsers", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        TimeClass tc = new TimeClass();
        LabelStatsDate.Text = tc.ConvertToIranTimeString(Convert.ToDateTime(dt.Rows[0]["UsersDate"].ToString()));

        LabelStatsUsers.Text = dt.Rows[0]["UsersCount"].ToString();
        LabelStatsGenderFemale.Text = "زن: " + dt.Rows[0]["UsersGenderFemale"].ToString();
        LabelStatsGenderMale.Text = " مرد: " + dt.Rows[0]["UsersGenderMale"].ToString();
        LabelStatsLogin.Text = dt.Rows[0]["UsersLoginMonth"].ToString();

        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonSearch_Click(object sender, ImageClickEventArgs e)
    {
        GridViewSearch.DataBind();
        GridViewSearch.Visible = true;
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}