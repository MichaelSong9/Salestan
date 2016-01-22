using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for getUserId
/// </summary>
public class LoginSession
{
    public Int32 getUserId(string VerificationCode)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_loginSessionRead", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@VerificationCode", SqlDbType.NVarChar).Value = VerificationCode;
        sda.Fill(ds);
        dt = ds.Tables[0];

        sda.Dispose();
        sqlConn.Dispose();

        if (dt.Rows.Count == 0)
        {
            return 0;
        }
        else
        {
            return Convert.ToInt32(dt.Rows[0]["UserId"].ToString());
        }
	}
    public void setLoginSession(int UserId, string VerificationCode, int Hours)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_loginSessionWrite", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
        sqlCmd.Parameters.Add("@VerificationCode", SqlDbType.NVarChar).Value = VerificationCode;
        sqlCmd.Parameters.Add("@ExpireDate", SqlDbType.SmallDateTime).Value = DateTime.Now.AddHours(Hours);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

    }
}