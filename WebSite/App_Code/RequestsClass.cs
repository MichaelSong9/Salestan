using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for RequestsClass
/// </summary>
public class RequestsClass
{
    public void addRequest(int RequestType, int SenderId, int SenderType, int ReceiverId, int ReceiverType)
    {
        if (verifyRequest(RequestType, SenderId, SenderType, ReceiverId, ReceiverType))
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlCommand sqlCmd = new SqlCommand("sp_requestAdd", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@RequestType", SqlDbType.Int).Value = RequestType;
            sqlCmd.Parameters.Add("@SenderId", SqlDbType.Int).Value = SenderId;
            sqlCmd.Parameters.Add("@SenderType", SqlDbType.Int).Value = SenderType;
            sqlCmd.Parameters.Add("@ReceiverId", SqlDbType.Int).Value = ReceiverId;
            sqlCmd.Parameters.Add("@ReceiverType", SqlDbType.Int).Value = ReceiverType;

            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();
        }
    }
    public bool verifyRequest(int RequestType, int SenderId, int SenderType, int ReceiverId, int ReceiverType)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_requestVerify", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@RequestType", SqlDbType.Int).Value = RequestType; 
        sda.SelectCommand.Parameters.Add("@SenderId", SqlDbType.Int).Value = SenderId;
        sda.SelectCommand.Parameters.Add("@SenderType", SqlDbType.Int).Value = SenderType;
        sda.SelectCommand.Parameters.Add("@ReceiverId", SqlDbType.Int).Value = ReceiverId;
        sda.SelectCommand.Parameters.Add("@ReceiverType", SqlDbType.Int).Value = ReceiverType;
        sda.Fill(ds);
        dt = ds.Tables[0];

        sda.Dispose();
        sqlConn.Dispose();

        if (dt.Rows.Count == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}