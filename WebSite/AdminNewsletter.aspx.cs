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

public partial class AdminNewsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Newsletter");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 2300, 0, "0");
        }
    }
    protected void LinkButtonSend_Click(object sender, EventArgs e)
    {
        PanelSend.Visible = true;
        PanelLog.Visible = false;
        LinkButtonSend.Enabled = false;
        LinkButtonLog.Enabled = true;
    }
    protected void LinkButtonLog_Click(object sender, EventArgs e)
    {
        PanelSend.Visible = false;
        PanelLog.Visible = true;
        LinkButtonSend.Enabled = true;
        LinkButtonLog.Enabled = false;

        if (GridViewLog.Rows.Count == 0)
        {
            LabelLogNoRecord.Visible = true;
        }
    }
    protected void ImageButtonSend_Click(object sender, ImageClickEventArgs e)
    {
        string StoredProcedure = "";

        switch (RadioButtonListReceivers.SelectedValue)
        {
            case "members":
                {
                    StoredProcedure = "sp_newsletterMembersEmails";
                    break;
                }
            case "email":
                {
                    StoredProcedure = "sp_newsletterEmailsEmails";
                    break;
                }
            case "offers":
                {
                    StoredProcedure = "sp_newsletterOffersEmails";
                    break;
                }
        }

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter(StoredProcedure, sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //news doesn't exist
        {
            //LabelName.Text = "خبری با این شناسه موجود نمی باشد!";
        }
        else //news exists
        {
            //send email
            MailMessage mail = new MailMessage();

            mail.Subject = TextBoxTitle.Text;
            mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            if (RadioButtonListFormat.SelectedValue == "HTML")
            {
                mail.IsBodyHtml = true;
            }
            else
            {
                mail.IsBodyHtml = false;
            }

            mail.Body = TextBoxBody.Text;

            System.Net.Mail.AlternateView plainView = System.Net.Mail.AlternateView.CreateAlternateViewFromString
            (System.Text.RegularExpressions.Regex.Replace(TextBoxBody.Text, @"<(.|\n)*?>", string.Empty), null, "text/plain");
            System.Net.Mail.AlternateView htmlView = System.Net.Mail.AlternateView.CreateAlternateViewFromString(TextBoxBody.Text, null, "text/html");

            mail.AlternateViews.Add(plainView);
            mail.AlternateViews.Add(htmlView);

            MailAddress m = new MailAddress("info@salestan.ir");

            mail.From = m;

            SmtpClient sc = new SmtpClient();
            sc.Host = "WebMail.salestan.ir";
            sc.Port = 25;
            sc.EnableSsl = false;
            NetworkCredential c = new NetworkCredential("info@salestan.ir", "$infomail1230185");
            sc.Credentials = c;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                mail.To.Add(new MailAddress(dt.Rows[i]["Email"].ToString()));
                sc.Send(mail);
            }

            SqlCommand sqlCmdAdd = new SqlCommand("sp_newsletterAdd", sqlConn);
            sqlCmdAdd.CommandType = CommandType.StoredProcedure;
            sqlCmdAdd.Parameters.Add("@Format", SqlDbType.VarChar).Value = RadioButtonListFormat.SelectedValue;
            sqlCmdAdd.Parameters.Add("@ReceiversCount", SqlDbType.Int).Value = dt.Rows.Count;
            sqlCmdAdd.Parameters.Add("@ReceiversType", SqlDbType.VarChar).Value = RadioButtonListReceivers.SelectedValue;
            sqlCmdAdd.Parameters.Add("@Title", SqlDbType.NVarChar).Value = TextBoxTitle.Text;
            sqlCmdAdd.Parameters.Add("@Body", SqlDbType.NVarChar).Value = TextBoxBody.Text;

            sqlConn.Open();
            sqlCmdAdd.ExecuteNonQuery();

            sqlCmdAdd.Dispose();

            LabelAddMessage.Visible = true;
            LabelAddMessage.Text = "خبرنامه با موفقیت ارسال شد.";
            LabelAddMessage.CssClass = "SuccessMessage";
        }
        sda.Dispose();
        sqlConn.Close();
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}