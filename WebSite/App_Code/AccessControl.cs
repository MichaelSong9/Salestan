using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for AccessControl
/// </summary>
public class AccessControl
{
    //public bool[] getAllAccess()
    //{
    //    DataTable dt = new DataTable();
    //    DataSet ds = new DataSet();
    //    SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

    //    SqlDataAdapter sda = new SqlDataAdapter("sp_accessInfo", sqlConn);
    //    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
    //    sda.Fill(ds);
    //    dt = ds.Tables[0];

    //    sda.Dispose();
    //    sqlConn.Close();

    //    bool[] access = new bool[] 
    //    {
    //        Convert.ToBoolean(dt.Rows[0]["SectionGeneralStatus"].ToString()), 
    //        Convert.ToBoolean(dt.Rows[0]["SectionOffersStatus"].ToString()),
    //        Convert.ToBoolean(dt.Rows[0]["SectionCharityStatus"].ToString()),
    //        Convert.ToBoolean(dt.Rows[0]["SectionRegisterStatus"].ToString()),
    //        Convert.ToBoolean(dt.Rows[0]["SectionLoginStatus"].ToString()),
    //        Convert.ToBoolean(dt.Rows[0]["SectionCreditStatus"].ToString()),
    //        Convert.ToBoolean(dt.Rows[0]["SectionPurchaseStatus"].ToString()),
    //    };

    //    return access;
    //}
    public bool getSectionAccess(string Section)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_accessInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        sda.Dispose();
        sqlConn.Close();

        switch (Section)
        {
            case "General":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionGeneralStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
            case "Offers":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionOffersStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
            case "Coupons":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionCouponsStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
            case "Charity":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionCharityStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
            case "Register":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionRegisterStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
            case "Login":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionLoginStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
            case "Credit":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionCreditStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
            case "Purchase":
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionPurchaseStatus"].ToString()) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                }
        }
        return false;
    }
    public string getMainSectionsLinksCode(string Path)
    {
        string Code = "";
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_accessInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        switch (Path)
        {
            case "Offers.aspx":
            case "ShowOffer.aspx":
                {
                    Code = "<a href='Offers.aspx'><img alt='' src='images/Tabs/SpecialOffers.png' width='155' height='38' /></a>";
                    if (Convert.ToInt32(dt.Rows[0]["SectionCharityStatus"].ToString()) == 1)
                    {
                        Code = Code + "<a href='Charity.aspx'><img alt='' src='images/Tabs/Charity0.png' width='155' height='38' onmouseover='this.src=&#39;images/Tabs/Charity1.png&#39;;' onmouseout='this.src=&#39;images/Tabs/Charity0.png&#39;;' border='0'/></a>";
                    }
                    
                    break;
                }
            case "Charity.aspx":
            case "CharityNews.aspx":
                {
                    Code = "<a href='Charity.aspx'><img alt='' src='images/Tabs/Charity.png' width='155' height='38' /></a>";
                    if (Convert.ToInt32(dt.Rows[0]["SectionOffersStatus"].ToString()) == 1)
                    {
                        Code = "<a href='Offers.aspx'><img alt='' src='images/Tabs/SpecialOffers0.png' width='155' height='38' onmouseover='this.src=&#39;images/Tabs/SpecialOffers1.png&#39;;' onmouseout='this.src=&#39;images/Tabs/SpecialOffers0.png&#39;;' border='0'/></a>" + Code;
                    }

                    break;
                }
            default:
                {
                    if (Convert.ToInt32(dt.Rows[0]["SectionOffersStatus"].ToString()) == 1)
                    {
                        Code = "<a href='Offers.aspx'><img alt='' src='images/Tabs/SpecialOffers0.png' width='155' height='38' onmouseover='this.src=&#39;images/Tabs/SpecialOffers1.png&#39;;' onmouseout='this.src=&#39;images/Tabs/SpecialOffers0.png&#39;;' border='0'/></a>";
                    }
                    if (Convert.ToInt32(dt.Rows[0]["SectionCharityStatus"].ToString()) == 1)
                    {
                        Code = Code + "<a href='Charity.aspx'><img alt='' src='images/Tabs/Charity0.png' width='155' height='38' onmouseover='this.src=&#39;images/Tabs/Charity1.png&#39;;' onmouseout='this.src=&#39;images/Tabs/Charity0.png&#39;;' border='0'/></a>";
                    }

                    break;
                }
        }

        sda.Dispose();
        sqlConn.Close();

        return Code;
    }
    public string getMainSectionsFooterCode(string Path)
    {
        string Code = "";
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_accessInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (Convert.ToInt32(dt.Rows[0]["SectionOffersStatus"].ToString()) == 1)
        {
            Code = "<img width='16px' height='16px' src='images/mainicons/white-offer16.png' /><a class='BottomLink' href='Offers.aspx'>&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;</a><br />";
        }
        if (Convert.ToInt32(dt.Rows[0]["SectionCharityStatus"].ToString()) == 1)
        {
            Code = Code + "<img width='16px' height='16px' src='images/mainicons/white-charity16.png' /><a class='BottomLink' href='Charity.aspx'>&#1582;&#1740;&#1585;&#1740;&#1607;</a><br />";
        }

        sda.Dispose();
        sqlConn.Close();

        return Code;
    }
    public string getPanelLinksCode(string Path, int UserId)
    {
        string Code = "";
        string NotificationCode = "";
        string SupportRequestsCode = "";
        string MessagesCode = "";
        string RequestsCode = "";

        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_userMenuRemindersCount", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (Convert.ToInt32(dt.Rows[0]["NotificationsCount"].ToString()) != 0)
        {
            NotificationCode = "<div style='position:absolute; top:2px; right:505px; width:16px; height:14px; background-color:red; text-align:center; border-radius: 4px; -moz-border-radius: 4px;' ><span style=' font-family:Verdana; font-size:10px; color:white; font-weight:bold;'>" + dt.Rows[0]["NotificationsCount"].ToString() + "</span></div>";
        }
        if (Convert.ToInt32(dt.Rows[0]["SupportRequestsCount"].ToString()) != 0)
        {
            SupportRequestsCode = "<div style='position:absolute; top:2px; right:625px; width:16px; height:14px; background-color:red; text-align:center; border-radius: 4px; -moz-border-radius: 4px;' ><span style=' font-family:Verdana; font-size:10px; color:white; font-weight:bold;'>" + dt.Rows[0]["SupportRequestsCount"].ToString() + "</span></div>";
        }
        if (Convert.ToInt32(dt.Rows[0]["MessagesCount"].ToString()) != 0)
        {
            MessagesCode = "<div style='position:absolute; top:2px; right:445px; width:16px; height:14px; background-color:red; text-align:center; border-radius: 4px; -moz-border-radius: 4px;' ><span style=' font-family:Verdana; font-size:10px; color:white; font-weight:bold;'>" + dt.Rows[0]["MessagesCount"].ToString() + "</span></div>";
        }
        if (Convert.ToInt32(dt.Rows[0]["RequestsCount"].ToString()) != 0)
        {
            RequestsCode = "<div style='position:absolute; top:2px; right:565px; width:16px; height:14px; background-color:red; text-align:center; border-radius: 4px; -moz-border-radius: 4px;' ><span style=' font-family:Verdana; font-size:10px; color:white; font-weight:bold;'>" + dt.Rows[0]["RequestsCount"].ToString() + "</span></div>";
        }

        sda.Dispose();
        sqlConn.Close();




        switch (Path)
        {
            case "Credit.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit1.png' width='60' height='60' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:322px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Favorites.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites1.png' width='60' height='60' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:265px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Messages.aspx":
            case "ShowMessages.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages1.png' width='60' height='60' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:465px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Notifications.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications1.png' width='60' height='60' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:525px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Panel.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel1.png' width='60' height='60' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:25px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Profile.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile1.png' width='60' height='60' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:85px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Connections.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections1.png' width='60' height='60' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:145px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Purchased.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased1.png' width='60' height='60' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:205px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Requests.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests1.png' width='60' height='60' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:585px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Settings.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings1.png' width='60' height='60' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div>		<div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:385px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            case "Support.aspx":
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support1.png' width='60' height='60' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:65px; right:645px; width:20px; height:11px;' ><img alt='' src='images/menu/arrow.png' width='20' height='11' border='0' /></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
            default:
                {
                    Code = "<div dir='rtl' style='width:950px; height:90px; margin:0 auto;'><div style='width:770px; height:90px; position:relative;margin:0 auto;'><div style='position:absolute; top:2px; right:5px; width:60px; height:60px;' ><a href='Panel.aspx'><img alt='' src='images/menu/panel0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/panel1.png&#39;;' onmouseout='this.src=&#39;images/menu/panel0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:65px; width:60px; height:60px;' ><a href='Profile.aspx'><img alt='' src='images/menu/profile0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/profile1.png&#39;;' onmouseout='this.src=&#39;images/menu/profile0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:125px; width:60px; height:60px;' ><a href='Connections.aspx'><img alt='' src='images/menu/connections0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/connections1.png&#39;;' onmouseout='this.src=&#39;images/menu/connections0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:185px; width:60px; height:60px;' ><a href='Purchased.aspx'><img alt='' src='images/menu/purchased0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/purchased1.png&#39;;' onmouseout='this.src=&#39;images/menu/purchased0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:245px; width:60px; height:60px;' ><a href='Favorites.aspx'><img alt='' src='images/menu/favorites0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/favorites1.png&#39;;' onmouseout='this.src=&#39;images/menu/favorites0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:305px; width:60px; height:60px;' ><a href='Credit.aspx'><img alt='' src='images/menu/credit0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/credit1.png&#39;;' onmouseout='this.src=&#39;images/menu/credit0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:365px; width:60px; height:60px;' ><a href='Settings.aspx'><img alt='' src='images/menu/settings0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/settings1.png&#39;;' onmouseout='this.src=&#39;images/menu/settings0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:2px; right:425px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div><div style='position:absolute; top:2px; right:445px; width:60px; height:60px;' ><a href='Messages.aspx'><img alt='' src='images/menu/messages0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/messages1.png&#39;;' onmouseout='this.src=&#39;images/menu/messages0.png&#39;;' border='0' /></a></div>" + MessagesCode + "<div style='position:absolute; top:2px; right:505px; width:60px; height:60px;' ><a href='Notifications.aspx'><img alt='' src='images/menu/notifications0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/notifications1.png&#39;;' onmouseout='this.src=&#39;images/menu/notifications0.png&#39;;' border='0' /></a></div>" + NotificationCode + "<div style='position:absolute; top:2px; right:565px; width:60px; height:60px;' ><a href='Requests.aspx'><img alt='' src='images/menu/requests0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/requests1.png&#39;;' onmouseout='this.src=&#39;images/menu/requests0.png&#39;;' border='0' /></a></div>" + RequestsCode + "<div style='position:absolute; top:2px; right:625px; width:60px; height:60px;' ><a href='Support.aspx'><img alt='' src='images/menu/support0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/support1.png&#39;;' onmouseout='this.src=&#39;images/menu/support0.png&#39;;' border='0' /></a></div>" + SupportRequestsCode + "<div style='position:absolute; top:2px; right:685px; width:20px; height:60px;' ><img alt='' src='images/menu/devider.png' width='20' height='60' border='0' /></div>		<div style='position:absolute; top:2px; right:705px; width:60px; height:60px;' ><a href='Signout.aspx'><img alt='' src='images/menu/signout0.png' width='60' height='60' onmouseover='this.src=&#39;images/menu/signout1.png&#39;;' onmouseout='this.src=&#39;images/menu/signout0.png&#39;;' border='0' /></a></div><div style='position:absolute; top:75px; right:5px; width:750px; height:1px;' ><img alt='' src='images/menu/line.png' width='750' height='1' border='0' /></div></div></div>";
                    break;
                }
        }

        return Code;
    }
}