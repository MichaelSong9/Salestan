using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Transaction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            var srv = new com.pecco24.www.EShopService();

            string authorityStr = Request.Params["au"];
            string Status = Request.Params["rs"];


            // if response is succesful, eShops have to check it again
            if (Status == "0" && authorityStr != null)
            {
                long au = long.Parse(authorityStr);

                byte st = 0;

                srv.PinPaymentEnquiry("hu1PP77d1x3227oU4A78", au, ref st);



                CreditOnlineBank cob = new CreditOnlineBank();
                int RecordId = cob.changeStatus(Convert.ToInt32(st), Convert.ToInt64(au));

                Response.Redirect("~/Credit.aspx?Mode=TransactionSuccessful&TransactionId=" + RecordId.ToString());

                // if this method failed, eShop has to call the following method
                // service.Reversal(authority, ref status);
                // to be sure about payment reversal
                if (st != 0)
                {

                }
            }
            else
            {
                long au = long.Parse(authorityStr);

                CreditOnlineBank cob = new CreditOnlineBank();
                int OrderlId = cob.addRecord(0, 0, " ", -2, Convert.ToInt64(au));
                int OrderReversalId = cob.getRecordIdByRefId(Convert.ToInt64(au));

                byte st = 0;

                srv.PinReversal("hu1PP77d1x3227oU4A78", OrderlId, OrderReversalId, ref st);

                Response.Redirect("~/Credit.aspx?Mode=TransactionFailed&TransactionId=" + OrderReversalId.ToString());
            }
        }
        catch (Exception)
        {
            throw;
        }

    }
}