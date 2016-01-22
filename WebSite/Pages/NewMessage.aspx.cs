using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Pages_NewMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("~/Pages/FirstLogin.aspx");
        }
    }
    protected void ImageButtonSend_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            if (DropDownListReceiver.Items.Count == 0)
            {
                LabelFriendsNoRecord.Visible = true;
            }
            else
            {
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
                SqlCommand sqlCmd = new SqlCommand("sp_messagesSendAdd", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@SenderId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
                sqlCmd.Parameters.Add("@SenderType", SqlDbType.Int).Value = 1;
                sqlCmd.Parameters.Add("@ReceiverId", SqlDbType.Int).Value = Convert.ToInt32(DropDownListReceiver.SelectedValue);
                sqlCmd.Parameters.Add("@ReceiverType", SqlDbType.Int).Value = 1;
                sqlCmd.Parameters.Add("@Message", SqlDbType.NVarChar).Value = TextBoxMessage.Text;
                if (TextBoxMessage.Text.Length < 100)
                {
                    sqlCmd.Parameters.Add("@Brief", SqlDbType.NVarChar).Value = TextBoxMessage.Text;
                }
                else
                {
                    sqlCmd.Parameters.Add("@Brief", SqlDbType.NVarChar).Value = TextBoxMessage.Text.Substring(0, 100);
                }

                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();

                sqlCmd.Dispose();
                sqlConn.Dispose();

                PanelMessage.Visible = false;
                PanelSent.Visible = true;
            }
        }
    }
}