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

public partial class Print : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ItemId"] == null || Request.QueryString["Mode"] == null)
        {
            PanelError.Visible = true;
        }
        else
        {
            int ItemId = Convert.ToInt32(Request.QueryString["ItemId"]);

            if (Request.QueryString["Mode"].Equals("Offers"))
            {
                Page.Title = "Salestan : &#1670;&#1575;&#1662; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;";
                PanelOffers.Visible = true;

                DataTable dt = new DataTable();
                DataTable dtComments = new DataTable();
                DataSet ds = new DataSet();
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                SqlDataAdapter sda = new SqlDataAdapter("sp_offerInfoShow", sqlConn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["ItemId"]);
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
                    ImagePhoto.ImageUrl = "~/Files/Photos/" + dt.Rows[0]["MainPhoto"].ToString() + ".jpg";
                    LabelPricePercent.Text = dt.Rows[0]["PriceDiscountPercent"].ToString() + " %";
                    LabelTitle.Text = dt.Rows[0]["Title"].ToString();
                    LabelPriceOffer.Text = dt.Rows[0]["PriceOffer"].ToString() + " &#1578;&#1608;&#1605;&#1575;&#1606;";
                    LabelPriceNormal.Text = dt.Rows[0]["PriceNormal"].ToString() + " &#1578;&#1608;&#1605;&#1575;&#1606;";
                    LabelPriceDiscount.Text = Convert.ToString(Convert.ToInt32(dt.Rows[0]["PriceNormal"].ToString()) - Convert.ToInt32(dt.Rows[0]["PriceOffer"].ToString())) + " &#1578;&#1608;&#1605;&#1575;&#1606;";
                    LiteralHighlights.Text = "<div class='OffersDescriptions'>" + dt.Rows[0]["Highlights"].ToString() + "</div>";
                    LiteralDetails.Text = dt.Rows[0]["Details"].ToString();
                    LiteralDescriptions.Text = "<div class='OffersDescriptions'>" + dt.Rows[0]["Descriptions"].ToString() + "</div>";
                    LabelLink.Text = LabelLink.Text + Request.QueryString["ItemId"];

                    //Comapny 
                    LabelTel.Text = dt.Rows[0]["Tel"].ToString();
                    LabelEmail.Text = dt.Rows[0]["Email"].ToString();
                    LabelWebsite.Text = dt.Rows[0]["Website"].ToString();
                    LabelAddress.Text = dt.Rows[0]["Address"].ToString();
                }

                sda.Dispose();
                sqlConn.Close();
            }
        }

    }
}