using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for CreditRequestAction
/// </summary>
public class CreditRequestAction
{
    public void requestAction(int RecordId, int Status, string Text)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd;

        sqlCmd = new SqlCommand("sp_creditRequestAction", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@RecordId", SqlDbType.Int).Value = RecordId;
        //sqlCmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = Text;
        sqlCmd.Parameters.Add("@Status", SqlDbType.Int).Value = Status;
        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlConn.Close();
        sqlConn.Dispose();

	}
}