using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Ads
/// </summary>
public class Ads
{
    public void editAd(string Section, bool Active, string Link, string Image)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_adsEdit", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Section", SqlDbType.VarChar).Value = Section;
        sqlCmd.Parameters.Add("@Active", SqlDbType.Bit).Value = Active;
        sqlCmd.Parameters.Add("@Link", SqlDbType.VarChar).Value = Link;
        sqlCmd.Parameters.Add("@Image", SqlDbType.VarChar).Value = Image;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
	}
    public void showAdd(string Section)
    {
        
    }
}