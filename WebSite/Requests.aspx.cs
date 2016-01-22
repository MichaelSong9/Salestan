using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Requests");
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_requestsAllRead", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        if (GridViewFriends.Rows.Count == 0)
        {
            LabelFriendsNoRecord.Visible = true;
        }
    }
    protected void GridViewFriends_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.CompareTo("FriendsReject") == 0)
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd;

            try
            {
                sqlCmd = new SqlCommand("sp_requestsConnectionsFriendsReject", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@RequestId", SqlDbType.Int).Value = Convert.ToInt32(e.CommandArgument.ToString());
                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                sqlConn.Close();
            }

            GridViewFriends.DataBind();
        }

        if (e.CommandName.CompareTo("FriendsAccept") == 0)
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
            SqlCommand sqlCmd;

            try
            {
                DataTable dt = new DataTable();
                DataTable dt2 = new DataTable();
                DataSet ds = new DataSet();
                SqlDataAdapter sda = new SqlDataAdapter("sp_requestsConnectionsFriendsVerify", sqlConn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add("@RequestId", SqlDbType.Int).Value = Convert.ToInt32(e.CommandArgument.ToString());
                sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
                sda.Fill(ds);
                dt = ds.Tables[0];
                dt2 = ds.Tables[1];

                NotificationsClass nc = new NotificationsClass();
                nc.addNotification(1, Convert.ToInt32(dt.Rows[0]["FriendId"].ToString()), 7, dt2.Rows[0]["FullName"].ToString(), "");
            }
            catch
            {

            }
            finally
            {
                sqlConn.Close();
            }

            GridViewFriends.DataBind();
        }
    }
}