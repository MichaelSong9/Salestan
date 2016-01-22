using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for CreditAdd
/// </summary>
public class CreditAdd
{
    public void addCredit(int UserId, int Type, int Credit, int AdminId, string Text)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        //get before credit
        int BeforeCredit = 0;
        switch (Type)
        {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
                {
                    DataTable dt = new DataTable();
                    DataSet ds = new DataSet();
                    SqlDataAdapter sda = new SqlDataAdapter("SELECT Credit FROM Credit WHERE (UserId = @UserId)", sqlConn);
                    sda.SelectCommand.CommandType = CommandType.Text;
                    sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    sda.Fill(ds);
                    dt = ds.Tables[0];
                    BeforeCredit = Convert.ToInt32(dt.Rows[0]["Credit"].ToString());

                    sda.Dispose();

                    break;
                }
            case 8:
                {
                    DataTable dt = new DataTable();
                    DataSet ds = new DataSet();
                    SqlDataAdapter sda = new SqlDataAdapter("SELECT Credit FROM GiftCredit WHERE (UserId = @UserId)", sqlConn);
                    sda.SelectCommand.CommandType = CommandType.Text;
                    sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    sda.Fill(ds);
                    dt = ds.Tables[0];
                    BeforeCredit = Convert.ToInt32(dt.Rows[0]["GiftCredit"].ToString());

                    sda.Dispose();

                    break;
                }
            case 9:
            case 10:
                {
                    DataTable dt = new DataTable();
                    DataSet ds = new DataSet();
                    SqlDataAdapter sda = new SqlDataAdapter("SELECT GiftCredit FROM Credit WHERE (UserId = @UserId)", sqlConn);
                    sda.SelectCommand.CommandType = CommandType.Text;
                    sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    sda.Fill(ds);
                    dt = ds.Tables[0];
                    BeforeCredit = Convert.ToInt32(dt.Rows[0]["GiftCredit"].ToString());

                    sda.Dispose();

                    break;
                }
        }

        //insert credit log
        SqlCommand sqlCmd = new SqlCommand("sp_creditLogAdd", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
        sqlCmd.Parameters.Add("@Type", SqlDbType.Int).Value = Type;
        sqlCmd.Parameters.Add("@Credit", SqlDbType.Int).Value = Credit;
        sqlCmd.Parameters.Add("@AdminId", SqlDbType.Int).Value = AdminId;
        sqlCmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = Text;
        sqlCmd.Parameters.Add("@BeforeCredit", SqlDbType.Int).Value = BeforeCredit;
        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        //insert credit
        switch (Type)
        {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
                {
                    sqlCmd = new SqlCommand("sp_creditAdd", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    sqlCmd.Parameters.Add("@Credit", SqlDbType.Int).Value = Credit;
                    sqlCmd.ExecuteNonQuery();

                    NotificationsClass nc = new NotificationsClass();
                    nc.addNotification(1, UserId, 4, Credit.ToString(), "");

                    break;
                }
            case 8:
                {
                    sqlCmd = new SqlCommand("sp_creditGiftAdd", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    sqlCmd.Parameters.Add("@Credit", SqlDbType.Int).Value = Credit;
                    sqlCmd.ExecuteNonQuery();

                    break;
                }
            case 9:
            case 10:
                {
                    sqlCmd = new SqlCommand("sp_creditGiftAdd", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    sqlCmd.Parameters.Add("@Credit", SqlDbType.Int).Value = Credit;
                    sqlCmd.ExecuteNonQuery();

                    break;
                }
        }

        sqlConn.Dispose();
	}
}