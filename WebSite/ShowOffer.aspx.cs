using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ShowOffer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Offers"))
        {
            Response.Redirect("~/Error.aspx?Code=NoAccess");
        }

        DataTable dt = new DataTable();
        DataTable dtComments = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_offerInfoShow", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
        sda.Fill(ds);
        dt = ds.Tables[0];
        dtComments = ds.Tables[1];

        if (dt.Rows.Count == 0) //offer doesn't exist
        {
            Response.Redirect("~/Error.aspx?Code=NoOffer");
        }
        else //offer exists
        {
//Offer 
            HiddenFieldOfferId.Value = Request.QueryString["OfferId"];
            Page.Title = "Salestan : " + dt.Rows[0]["PriceDiscountPercent"].ToString() + "% " + dt.Rows[0]["Title"].ToString();
            //ImageMainPhoto.ImageUrl = "~/Files/Photos/" + dt.Rows[0]["MainPhoto"].ToString() + ".jpg";
            LabelPriceDiscountPercent.Text = dt.Rows[0]["PriceDiscountPercent"].ToString() + " %";
            LabelTitle.Text = dt.Rows[0]["Title"].ToString();
            LabelPriceOffer.Text = dt.Rows[0]["PriceOffer"].ToString() + " &#1578;&#1608;&#1605;&#1575;&#1606;";
            LabelPriceNormal.Text = dt.Rows[0]["PriceNormal"].ToString() + " &#1578;&#1608;&#1605;&#1575;&#1606;";
            LabelPriceDiscount.Text = Convert.ToString(Convert.ToInt32(dt.Rows[0]["PriceNormal"].ToString()) - Convert.ToInt32(dt.Rows[0]["PriceOffer"].ToString())) + " &#1578;&#1608;&#1605;&#1575;&#1606;";
            LabelPriceGift.Text = dt.Rows[0]["PriceGift"].ToString() + " &#1578;&#1608;&#1605;&#1575;&#1606;";
            LabelPurchasedCount.Text = dt.Rows[0]["PurchasedCount"].ToString();
            LabelPurchasedRemained.Text = (Convert.ToInt32(dt.Rows[0]["MaxBuy"].ToString()) - Convert.ToInt32(dt.Rows[0]["PurchasedCount"].ToString())).ToString();
            LiteralHighlights.Text = "<div class='OffersDescriptions'>" + dt.Rows[0]["Highlights"].ToString() + "</div>";
            LiteralDetails.Text = "<div class='OffersDescriptions'>" + dt.Rows[0]["Details"].ToString() + "</div>";
            LiteralDescriptions.Text = "<div class='OffersDescriptions'>" + dt.Rows[0]["Descriptions"].ToString() + "</div>";


            //Purchased Count
            decimal PurchasedCount = Convert.ToDecimal(dt.Rows[0]["PurchasedCount"].ToString());
            decimal MaxBuy = Convert.ToDecimal(dt.Rows[0]["MaxBuy"].ToString());
            int Size = Convert.ToInt32(PurchasedCount / MaxBuy * 374);
            HiddenFieldProgressSize.Value = Size.ToString();
            if (Convert.ToInt32(dt.Rows[0]["PurchasedCount"].ToString()) >= Convert.ToInt32(dt.Rows[0]["MinBuy"].ToString()))
            {
                LabelActiveMessage.Text = "پیشنهاد فعال است.";
                LabelActiveMessage.CssClass = "SuccessMessage";
                LabelActivePurchased.Text = "";
                HiddenFieldProgressColor.Value = "green";
            }
            else if (Convert.ToInt32(dt.Rows[0]["PurchasedCount"].ToString()) < Convert.ToInt32(dt.Rows[0]["MinBuy"].ToString()))
            {
                LabelActiveMessage.Text = " خرید تا فعالسازی";
                LabelActivePurchased.Text = Convert.ToString(Convert.ToInt32(dt.Rows[0]["MinBuy"].ToString()) - Convert.ToInt32(dt.Rows[0]["PurchasedCount"].ToString()));
                HiddenFieldProgressColor.Value = "orange";
            }
            
            //Remained Time countdown
            DateTime offerEndDate = Convert.ToDateTime(dt.Rows[0]["EndDate"].ToString());
            if (DateTime.Now > offerEndDate)
            {
                PanelBuyActive.Visible = false;
                PanelBuyInactive.Visible = true;
            }

            string month = " ";
            switch (offerEndDate.Month.ToString())
            {
                case "1":
                    {
                        month = "january";
                        break;
                    }
                case "2":
                    {
                        month = "february";
                        break;
                    }
                case "3":
                    {
                        month = "march";
                        break;
                    }
                case "4":
                    {
                        month = "april";
                        break;
                    }
                case "5":
                    {
                        month = "may";
                        break;
                    }
                case "6":
                    {
                        month = "june";
                        break;
                    }
                case "7":
                    {
                        month = "july";
                        break;
                    }
                case "8":
                    {
                        month = "august";
                        break;
                    }
                case "9":
                    {
                        month = "september";
                        break;
                    }
                case "10":
                    {
                        month = "october";
                        break;
                    }
                case "11":
                    {
                        month = "november";
                        break;
                    }
                case "12":
                    {
                        month = "december";
                        break;
                    }
            }
            HiddenFieldEndDate.Value = month + " " + offerEndDate.Day + ", " + offerEndDate.Year + " " + offerEndDate.Hour + ":" + offerEndDate.Minute;
            
            //Links
            if (dt.Rows[0]["Link1Url"].ToString().Length > 0)
            {
                PanelLink1.Visible = true;
                HyperLinkLink1.Text = dt.Rows[0]["Link1Name"].ToString();
                HyperLinkLink1.NavigateUrl = dt.Rows[0]["Link1Url"].ToString();
            }
            if (dt.Rows[0]["Link2Url"].ToString().Length > 0)
            {
                PanelLink2.Visible = true;
                HyperLinkLink2.Text = dt.Rows[0]["Link2Name"].ToString();
                HyperLinkLink2.NavigateUrl = dt.Rows[0]["Link2Url"].ToString();
            }

//Comapny 
            LabelCompanyName.Text = dt.Rows[0]["Name"].ToString();
            LabelCompanyAbout.Text = dt.Rows[0]["About"].ToString();
            LabelTel.Text = dt.Rows[0]["Tel"].ToString();
            LabelMobile.Text = dt.Rows[0]["Mobile"].ToString();
            LabelEmail.Text = dt.Rows[0]["Email"].ToString();
            LabelFax.Text = dt.Rows[0]["Fax"].ToString();
            HyperLinkWebsite.Text = dt.Rows[0]["Website"].ToString();
            HyperLinkWebsite.NavigateUrl = dt.Rows[0]["Website"].ToString();
            LabelAddress.Text = dt.Rows[0]["Address"].ToString();
            HiddenFieldGoogleId.Value = dt.Rows[0]["GoogleMap"].ToString();
            ImageCompany.ImageUrl = "~/Files/companies/" + dt.Rows[0]["CompanyId"].ToString() + ".jpg";
            LabelOffersCount.Text = dt.Rows[0]["OffersCount"].ToString();
            LabelSaleCount.Text = dt.Rows[0]["SaleCount"].ToString();
        }

//Comment
        StringBuilder sb3 = new StringBuilder();
        if (dtComments.Rows.Count != 0)
        {
            for (int i = 0; i < dtComments.Rows.Count; i++)
            {
                sb3.AppendLine("<br/>");
                sb3.AppendLine("<div class='FormLabel' style='direction:rtl;'>");
                sb3.AppendLine(dtComments.Rows[i]["Comment"].ToString());
                if (dtComments.Rows[i]["Answer"].ToString() != "")
                {
                    sb3.AppendLine("<br/><br/>");
                    sb3.AppendLine("<img alt='' height='20' src='images/logosmall.png' width='60' /><br/>");
                    sb3.AppendLine("<strong>" + dtComments.Rows[i]["Answer"].ToString() + "</strong>");
                }
                sb3.AppendLine("</div>");
                sb3.AppendLine("<br/>");
                sb3.AppendLine("<hr style='color:#CAE1E6' />");
            }
            LiteralComments.Text = sb3.ToString();
        }
            sda.Dispose();
            sqlConn.Close();
    }

    protected string FormatPassedDate(DateTime Date)
    {
        string passedDate = Date.ToString();
        TimeSpan span = DateTime.Now.Subtract(Convert.ToDateTime(Date));

        if (span.TotalSeconds < 60)
        {
            passedDate = Convert.ToInt16(span.TotalSeconds).ToString() + " ثانیه قبل";
        }

        if (span.TotalSeconds > 60 && span.TotalSeconds < 3600)
        {
            passedDate = Convert.ToInt16(span.TotalMinutes).ToString() + " دقیقه قبل";
        }

        if (span.TotalSeconds > 3600 && span.TotalSeconds < 86400)
        {
            passedDate = Convert.ToInt16(span.TotalHours).ToString() + " ساعت قبل";
        }

        if (span.TotalSeconds > 86400 && span.TotalSeconds < 604800)
        {
            passedDate = Convert.ToInt16(span.TotalDays).ToString() + " روز قبل";
        }

        return passedDate;
    }
    protected void ImageButtonFavorite_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserId"] != null)
        {
            int Type = 1;

            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_favoriteAddCheckExists", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
            sda.SelectCommand.Parameters.Add("@Type", SqlDbType.Int).Value = Type;
            sda.SelectCommand.Parameters.Add("@ItemId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count == 0) //item doesn't exist
            {
                SqlCommand sqlCmd = new SqlCommand("sp_favoriteOfferAdd", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
                sqlCmd.Parameters.Add("@Type", SqlDbType.Int).Value = Type;
                sqlCmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["OfferId"]);

                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();

                sqlCmd.Dispose();

                LabelAction.Text = "اضافه گردید.";
                LabelAction.CssClass = "SuccessMessage";
                LabelAction.Visible = true;
                ImageActionImage.Visible = true;
                ImageActionImage.ImageUrl = "~/images/icons/check16.png";
            }
            else //item exists
            {
                LabelAction.Text = "موجود بود.";
                LabelAction.CssClass = "ErrorMessage";
                LabelAction.Visible = true;
                ImageActionImage.Visible = true;
                ImageActionImage.ImageUrl = "~/images/icons/delete16.png";
            }

            sqlConn.Dispose();
            sda.Dispose();
        }
        else
        {
            LabelAction.Text = "وارد سیستم شوید.";
            LabelAction.CssClass = "ErrorMessage";
            LabelAction.Visible = true;
            ImageActionImage.Visible = true;
            ImageActionImage.ImageUrl = "~/images/icons/delete16.png";
        }
    }
}