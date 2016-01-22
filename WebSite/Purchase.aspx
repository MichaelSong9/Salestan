<%@ Page Title="Salestan : &#1582;&#1585;&#1740;&#1583;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Purchase.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

	<script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#about-credit").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'width': '7',
	            'height': '3'
	        });
	    });
	</script>

<style type="text/css">
.auto-stylebuy1 {
	border: 1px solid #cae1e6;
}
.auto-stylebuy2 {
	border: 1px solid #cae1e6;
	background-color: #dae9fb;
}
    .Data
        {
            font-family: Tahoma;
            font-size: 14px;
            font-weight: bold;
        }
	
    .Title
        {
            font-family: Tahoma;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
<asp:Panel ID="PanelAll" runat="server" Width="100%">
	<table cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
		<tr>
			<td style="vertical-align:top;">
                <asp:Image ID="Image25" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/purchased32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1582;&#1585;&#1740;&#1583;"></asp:Label>
            </td>
			<td style="width:25%;">
                <asp:Image ID="ImageGift3" runat="server" Height="16px" 
                    ImageUrl="~/images/icons/credit24.png" Width="16px" />
                <asp:Label ID="Label40" runat="server" CssClass="FormLabel" Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1588;&#1605;&#1575;:"></asp:Label>
                <asp:Label ID="LabelUserCredit" runat="server" CssClass="Data"></asp:Label>
                <asp:Label ID="Label44" runat="server" CssClass="FormLabel" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                <br />
                <asp:Image ID="ImageGift4" runat="server" Height="16px" 
                    ImageUrl="~/images/icons/gift16.png" Width="16px" />
                <asp:Label ID="Label15" runat="server" CssClass="FormLabel" 
                    Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607; &#1588;&#1605;&#1575;:"></asp:Label>
                <asp:Label ID="LabelUserGift" runat="server" CssClass="Data"></asp:Label>
                <asp:Label ID="Label45" runat="server" CssClass="FormLabel" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                <br />
                <asp:HyperLink ID="HyperLink4" runat="server" CssClass="NormalLink" 
                    NavigateUrl="~/Credit.aspx" Target="_blank">&#1575;&#1601;&#1586;&#1575;&#1740;&#1588; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:HyperLink>
            </td>
		</tr>
	</table>
        <br />
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                ImageUrl="~/images/mainicons/offers24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonOffers" runat="server" CssClass="MessageSender" 
                Enabled="False">&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelOffers" runat="server" Width="100%">
            <asp:Panel ID="PanelError" runat="server" Visible="False" Width="100%">
        <asp:Image ID="ImageError" runat="server" />
    </asp:Panel>
                <br />
 <asp:Panel ID="PanelProcess" runat="server" Width="100%">
                <table cellspacing="0" style="width: 900px" cellpadding="0">
	<tr>
		<td style="width: 400px" class="auto-stylebuy2">
            <asp:Label ID="Label7" runat="server" CssClass="FormLabel" Text="&#1593;&#1606;&#1608;&#1575;&#1606;"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy2">
            <asp:Label ID="Label8" runat="server" CssClass="FormLabel" Text="&#1602;&#1740;&#1605;&#1578; &#1593;&#1575;&#1583;&#1740;"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy2">
            <asp:Label ID="Label9" runat="server" CssClass="FormLabel" Text="&#1602;&#1740;&#1605;&#1578; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy2">
            <asp:Label ID="Label10" runat="server" CssClass="FormLabel" Text="&#1578;&#1593;&#1583;&#1575;&#1583;"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy2">
            <asp:Label ID="Label11" runat="server" CssClass="FormLabel" Text="&#1580;&#1605;&#1593; &#1705;&#1604;"></asp:Label>
        </td>
	</tr>
	<tr>
		<td style="width: 400px" class="auto-stylebuy1">
            <asp:Image ID="ImagePhoto" runat="server" Height="40px" Width="60px" />
            <asp:HyperLink ID="HyperLinkTitle" runat="server" CssClass="NormalLink" 
                Target="_blank">[HyperLinkTitle]</asp:HyperLink>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelNormalPrice" runat="server" CssClass="Data"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelSinglePrice" runat="server" CssClass="Data"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:DropDownList ID="DropDownListQuantity" runat="server" AutoPostBack="True" 
                CssClass="DropDownR2L" 
                onselectedindexchanged="DropDownListQuantity_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelAllPrice" runat="server" CssClass="Data"></asp:Label>
        </td>
	</tr>
	<tr>
		<td colspan="2" style="width: 400px" class="auto-stylebuy2">
            <asp:Image ID="ImageGift0" runat="server" Height="16px" 
                ImageUrl="~/images/icons/gift16.png" Width="16px" />
            <asp:Label ID="Label12" runat="server" CssClass="FormLabel" 
                Text="&#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1575;&#1586; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;"></asp:Label>&nbsp;<a 
                ID="about-credit" class="NormalLink" href="images/about/credit.png">(&#1578;&#1608;&#1590;&#1740;&#1581;)</a>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy2">
            <asp:Label ID="Label13" runat="server" CssClass="FormLabel" Text="&#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1593;&#1583;&#1583;"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy2">
            <asp:Label ID="Label14" runat="server" CssClass="FormLabel" Text="&#1576;&#1585;&#1575;&#1740; &#1705;&#1604;"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy2">
            <asp:Label ID="Label16" runat="server" CssClass="FormLabel" 
                Text="&#1662;&#1585;&#1583;&#1575;&#1582;&#1578;&#1740; &#1575;&#1586; &#1607;&#1583;&#1740;&#1607;"></asp:Label>
        </td>
	</tr>
	<tr>
		<td colspan="2" style="width: 400px; text-align: center;" class="auto-stylebuy1">
            &nbsp;</td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelGiftPrice" runat="server" CssClass="Data"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelAllGift" runat="server" CssClass="Data"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelGiftSpend" runat="server" CssClass="Data"></asp:Label>
        </td>
	</tr>
    </table>
    <br />
    <table cellpadding="0" cellpadding="0" cellspacing="0" style="width: 250px">
	<tr>
		<td style="width: 125px; text-align: left;" colspan="4" class="auto-stylebuy1">
            <asp:Image ID="ImageGift1" runat="server" Height="16px" 
                ImageUrl="~/images/icons/post16.png" Width="16px" />
            <asp:Label ID="Label17" runat="server" CssClass="FormLabel" Text="&#1607;&#1586;&#1740;&#1606;&#1607; &#1575;&#1585;&#1587;&#1575;&#1604;:"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelPostPrice" runat="server" CssClass="Data"></asp:Label>
        </td>
	</tr>
	<tr>
		<td style="width: 125px; text-align: left;" colspan="4" class="auto-stylebuy1">
            <asp:Image ID="ImageGift2" runat="server" Height="16px" 
                ImageUrl="~/images/icons/credit24.png" Width="16px" />
            <asp:Label ID="Label18" runat="server" CssClass="FormLabel" Text="&#1662;&#1585;&#1583;&#1575;&#1582;&#1578;&#1740; &#1588;&#1605;&#1575;:"></asp:Label>
        </td>
		<td style="width: 125px; text-align: center;" class="auto-stylebuy1">
            <asp:Label ID="LabelPayment" runat="server" CssClass="Data"></asp:Label>
        </td>
	</tr>
	</table>

                <asp:Label ID="Label39" runat="server" CssClass="smalltext" 
                    Text="*&#1578;&#1605;&#1575;&#1605;&#1740; &#1602;&#1740;&#1605;&#1578; &#1607;&#1575; &#1576;&#1607; &#1578;&#1608;&#1605;&#1575;&#1606; &#1605;&#1740; &#1576;&#1575;&#1588;&#1583;."></asp:Label>
                <br />
                <br />
                &nbsp;<asp:ImageButton ID="ImageButtonBuy" runat="server" 
                    ImageUrl="~/images/Buttons/purchase-off.png" 
                    onclick="ImageButtonBuy_Click" />
                <br />
                <asp:Panel ID="PanelNoCredit" runat="server" Visible="False">
                    <asp:Label ID="Label32" runat="server" CssClass="FormValidation" 
                        Text="&#1705;&#1575;&#1585;&#1576;&#1585; &#1711;&#1585;&#1575;&#1605;&#1740; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1588;&#1605;&#1575; &#1576;&#1585;&#1575;&#1740; &#1582;&#1585;&#1740;&#1583; &#1575;&#1740;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1705;&#1575;&#1601;&#1740; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;!"></asp:Label>
                    <br />
                    <asp:Label ID="Label33" runat="server" CssClass="InlineText" 
                        Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1601;&#1593;&#1604;&#1740; &#1588;&#1605;&#1575;:"></asp:Label>
                    &nbsp;<asp:Label ID="LabelCurrentCredit" runat="server" CssClass="InlineText"></asp:Label>
                    <asp:Label ID="Label42" runat="server" CssClass="InlineText" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label34" runat="server" CssClass="InlineText" Text="&#1605;&#1576;&#1604;&#1594; &#1705;&#1587;&#1585;&#1740;:"></asp:Label>
                    <asp:Label ID="LabelCreditDifference" runat="server" CssClass="InlineText"></asp:Label>
                    <asp:Label ID="Label43" runat="server" CssClass="InlineText" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                    <br />
                    <asp:Image ID="Image2" runat="server" Height="24px" 
                        ImageUrl="~/images/controlpanel/menu/credit24.png" Width="24px" />
                    <asp:HyperLink ID="HyperLink3" runat="server" CssClass="NormalLink" 
                        NavigateUrl="~/Credit.aspx" Target="_blank">&#1605;&#1585;&#1575;&#1580;&#1593;&#1607; &#1576;&#1607; &#1589;&#1601;&#1581;&#1607; &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1608; &#1575;&#1601;&#1586;&#1575;&#1740;&#1588; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:HyperLink>
                </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="PanelSuccessful" runat="server" Visible="False" Width="100%">
                    <asp:Image ID="Image26" runat="server" Height="22px" 
                        ImageUrl="~/images/icons/check22.png" Width="22px" />
                    <asp:Label ID="Label41" runat="server" CssClass="SuccessMessage" 
                        Text="&#1588;&#1605;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1575;&#1740;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1585;&#1575; &#1582;&#1585;&#1740;&#1583;&#1575;&#1585;&#1740; &#1606;&#1605;&#1608;&#1583;&#1740;&#1583;!"></asp:Label>
                    <br />
                    <br />
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 110px">
                                <asp:Label ID="Label35" runat="server" CssClass="Title" Text="&#1705;&#1583; &#1582;&#1585;&#1740;&#1583;:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelCode" runat="server" CssClass="Data"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 110px">
                                <asp:Label ID="Label23" runat="server" CssClass="Title" Text="&#1578;&#1593;&#1583;&#1575;&#1583;:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelQuantity" runat="server" CssClass="Data"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px; vertical-align:top;">
                                <asp:Label ID="Label36" runat="server" CssClass="Title" Text="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578;:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label37" runat="server" CssClass="Title" 
                                    Text="&#1607;&#1606;&#1711;&#1575;&#1605; &#1583;&#1585;&#1740;&#1575;&#1601;&#1578; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1575;&#1740;&#1606; &#1705;&#1583; &#1585;&#1575; &#1576;&#1607; &#1607;&#1605;&#1585;&#1575;&#1607; &#1583;&#1575;&#1588;&#1578;&#1607; &#1576;&#1575;&#1588;&#1740;&#1583;."></asp:Label>
                                <br />
                                <asp:Label ID="Label38" runat="server" CssClass="Title" 
                                    Text=" &#1583;&#1585; &#1589;&#1608;&#1585;&#1578; &#1601;&#1585;&#1575;&#1605;&#1608;&#1588;&#1740;&#1548; &#1705;&#1583; &#1583;&#1585; &#1662;&#1606;&#1604; &#1588;&#1605;&#1575; &#1576;&#1582;&#1588; &quot;&#1582;&#1585;&#1740;&#1583; &#1607;&#1575;&quot; &#1602;&#1575;&#1576;&#1604; &#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1605;&#1740; &#1576;&#1575;&#1588;&#1583;."></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>
        </div>
        </asp:Panel>
        <asp:Panel ID="PanelNoAccess" runat="server" Visible="False" Width="100%">
        </asp:Panel>
</div>
</asp:Content>

