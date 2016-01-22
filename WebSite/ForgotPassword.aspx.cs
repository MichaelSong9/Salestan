using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;

public partial class ForgotPassword2 : System.Web.UI.Page
{
    DataClassesDataContext context = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (LoginStatus)
        {
            PanelForgot.Visible = false;
            PanelError.Visible = true;
        }

        LabelError.Visible = false;
        lblSucces.Visible = false;
        ImageOk.Visible = false;
    }
    string VCode;
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            if (txtEmail.Text.Trim() != "")
            {
                Literal1.Text = "";

                string email = txtEmail.Text.Trim();

                var query = context.Users.Where(u => u.Email == email).FirstOrDefault();
                if (query != null)
                {
                    int UserId = query.UserId;

                    var query1 = context.ForgotPasswords.Where(s => s.UserId == UserId).FirstOrDefault();
                    if (query1 == null)
                    {
                        VCode = Convert.ToString(Guid.NewGuid());
                        ForgotPassword fp = new ForgotPassword();

                        fp.UserId = UserId;
                        fp.Email = email;
                        fp.VerificationCode = VCode;
                        fp.SubmitDate = DateTime.Now;
                        context.ForgotPasswords.InsertOnSubmit(fp);
                        context.SubmitChanges();

                    }
                    else if (query1 != null)
                    {
                        VCode = query1.VerificationCode;

                    }


                    string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath;
                    string RegUrl = "ChangePassword.aspx?VCode=" + VCode;
                    string fullUrl = urlBase + RegUrl;


                    string AppPath = Request.PhysicalApplicationPath;
                    StreamReader sr = new StreamReader(AppPath + "EmailTemplates/ForgotPassword.txt");

                    MailMessage mail = new MailMessage();

                    mail.Subject = "Forgot Password ";
                    mail.IsBodyHtml = true;

                    mail.Body = sr.ReadToEnd();

                    sr.Close();
                    mail.Body = mail.Body.Replace("<%UserName %>", query.FirstName);
                    mail.Body = mail.Body.Replace("<%ChangePasswordURL%>", fullUrl);

                    mail.To.Add(new MailAddress(email));
                    MailAddress m = new MailAddress("register@salestan.ir");

                    mail.From = m;

                    SmtpClient sc = new SmtpClient();
                    sc.Host = "WebMail.salestan.ir";

                    sc.Port = 25;

                    sc.EnableSsl = false;

                    NetworkCredential c = new NetworkCredential("register@salestan.ir", "$users12345");

                    sc.Credentials = c;

                    sc.Send(mail);
                    lblSucces.Visible = true;
                    ImageOk.Visible = true;
                }
                else
                {
                    LabelError.Visible = true;
                }
            }
            else
            {
                Literal1.Text = "<p class='FormValidation'>پست الکترونیکی خود را وارد نمایید!</p>";
            }
        }
    }
}
