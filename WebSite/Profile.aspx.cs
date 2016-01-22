using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfilePage : System.Web.UI.Page
{
    DataClassesDataContext context = new DataClassesDataContext();

    int userid;

    protected void Page_Load(object sender, EventArgs e)
    {
        userid = Convert.ToInt32(Session["UserId"]);

        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Profile");
        }
    }
    protected void ImageButtonFirstNameEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonFirstNameChange.Visible = true;
        ImageButtonFirstNameCancel.Visible = true;
        TextBoxFirstName.Visible = true;
        ImageButtonFirstNameEdit.Visible = false;
        TextBoxFirstName.Text = LabelFirstNameData.Text;
    }
    protected void ImageButtonFirstNameChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            if (TextBoxFirstName.Text.Trim() != "")
            {
                Literal1.Text = "";
                query.FirstName = TextBoxFirstName.Text.Trim();
                context.SubmitChanges();
                LabelFirstNameData.Text = TextBoxFirstName.Text.Trim();
            }
            else
            {
                Literal1.Text = "<p class='FormValidation'> نام خود را وارد نمایید!</p>";


            }

        }
        catch (Exception)
        {

            throw;
        }
        query.FirstName = TextBoxFirstName.Text;
        context.SubmitChanges();

        ImageButtonFirstNameChange.Visible = false;
        ImageButtonFirstNameCancel.Visible = false;
        TextBoxFirstName.Visible = false;
        ImageButtonFirstNameEdit.Visible = true;
    }
    protected void ImageButtonFirstNameCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonFirstNameChange.Visible = false;
        ImageButtonFirstNameCancel.Visible = false;
        TextBoxFirstName.Visible = false;
        ImageButtonFirstNameEdit.Visible = true;
    }
    protected void ImageButtonLastNameEdit_Click(object sender, ImageClickEventArgs e)
    {

        ImageButtonLastNameChange.Visible = true;
        ImageButtonLastNameCancel.Visible = true;
        TextBoxLastName.Visible = true;
        ImageButtonLastNameEdit.Visible = false;
        TextBoxLastName.Text = LabelLastNameData.Text;
    }
    protected void ImageButtonLastNameChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            if (TextBoxLastName.Text.Trim() != "")
            {
                Literal1.Text = "";
                query.LastName = TextBoxLastName.Text.Trim();
                context.SubmitChanges();
                LabelLastNameData.Text = TextBoxLastName.Text.Trim();
            }
            else
            {
                Literal1.Text = "<p class='FormValidation'> نام خانوادگی خود را وارد نمایید!</p>";

            }
        }
        catch (Exception)
        {
            throw;
        }
        ImageButtonLastNameChange.Visible = false;
        ImageButtonLastNameCancel.Visible = false;
        TextBoxLastName.Visible = false;
        ImageButtonLastNameEdit.Visible = true;
    }
    protected void ImageButtonLastNameCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonLastNameChange.Visible = false;
        ImageButtonLastNameCancel.Visible = false;
        TextBoxLastName.Visible = false;
        ImageButtonLastNameEdit.Visible = true;
    }
    protected void ImageButtonBirthDateEdit_Click(object sender, ImageClickEventArgs e)
    {
        DropDownListBirthDay.Visible = true;
        DropDownListBirthMonth.Visible = true;
        DropDownListBirthYear.Visible = true;
        ImageButtonBirthDateChange.Visible = true;
        ImageButtonBirthDateCancel.Visible = true;
        ImageButtonBirthDateEdit.Visible = false;
        DropDownListBirthDay.SelectedValue = LabelBirthDateData.Text.Trim().Substring(8, 2);
        DropDownListBirthMonth.SelectedValue = LabelBirthDateData.Text.Trim().Substring(5, 2);
        DropDownListBirthYear.SelectedValue = LabelBirthDateData.Text.Trim().Substring(0, 4);
    }
    protected void ImageButtonBirthDateChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();

        string Bday = DropDownListBirthDay.SelectedValue;
        string BMonth = DropDownListBirthMonth.SelectedValue;
        string BYear = DropDownListBirthYear.SelectedValue;

        string BirthDate = BYear + "/" + BMonth + "/" + Bday;

        query.BirthDate = BirthDate;
        context.SubmitChanges();
        LabelBirthDateData.Text = BirthDate;



        DropDownListBirthDay.Visible = false;
        DropDownListBirthMonth.Visible = false;
        DropDownListBirthYear.Visible = false;
        ImageButtonBirthDateChange.Visible = false;
        ImageButtonBirthDateCancel.Visible = false;
        ImageButtonBirthDateEdit.Visible = true;
    }
    protected void ImageButtonBirthDateCancel_Click(object sender, ImageClickEventArgs e)
    {
        DropDownListBirthDay.Visible = false;
        DropDownListBirthMonth.Visible = false;
        DropDownListBirthYear.Visible = false;
        ImageButtonBirthDateChange.Visible = false;
        ImageButtonBirthDateCancel.Visible = false;
        ImageButtonBirthDateEdit.Visible = true;
    }
    protected void ImageButtonGenderEdit_Click(object sender, ImageClickEventArgs e)
    {

        ImageButtonGenderChange.Visible = true;
        ImageButtonGenderCancel.Visible = true;
        DropDownListGender.Visible = true;
        ImageButtonGenderEdit.Visible = false;

        if (LabelGenderData.Text.Trim() == "مرد")
        {
            DropDownListGender.SelectedValue = "0";
        }
        else if (LabelGenderData.Text.Trim() == "زن")
        {
            DropDownListGender.SelectedValue = "1";
        }


    }
    protected void ImageButtonGenderChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            if (DropDownListGender.SelectedValue == "0")
            {
                query.Gender = false;
            }
            else if (DropDownListGender.SelectedValue == "1")
            {
                query.Gender = true;
            }
            context.SubmitChanges();
            LabelGenderData.Text = DropDownListGender.SelectedItem.Text;
        }
        catch (Exception)
        {
            throw;
        }
        ImageButtonGenderChange.Visible = false;
        ImageButtonGenderCancel.Visible = false;
        DropDownListGender.Visible = false;
        ImageButtonGenderEdit.Visible = true;
    }
    protected void ImageButtonGenderCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonGenderChange.Visible = false;
        ImageButtonGenderCancel.Visible = false;
        DropDownListGender.Visible = false;
        ImageButtonGenderEdit.Visible = true;

    }

    protected void ImageButtonJobEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonJobChange.Visible = true;
        ImageButtonJobCancel.Visible = true;
        TextBoxJob.Visible = true;
        ImageButtonJobEdit.Visible = false;
        TextBoxJob.Text = LabelJobData.Text;
    }
    protected void ImageButtonJobChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            query.Job = TextBoxJob.Text;
            context.SubmitChanges();
            LabelJobData.Text = TextBoxJob.Text;
        }
        catch (Exception)
        {
            throw;
        }

        ImageButtonJobChange.Visible = false;
        ImageButtonJobCancel.Visible = false;
        TextBoxJob.Visible = false;
        ImageButtonJobEdit.Visible = true;
    }
    protected void ImageButtonJobCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonJobChange.Visible = false;
        ImageButtonJobCancel.Visible = false;
        TextBoxJob.Visible = false;
        ImageButtonJobEdit.Visible = true;

    }
    protected void ImageButtonEducationsEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonEducationsChange.Visible = true;
        ImageButtonEducationsCancel.Visible = true;
        DropDownListEducations.Visible = true;
        ImageButtonEducationsEdit.Visible = false;

        userid = Convert.ToInt32(Session["UserId"]);
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();

        DropDownListEducations.SelectedValue = query.Education;
    }
    protected void ImageButtonEducationsChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            query.Education = DropDownListEducations.SelectedValue;
            context.SubmitChanges();
            LabelEducationsData.Text = DropDownListEducations.SelectedItem.Text;
        }
        catch (Exception)
        {
            throw;
        }
        ImageButtonEducationsChange.Visible = false;
        ImageButtonEducationsCancel.Visible = false;
        DropDownListEducations.Visible = false;
        ImageButtonEducationsEdit.Visible = true;
    }
    protected void ImageButtonEducationsCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonEducationsChange.Visible = false;
        ImageButtonEducationsCancel.Visible = false;
        DropDownListEducations.Visible = false;
        ImageButtonEducationsEdit.Visible = true;
    }
    protected void ImageButtonHomePhoneEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonHomePhoneChange.Visible = true;
        ImageButtonHomePhoneCancel.Visible = true;
        TextBoxHomePhone.Visible = true;
        ImageButtonHomePhoneEdit.Visible = false;
        TextBoxHomePhone.Text = LabelHomePhoneData.Text;
    }
    protected void ImageButtonHomePhoneChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            query.HomeTel = TextBoxHomePhone.Text;
            context.SubmitChanges();
            LabelHomePhoneData.Text = TextBoxHomePhone.Text;
        }
        catch (Exception)
        {

            throw;
        }
        ImageButtonHomePhoneChange.Visible = false;
        ImageButtonHomePhoneCancel.Visible = false;
        TextBoxHomePhone.Visible = false;
        ImageButtonHomePhoneEdit.Visible = true;
    }
    protected void ImageButtonHomePhoneCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonHomePhoneChange.Visible = false;
        ImageButtonHomePhoneCancel.Visible = false;
        TextBoxHomePhone.Visible = false;
        ImageButtonHomePhoneEdit.Visible = true;
    }
    protected void ImageButtonWorkPhoneEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonWorkPhoneChange.Visible = true;
        ImageButtonWorkPhoneCancel.Visible = true;
        TextBoxWorkPhone.Visible = true;
        ImageButtonWorkPhoneEdit.Visible = false;
        TextBoxWorkPhone.Text = LabelWorkPhoneData.Text;
    }
    protected void ImageButtonWorkPhoneChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            query.WorkTel = TextBoxWorkPhone.Text;
            context.SubmitChanges();
            LabelWorkPhoneData.Text = TextBoxWorkPhone.Text;
        }
        catch (Exception)
        {
            throw;
        }
        ImageButtonWorkPhoneChange.Visible = false;
        ImageButtonWorkPhoneCancel.Visible = false;
        TextBoxWorkPhone.Visible = false;
        ImageButtonWorkPhoneEdit.Visible = true;
    }
    protected void ImageButtonWorkPhoneCancel_Click(object sender, ImageClickEventArgs e)
    {

        ImageButtonWorkPhoneChange.Visible = false;
        ImageButtonWorkPhoneCancel.Visible = false;
        TextBoxWorkPhone.Visible = false;
        ImageButtonWorkPhoneEdit.Visible = true;
    }
    protected void ImageButtonMobileEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonMobileChange.Visible = true;
        ImageButtonMobileCancel.Visible = true;
        TextBoxMobile.Visible = true;
        ImageButtonMobileEdit.Visible = false;
        TextBoxMobile.Text = LabelMobileData.Text;
    }
    protected void ImageButtonMobileChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            if (TextBoxMobile.Text.Trim() != "")
            {
                Literal1.Text = "";
                query.Mobile = TextBoxMobile.Text.Trim();
                context.SubmitChanges();
                LabelMobileData.Text = TextBoxMobile.Text;
            }
            else
            {

                Literal1.Text = "<p class='FormValidation'> موبایل خود را وارد نمایید!</p>";

            }
        }
        catch (Exception)
        {
            throw;
        }

        ImageButtonMobileChange.Visible = false;
        ImageButtonMobileCancel.Visible = false;
        TextBoxMobile.Visible = false;
        ImageButtonMobileEdit.Visible = true;
    }
    protected void ImageButtonMobileCancel_Click(object sender, ImageClickEventArgs e)
    {

        ImageButtonMobileChange.Visible = false;
        ImageButtonMobileCancel.Visible = false;
        TextBoxMobile.Visible = false;
        ImageButtonMobileEdit.Visible = true;

    }
    protected void ImageButtonLocationEdit_Click(object sender, ImageClickEventArgs e)
    {
        DropDownListLocationCountry.Visible = true;
        DropDownListLocationProvince.Visible = true;
        DropDownListLocationCity.Visible = true;
        LabelLocationState.Visible = true;
        LabelLocationCity.Visible = true;
        ImageButtonLocationChange.Visible = true;
        ImageButtonLocationCancel.Visible = true;
        ImageButtonLocationEdit.Visible = false;

        userid = Convert.ToInt32(Session["UserId"]);
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();

        switch (query.Province.ToString())
        {
            case "1":
                {

                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("تبریز ");
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

        DropDownListLocationCountry.SelectedValue = query.Country;
        DropDownListLocationCity.SelectedValue = query.City;
        DropDownListLocationProvince.SelectedValue = query.Province.ToString();
    }
    protected void ImageButtonLocationChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            Literal1.Text = "";
            query.City = DropDownListLocationCity.SelectedValue;
            query.Province = Convert.ToInt32(DropDownListLocationProvince.SelectedValue);

            context.SubmitChanges();
            LabelLocationData.Text = query.City;
        }
        catch (Exception)
        {
            throw;
        }
        DropDownListLocationCountry.Visible = false;
        DropDownListLocationProvince.Visible = false;
        DropDownListLocationCity.Visible = false;
        LabelLocationState.Visible = false;
        LabelLocationCity.Visible = false;
        ImageButtonLocationChange.Visible = false;
        ImageButtonLocationCancel.Visible = false;
        ImageButtonLocationEdit.Visible = true;
    }
    protected void ImageButtonLocationCancel_Click(object sender, ImageClickEventArgs e)
    {
        DropDownListLocationCountry.Visible = false;
        DropDownListLocationProvince.Visible = false;
        DropDownListLocationCity.Visible = false;
        LabelLocationState.Visible = false;
        LabelLocationCity.Visible = false;
        ImageButtonLocationChange.Visible = false;
        ImageButtonLocationCancel.Visible = false;
        ImageButtonLocationEdit.Visible = true;
    }
    protected void ImageButtonAddressEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButtonAddressChange.Visible = true;
        ImageButtonAddressCancel.Visible = true;
        TextBoxAddress.Visible = true;
        ImageButtonAddressEdit.Visible = false;
        TextBoxAddress.Text = LabelAddressData.Text;
    }
    protected void ImageButtonAddressChange_Click(object sender, ImageClickEventArgs e)
    {
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();
        try
        {
            query.Address = TextBoxAddress.Text;
            context.SubmitChanges();
            LabelAddressData.Text = TextBoxAddress.Text;
        }
        catch (Exception)
        {

            throw;
        }
        ImageButtonAddressChange.Visible = false;
        ImageButtonAddressCancel.Visible = false;
        TextBoxAddress.Visible = false;
        ImageButtonAddressEdit.Visible = true;
    }
    protected void ImageButton27_Click(object sender, ImageClickEventArgs e)
    {

        ImageButtonAddressChange.Visible = false;
        ImageButtonAddressCancel.Visible = false;
        TextBoxAddress.Visible = false;
        ImageButtonAddressEdit.Visible = true;
    }
    protected void LinkButtonPersonal_Click(object sender, EventArgs e)
    {
        PanelPersonal.Visible = true;
        PanelContact.Visible = false;
        LinkButtonPersonal.Enabled = false;
        LinkButtonContact.Enabled = true;

        userid = Convert.ToInt32(Session["UserId"]);
        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();

        //مشخصات فردی
        LabelFirstNameData.Text = query.FirstName;
        LabelLastNameData.Text = query.LastName;
        LabelBirthDateData.Text = query.BirthDate.ToString();

        if (query.Gender)
        {
            LabelGenderData.Text = "زن";
        }
        else
        {
            LabelGenderData.Text = "مرد";
        }

        LabelJobData.Text = query.Job;

        switch (query.Education)
        {
            case "0":
                {
                    LabelEducationsData.Text = "";
                    break;
                }
            case "Diploma":
                {
                    LabelEducationsData.Text = "دیپلم";
                    break;
                }
            case "HigherDiploma":
                {
                    LabelEducationsData.Text = "فوق دیپلم";
                    break;
                }
            case "BSc":
                {
                    LabelEducationsData.Text = "لیسانس";
                    break;
                }
            case "MSc":
                {
                    LabelEducationsData.Text = "فوق لیسانس";
                    break;
                }
            case "Dr":
                {
                    LabelEducationsData.Text = "دکترا";
                    break;
                }
        }
    }
    protected void LinkButtonContact_Click(object sender, EventArgs e)
    {
        PanelPersonal.Visible = false;
        PanelContact.Visible = true;
        LinkButtonPersonal.Enabled = true;
        LinkButtonContact.Enabled = false;

        userid = Convert.ToInt32(Session["UserId"]);

        var query = context.Users.Where(u => u.UserId == userid).SingleOrDefault();

        //مشخصات ارتباطی
        LabelHomePhoneData.Text = query.HomeTel;
        LabelWorkPhoneData.Text = query.WorkTel;
        LabelMobileData.Text = query.Mobile;
        LabelEmailData.Text = query.Email;
        LabelAddressData.Text = query.Address;
        LabelLocationData.Text = query.City;
    }
    protected void DropDownListLocationProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownListLocationProvince.SelectedValue)
        {
            case "1":
                {
                    DropDownListLocationCity.Enabled = true;
                    DropDownListLocationCity.Items.Clear();
                    DropDownListLocationCity.Items.Add("تبریز ");
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