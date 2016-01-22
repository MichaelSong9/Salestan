using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Settings");
        }
    }

    protected void ImageButtonChangePassword_Click(object sender, ImageClickEventArgs e)
    {
        lblsuccess.Visible = false;
        try
        {

        if (Session["UserId"] != null)
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            DataClassesDataContext db = new DataClassesDataContext();
            if (TextBoxOld.Text != "" && TextBoxNew.Text != "" && TextBoxNew2.Text != "")
            {
                Literal1.Text = "";

                var query = db.Users.Where(u => u.UserId == userId).SingleOrDefault();
                string OldPass = TextBoxOld.Text;
                string NewPass = TextBoxNew.Text;
                string RpNewPass = TextBoxNew2.Text;

                MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();

                Byte[] hashedBytesOld;
                Byte[] hashedBytes;

                UTF8Encoding encoder = new UTF8Encoding();

                hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(NewPass));
                hashedBytesOld = md5Hasher.ComputeHash(encoder.GetBytes(OldPass));

                if (hashedBytesOld == query.Password)
                {
                    lblerror.Visible = false;

                    if (NewPass == RpNewPass)
                    {
                        query.Password = hashedBytes;
                        db.SubmitChanges();
                        lblsuccess.Visible = true;
                    }
                }
                else
                {
                    lblerror.Visible = true;
                }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        else
        {
            if (TextBoxOld.Text == "")
            {
                Literal1.Text = "<p class='FormValidation'>کلمه عبور خود را  وارد نمایید!</p>";
            }
            else if (TextBoxNew.Text == "" && TextBoxNew2.Text == "")
            {
                Literal1.Text = "<p class='FormValidation'>کلمه عبور جدید و تکرار آن را  وارد نمایید!</p>";
            }
        }
        }
        catch (Exception)
        {

            Response.Redirect("~/Default.aspx");
        }
    }

    protected void LinkButtonDetails_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButtonPassword_Click(object sender, EventArgs e)
    {
        PanelPassword.Visible = true;
        LinkButtonPassword.Enabled = false;
        PanelCommunications.Visible = false;
        LinkButtonCommunications.Enabled = true;
    }
    protected void LinkButtonCommunications_Click(object sender, EventArgs e)
    {
        PanelPassword.Visible = false;
        LinkButtonPassword.Enabled = true;
        PanelCommunications.Visible = true;
        LinkButtonCommunications.Enabled = false;

        LabelCommunicationsChanged.Visible = false;
        ImageCommunicationsChanged.Visible = false;

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_communicationsSettingsRead", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //news doesn't exist
        {
            //LabelName.Text = "خبری با این شناسه موجود نمی باشد!";
        }
        else //user exists
        {
            LabelCommunicationsEmail.Text = dt.Rows[0]["Email"].ToString();
            LabelCommunicationsMobile.Text = dt.Rows[0]["Mobile"].ToString();
            CheckBoxCommunicationsOffersNewEmail.Checked = Convert.ToBoolean(dt.Rows[0]["CommunicationsOffersNewEmail"].ToString());
            CheckBoxCommunicationsCreditEmail.Checked = Convert.ToBoolean(dt.Rows[0]["CommunicationsCreditEmail"].ToString());
            CheckBoxCommunicationsOffersPurchaseEmail.Checked = Convert.ToBoolean(dt.Rows[0]["CommunicationsOffersPurchaseEmail"].ToString());
            CheckBoxCommunicationsUpdatesEmail.Checked = Convert.ToBoolean(dt.Rows[0]["CommunicationsUpdatesEmail"].ToString());
            CheckBoxCommunicationsRequestsEmail.Checked = Convert.ToBoolean(dt.Rows[0]["CommunicationsRequestsEmail"].ToString());
            CheckBoxCommunicationsEventsEmail.Checked = Convert.ToBoolean(dt.Rows[0]["CommunicationsEventsEmail"].ToString());
        }

        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonChangeCommunications_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
        SqlCommand sqlCmd = new SqlCommand("sp_communicationsSettingsWrite", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sqlCmd.Parameters.Add("@CommunicationsOffersNewEmail", SqlDbType.Bit).Value = Convert.ToInt32(CheckBoxCommunicationsOffersNewEmail.Checked);
        sqlCmd.Parameters.Add("@CommunicationsCreditEmail", SqlDbType.Bit).Value = Convert.ToInt32(CheckBoxCommunicationsOffersNewEmail.Checked);
        sqlCmd.Parameters.Add("@CommunicationsOffersPurchaseEmail", SqlDbType.Bit).Value = Convert.ToInt32(CheckBoxCommunicationsOffersPurchaseEmail.Checked);
        sqlCmd.Parameters.Add("@CommunicationsUpdatesEmail", SqlDbType.Bit).Value = Convert.ToInt32(CheckBoxCommunicationsUpdatesEmail.Checked);
        sqlCmd.Parameters.Add("@CommunicationsRequestsEmail", SqlDbType.Bit).Value = Convert.ToInt32(CheckBoxCommunicationsRequestsEmail.Checked);
        sqlCmd.Parameters.Add("@CommunicationsEventsEmail", SqlDbType.Bit).Value = Convert.ToInt32(CheckBoxCommunicationsEventsEmail.Checked);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        sqlCmd.Dispose();
        sqlConn.Dispose();

        LabelCommunicationsChanged.Visible = true;
        ImageCommunicationsChanged.Visible = true;
    }
}