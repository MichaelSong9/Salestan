using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for AdminLogInsert
/// </summary>
public class AdminLogInsert
{
    public void insertAdminLog(int AdminId, int LogCode, int ItemId, string Value)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_adminLogInsert", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@AdminId", SqlDbType.Int).Value = AdminId;
        sqlCmd.Parameters.Add("@LogCode", SqlDbType.Int).Value = LogCode;
        sqlCmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = ItemId;
        sqlCmd.Parameters.Add("@Value", SqlDbType.NVarChar).Value = Value;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
	}
}