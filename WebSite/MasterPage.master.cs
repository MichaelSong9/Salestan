using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    DataClassesDataContext context = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["VC"] != null)
        {
            string VC = Request.Cookies["VC"].Values["VC"];
            LoginSession ls = new LoginSession();
            int UserId = ls.getUserId(VC);
            if (UserId == 0)
            {
                PanelUser.Visible = false;
                PanelLogin.Visible = true;
                PanelTop.Visible = true;
                Session.Remove("UserId");
                Response.Cookies.Remove("VC");
            }
            else
            {
                Session["UserId"] = UserId.ToString();
                loginTrue();
            }
        }
        else
        {
            PanelUser.Visible = false;
            PanelLogin.Visible = true;
            PanelTop.Visible = true;
            Session.Remove("UserId");
            Response.Cookies.Remove("VC");
        }

        if (!IsPostBack)
        {
            AccessControl ac = new AccessControl();
            if (!ac.getSectionAccess("General"))
            {
                Response.Redirect("~/NoAccess.aspx");
            }

            HyperLinkPageFlip.NavigateUrl = "~/Offers.aspx";
            HyperLinkPageFlip.ImageUrl = "~/_shared/jQuery/PageFlip/page_flip.png";

            //get keywords & descriptions
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_seoInfo", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.Fill(ds);
            dt = ds.Tables[0];

            Page.MetaKeywords = dt.Rows[0]["SeoKeywords"].ToString();
            Page.MetaDescription = dt.Rows[0]["SeoDescriptions"].ToString();

            sda.Dispose();
            sqlConn.Close();

            //getMainSectionsLinksCode
            LiteralSectionsLinks.Text = ac.getMainSectionsLinksCode(Path.GetFileName(Request.Path));
            LiteralSectionsFooter.Text = ac.getMainSectionsFooterCode(Path.GetFileName(Request.Path));

            //Location&Language Menu
            DataTable dtLocations = new DataTable();
            DataTable dtLanguages = new DataTable();
            DataSet dsLocations = new DataSet();
            SqlDataAdapter sdaLocations = new SqlDataAdapter("sp_LocationsAndLanguagesList", sqlConn);
            sdaLocations.SelectCommand.CommandType = CommandType.StoredProcedure;
            sdaLocations.Fill(dsLocations);
            dtLocations = dsLocations.Tables[0];
            dtLanguages = dsLocations.Tables[1];
            for (int i = 0; i < dtLocations.Rows.Count; i++)
            {
                MenuItem newItem = new MenuItem();
                newItem.NavigateUrl = "~/Pages/ChangeLocation.aspx?Mode=Location&LocationId=" + dtLocations.Rows[i]["LocationId"].ToString() + "&LocationName=" + dtLocations.Rows[i]["LocationName"].ToString();
                newItem.Text = dtLocations.Rows[i]["LocationName"].ToString();
                MenuLocations.Items[0].ChildItems.Add(newItem);
            }
            //for (int i = 0; i < dtLanguages.Rows.Count; i++)
            //{
            //    MenuItem newItem = new MenuItem();
            //    newItem.NavigateUrl = "~/Pages/ChangeLocation.aspx?Mode=Language&LanguageId=" + dtLanguages.Rows[i]["LanguageId"].ToString() + "&LanguageName=" + dtLanguages.Rows[i]["LanguageName"].ToString();
            //    newItem.Text = dtLanguages.Rows[i]["LanguageName"].ToString();
            //    MenuLanguages.Items[0].ChildItems.Add(newItem);
            //}
            LabelLocation.Text = "موقعیت: سراسری";
            //try
            //{
            //    if (HttpContext.Current.Request.Cookies["Location"] != null)
            //    {
            //        LabelLocation.Text = "موقعیت: " + Request.Cookies["Location"].Values["LocationName"];
            //    }
            //    else
            //    {
            //        HttpCookie _locationCookies = new HttpCookie("Location");
            //        _locationCookies["LocationId"] = "0";
            //        _locationCookies["LocationName"] = "سراسری";
            //        _locationCookies.Expires = DateTime.Now.AddYears(1);
            //        Response.Cookies.Add(_locationCookies);
            //        LabelLocation.Text = "موقعیت: " + Request.Cookies["Location"].Values["LocationName"];
            //    }
            //}
            //catch (Exception)
            //{

            //}
            //try
            //{
            //    if (HttpContext.Current.Request.Cookies["Language"] != null)
            //    {
            //        LabelLanguage.Text = "زبان: " + Request.Cookies["Language"].Values["LanguageName"];
            //    }
            //    else
            //    {
            //        HttpCookie _LanguageCookies = new HttpCookie("Language");
            //        _LanguageCookies["LanguageId"] = "FA";
            //        _LanguageCookies["LanguageName"] = "فارسی";
            //        _LanguageCookies.Expires = DateTime.Now.AddYears(1);
            //        Response.Cookies.Add(_LanguageCookies);
            //        LabelLanguage.Text = "زبان: " + Request.Cookies["Language"].Values["LanguageName"];
            //    }
            //}
            //catch (Exception)
            //{

            //}

        }
    }

    protected void loginTrue()
    {
        PanelUser.Visible = true;
        PanelLogin.Visible = false;
        PanelTop.Visible = false;

        AccessControl ac = new AccessControl();
        LiteralPanelLinksCode.Text = ac.getPanelLinksCode(Path.GetFileName(Request.Path), Convert.ToInt32(Session["UserId"]));

        if (!IsPostBack)
        {
            DataClassesDataContext context = new DataClassesDataContext();
            var queryVerify = context.Admins.Where(r => r.UserId == Convert.ToInt32(Session["UserId"]) && r.Status == 1).FirstOrDefault();
            if (queryVerify != null)
            {
                MenuAdmin.Visible = true;


                DataTable dt2 = new DataTable();
                DataSet ds2 = new DataSet();


                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);
                SqlDataAdapter sda = new SqlDataAdapter("sp_adminPremissions", sqlConn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
                sda.Fill(ds2);
                dt2 = ds2.Tables[0];

                if (Convert.ToBoolean(dt2.Rows[0]["PremAdmins"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/admin24.png";
                    item.NavigateUrl = "~/AdminAdmins.aspx";
                    item.Text = "مدیریت ادمین ها";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremAds"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/icons/ads24.png";
                    item.NavigateUrl = "~/AdminAds.aspx";
                    item.Text = "مدیریت تبلیغات";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremAgencies"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/agencies24.png";
                    item.NavigateUrl = "~/AdminAgencies.aspx";
                    item.Text = "مدیریت نمایندگی ها";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremBlog"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/blog24.png";
                    item.NavigateUrl = "~/AdminBlog.aspx";
                    item.Text = "مدیریت بلاگ";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremCharity"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/charity24.png";
                    item.NavigateUrl = "~/AdminCharity.aspx";
                    item.Text = "مدیریت خیریه";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremCompanies"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/companies24.png";
                    item.NavigateUrl = "~/AdminCompanies.aspx";
                    item.Text = "مدیریت مشاغل";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremContent"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/content24.png";
                    item.NavigateUrl = "~/AdminContent.aspx";
                    item.Text = "مدیریت محتوا";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremCoupons"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/coupons24.png";
                    item.NavigateUrl = "~/AdminCoupons.aspx";
                    item.Text = "مدیریت کوپن ها";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremCredit"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/credit24.png";
                    item.NavigateUrl = "~/AdminCredit.aspx";
                    item.Text = "مدیریت اعتبار";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremCurrencies"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/currencies24.png";
                    item.NavigateUrl = "~/AdminCurrencies.aspx";
                    item.Text = "مدیریت واحدهای پولی";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremLocations"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/locations24.png";
                    item.NavigateUrl = "~/AdminLocations.aspx";
                    item.Text = "مدیریت موقعیت ها و زبان ها";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremNewsletter"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/newsletter24.png";
                    item.NavigateUrl = "~/AdminNewsletter.aspx";
                    item.Text = "مدیریت خبرنامه";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremOffers"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/offers24.png";
                    item.NavigateUrl = "~/AdminOffers.aspx";
                    item.Text = "مدیریت پیشنهادهای ویژه";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremSettings"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/settings24.png";
                    item.NavigateUrl = "~/AdminSettings.aspx";
                    item.Text = "تنظیمات";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremStats"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/stats24.png";
                    item.NavigateUrl = "~/AdminStats.aspx";
                    item.Text = "آمار";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremSupport"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/support24.png";
                    item.NavigateUrl = "~/AdminSupport.aspx";
                    item.Text = "مدیریت پشتیبانی";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }
                if (Convert.ToBoolean(dt2.Rows[0]["PremUsers"].ToString()))
                {
                    MenuItem item = new MenuItem();
                    item.ImageUrl = "~/images/controlpanel/admin/users24.png";
                    item.NavigateUrl = "~/AdminUsers.aspx";
                    item.Text = "مدیریت کاربران";
                    MenuAdmin.Items[0].ChildItems.Add(item);
                }

                sda.Dispose();
                sqlConn.Close();

            }
        }
    }

    protected void ImageButtonTop_Click(object sender, ImageClickEventArgs e)
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
            sda.SelectCommand.Parameters["@Email"].Value = TextBoxTopEmail.Text;
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count > 0) //email registered before
            {
                sqlConn.Close();
                sqlConn.Dispose();
            }
            else
            {
                string VerificationCode = "";

                sda = new SqlDataAdapter("sp_registerTempCheckExists", sqlConn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar));
                sda.SelectCommand.Parameters["@Email"].Value = TextBoxTopEmail.Text;
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
                    sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = TextBoxTopEmail.Text;
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
                mail.To.Add(new MailAddress(TextBoxTopEmail.Text));
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
                ImageButtonTop.Enabled = false;
                ImageButtonTop.ImageUrl = "~/images/icons/check22.png";
                LabelRegisterSent.Visible = true;
            }
        }
    }
}
