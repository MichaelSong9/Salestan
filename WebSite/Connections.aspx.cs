using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.IO;

public partial class Connections : System.Web.UI.Page
{
    DataClassesDataContext context = new DataClassesDataContext();
    int userId;

    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Connections");
        }

        if (GridViewFriends.Rows.Count == 0)
        {
            LabelFriendsNoRecord.Visible = true;
        }
    }
    protected void LinkButtonFriendsSearch_Click(object sender, EventArgs e)
    {
        PanelFriendsSearch.Visible = true;
        LinkButtonFriendsSearch.Enabled = false;
        TextBoxFriendsSearchEmail.Text = "";
        PanelFriendsSearchInvitationSent.Visible = false;
    }
    protected void ImageButtonFriendsSearch_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_connectionsFriendsSearchByEmail", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@Email", SqlDbType.VarChar).Value = TextBoxFriendsSearchEmail.Text;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            PanelFriendsSearchNotFound.Visible = true;
            PanelFriendsSearchResult.Visible = false;
            PanelFriendsSearchError.Visible = false;
        }
        else
        {
            if (dt.Rows[0]["UserId"].ToString() == Session["UserId"].ToString())
            {
                PanelFriendsSearchError.Visible = true;
                LabelFriendsSearchErrorMessage.Text = "شما نمی توانید درخواست افزودن به فهرست دوستان برای خود ارسال نمایید!";
                PanelFriendsSearchNotFound.Visible = false;
            }
            else
            {
                DataTable dtFriend = new DataTable();
                dtFriend = ds.Tables[1];
                if (dtFriend.Rows.Count == 0)
                {
                    LabelFriendsSearchFullName.Text = dt.Rows[0]["FullName"].ToString();
                    HiddenFieldFriendsSearchUserId.Value = dt.Rows[0]["UserId"].ToString();
                    PanelFriendsSearchResult.Visible = true;
                    PanelFriendsSearchNotFound.Visible = false;
                    PanelFriendsSearchError.Visible = false;
                }
                else
                {
                    PanelFriendsSearchError.Visible = true;
                    LabelFriendsSearchErrorMessage.Text = "کاربر در فهرست دوستان شما قرار دارد!";
                    PanelFriendsSearchNotFound.Visible = false;
                }
            }
        }

        sda.Dispose();
        sqlConn.Dispose();
    }
    protected void LinkButtonFriendsSearchInvite_Click(object sender, EventArgs e)
    {
        userId = Convert.ToInt32(Session["UserId"]);
        string Email = "";
        string VerificatonCode = "";
        string title = "";

        if (TextBoxFriendsSearchEmail.Text.Trim() != "")
        {
            Email = TextBoxFriendsSearchEmail.Text.Trim();

            var query = context.Users.Where(u => u.UserId == userId).FirstOrDefault();
            bool gender = query.Gender;


            if (gender == true)
            {
                title = "خانم";
            }
            else if (gender == false)
            {
                title = "آقای";
            }
            string Name = query.FirstName + " " + query.LastName + " ";
            string regentid = "GP800-" + userId;

            var q2 = context.RegisterTemps.Where(p => p.Email == Email).SingleOrDefault();
            var q3 = context.Users.Where(k => k.Email == Email).SingleOrDefault();

            if (q3 == null)
            {
                if (q2 != null)
                {
                    VerificatonCode = q2.VerifiactionCode;
                }
                else if (q2 == null)
                {
                    VerificatonCode = Convert.ToString(Guid.NewGuid());

                    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
                    SqlCommand sqlCmd = new SqlCommand("INSERT INTO RegisterTemp (VerifiactionCode, Email, SubmitDate, RegeantId) VALUES (@VerifiactionCode,@Email, GETDATE(),@RegeantId)", sqlConn);
                    sqlCmd.CommandType = CommandType.Text;
                    sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                    sqlCmd.Parameters.Add("@VerifiactionCode", SqlDbType.NVarChar).Value = VerificatonCode;
                    sqlCmd.Parameters.Add("@RegeantId", SqlDbType.Int).Value = Session["UserId"];
                    sqlConn.Open();
                    sqlCmd.ExecuteNonQuery();

                    sqlCmd.Dispose();
                    sqlConn.Dispose();
                }


                string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath;
                string RegUrl = "Register.aspx?VCode=" + VerificatonCode;
                string fullUrl = urlBase + RegUrl;

                string AppPath = Request.PhysicalApplicationPath;
                StreamReader sr = new StreamReader(AppPath + "EmailTemplates/InvitationMessage.txt");

                MailMessage mail = new MailMessage();

                mail.Subject = "Invitation to signup in Salsestan.ir";
                mail.IsBodyHtml = true;

                mail.Body = sr.ReadToEnd();

                sr.Close();
                mail.Body = mail.Body.Replace("<%Title%>", title);
                mail.Body = mail.Body.Replace("<%UserName%>", Name);
                mail.Body = mail.Body.Replace("<%RegentId%>", regentid);
                mail.Body = mail.Body.Replace("<%RegisterationUrl%>", fullUrl);

                mail.To.Add(new MailAddress(Email));
                MailAddress m = new MailAddress("register@salestan.ir");

                mail.From = m;

                SmtpClient sc = new SmtpClient();
                sc.Host = "WebMail.salestan.ir";

                sc.Port = 25;

                sc.EnableSsl = false;

                NetworkCredential c = new NetworkCredential("register@salestan.ir", "$users12345");

                sc.Credentials = c;

                sc.Send(mail);
            }
        }

        PanelFriendsSearchNotFound.Visible = false;
        PanelFriendsSearchInvitationSent.Visible = true;
        PanelFriendsSearch.Visible = false;
        LinkButtonFriendsSearch.Enabled = true;
    }
    protected void LinkButtonFriendsRequest_Click(object sender, EventArgs e)
    {
        RequestsClass rc = new RequestsClass();
        rc.addRequest(1, Convert.ToInt32(Session["UserId"]), 1, Convert.ToInt32(HiddenFieldFriendsSearchUserId.Value), 1);

        PanelFriendsSearchInvitationSent.Visible = true;
        PanelFriendsSearchResult.Visible = false;
        PanelFriendsSearch.Visible = false;
        LinkButtonFriendsSearch.Enabled = true;
    }
}