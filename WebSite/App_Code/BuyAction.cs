using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for BuyAction
/// </summary>
public class BuyAction
{
    public string buyAction(string Section, int UserId, int ItemId, int Quantity, int Payment, int GiftCredit)
    {
        int Code = 0;
        switch (Section)
        {
            case "Offers":
                {
                    Code = buyOffer(UserId,  ItemId, Quantity, Payment, GiftCredit);
                    break;
                }
        }
        return Code.ToString();
	}

    public int buyOffer(int UserId, int ItemId, int Quantity, int Payment, int GiftCredit)
    {
        Random rand = new Random((int)DateTime.Now.Ticks);

        int Code = 0;
        Code = rand.Next(100000, 999999);

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_buyOffer", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@OfferId", SqlDbType.Int).Value = ItemId;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
        sqlCmd.Parameters.Add("@Payment", SqlDbType.Int).Value = Payment;
        sqlCmd.Parameters.Add("@GiftCredit", SqlDbType.Int).Value = GiftCredit;
        sqlCmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = Quantity;
        sqlCmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = "خرید پیشنهاد ویژه";
        sqlCmd.Parameters.Add("@Code", SqlDbType.Int).Value = Code;

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        return Code;
    }
}