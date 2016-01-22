<%@ Page Title="Salestan : &#1662;&#1606;&#1604; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Panel.aspx.cs" Inherits="Panel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#invitelist").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe'
	        });
	        jq14("#invitelistimage").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe'
	        });
	        jq14("#invite-mail").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe'
	        });
	        jq14("#invite-link").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe'
	        });
	        jq14("#about-credit").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'width': '7',
	            'height': '3'
	        });
	    });
	</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
 <asp:Label ID="LabelWelcome" runat="server" CssClass="FormLabel"></asp:Label>
    <br />
    <br />
        <asp:Panel ID="PanelFemale" runat="server" Visible="False">
<table style="width: 100%;">
	            <tr>
		            <td style="width: 33%">
                    &nbsp;</td>
                    <td style="width: 33%">
                        <div class="ShowHidePanelAttention" style="width:400px;" >
                            <table style="width: 100%">
								<tr>
									<td style="width: 70px">
                                        <asp:Image ID="Image11" runat="server" Height="64px" 
                                            ImageUrl="~/images/icons/user_woman64.png" Width="64px" />
                                    </td>
									<td>
                                    <span class="InlineText">
                                        <asp:Label ID="Label28" runat="server" CssClass="ErrorMessage" 
                                            Text="&#1662;&#1740;&#1594;&#1575;&#1605; &#1605;&#1581;&#1585;&#1605;&#1575;&#1606;&#1607; &#1601;&#1602;&#1591; &#1576;&#1585;&#1575;&#1740; &#1582;&#1575;&#1606;&#1605; &#1607;&#1575;!"></asp:Label>
                                        <br />
                                        &#1601;&#1602;&#1591; <asp:Label ID="LabelFemaleStats" runat="server" CssClass="Header"></asp:Label>
                                        &#1575;&#1593;&#1590;&#1575;&#1740; &#1587;&#1575;&#1740;&#1578; &#1582;&#1575;&#1606;&#1608;&#1605; &#1607;&#1575; &#1607;&#1587;&#1578;&#1606; &#1608; &#1576;&#1602;&#1740;&#1607; &#1570;&#1602;&#1575;&#1740;&#1608;&#1606; &#1607;&#1587;&#1578;&#1606;!<br /> &#1576;&#1575; &#1583;&#1593;&#1608;&#1578; &#1583;&#1608;&#1587;&#1578;&#1575;&#1606; &#1583;&#1582;&#1578;&#1585; &#1582;&#1608;&#1583; &#1576;&#1607; 
                                        &#1587;&#1575;&#1740;&#1578; &#1606;&#1711;&#1584;&#1575;&#1585;&#1740;&#1583; Salestan &#1740;&#1705; &#1587;&#1575;&#1740;&#1578; &#1605;&#1585;&#1583;&#1608;&#1606;&#1607; &#1576;&#1588;&#1607;!
                                    </span>
                                    </td>
								</tr>
							</table>
                         </div>
                    </td>
					<td>
                    &nbsp;</td>
	            </tr>
            </table>
        </asp:Panel>
<table cellpadding="0" cellspacing="0" style="width: 100%">
	<tr>
		<td style="width: 50%" valign="top">
                    <div class="ShowHidePanel1">
                <table cellpadding="0" cellspacing="0" style="width: 100%">
	<tr>
		<td valign="top"><asp:Label ID="Label16" runat="server" CssClass="ShowHideHeader" 
                    Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1608; &#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578;"></asp:Label>
             <br />
                        <br />
                        <asp:HyperLink ID="HyperLink166" runat="server" 
                CssClass="NormalLink" NavigateUrl="~/Profile.aspx?Show=Contact">&#1578;&#1594;&#1740;&#1740;&#1585; &#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740;</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="HyperLink165" runat="server" 
                CssClass="NormalLink" NavigateUrl="~/Profile.aspx?Show=Communications">&#1578;&#1594;&#1740;&#1740;&#1585; &#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1575;&#1578;</asp:HyperLink>
                        <br />
                        <br />
                <br /></td>
				<td style="width: 64px" valign="bottom">
            <a href="Settings.aspx">
            <img id="imagesettings" alt="" src="images/controlpanel/fade/settings64.png" width="64" height="64" onmouseover="this.src='images/controlpanel/menu/settings48.png';"
                onmouseout="this.src='images/controlpanel/fade/settings64.png';" border="0" /></a>
        </td>
	</tr>
</table>
         </div>
        </td>
		<td style="width: 50%" valign="top">
                    <div class="ShowHidePanel1">
                <table cellpadding="0" cellspacing="0" style="width: 100%">
	<tr>
		<td valign="top"><asp:Label ID="Label17" runat="server" CssClass="ShowHideHeader" 
                    Text="&#1582;&#1585;&#1740;&#1583; &#1607;&#1575;"></asp:Label>
             <br />
                        <br />
                            <asp:Label ID="Label20" runat="server" Text="&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;:" 
                            CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelOffersPurchasedCount" runat="server" 
                            CssClass="InlineText"></asp:Label>
                            <asp:Label ID="Label21" runat="server" Text="&#1582;&#1585;&#1740;&#1583;" CssClass="InlineText"></asp:Label>
                            <br />
                            <asp:Label ID="Label22" runat="server" Text="&#1570;&#1582;&#1585;&#1740;&#1606; &#1582;&#1585;&#1740;&#1583;:" 
                            CssClass="InlineText"></asp:Label>
                            <asp:Image ID="ImageLastPurchased" runat="server" 
                            ImageUrl="~/images/mainicons/offers16.png" Visible="False" />
                            <asp:Label ID="LabelLastPurchased" runat="server" 
                            CssClass="InlineText"></asp:Label>
                            <br />
                        <br />
                        <asp:HyperLink ID="HyperLink161" runat="server" 
                CssClass="NormalLink" NavigateUrl="~/Purchased.aspx">(&#1601;&#1607;&#1585;&#1587;&#1578; &#1578;&#1605;&#1575;&#1605;&#1740; &#1582;&#1585;&#1740;&#1583; &#1607;&#1575;)</asp:HyperLink>
                <br /></td>
				<td style="width: 64px" valign="bottom">
            <a href="Purchased.aspx">
            <img alt="" src="images/controlpanel/fade/purchased64.png" width="64" height="64" onmouseover="this.src='images/controlpanel/menu/purchased48.png';"
                onmouseout="this.src='images/controlpanel/fade/purchased64.png';" border="0" /></a>
        </td>
	</tr>
</table>

         </div>
        </td>
	</tr>
	<tr>
		<td style="width: 50%" valign="top">
                    <div class="ShowHidePanel1">
                <table cellpadding="0" cellspacing="0" style="width: 100%">
	<tr>
		<td valign="top"><asp:Label ID="Label18" runat="server" CssClass="ShowHideHeader" 
                    Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585;"></asp:Label>
             <br />
                        <br />
                            <asp:Label ID="Label6" runat="server" Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604;&#1740;:" 
                                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelCredit" runat="server" 
                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="&#1578;&#1608;&#1605;&#1575;&#1606;" 
                                CssClass="InlineText"></asp:Label>
                            <br />
                            <asp:Label ID="Label7" runat="server" Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;:" 
                                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelGiftCredit" runat="server" 
                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="Label23" runat="server" Text="&#1578;&#1608;&#1605;&#1575;&#1606;" 
                                CssClass="InlineText"></asp:Label>
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:" 
                                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelSpentCredit" runat="server" 
                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="Label25" runat="server" Text="&#1578;&#1608;&#1605;&#1575;&#1606;" 
                                CssClass="InlineText"></asp:Label>
                            <br />
                            <asp:Label ID="Label10" runat="server" Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:" 
                                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelSpentGift" runat="server" 
                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="Label26" runat="server" Text="&#1578;&#1608;&#1605;&#1575;&#1606;" 
                                CssClass="InlineText"></asp:Label>
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="&#1705;&#1604; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:" 
                                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelTotalCredit" runat="server" 
                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="Label27" runat="server" Text="&#1578;&#1608;&#1605;&#1575;&#1606;" 
                                CssClass="InlineText"></asp:Label>
                            <br />
                <a class="NormalLink" id="about-credit" href="images/about/credit.png">(&#1578;&#1608;&#1590;&#1740;&#1581;)</a><br /></td>
				<td style="width: 64px" valign="bottom">
            <a href="Credit.aspx">
            <img alt="" src="images/controlpanel/fade/credit64.png" width="64" height="64" onmouseover="this.src='images/controlpanel/menu/credit48.png';"
                onmouseout="this.src='images/controlpanel/fade/credit64.png';" border="0" /></a>
        </td>
	</tr>
</table>

         </div>
        </td>
		<td style="width: 50%" valign="top">
                    <div class="ShowHidePanel1">
                <table cellpadding="0" cellspacing="0" style="width: 100%">
	<tr>
		<td valign="top"><asp:Label ID="Label19" runat="server" CssClass="ShowHideHeader" 
                    Text="&#1605;&#1593;&#1585;&#1601;&#1740; &#1608; &#1570;&#1605;&#1575;&#1585;"></asp:Label>
             <br />
                        <br />
                            <asp:Label ID="Label3" runat="server" 
                            Text="&#1705;&#1583; &#1605;&#1593;&#1585;&#1601;&#1740; &#1588;&#1605;&#1575;:" 
                            CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelInviteCode" runat="server" 
                CssClass="InlineText"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="&#1578;&#1593;&#1583;&#1575;&#1583;  &#1575;&#1601;&#1585;&#1575;&#1583; &#1605;&#1593;&#1585;&#1601;&#1740; &#1606;&#1605;&#1608;&#1583;&#1607;: " 
                                CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelInvitedCount" runat="server" CssClass="InlineText"></asp:Label>
                            <a class="NormalLink" id="invitelist" href="Pages/UsersInviteList.aspx">(&#1601;&#1607;&#1585;&#1587;&#1578; &#1705;&#1575;&#1605;&#1604;)</a>
                            <br />
                            <asp:Label ID="Label5" runat="server" 
                            Text="&#1605;&#1593;&#1585;&#1601; &#1588;&#1605;&#1575;:" 
                            CssClass="InlineText"></asp:Label>
                            <asp:Label ID="LabelInvitedName" runat="server" 
                CssClass="InlineText"></asp:Label>
                            <br />
                            <asp:Image ID="Image4" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/mail16.png" />
                            <a class="NormalLink" id="invite-mail" href="Pages/UsersInvite.aspx">&#1583;&#1593;&#1608;&#1578; &#1575;&#1586; &#1583;&#1608;&#1587;&#1578; &#1576;&#1607; 
                            &#1593;&#1590;&#1608;&#1740;&#1578;</a><br />
                            <asp:Image ID="Image5" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/link16.png" />
                            <a class="NormalLink" id="invite-link" href="Pages/UsersInviteLink.aspx">&#1583;&#1585;&#1740;&#1575;&#1601;&#1578; &#1604;&#1740;&#1606;&#1705; 
                            &#1583;&#1593;&#1608;&#1578; &#1576;&#1607; 
                            &#1593;&#1590;&#1608;&#1740;&#1578;</a><br />
                            <asp:HyperLink CssClass="NormalLink" ID="HyperLink6" runat="server" 
                                NavigateUrl="~/About.aspx?Show=Gift800" Target="_blank">&#1583;&#1585;&#1576;&#1575;&#1585;&#1607; &#1591;&#1585;&#1581; 800 &#1605;&#1740;&#1604;&#1740;&#1608;&#1606; &#1585;&#1740;&#1575;&#1604; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;</asp:HyperLink>
                <br /></td>
				<td style="width: 64px" valign="bottom">
            <a id="invitelistimage" href="Pages/UsersInviteList.aspx">
            <img alt="" src="images/controlpanel/fade/stats64.png" width="64" height="64" onmouseover="this.src='images/controlpanel/menu/statistics48.png';"
                onmouseout="this.src='images/controlpanel/fade/stats64.png';" border="0" /></a>
        </td>
	</tr>
</table>

         </div>
        </td>
	</tr>
</table>
    </div>
</asp:Content>

