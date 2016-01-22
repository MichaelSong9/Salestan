using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for StatsRefresh
/// </summary>
public class StatsRefresh
{
    public void refreshStats(string Section)
    {
        switch (Section)
        {
            case "Credit":
                {
                    refreshCredit();
                    break;
                }
            case "Offers":
                {
                    refreshOffers();
                    break;
                }
            case "Coupons":
                {
                    refreshCoupons();
                    break;
                }
            case "Users":
                {
                    refreshUsers();
                    break;
                }
            case "All":
                {
                    refreshCredit();
                    refreshOffers();
                    refreshUsers();
                    break;
                }
        }

	}
    public void refreshCredit()
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_statsCreditRefresh", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    public void refreshOffers()
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_statsOffersRefresh", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    public void refreshCoupons()
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_statsCouponsRefresh", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    public void refreshUsers()
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_statsUsersRefresh", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
}