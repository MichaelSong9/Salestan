using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    DataClassesDataContext context = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (LoginStatus)
        {
            Response.Redirect("~/Panel.aspx");
        }
    }
    protected void ImageButtonLogin_Click(object sender, ImageClickEventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Login"))
        {
            LabelLoginError.Text = "با عرض پوزش ورود به سیستم موقتاً در سایت غیر فعال می باشد.";
            LabelLoginError.Visible = true;
        }
        else
        {
            string loginEmail = TextBoxLoginEmail.Text;

            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            Byte[] PassByte;
            UTF8Encoding encoder = new UTF8Encoding();
            PassByte = md5Hasher.ComputeHash(encoder.GetBytes(TextBoxLoginPassword.Text));

            var query = context.Users.Where(u => u.Email == loginEmail && u.Password == PassByte).SingleOrDefault();
            if (query != null)
            {
                LabelLoginError.Visible = false;
                Session["UserId"] = query.UserId;

                int Hours = 2;
                string VerificationCode = Convert.ToString(Guid.NewGuid());

                if (CheckBoxLoginRemember.Checked)
                {
                    Hours = 168;
                }

                LoginSession ls = new LoginSession();
                ls.setLoginSession(Convert.ToInt32(query.UserId), VerificationCode, Hours);

                HttpCookie _userInfoCookies = new HttpCookie("VC");
                _userInfoCookies["VC"] = VerificationCode;
                _userInfoCookies.Expires = DateTime.Now.AddHours(Hours);
                Response.Cookies.Add(_userInfoCookies);

                query.LastLogin = DateTime.Now;
                context.SubmitChanges();

                Response.Redirect("~/Panel.aspx");
            }
            else
            {
                LabelLoginError.Visible = true;
            }
        }
    }

    protected void ImageButtonRegister_Click(object sender, ImageClickEventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Register"))
        {
            LabelEmailError.Text = "با عرض پوزش ثبت نام موقتاً در سایت غیر فعال می باشد.";
            LabelEmailError.Visible = true;
        }
        else
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_registerCheckEmail", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar));
            sda.SelectCommand.Parameters["@Email"].Value = TextBoxEmail.Text;
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count > 0) //email registered before
            {
                LabelEmailError.Visible = true;
                sqlConn.Close();
                sqlConn.Dispose();
            }
            else
            {
                string VerificationCode = "";

                sda = new SqlDataAdapter("sp_registerTempCheckExists", sqlConn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar));
                sda.SelectCommand.Parameters["@Email"].Value = TextBoxEmail.Text;
                sda.Fill(ds);
                dt = ds.Tables[0];

                if (dt.Rows.Count > 0) //email exist in temp
                {
                    VerificationCode = dt.Rows[0]["VerifiactionCode"].ToString();
                }
                else //email does not exist in temp
                {
                    VerificationCode = Convert.ToString(Guid.NewGuid());

                    SqlCommand sqlCmd = new SqlCommand("sp_registerPre", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@VerificationCode", SqlDbType.NVarChar).Value = VerificationCode;
                    sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = TextBoxEmail.Text;
                    sqlCmd.Parameters.Add("@RegeantId", SqlDbType.Int).Value = 0;

                    sqlConn.Open();
                    sqlCmd.ExecuteNonQuery();
                    sqlConn.Close();
                    sqlConn.Dispose();
                }


                //send mail
                string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath;
                string RegUrl = "Register.aspx?VCode=" + VerificationCode;
                string fullUrl = urlBase + RegUrl;

                string AppPath = Request.PhysicalApplicationPath;
                StreamReader sr = new StreamReader(AppPath + "EmailTemplates/PreRegister.txt");

                MailMessage mail = new MailMessage();
                mail.Subject = "Registration in salsestan.ir ";
                mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
                mail.IsBodyHtml = true;
                mail.Body = sr.ReadToEnd();

                sr.Close();
                mail.Body = mail.Body.Replace("<%RegisterationUrl%>", fullUrl);
                mail.To.Add(new MailAddress(TextBoxEmail.Text));
                MailAddress m = new MailAddress("register@salestan.ir");
                mail.From = m;
                SmtpClient sc = new SmtpClient();
                sc.Host = "WebMail.salestan.ir";
                sc.Port = 25;
                sc.EnableSsl = false;
                NetworkCredential c = new NetworkCredential("register@salestan.ir", "$users12345");
                sc.Credentials = c;
                sc.Send(mail);

                //show message
                LabelRegisterSent.Visible = true;
                ImageRegisterSuccessful.Visible = true;
                LabelEmailError.Visible = false;
            }
        }
    }
}