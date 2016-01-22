using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for CreditAddRequestByUser
/// </summary>
public class CreditAddRequestByUser
{
    public void addRequest(int UserId, int Type, string Date, string Credit, string Name, string Number)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_creditBankRequestAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
        sqlCmd.Parameters.Add("@Type", SqlDbType.Int).Value = Type;
        sqlCmd.Parameters.Add("@Date", SqlDbType.NVarChar).Value = Date;
        sqlCmd.Parameters.Add("@Credit", SqlDbType.NVarChar).Value = Credit;
        sqlCmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Name;
        sqlCmd.Parameters.Add("@Number", SqlDbType.NVarChar).Value = Number;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
	}
}