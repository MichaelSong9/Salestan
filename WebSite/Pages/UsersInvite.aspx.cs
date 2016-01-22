using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Pages_UsersInvite : System.Web.UI.Page
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
            Response.Redirect("~/Pages/FirstLogin.aspx");
        }

        LabelRegisterSent.Visible = false;
        imgok.Visible = false;
        lblEmailError.Visible = false;
        userId = Convert.ToInt32(Session["UserId"]);

        //Name
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
        LabelName.Text = title + " " + query.FirstName + " " + query.LastName;
        LabelCode.Text = "GP800-" + Session["UserId"];
    }

    String Email;
    string VerificatonCode;
    string title;
    protected void ImageButtonSubmit0_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            LabelRegisterSent.Visible = false;
            imgok.Visible = false;
            lblEmailError.Visible = false;
            if (TextBoxEmail.Text.Trim() != "")
            {
                Literal1.Text = "";
                Email = TextBoxEmail.Text.Trim();

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

                    LabelRegisterSent.Visible = true;
                    imgok.Visible = true;
                    TextBoxEmail.Text = "";
                }
                else
                {

                    lblEmailError.Visible = true;


                }
            }

            else
            {
                Literal1.Text = "<p class='FormValidation'>پست الکترونیکی خود را وارد نمایید!</p>";

            }
        }
    }
}