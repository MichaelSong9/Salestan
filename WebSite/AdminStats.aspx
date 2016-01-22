<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1570;&#1605;&#1575;&#1585;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminStats.aspx.cs" Inherits="AdminStats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">



        .style1
        {
            width: 100%;
        }
        
        .style2
        {
            text-align: right;
            width: 150px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/stats32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1570;&#1605;&#1575;&#1585;"></asp:Label>
        <br />
        <br />
                            <asp:Image ID="ImageAllRefresh" runat="server" Height="16px" 
            Width="16px" ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonStatsRefresh" runat="server" 
                                CssClass="NormalLink" 
            onclick="LinkButtonStatsRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1578;&#1605;&#1575;&#1605;&#1740; &#1570;&#1605;&#1575;&#1585;&#1607;&#1575;</asp:LinkButton>
                        <br />
        <br />
    </div>
    <ContentTemplate>
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1">
            <asp:Image ID="Image3" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/user_woman24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonUsers" runat="server" CssClass="MessageSender" onclick="LinkButtonUsers_Click" 
                 >&#1570;&#1605;&#1575;&#1585; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelUsers" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Image ID="ImageUsersRefresh" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonUsersRefresh" runat="server" 
                                CssClass="NormalLink" onclick="LinkButtonUsersRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1570;&#1605;&#1575;&#1585;</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label14" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1570;&#1582;&#1585;&#1740;&#1606; &#1576;&#1607; &#1585;&#1608;&#1586;&#1585;&#1587;&#1575;&#1606;&#1740;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelUsersDate" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label7" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelUsersUsers" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="Label8" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1580;&#1606;&#1587;&#1740;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelUsersGenderFemale" runat="server" CssClass="FormLabel"></asp:Label>
                            <br />
                            <asp:Label ID="LabelUsersGenderMale" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label10" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1608;&#1585;&#1608;&#1583; &#1587;&#1575;&#1740;&#1578; &#1583;&#1585; 1 &#1605;&#1575;&#1607; &#1575;&#1582;&#1740;&#1585;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelUsersLogin" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
<div class="ShowHidePanel1">
            <asp:Image ID="Image1" runat="server" Height="24px" 
                 ImageUrl="~/images/mainicons/offers24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonOffers" runat="server" CssClass="MessageSender" onclick="LinkButtonOffers_Click" 
                 >&#1570;&#1605;&#1575;&#1585; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelOffers" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Image ID="ImageOffersRefresh" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonOffersRefresh" runat="server" 
                                CssClass="NormalLink" onclick="LinkButtonOffersRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1570;&#1605;&#1575;&#1585;</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1570;&#1582;&#1585;&#1740;&#1606; &#1576;&#1607; &#1585;&#1608;&#1586;&#1585;&#1587;&#1575;&#1606;&#1740;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelOffersDate" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelOffersOffers" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label5" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1601;&#1593;&#1575;&#1604;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelOffersActive" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label9" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1711;&#1584;&#1588;&#1578;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelOffersPast" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label15" runat="server" CssClass="FormLabel" 
                                Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1705;&#1604; &#1601;&#1585;&#1608;&#1588;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelOffersSold" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label16" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1601;&#1585;&#1608;&#1588; &#1607;&#1585; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelOffersAverage" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image4" runat="server" Height="24px" 
                 ImageUrl="~/images/mainicons/coupons24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonCoupons" runat="server" CssClass="MessageSender" onclick="LinkButtonCoupons_Click"
                 >&#1570;&#1605;&#1575;&#1585; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelCoupons" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Image ID="ImageCouponsRefresh" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonCouponsRefresh" runat="server" 
                                CssClass="NormalLink" onclick="LinkButtonCouponsRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1570;&#1605;&#1575;&#1585;</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label13" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1570;&#1582;&#1585;&#1740;&#1606; &#1576;&#1607; &#1585;&#1608;&#1586;&#1585;&#1587;&#1575;&#1606;&#1740;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelCouponsDate" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label24" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelCouponsCoupons" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label26" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1705;&#1608;&#1662;&#1606; &#1607;&#1575;&#1740; &#1601;&#1593;&#1575;&#1604;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelCouponsActive" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label28" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1705;&#1608;&#1662;&#1606; &#1607;&#1575;&#1740; &#1711;&#1584;&#1588;&#1578;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelCouponsPast" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image2" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/credit24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonCredit" runat="server" CssClass="MessageSender" onclick="LinkButtonCredit_Click"
                 >&#1570;&#1605;&#1575;&#1585; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelCredit" runat="server" Visible="False" Width="100%">
                <br />
                <table style="direction:rtl; width: 100%;">
                    <tr>
                        <td colspan="4" style="text-align:center;">
                            <asp:Image ID="ImageCreditRefresh" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonCreditRefresh" runat="server" 
                                CssClass="NormalLink" onclick="LinkButtonCreditRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1570;&#1605;&#1575;&#1585;</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label2" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1570;&#1582;&#1585;&#1740;&#1606; &#1576;&#1607; &#1585;&#1608;&#1586;&#1585;&#1587;&#1575;&#1606;&#1740;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsDate" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label4" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1605;&#1608;&#1580;&#1608;&#1583;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsActiveCredit" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label18" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsActiveCreditAverage" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label6" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsGiftCredit" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label20" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsGiftCreditAverage" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label12" runat="server" CssClass="FormLabel" 
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentCredit" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label22" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentCreditAverage" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label17" runat="server" CssClass="FormLabel" 
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentGift" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label23" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentGiftAverage" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    </ContentTemplate>
</asp:Content>

