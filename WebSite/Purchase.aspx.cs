using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Purchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessControl ac = new AccessControl();
        if (!ac.getSectionAccess("Purchase"))
        {
            PanelAll.Visible = false;
            PanelNoAccess.Visible = true;
            Response.End();
        }

        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

                SqlDataAdapter sda = new SqlDataAdapter("sp_buyActionOfferInfo", sqlConn);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["ItemId"]);
                sda.Fill(ds);
                dt = ds.Tables[0];

                if (dt.Rows.Count == 0) //offer doesn't exist
                {
                    PanelError.Visible = true;
                    PanelProcess.Visible = false;
                    PanelSuccessful.Visible = false;
                    ImageError.ImageUrl = "~/images/messages/notfound.png";
                }
                else //offer exists
                {
                    DateTime Deadline = Convert.ToDateTime(dt.Rows[0]["EndDate"].ToString());
                    if (DateTime.Now <= Deadline)
                    {
                        PanelError.Visible = false;
                        PanelProcess.Visible = true;
                        PanelSuccessful.Visible = false;

                        DataTable dtUser = new DataTable();
                        DataSet ds2 = new DataSet();

                        SqlDataAdapter sda2 = new SqlDataAdapter("sp_buyActionUserCreditInfo", sqlConn);
                        sda2.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sda2.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
                        sda2.Fill(ds2);
                        dtUser = ds2.Tables[0];

                        HyperLinkTitle.Text = dt.Rows[0]["Title"].ToString();
                        HyperLinkTitle.NavigateUrl = "~/ShowOffer.aspx?OfferId=" + Request.QueryString["ItemId"];
                        ImagePhoto.ImageUrl = "~/Files/Photos/" + dt.Rows[0]["MainPhoto"].ToString() + "t.jpg";
                        //LabelUser.Text = dtUser.Rows[0]["FullName"].ToString();
                        LabelNormalPrice.Text = dt.Rows[0]["PriceNormal"].ToString();
                        LabelSinglePrice.Text = dt.Rows[0]["PriceOffer"].ToString();
                        LabelPostPrice.Text = dt.Rows[0]["PostPrice"].ToString();
                        LabelAllPrice.Text = dt.Rows[0]["PriceOffer"].ToString();
                        LabelGiftPrice.Text = dt.Rows[0]["PriceGift"].ToString();
                        LabelAllGift.Text = dt.Rows[0]["PriceGift"].ToString();
                        LabelUserGift.Text = dtUser.Rows[0]["GiftCredit"].ToString();
                        LabelUserCredit.Text = dtUser.Rows[0]["Credit"].ToString();

                        int MinUser = Convert.ToInt32(dt.Rows[0]["MinUser"].ToString()) - 1;
                        int MaxUser = Convert.ToInt32(dt.Rows[0]["MaxUser"].ToString());

                        for (int i = MinUser; i < MaxUser; i++)
                        {
                            DropDownListQuantity.Items.Add(Convert.ToString(i + 1));
                        }

                        if (Convert.ToInt32(LabelAllGift.Text) > Convert.ToInt32(LabelUserGift.Text))
                        {
                            LabelPayment.Text = (Convert.ToInt32(LabelAllPrice.Text) - Convert.ToInt32(LabelUserGift.Text) + Convert.ToInt32(LabelPostPrice.Text)).ToString();
                            LabelGiftSpend.Text = LabelUserGift.Text;
                        }
                        else
                        {
                            LabelPayment.Text = (Convert.ToInt32(LabelAllPrice.Text) - Convert.ToInt32(LabelAllGift.Text) + Convert.ToInt32(LabelPostPrice.Text)).ToString();
                            LabelGiftSpend.Text = LabelAllGift.Text;
                        }

                        sda2.Dispose();

                    }
                    else if (DateTime.Now > Deadline)
                    {
                        PanelError.Visible = true;
                        PanelProcess.Visible = false;
                        PanelSuccessful.Visible = false;
                        ImageError.ImageUrl = "~/images/messages/expired.png";
                    }
                }

                sda.Dispose();
                sqlConn.Close();

            }
            else
            {
                PanelError.Visible = true;
                PanelProcess.Visible = false;
                PanelSuccessful.Visible = false;
                ImageError.ImageUrl = "~/images/messages/loginfirst.png";
            }
        }
    }
    protected void DropDownListQuantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelAllPrice.Text = (Convert.ToInt32(LabelSinglePrice.Text) * Convert.ToInt32(DropDownListQuantity.SelectedValue)).ToString();
        LabelAllGift.Text = (Convert.ToInt32(LabelGiftPrice.Text) * Convert.ToInt32(DropDownListQuantity.SelectedValue)).ToString();

        if (Convert.ToInt32(LabelAllGift.Text) > Convert.ToInt32(LabelUserGift.Text))
        {
            LabelPayment.Text = (Convert.ToInt32(LabelAllPrice.Text) - Convert.ToInt32(LabelUserGift.Text) + Convert.ToInt32(LabelPostPrice.Text)).ToString();
            LabelGiftSpend.Text = LabelUserGift.Text;
        }
        else
        {
            LabelPayment.Text = (Convert.ToInt32(LabelAllPrice.Text) - Convert.ToInt32(LabelAllGift.Text) + Convert.ToInt32(LabelPostPrice.Text)).ToString();
            LabelGiftSpend.Text = LabelAllGift.Text;
        }
    }
    protected void ImageButtonBuy_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserId"] != null)
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_buyActionOfferInfo", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add("@OfferId", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["ItemId"]);
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count == 0) //offer doesn't exist
            {
                PanelError.Visible = true;
                PanelProcess.Visible = false;
                PanelSuccessful.Visible = false;
                ImageError.ImageUrl = "~/images/messages/notfound.png";
            }
            else //offer exists
            {
                DateTime Deadline = Convert.ToDateTime(dt.Rows[0]["EndDate"].ToString());
                if (DateTime.Now <= Deadline)
                {
                    DataTable dtUser = new DataTable();
                    DataSet ds2 = new DataSet();

                    SqlDataAdapter sda2 = new SqlDataAdapter("sp_buyActionUserCreditInfo", sqlConn);
                    sda2.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sda2.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(Session["UserId"]);
                    sda2.Fill(ds2);
                    dtUser = ds2.Tables[0];

                    int GiftCredit = 0;
                    int AllPrice = Convert.ToInt32(DropDownListQuantity.SelectedValue) * Convert.ToInt32(dt.Rows[0]["PriceOffer"].ToString()) + Convert.ToInt32(LabelPostPrice.Text);
                    int AllGift = Convert.ToInt32(DropDownListQuantity.SelectedValue) * Convert.ToInt32(dt.Rows[0]["PriceGift"].ToString());
                    int UserGift = Convert.ToInt32(dtUser.Rows[0]["GiftCredit"].ToString());
                    int UserCredit = Convert.ToInt32(dtUser.Rows[0]["Credit"].ToString());

                    if (AllGift > UserGift)
                    {
                        GiftCredit = UserGift;
                    }
                    else
                    {
                        GiftCredit = AllGift;
                    }

                    int UserPayment = AllPrice - GiftCredit;

                    if (UserCredit >= UserPayment)
                    {
                        PanelError.Visible = false;
                        PanelProcess.Visible = false;
                        PanelSuccessful.Visible = true;

                        BuyAction ba = new BuyAction();
                        LabelCode.Text = ba.buyAction("Offers", Convert.ToInt32(Session["UserId"]), Convert.ToInt32(Request.QueryString["ItemId"]), Convert.ToInt32(DropDownListQuantity.SelectedValue), UserPayment, GiftCredit);
                        LabelQuantity.Text = DropDownListQuantity.SelectedValue;

                        NotificationsClass nc = new NotificationsClass();
                        nc.addNotification(1, Convert.ToInt32(Session["UserId"]), 2, HyperLinkTitle.Text, "");
                    }
                    else
                    {
                        PanelNoCredit.Visible = true;
                        PanelProcess.Visible = true;

                        LabelCurrentCredit.Text = dtUser.Rows[0]["Credit"].ToString();
                        LabelCreditDifference.Text = (UserPayment - UserCredit).ToString();
                    }

                    sda2.Dispose();

                }
                else if (DateTime.Now > Deadline)
                {
                    PanelError.Visible = true;
                    PanelProcess.Visible = false;
                    PanelSuccessful.Visible = false;
                    ImageError.ImageUrl = "~/images/messages/expired.png";
                }
            }

            sda.Dispose();
            sqlConn.Close();
        }
        else
        {
            PanelError.Visible = true;
            PanelProcess.Visible = false;
            PanelSuccessful.Visible = false;
            ImageError.ImageUrl = "~/images/messages/loginfirst.png";
        }
    }
}