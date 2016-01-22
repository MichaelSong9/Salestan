<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="AdminPages_Users" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../salestan.ico" type="image/x-icon" />
    <style type="text/css">

        .style2
        {
            text-align: right;
            width: 150px;
        }
        .style5
    {
        text-align: right;
        width: 150px;
        height: 27px;
    }
    .style6
    {
        height: 27px;
    }
        .style3
        {
            text-align: right;
            width: 150px;
            height: 23px;
        }
        .style4
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="PanelInfo" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image26" runat="server" Height="24px" 
                ImageUrl="~/images/icons/panel24.png" Width="24px" />
            <asp:Label ID="Label10" runat="server" CssClass="Header" 
                Text="مشخصات کاربر"></asp:Label>
            <br />
            <asp:Label ID="LabelMessage" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:Panel ID="PanelUserInfo" runat="server" Width="100%">
            <table class="style1" style="direction:rtl;">
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image6" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/keyboard24.png" Width="24px" />
                    <asp:Label ID="Label1" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelEmail0" runat="server" CssClass="FormLabel" 
                        Text="شناسه کاربری:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelUserIdValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelEmail" runat="server" CssClass="FormLabel" 
                            Text="پست الکترونیکی:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelEmailValue" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelMemberSince" runat="server" CssClass="FormLabel" 
                            Text="تاریخ عضویت:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelMemberSinceValue" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelLastLogin" runat="server" CssClass="FormLabel" 
                            Text="آخرین ورود به سیستم:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelLastLoginValue" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image5" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/user_woman24.png" Width="24px" />
                    <asp:Label ID="Label9" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1601;&#1585;&#1583;&#1740;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="LabelFirstName" runat="server" Text="&#1606;&#1575;&#1605;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td class="style6">
                    <asp:Label ID="LabelFirstNameValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLastName" runat="server" Text="&#1606;&#1575;&#1605; &#1582;&#1575;&#1606;&#1608;&#1575;&#1583;&#1711;&#1740;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelLastNameValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelBirthDate" runat="server" Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1578;&#1608;&#1604;&#1583;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelBirthValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="LabelGender" runat="server" 
                        Text="&#1580;&#1606;&#1587;&#1740;&#1578;:" CssClass="FormLabel"></asp:Label>
                </td>
                <td class="style4">
                    <asp:Image ID="ImageGender" runat="server" Height="24px" Width="24px" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelJob" runat="server" Text="&#1588;&#1594;&#1604;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td class="style4">
                    <asp:Label ID="LabelJobValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelEducations" runat="server" Text="&#1578;&#1581;&#1589;&#1740;&#1604;&#1575;&#1578;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelEducationValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image4" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/phone24.png" Width="24px" />
                    <asp:Label ID="Label8" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelHomePhone" runat="server" Text="&#1578;&#1604;&#1601;&#1606; &#1605;&#1606;&#1586;&#1604;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelHomePhoneValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelWorkPhone" runat="server" Text="&#1578;&#1604;&#1601;&#1606; &#1605;&#1581;&#1604; &#1705;&#1575;&#1585;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelWorkPhoneValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelMobile" runat="server" Text="&#1578;&#1604;&#1601;&#1606; &#1607;&#1605;&#1585;&#1575;&#1607;:" 
                        CssClass="FormLabel"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Label ID="LabelMobileValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
      
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelAddress" runat="server" Text="&#1570;&#1583;&#1585;&#1587;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelAddressValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image1" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/credit24.png" Width="24px" />
                    <asp:Label ID="Label2" runat="server" CssClass="Header" Text="اعتبار"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label15" runat="server" Text="اعتبار موجود:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelCredit" runat="server" CssClass="FormLabel" 
                        Font-Bold="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label16" runat="server" Text="اعتبار هدیه:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelGiftCredit" runat="server" CssClass="FormLabel" 
                        Font-Bold="False"></asp:Label>
                </td>
            </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label18" runat="server" CssClass="FormLabel" 
                            Text="اعتبار خرج شده:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelSpentCredit" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label19" runat="server" CssClass="FormLabel" 
                            Text="اعتبار هدیه خرج شده:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelSpendGift" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image2" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/stats24.png" Width="24px" />
                    <asp:Label ID="Label7" runat="server" CssClass="Header" Text="آمار"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label11" runat="server" Text="پیشنهادهای خریده:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelStatsOffersPurchased" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label13" runat="server" Text="کاربران دعوت نموده:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelStatsUsersInvite" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
                <tr>
                    <td colspan="2" class="style2">
                        <asp:Image ID="Image27" runat="server" Height="24px" 
                            ImageUrl="~/images/controlpanel/admin/settings24.png" Width="24px" />
                        <asp:Label ID="Label20" runat="server" CssClass="Header" Text="تنظیمات"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelPremissions0" runat="server" 
                            AssociatedControlID="DropDownListStatus" CssClass="FormLabel" Text="وضعیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="DropDownR2L">
                            <asp:ListItem Value="1">فعال</asp:ListItem>
                            <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:ImageButton ID="ImageButtonStatus" runat="server" 
                            ImageUrl="~/images/Buttons/check-off.png" 
                            onclick="ImageButtonStatus_Click" />
                        &nbsp;<asp:Label ID="LabelStatusMessage" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
        </table>
            </asp:Panel>
            <br />
            
        </asp:Panel>
    </div>
    </form>
</body>
</html>
