using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Refer : System.Web.UI.Page
{
    DataClassesDataContext context = new DataClassesDataContext();
    int RegeantId;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            RegeantId = Convert.ToInt32(Request.QueryString["Id"]);
            var query = context.Users.Where(u => u.UserId == RegeantId).Select(s => new { s.FirstName, s.LastName, s.Gender }).FirstOrDefault();

            if (query.Gender == true)
            {
                LabelName.Text = " خانم " + query.FirstName + " " + query.LastName;
            }
            else if (query.Gender == false)
            {
                LabelName.Text = " آقای " + query.FirstName + " " + query.LastName;
            }
        }
        catch (Exception)
        {

            Response.Redirect("~/Default.aspx");
        }

    }

    String Email;
    string VerificatonCode;
    protected void ImageButtonSubmit_Click(object sender, ImageClickEventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Register"))
        {

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
                LabelEmailError.Visible = false;

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
                    sqlCmd.Parameters.Add("@RegeantId", SqlDbType.Int).Value = Request.QueryString["Id"];

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
                imgok.Enabled = false;
                imgok.ImageUrl = "~/images/icons/check22.png";
                LabelRegisterSent.Visible = true;
            }
        }
    }
}