using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for CreditOnline
/// </summary>
public class CreditOnlineBank
{
    public int addRecord(int UserId, int Credit, string Bank, int Status, Int64 RefId)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_creditOnlineAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
        sqlCmd.Parameters.Add("@Credit", SqlDbType.Int).Value = Credit;
        sqlCmd.Parameters.Add("@Bank", SqlDbType.NVarChar).Value = Bank;
        sqlCmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = Status;

        sqlConn.Open();
        int RecordId = Convert.ToInt32(sqlCmd.ExecuteScalar());

        sqlCmd.Dispose();
        sqlConn.Dispose();

        return RecordId;
	}
    public void setRefId(int RecordId, Int64 RefId)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_creditOnlineSetRefId", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@RecordId", SqlDbType.Int).Value = RecordId;
        sqlCmd.Parameters.Add("@RefId", SqlDbType.BigInt).Value = RefId;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();
    }
    public int changeStatus(int Status, Int64 RefId)
    {
        int UserId = 0;
        int Credit = 0;
        int RecordId = 0;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_creditOnlineChangeStatus", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@Status", SqlDbType.Int).Value = Status;
        sda.SelectCommand.Parameters.Add("@RefId", SqlDbType.Int).Value = RefId;
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //news doesn't exist
        {
            //LabelName.Text = "موسسه ای با این شناسه موجود نمی باشد!";
        }
        else //news exists
        {
            UserId = Convert.ToInt32(dt.Rows[0]["UserId"].ToString());
            Credit = Convert.ToInt32(dt.Rows[0]["Credit"].ToString());
            RecordId = Convert.ToInt32(dt.Rows[0]["RecordId"].ToString());
        }
        sda.Dispose();
        sqlConn.Close();

        if (Status == 0)
        {
            CreditAdd ca = new CreditAdd();
            ca.addCredit(UserId, 1, Credit, 0, RecordId.ToString());
        }

        return RecordId;
    }
    public int getRecordIdByRefId(Int64 RefId)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_creditOnlineGetRecordIdByRefId", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@RefId", SqlDbType.Int).Value = RefId;
        sda.Fill(ds);
        dt = ds.Tables[0];

        sda.Dispose();
        sqlConn.Close();

        return Convert.ToInt32(dt.Rows[0]["RecordId"].ToString());
    }
}