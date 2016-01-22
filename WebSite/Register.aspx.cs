using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Globalization;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Transactions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
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

        if (!Page.IsPostBack)
        {
            //try
            //{
                String Vcode = Request.QueryString["VCode"].ToString();

                var q = context.RegisterTemps.Where(p => p.VerifiactionCode == Vcode).SingleOrDefault();
                LabelEmailValue.Text = q.Email;
                if (q.RegeantId != 0)
                {
                    TextBoxRegeantId.Text = "GP800-" + q.RegeantId;
                }
            
            DropDownListLocationCity.Enabled = true;
            DropDownListLocationCity.Items.Clear();
            DropDownListLocationCity.Items.Add("اسلام‌شهر");
            DropDownListLocationCity.Items.Add("پاکدشت");
            DropDownListLocationCity.Items.Add("تهران");
            DropDownListLocationCity.Items.Add("دماوند");
            DropDownListLocationCity.Items.Add("رباط‌ کریم");
            DropDownListLocationCity.Items.Add("ری");
            DropDownListLocationCity.Items.Add("ساوجبلاغ");
            DropDownListLocationCity.Items.Add("شمیرانات");
            DropDownListLocationCity.Items.Add("شهریار");
            DropDownListLocationCity.Items.Add("فیروزکوه");
            DropDownListLocationCity.Items.Add("کرج");
            DropDownListLocationCity.Items.Add("نظرآباد");
            DropDownListLocationCity.Items.Add("ورامین");
            DropDownListLocationCity.SelectedValue = "تهران";

        }
    }
    protected void ImageButtonRegeant_Click(object sender, ImageClickEventArgs e)
    {
        string Regeant = TextBoxRegeantId.Text.Trim();


        if (Regeant.Length >= 6)
        {
            if (Regeant.Trim().Substring(0, 6).ToUpper() == "GP800-")
            {

                int UserId = Convert.ToInt32(TextBoxRegeantId.Text.Trim().Substring(6));
                var query = context.Users.Where(s => s.UserId == UserId).FirstOrDefault();

                if (query != null)
                {
                    LabelRegeant.Text = "کد معرف شما صحیح می باشد";
                    LabelRegeant.CssClass = "SuccessMessage";
                }
                else if (query == null)
                {
                    LabelRegeant.Text = "کد معرف وارد شده در سیستم وجود ندارد";
                    LabelRegeant.CssClass = "ErrorMessage";
                }
            }
            else
            {
                LabelRegeant.Text = "کد معرف شما صحیح نمی باشد";
                LabelRegeant.CssClass = "ErrorMessage";
            }
        }
        else if (Regeant.Length < 6)
        {
            LabelRegeant.Text = "کد معرف شما صحیح نمی باشد";
            LabelRegeant.CssClass = "ErrorMessage";
        }

    }
   int UserId;
    protected void ImageButtonSubmit_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlCommand sqlCmd = new SqlCommand("sp_register", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = LabelEmailValue.Text;
        sqlCmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = TextBoxFirstName.Text;
        sqlCmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = TextBoxLastName.Text;
        sqlCmd.Parameters.Add("@BirthDate", SqlDbType.VarChar).Value = DropDownListBirthYear.SelectedValue + "/" + DropDownListBirthMonth.SelectedValue + "/" + DropDownListBirthDay.SelectedValue;
        sqlCmd.Parameters.Add("@Gender", SqlDbType.Bit).Value = Convert.ToBoolean(DropDownListGender.SelectedValue);
        sqlCmd.Parameters.Add("@Country", SqlDbType.VarChar).Value = DropDownListLocationCountry.SelectedValue;
        sqlCmd.Parameters.Add("@City", SqlDbType.NVarChar).Value = DropDownListLocationCity.SelectedValue;
        sqlCmd.Parameters.Add("@Province", SqlDbType.NVarChar).Value = DropDownListLocationProvince.SelectedValue;
        sqlCmd.Parameters.Add("@Job", SqlDbType.NVarChar).Value = TextBoxJob.Text;
        sqlCmd.Parameters.Add("@Education", SqlDbType.NVarChar).Value = DropDownListEducations.SelectedValue;
        sqlCmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBoxAddress.Text;
        sqlCmd.Parameters.Add("@HomeTel", SqlDbType.NVarChar).Value = TextBoxHomePhone.Text;
        sqlCmd.Parameters.Add("@WorkTel", SqlDbType.NVarChar).Value = TextBoxWorkPhone.Text;
        sqlCmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = TextBoxMobile.Text;


        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        byte[] hashedBytes;
        UTF8Encoding encoder = new UTF8Encoding();
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(TextBoxPassword.Text));
        SqlParameter paramPwd;
        paramPwd = new SqlParameter("@Password", SqlDbType.Binary, 16);
        paramPwd.Value = hashedBytes;
        sqlCmd.Parameters.Add(paramPwd);

        sqlConn.Open();
        sqlCmd.ExecuteNonQuery();

        dt = new DataTable();
        ds = new DataSet();
        sqlCmd = new SqlCommand("sp_userIdByEmail", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = LabelEmailValue.Text;
        SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
        sda.Fill(ds);
        dt = ds.Tables[0];
        Session["UserId"] = dt.Rows[0]["UserId"].ToString();

        //add credit records
        sqlCmd = new SqlCommand("sp_registerInsertRecords", sqlConn);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Session["UserId"];
        sqlCmd.Parameters.Add("@Introduction", SqlDbType.Int).Value = DropDownListIntroduction.SelectedValue;

        sqlCmd.ExecuteNonQuery();

        NotificationsClass nc = new NotificationsClass();
        nc.addNotification(1, Convert.ToInt32(Session["UserId"]), 1, "", "");

        //regeants credit
        if (TextBoxRegeantId.Text.Trim() != "")
        {
            string Regeant = TextBoxRegeantId.Text.Trim();

            if (Regeant.Length >= 6)
            {
                if (Regeant.Trim().Substring(0, 6).ToUpper() == "GP800-")
                {

                    dt = new DataTable();
                    ds = new DataSet();
                    sqlCmd = new SqlCommand("sp_userCheckExistsByUserId", sqlConn);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxRegeantId.Text.Trim().Substring(6));
                    sda = new SqlDataAdapter(sqlCmd);
                    sda.Fill(ds);
                    dt = ds.Tables[0];

                    if (dt.Rows.Count != 0) //user exist
                    {
                        sqlCmd = new SqlCommand("sp_registerRegeantCredits", sqlConn);
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Session["UserId"];
                        sqlCmd.Parameters.Add("@RegeantId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxRegeantId.Text.Trim().Substring(6));

                        sqlCmd.ExecuteNonQuery();

                        sqlCmd.Dispose();
                        sqlConn.Dispose();
                        sda.Dispose();

                        nc.addNotification(1, Convert.ToInt32(TextBoxRegeantId.Text.Trim().Substring(6)), 3, TextBoxFirstName.Text + " " + TextBoxLastName.Text, "8000");
                    }
                }
            }
        }

        sqlConn.Close();
        sqlConn.Dispose();


        //send email
        string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath;
        string RegUrl = "/Offers.aspx?UserId=" + UserId;
        string fullUrl = urlBase + RegUrl;

        string AppPath = Request.PhysicalApplicationPath;
        StreamReader sr = new StreamReader(AppPath + "EmailTemplates/SuccessfulRegister.txt");

        MailMessage mail = new MailMessage();

        mail.Subject = "Successful Registeration";
        mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
        mail.IsBodyHtml = true;

        mail.Body = sr.ReadToEnd();

        System.Net.Mail.AlternateView plainView = System.Net.Mail.AlternateView.CreateAlternateViewFromString
        (System.Text.RegularExpressions.Regex.Replace(sr.ReadToEnd(), @"<(.|\n)*?>", string.Empty), null, "text/plain");
        System.Net.Mail.AlternateView htmlView = System.Net.Mail.AlternateView.CreateAlternateViewFromString(sr.ReadToEnd(), null, "text/html");

        mail.AlternateViews.Add(plainView);
        mail.AlternateViews.Add(htmlView);

        mail.To.Add(new MailAddress(LabelEmailValue.Text));
        MailAddress m = new MailAddress("register@salestan.ir");

        mail.From = m;

        SmtpClient sc = new SmtpClient();
        sc.Host = "WebMail.salestan.ir";

        sc.Port = 25;

        sc.EnableSsl = false;

        NetworkCredential c = new NetworkCredential("register@salestan.ir", "$users12345");

        sc.Credentials = c;

        sc.Send(mail);

        sr.Close();



        int Hours = 2;
        string VerificationCode = Convert.ToString(Guid.NewGuid());

        LoginSession ls = new LoginSession();
        ls.setLoginSession(Convert.ToInt32(Session["UserId"]), VerificationCode, Hours);

        HttpCookie _userInfoCookies = new HttpCookie("VC");
        _userInfoCookies["VC"] = VerificationCode;
        _userInfoCookies.Expires = DateTime.Now.AddHours(Hours);
        Response.Cookies.Add(_userInfoCookies);


        Response.Redirect("~/Panel.aspx");
    }
    protected void DropDownListLocationProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownListLocationProvince.SelectedValue)
        {
            case "1":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("تبریز");
                    DropDownListLocationCity.Items.Add("آذرشهر");
                    DropDownListLocationCity.Items.Add("اسکو");
                    DropDownListLocationCity.Items.Add("اهر");
                    DropDownListLocationCity.Items.Add("بستان‌آباد");
                    DropDownListLocationCity.Items.Add("بناب");
                    DropDownListLocationCity.Items.Add("جلفا");
                    DropDownListLocationCity.Items.Add("چاراویماق");
                    DropDownListLocationCity.Items.Add("شبستر");
                    DropDownListLocationCity.Items.Add("عجب‌شیر");
                    DropDownListLocationCity.Items.Add("کلیبر");
                    DropDownListLocationCity.Items.Add("مراغه");
                    DropDownListLocationCity.Items.Add("مرند");
                    DropDownListLocationCity.Items.Add("ملکان");
                    DropDownListLocationCity.Items.Add("میانه");
                    DropDownListLocationCity.Items.Add("ورزقان");
                    DropDownListLocationCity.Items.Add("هریس");
                    DropDownListLocationCity.Items.Add("هشترود");
                    break;
                }
            case "2":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("ارومیه");
                    DropDownListLocationCity.Items.Add("اشنویه");
                    DropDownListLocationCity.Items.Add("بوکان");
                    DropDownListLocationCity.Items.Add("پلدشت");
                    DropDownListLocationCity.Items.Add("پیرانشهر");
                    DropDownListLocationCity.Items.Add("تکاب");
                    DropDownListLocationCity.Items.Add("چالدران");
                    DropDownListLocationCity.Items.Add("چایپاره");
                    DropDownListLocationCity.Items.Add("سردشت");
                    DropDownListLocationCity.Items.Add("سلماس");
                    DropDownListLocationCity.Items.Add("شاهین‌دژ");
                    DropDownListLocationCity.Items.Add("شوط");
                    DropDownListLocationCity.Items.Add("ماکو");
                    DropDownListLocationCity.Items.Add("مهاباد");
                    DropDownListLocationCity.Items.Add("میاندوآب");
                    DropDownListLocationCity.Items.Add("نقده");
                    DropDownListLocationCity.Items.Add("شوط");
                    DropDownListLocationCity.Items.Add("خوی");
                    break;
                }
            case "3":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اردبیل");
                    DropDownListLocationCity.Items.Add("بیله‌سوار ");
                    DropDownListLocationCity.Items.Add("پارس‌آباد");
                    DropDownListLocationCity.Items.Add("خلخال");
                    DropDownListLocationCity.Items.Add("سرعین");
                    DropDownListLocationCity.Items.Add("کوثر");
                    DropDownListLocationCity.Items.Add("گرمی");
                    DropDownListLocationCity.Items.Add("مشگین‌شهر");
                    DropDownListLocationCity.Items.Add("نمین");
                    DropDownListLocationCity.Items.Add("نیر");
                    break;
                }
            case "4":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اصفهان");
                    DropDownListLocationCity.Items.Add("اردستان");
                    DropDownListLocationCity.Items.Add("برخوار");
                    DropDownListLocationCity.Items.Add("تیران و کرون");
                    DropDownListLocationCity.Items.Add("چادگان");
                    DropDownListLocationCity.Items.Add("خمینی‌شهر");
                    DropDownListLocationCity.Items.Add("خوانسار");
                    DropDownListLocationCity.Items.Add("خور و بیابانک");
                    DropDownListLocationCity.Items.Add("سمیرم");
                    DropDownListLocationCity.Items.Add("شاهین‌شهر و میمه");
                    DropDownListLocationCity.Items.Add("شهرضا");
                    DropDownListLocationCity.Items.Add("دهاقان");
                    DropDownListLocationCity.Items.Add("فریدن");
                    DropDownListLocationCity.Items.Add("فریدون‌شهر");
                    DropDownListLocationCity.Items.Add("فلاورجان");
                    DropDownListLocationCity.Items.Add("كاشان");
                    DropDownListLocationCity.Items.Add("گلپایگان");
                    DropDownListLocationCity.Items.Add("لنجان");
                    DropDownListLocationCity.Items.Add("مبارکه");
                    DropDownListLocationCity.Items.Add("نایین");
                    DropDownListLocationCity.Items.Add("نجف‌آباد");
                    DropDownListLocationCity.Items.Add("نطنز");
                    break;
                }
            case "5":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("ساوجبلاغ");
                    DropDownListLocationCity.Items.Add("طالقان");
                    DropDownListLocationCity.Items.Add("کرج");
                    DropDownListLocationCity.Items.Add("نظرآباد");
                    break;
                }
            case "6":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آبدانان");
                    DropDownListLocationCity.Items.Add("ایلام");
                    DropDownListLocationCity.Items.Add("ایوان");
                    DropDownListLocationCity.Items.Add("دره‌شهر");
                    DropDownListLocationCity.Items.Add("دهلران");
                    DropDownListLocationCity.Items.Add("شیروان و چرداول");
                    DropDownListLocationCity.Items.Add("مهران");
                    break;
                }
            case "7":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("بوشهر");
                    DropDownListLocationCity.Items.Add("دیر");
                    DropDownListLocationCity.Items.Add("دیلم");
                    DropDownListLocationCity.Items.Add("کنگان");
                    DropDownListLocationCity.Items.Add("گناوه");
                    DropDownListLocationCity.Items.Add("تنگستان");
                    DropDownListLocationCity.Items.Add("جم");
                    DropDownListLocationCity.Items.Add("دشتستان");
                    DropDownListLocationCity.Items.Add("دشتی");
                    break;
                }

            case "8":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اسلام‌شهر");
                    DropDownListLocationCity.Items.Add("پاکدشت");
                    DropDownListLocationCity.Items.Add("تهران");
                    DropDownListLocationCity.Items.Add("دماوند");
                    DropDownListLocationCity.Items.Add("رباط‌ کریم");
                    DropDownListLocationCity.Items.Add("ری");
                    DropDownListLocationCity.Items.Add("شمیرانات");
                    DropDownListLocationCity.Items.Add("شهریار");
                    DropDownListLocationCity.Items.Add("فیروزکوه");
                    DropDownListLocationCity.Items.Add("ورامین");
                    break;
                }
            case "9":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اردل");
                    DropDownListLocationCity.Items.Add("بروجن");
                    DropDownListLocationCity.Items.Add("شهرکرد");
                    DropDownListLocationCity.Items.Add("فارسان");
                    DropDownListLocationCity.Items.Add("کوهرنگ");
                    DropDownListLocationCity.Items.Add("لردگان");
                    break;
                }
            case "10":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("بیرجند");
                    DropDownListLocationCity.Items.Add("درمیان");
                    DropDownListLocationCity.Items.Add("سرایان");
                    DropDownListLocationCity.Items.Add("سربیشه");
                    DropDownListLocationCity.Items.Add("قائن");
                    DropDownListLocationCity.Items.Add("نهبندان");
                    break;
                }
            case "11":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("بردسکن");
                    DropDownListLocationCity.Items.Add("تایباد");
                    DropDownListLocationCity.Items.Add("تربت جام");
                    DropDownListLocationCity.Items.Add("تربت حیدریه");
                    DropDownListLocationCity.Items.Add("چناران");
                    DropDownListLocationCity.Items.Add("خلیل‌آباد");
                    DropDownListLocationCity.Items.Add("خواف");
                    DropDownListLocationCity.Items.Add("درگز");
                    DropDownListLocationCity.Items.Add("رشتخوار");
                    DropDownListLocationCity.Items.Add("سبزوار");
                    DropDownListLocationCity.Items.Add("سرخس");
                    DropDownListLocationCity.Items.Add("فردوس");
                    DropDownListLocationCity.Items.Add("فریمان");
                    DropDownListLocationCity.Items.Add("قائنات");
                    DropDownListLocationCity.Items.Add("قوچان");
                    DropDownListLocationCity.Items.Add("کاشمر");
                    DropDownListLocationCity.Items.Add("کلات");
                    DropDownListLocationCity.Items.Add("گناباد");
                    DropDownListLocationCity.Items.Add("مشهد");
                    DropDownListLocationCity.Items.Add("نیشابور");
                    break;
                }
            case "12":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اسفراین");
                    DropDownListLocationCity.Items.Add("بجنورد");
                    DropDownListLocationCity.Items.Add("جاجرم");
                    DropDownListLocationCity.Items.Add("شیروان");
                    DropDownListLocationCity.Items.Add("مانه");
                    DropDownListLocationCity.Items.Add("سَمَلقان");
                    break;
                }
            case "13":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آبادان");
                    DropDownListLocationCity.Items.Add("امیدیه");
                    DropDownListLocationCity.Items.Add("اندیمشک");
                    DropDownListLocationCity.Items.Add("اهواز");
                    DropDownListLocationCity.Items.Add("ایذه");
                    DropDownListLocationCity.Items.Add("باغ ملک");
                    DropDownListLocationCity.Items.Add("ماهشهر");
                    DropDownListLocationCity.Items.Add("بهبهان");
                    DropDownListLocationCity.Items.Add("خرمشهر");
                    DropDownListLocationCity.Items.Add("دزفول");
                    DropDownListLocationCity.Items.Add("دشت");
                    DropDownListLocationCity.Items.Add("ادگان");
                    DropDownListLocationCity.Items.Add("رامهرمز");
                    DropDownListLocationCity.Items.Add("شادگان");
                    DropDownListLocationCity.Items.Add("شوش");
                    DropDownListLocationCity.Items.Add("شوشتر");
                    DropDownListLocationCity.Items.Add("لالی");
                    DropDownListLocationCity.Items.Add("مسجد سلیمان");
                    DropDownListLocationCity.Items.Add("هندیجان");
                    break;
                }
            case "14":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("ابهر");
                    DropDownListLocationCity.Items.Add("ایجرود");
                    DropDownListLocationCity.Items.Add("خدابنده");
                    DropDownListLocationCity.Items.Add("خرمدره");
                    DropDownListLocationCity.Items.Add("زنجان");
                    DropDownListLocationCity.Items.Add("طارم");
                    DropDownListLocationCity.Items.Add("ماه نشان");
                    break;
                }
            case "15":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("دامغان");
                    DropDownListLocationCity.Items.Add("سمنان");
                    DropDownListLocationCity.Items.Add("شاهرود");
                    DropDownListLocationCity.Items.Add("گرمسار");
                    break;
                }
            case "16":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("ایرانشهر");
                    DropDownListLocationCity.Items.Add("چابهار");
                    DropDownListLocationCity.Items.Add("خاش");
                    DropDownListLocationCity.Items.Add("زابل");
                    DropDownListLocationCity.Items.Add("زاهدان");
                    DropDownListLocationCity.Items.Add("سراوان");
                    DropDownListLocationCity.Items.Add("سرباز");
                    DropDownListLocationCity.Items.Add("نیکشهر");
                    break;
                }
            case "17":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آباده");
                    DropDownListLocationCity.Items.Add("ارسنجان");
                    DropDownListLocationCity.Items.Add("استهبان");
                    DropDownListLocationCity.Items.Add("اقلید");
                    DropDownListLocationCity.Items.Add("بوانات");
                    DropDownListLocationCity.Items.Add("جهرم");
                    DropDownListLocationCity.Items.Add("خرم بيد");
                    DropDownListLocationCity.Items.Add("داراب");
                    DropDownListLocationCity.Items.Add("زرین دشت");
                    DropDownListLocationCity.Items.Add("سپیدان");
                    DropDownListLocationCity.Items.Add("شیراز");
                    DropDownListLocationCity.Items.Add("فراشبند");
                    DropDownListLocationCity.Items.Add("فسا");
                    DropDownListLocationCity.Items.Add("فیروزآباد");
                    DropDownListLocationCity.Items.Add("قیر و کارزین");
                    DropDownListLocationCity.Items.Add("کازرون");
                    DropDownListLocationCity.Items.Add("لارستان");
                    DropDownListLocationCity.Items.Add("لامرد");
                    DropDownListLocationCity.Items.Add("مرودشت");
                    DropDownListLocationCity.Items.Add("ممسنی");
                    DropDownListLocationCity.Items.Add("مهر");
                    DropDownListLocationCity.Items.Add("نی ريز");
                    break;
                }
            case "18":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آبیک");
                    DropDownListLocationCity.Items.Add("بوئین زهرا");
                    DropDownListLocationCity.Items.Add("تاکستان");
                    DropDownListLocationCity.Items.Add("قزوین");
                    break;
                }
            case "19":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("قم");
                    break;
                }
            case "20":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("بانه");
                    DropDownListLocationCity.Items.Add("بیجار");
                    DropDownListLocationCity.Items.Add("دیواندره");
                    DropDownListLocationCity.Items.Add("سروآباد");
                    DropDownListLocationCity.Items.Add("سقز");
                    DropDownListLocationCity.Items.Add("سنندج");
                    DropDownListLocationCity.Items.Add("قروه");
                    DropDownListLocationCity.Items.Add("کامیاران");
                    DropDownListLocationCity.Items.Add("مریوان");
                    break;
                }
            case "21":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("بافت");
                    DropDownListLocationCity.Items.Add("بردسیر");
                    DropDownListLocationCity.Items.Add("بم");
                    DropDownListLocationCity.Items.Add("جیرفت");
                    DropDownListLocationCity.Items.Add("راور");
                    DropDownListLocationCity.Items.Add("رفسنجان");
                    DropDownListLocationCity.Items.Add("زرند");
                    DropDownListLocationCity.Items.Add("سیرجان");
                    DropDownListLocationCity.Items.Add("شهر بابک");
                    DropDownListLocationCity.Items.Add("عنبرآباد");
                    DropDownListLocationCity.Items.Add("کرمان");
                    DropDownListLocationCity.Items.Add("کهنوج");
                    DropDownListLocationCity.Items.Add("منوجان");
                    break;
                }
            case "22":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اسلام آباد غرب");
                    DropDownListLocationCity.Items.Add("پاوه");
                    DropDownListLocationCity.Items.Add("ثلاث باباجانی");
                    DropDownListLocationCity.Items.Add("جوانرود");
                    DropDownListLocationCity.Items.Add("سرپل ذهاب");
                    DropDownListLocationCity.Items.Add("سنقر");
                    DropDownListLocationCity.Items.Add("صحنه");
                    DropDownListLocationCity.Items.Add("قصر شیرین");
                    DropDownListLocationCity.Items.Add("کرمانشاه");
                    DropDownListLocationCity.Items.Add("کنگاور");
                    DropDownListLocationCity.Items.Add("گیلان غرب");
                    DropDownListLocationCity.Items.Add("هرسین");
                    break;
                }
            case "23":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("بویراحمد");
                    DropDownListLocationCity.Items.Add("بهمئی");
                    DropDownListLocationCity.Items.Add("دنا");
                    DropDownListLocationCity.Items.Add("کهگیلویه");
                    DropDownListLocationCity.Items.Add("گچساران");
                    break;
                }
            case "24":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آزادشهر");
                    DropDownListLocationCity.Items.Add("آق قلا");
                    DropDownListLocationCity.Items.Add("بندر گز");
                    DropDownListLocationCity.Items.Add("بندر ترکمن");
                    DropDownListLocationCity.Items.Add("رامیان");
                    DropDownListLocationCity.Items.Add("علی آباد");
                    DropDownListLocationCity.Items.Add("کردکوی");
                    DropDownListLocationCity.Items.Add("کلاله");
                    DropDownListLocationCity.Items.Add("گرگان");
                    DropDownListLocationCity.Items.Add("گنبد کاووس");
                    DropDownListLocationCity.Items.Add("مینودشت");

                    break;
                }
            case "25":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آستارا");
                    DropDownListLocationCity.Items.Add("آستانه");
                    DropDownListLocationCity.Items.Add("اشرفيه");
                    DropDownListLocationCity.Items.Add("اَملَش");
                    DropDownListLocationCity.Items.Add("بندر انزلی");
                    DropDownListLocationCity.Items.Add("رشت");
                    DropDownListLocationCity.Items.Add("رضوان شهر");
                    DropDownListLocationCity.Items.Add("رودبار");
                    DropDownListLocationCity.Items.Add("رودسر");
                    DropDownListLocationCity.Items.Add("سیاهکل");
                    DropDownListLocationCity.Items.Add("شَفت");
                    DropDownListLocationCity.Items.Add("صومعه سرا");
                    DropDownListLocationCity.Items.Add("طوالش");
                    DropDownListLocationCity.Items.Add("فومن");
                    DropDownListLocationCity.Items.Add("لاهیجان");
                    DropDownListLocationCity.Items.Add("لنگرود");
                    DropDownListLocationCity.Items.Add("ماسال");
                    break;
                }
            case "26":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اَزنا");
                    DropDownListLocationCity.Items.Add("الیگودرز");
                    DropDownListLocationCity.Items.Add("بروجرد");
                    DropDownListLocationCity.Items.Add("پلدختر");
                    DropDownListLocationCity.Items.Add("خرم آباد");
                    DropDownListLocationCity.Items.Add("دورود");
                    DropDownListLocationCity.Items.Add("دِلفان");
                    DropDownListLocationCity.Items.Add("سلسله");
                    DropDownListLocationCity.Items.Add("کوهدشت");
                    break;
                }

            case "27":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آمل");
                    DropDownListLocationCity.Items.Add("بابل");
                    DropDownListLocationCity.Items.Add("بابلسر");
                    DropDownListLocationCity.Items.Add("بهشهر");
                    DropDownListLocationCity.Items.Add("تنکابن");
                    DropDownListLocationCity.Items.Add("جویبار");
                    DropDownListLocationCity.Items.Add("چالوس");
                    DropDownListLocationCity.Items.Add("رامسر");
                    DropDownListLocationCity.Items.Add("ساری");
                    DropDownListLocationCity.Items.Add("سوادکوه");
                    DropDownListLocationCity.Items.Add("قائم شهر");
                    DropDownListLocationCity.Items.Add("محمودآباد");
                    DropDownListLocationCity.Items.Add("نکا");
                    DropDownListLocationCity.Items.Add("نور");
                    DropDownListLocationCity.Items.Add("نوشهر");
                    break;
                }
            case "28":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("آشتیان");
                    DropDownListLocationCity.Items.Add("اراک");
                    DropDownListLocationCity.Items.Add("تفرش");
                    DropDownListLocationCity.Items.Add("خمین");
                    DropDownListLocationCity.Items.Add("دلیجان");
                    DropDownListLocationCity.Items.Add("زرندیه");
                    DropDownListLocationCity.Items.Add("ساوه");
                    DropDownListLocationCity.Items.Add("شازند");
                    DropDownListLocationCity.Items.Add("کمیجان");
                    DropDownListLocationCity.Items.Add("محلات");
                    break;
                }
            case "29":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("بندرعباس");
                    DropDownListLocationCity.Items.Add("میناب");
                    DropDownListLocationCity.Items.Add("بندرلنگه");
                    DropDownListLocationCity.Items.Add("رودان (دهبارز)");
                    DropDownListLocationCity.Items.Add("جاسک");
                    DropDownListLocationCity.Items.Add("قشم");
                    DropDownListLocationCity.Items.Add("حاجیآباد");
                    DropDownListLocationCity.Items.Add("ابوموسی");
                    DropDownListLocationCity.Items.Add("بستک");
                    DropDownListLocationCity.Items.Add("گاوبندی");
                    break;
                }
            case "30":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("اسدآباد");
                    DropDownListLocationCity.Items.Add("بهار");
                    DropDownListLocationCity.Items.Add("تویسرکان");
                    DropDownListLocationCity.Items.Add("رزن");
                    DropDownListLocationCity.Items.Add("کبودرآهنگ");
                    DropDownListLocationCity.Items.Add("ملایر");
                    DropDownListLocationCity.Items.Add("نهاوند");
                    DropDownListLocationCity.Items.Add("همدان");

                    break;
                }
            case "31":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("ابرکوه");
                    DropDownListLocationCity.Items.Add("اردکان");
                    DropDownListLocationCity.Items.Add("بافق");
                    DropDownListLocationCity.Items.Add("تفت");
                    DropDownListLocationCity.Items.Add("خاتم");
                    DropDownListLocationCity.Items.Add("صدوق");
                    DropDownListLocationCity.Items.Add("طبس");
                    DropDownListLocationCity.Items.Add("مهریز");
                    DropDownListLocationCity.Items.Add("میبد");
                    DropDownListLocationCity.Items.Add("یزد");
                    break;
                }
        }
    }
}