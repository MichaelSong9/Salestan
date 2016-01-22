using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreditPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Credit"))
        {
            PanelAll.Visible = false;
            PanelNoAccess.Visible = true;
            Response.End();
        }

        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (!LoginStatus)
        {
            Response.Redirect("Login.aspx?Page=Credit");
        }

        try
        {
            switch (Request.QueryString["Mode"])
            {
                case "TransactionSuccessful":
                    {
                        PanelResult.Visible = true;
                        PanelTransactionSuccessful.Visible = true;
                        LabelSuccessfulCode.Text = Request.QueryString["TransactionId"].ToString();
                        break;
                    }
                case "TransactionFailed":
                    {
                        PanelResult.Visible = true;
                        PanelTransactionFailed.Visible = true;
                        LabelFailedCode.Text = Request.QueryString["TransactionId"].ToString();
                        break;
                    }
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
    protected void LinkButtonCredit_Click(object sender, EventArgs e)
    {
        PanelCredit.Visible = true;
        PanelAdd.Visible = false;
        PanelLog.Visible = false;
        LinkButtonCredit.Enabled = false;
        LinkButtonAdd.Enabled = true;
        LinkButtonLog.Enabled = true;

        DataClassesDataContext context = new DataClassesDataContext();
        int Userid = Convert.ToInt32(Session["UserId"]);
        var query2 = context.Credits.Where(c => c.UserId == Userid).FirstOrDefault();
        if (query2 != null)
        {
            LabelGiftCredit.Text = query2.GiftCredit.ToString();
            LabelSpendGift.Text = query2.SpentGift.ToString();
            LabelSpentCreadit.Text = query2.SpentCredit.ToString();
            LabelCredit.Text = query2.Credit1.ToString();
        }
        else if (query2 == null)
        {
            LabelGiftCredit.Text = " 0 ";
            LabelSpendGift.Text = " 0 ";
            LabelSpentCreadit.Text = " 0 ";
            LabelCredit.Text = " 0 ";
        }
    }
    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        PanelCredit.Visible = false;
        PanelAdd.Visible = true;
        PanelLog.Visible = false;
        LinkButtonCredit.Enabled = true;
        LinkButtonAdd.Enabled = false;
        LinkButtonLog.Enabled = true;
    }
    protected void LinkButtonHistory_Click(object sender, EventArgs e)
    {
        PanelCredit.Visible = false;
        PanelAdd.Visible = false;
        PanelLog.Visible = true;
        LinkButtonCredit.Enabled = true;
        LinkButtonAdd.Enabled = true;
        LinkButtonLog.Enabled = false;

        if (GridViewCreditLog.Rows.Count == 0)
        {
            LabelLogNoRecord.Visible = true;
        }
    }
    protected void LinkButtonAddOnline_Click(object sender, EventArgs e)
    {
        PanelAddAccount.Visible = false;
        PanelAddCard.Visible = false;
        PanelAddOnline.Visible = true;
        PanelSuccess.Visible = false;
    }
    protected void LinkButtonAddCard_Click(object sender, EventArgs e)
    {
        PanelAddAccount.Visible = false;
        PanelAddCard.Visible = true;
        PanelAddOnline.Visible = false;
        PanelSuccess.Visible = false;
    }
    protected void LinkButtonAddAccount_Click(object sender, EventArgs e)
    {
        PanelAddAccount.Visible = true;
        PanelAddCard.Visible = false;
        PanelAddOnline.Visible = false;
        PanelSuccess.Visible = false;
    }
    protected void ImageButtonCard_Click(object sender, ImageClickEventArgs e)
    {
        if (!captchaCard.Decide())
        {
            captchaCard.message = "پاسخ اشتباه است!";
        }
        else
        {
            PanelAddCard.Visible = false;
            PanelSuccess.Visible = true;

            CreditAddRequestByUser carbu = new CreditAddRequestByUser();
            carbu.addRequest(Convert.ToInt32(Session["UserId"].ToString()), 1, TextBoxCardDate.Text, TextBoxCardCredit.Text, TextBoxCardName.Text, TextBoxCardNumber.Text);
        }
    }
    protected void ImageButtonAccount_Click(object sender, ImageClickEventArgs e)
    {
        if (!captchaAccount.Decide())
        {
            captchaAccount.message = "پاسخ اشتباه است!";
        }
        else
        {
            PanelAddAccount.Visible = false;
            PanelSuccess.Visible = true;

            CreditAddRequestByUser carbu = new CreditAddRequestByUser();
            carbu.addRequest(Convert.ToInt32(Session["UserId"].ToString()), 2, TextBoxAccountDate.Text, TextBoxAccountCredit.Text, TextBoxAccountName.Text, DropDownListAccountAccount.SelectedValue);
        }
    }

    protected void ImageButtonOnline_Click(object sender, ImageClickEventArgs e)
    {
        if (!captchaOnline.Decide())
        {
            captchaOnline.message = "پاسخ اشتباه است!";
        }
        else
        {
            try
            {
                if (Convert.ToInt32(TextBoxOnlineCredit.Text) < 1000)
                {
                    LabelAddMinimum.Visible = true;
                    Response.End();
                }
            }
            catch (Exception)
            {
                throw;
            }

            int Credit = Convert.ToInt32(TextBoxOnlineCredit.Text);

            CreditOnlineBank cob = new CreditOnlineBank();
            int OrderId = cob.addRecord(Convert.ToInt32(Session["UserId"]), (Credit / 10), RadioButtonListOnlineBank.SelectedValue, -1, 0);

            //Parsian Web Sevice

            var srv = new com.pecco24.www.EShopService();

            try
            {
                long au = 0;
                byte st = 0;
                srv.PinPaymentRequest("hu1PP77d1x3227oU4A78", Credit, OrderId, "http://www.salestan.ir/Transaction.aspx", ref au, ref st);
                if (st == 0)
                {
                    cob.setRefId(OrderId, Convert.ToInt64(au));

                    Response.Redirect("https://www.pecco24.com/pecpaymentgateway/?au=" + au.ToString(), true);
                }
            }
            catch (Exception)
            {

            }
        }
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}