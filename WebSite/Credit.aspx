<%@ Page Title="Salestan : &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Credit.aspx.cs" Inherits="CreditPage" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

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

        .style2
        {
            text-align: right;
            width: 150px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Panel ID="PanelAll" runat="server" Width="100%">
             <asp:Panel ID="PanelResult" runat="server" Visible="False" Width="100%">
         <div class="ShowHidePanel1">
             <asp:Image ID="Image29" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/clock24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonResult" runat="server" CssClass="MessageSender" 
                 onclick="LinkButtonHistory_Click" TabIndex="16" Enabled="False" 
                 >&#1606;&#1578;&#1740;&#1580;&#1607; &#1578;&#1585;&#1575;&#1705;&#1606;&#1588;</asp:LinkButton>
             <br />
    <asp:Panel ID="PanelTransactionSuccessful" runat="server" Visible="False">
    <div dir="rtl">
        <asp:Image ID="Image2" runat="server" Height="22px" 
            ImageUrl="~/images/icons/check22.png" Width="22px" />
        <asp:Label ID="Label1" runat="server" CssClass="SuccessMessage" 
            Text="&#1705;&#1575;&#1585;&#1576;&#1585; &#1711;&#1585;&#1575;&#1605;&#1740;! &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1588;&#1605;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604; &#1740;&#1575;&#1601;&#1578;."></asp:Label>
            <br />
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="FormLabel" Text="&#1705;&#1583; &#1578;&#1585;&#1575;&#1705;&#1606;&#1588;:"></asp:Label>
        <asp:Label ID="LabelSuccessfulCode" runat="server" CssClass="FormLabel"></asp:Label>
        <br />
            </div>
    </asp:Panel>
    <asp:Panel ID="PanelTransactionFailed" runat="server" Visible="False">
            <div dir="rtl">
        <asp:Image ID="Image3" runat="server" Height="22px" 
            ImageUrl="~/images/icons/delete16.png" Width="22px" />
        <asp:Label ID="Label5" runat="server" CssClass="ErrorMessage" 
            
                    Text="&#1705;&#1575;&#1585;&#1576;&#1585; &#1711;&#1585;&#1575;&#1605;&#1740;! &#1582;&#1591;&#1575;&#1740;&#1740; &#1583;&#1585; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1588;&#1605;&#1575; &#1585;&#1608;&#1740; &#1583;&#1575;&#1583;. &#1583;&#1585; &#1589;&#1608;&#1585;&#1578;&#1740; &#1705;&#1607; &#1576;&#1575;&#1606;&#1705; &#1605;&#1576;&#1604;&#1594; &#1585;&#1575; &#1575;&#1586; &#1581;&#1587;&#1575;&#1576; &#1588;&#1605;&#1575; &#1705;&#1587;&#1585; &#1705;&#1585;&#1583;&#1607; &#1576;&#1575;&#1588;&#1583; &#1608; &#1578;&#1575; 24 &#1587;&#1575;&#1593;&#1578; &#1576;&#1607; &#1581;&#1587;&#1575;&#1576; &#1588;&#1605;&#1575; &#1576;&#1575;&#1586;&#1606;&#1711;&#1588;&#1578;&#1607; &#1576;&#1608;&#1583; &#1576;&#1575; &#1705;&#1575;&#1585;&#1588;&#1606;&#1575;&#1587;&#1575;&#1606; &#1601;&#1606;&#1740; &#1605;&#1575; &#1576;&#1607; &#1570;&#1583;&#1585;&#1587; support@salestan.ir &#1605;&#1705;&#1575;&#1578;&#1576;&#1607; &#1606;&#1605;&#1608;&#1583;&#1607; &#1608; &#1705;&#1583; &#1578;&#1585;&#1575;&#1705;&#1606;&#1588; &#1585;&#1575; &#1576;&#1607; &#1575;&#1591;&#1604;&#1575;&#1593; &#1570;&#1606; &#1607;&#1575; &#1576;&#1585;&#1587;&#1575;&#1606;&#1740;&#1583;."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" CssClass="FormLabel" Text="&#1705;&#1583; &#1578;&#1585;&#1575;&#1705;&#1606;&#1588;:"></asp:Label>
                <asp:Label ID="LabelFailedCode" runat="server" CssClass="FormLabel"></asp:Label>
            </div>
            </asp:Panel>
         </div>
             </asp:Panel>
        <div class="ShowHidePanel1">
             <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/credit24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonCredit" runat="server" CssClass="MessageSender" onclick="LinkButtonCredit_Click" 
                 >&#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:LinkButton>
             <br />
             <asp:Panel ID="PanelCredit" runat="server" Visible="False" Width="100%">
                 <a class="NormalLink" id="about-credit" href="images/about/credit.png">(&#1578;&#1608;&#1590;&#1740;&#1581;)</a><br />
                 <table class="style1">
                     <tr>
                         <td class="style2">
                             <asp:Label ID="Label6" runat="server" CssClass="FormLabel" 
                                 Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1605;&#1608;&#1580;&#1608;&#1583;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelCredit" runat="server" CssClass="FormLabel" 
                                 Font-Bold="True"></asp:Label>
                             <asp:Label ID="Label19" runat="server" CssClass="FormLabel" 
                                 Text="&#1578;&#1608;&#1605;&#1575;&#1606;" Font-Bold="True"></asp:Label>
                         </td>
                         <td style="width:45px;">
                             &nbsp;</td>
                         <td>
                             <asp:Label ID="Label9" runat="server" CssClass="FormLabel" 
                                 Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelSpentCreadit" runat="server" CssClass="FormLabel"></asp:Label>
                             <asp:Label ID="Label23" runat="server" CssClass="FormLabel" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="Label7" runat="server" CssClass="FormLabel" 
                                 Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;:"></asp:Label>
                         </td>
                         <td class="style4">
                             <asp:Label ID="LabelGiftCredit" runat="server" CssClass="FormLabel" 
                                 Font-Bold="True"></asp:Label>
                             <asp:Label ID="Label20" runat="server" CssClass="FormLabel" 
                                 Text="&#1578;&#1608;&#1605;&#1575;&#1606;" Font-Bold="True"></asp:Label>
                         </td>
                         <td style="width:45px;">
                             &nbsp;</td>
                         <td class="style4">
                             <asp:Label ID="Label10" runat="server" CssClass="FormLabel" 
                                 Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                         </td>
                         <td class="style4">
                             <asp:Label ID="LabelSpendGift" runat="server" CssClass="FormLabel"></asp:Label>
                             <asp:Label ID="Label22" runat="server" CssClass="FormLabel" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                         </td>
                     </tr>
                 </table>
             </asp:Panel>
         </div>
         <div class="ShowHidePanel1">
             <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/add24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonAdd" runat="server" CssClass="MessageSender" 
                 onclick="LinkButtonAdd_Click" TabIndex="1" 
                 >&#1575;&#1590;&#1575;&#1601;&#1607; &#1606;&#1605;&#1608;&#1583;&#1606; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:LinkButton>
             <br />
             <asp:Panel ID="PanelAdd" runat="server" Visible="False" Width="100%">
             <br />
                 <table cellpadding="0" cellspacing="0" style="width: 810px">
		<tr>
			<td style="width: 160px; padding-right:25px;" valign="top">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr onmouseover="this.className='trHighlight'" onmouseout="this.className='trNormal'">
					<td style="height: 30px">
					<asp:LinkButton ID="LinkButtonAddOnline" runat="server" CssClass="MessageSender" 
                            onclick="LinkButtonAddOnline_Click" TabIndex="2">&#1662;&#1585;&#1583;&#1575;&#1582;&#1578; 
					&#1570;&#1606;&#1604;&#1575;&#1740;&#1606;</asp:LinkButton>
					</td>
				</tr>
				<tr onmouseover="this.className='trHighlight'" onmouseout="this.className='trNormal'">
					<td style="height: 30px">
					<asp:LinkButton ID="LinkButtonAddCard" runat="server" CssClass="MessageSender" 
                            onclick="LinkButtonAddCard_Click" TabIndex="3">&#1575;&#1606;&#1578;&#1602;&#1575;&#1604; 
					&#1705;&#1575;&#1585;&#1578; &#1576;&#1607; &#1705;&#1575;&#1585;&#1578;</asp:LinkButton>
					</td>
				</tr>
				<tr onmouseover="this.className='trHighlight'" onmouseout="this.className='trNormal'">
					<td style="height: 30px">
					<asp:LinkButton ID="LinkButtonAddAccount" runat="server" CssClass="MessageSender" 
                            onclick="LinkButtonAddAccount_Click" TabIndex="4">&#1608;&#1575;&#1585;&#1740;&#1586; 
					&#1576;&#1607; &#1581;&#1587;&#1575;&#1576; &#1576;&#1575;&#1606;&#1705;&#1740;</asp:LinkButton>
					</td>
				</tr>
			</table>
			</td>
			<td valign="top" style="padding-right:10px; padding-top:10px; background-color: #FAFAFA; width: 650px;">
                <asp:Panel ID="PanelAddOnline" runat="server" BackColor="#FAFAFA" Width="650px" 
                    Visible="false">
                    <div style="font-family: Tahoma; font-size: 12px;">&#1576;&#1575; &#1575;&#1587;&#1578;&#1601;&#1575;&#1583;&#1607; &#1575;&#1586; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604; &#1570;&#1606;&#1604;&#1575;&#1740;&#1606;&#1548; 
                        &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1605;&#1608;&#1585;&#1583; &#1606;&#1592;&#1585; &#1585;&#1575; &#1576;&#1604;&#1575;&#1601;&#1575;&#1589;&#1604;&#1607; &#1576;&#1607; &#1662;&#1606;&#1604; &#1582;&#1608;&#1583; &#1575;&#1606;&#1578;&#1601;&#1575;&#1604; &#1583;&#1607;&#1740;&#1583;. &#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1576;&#1575;&#1606;&#1705;&#1740; &#1588;&#1605;&#1575; &#1601;&#1602;&#1591; &#1583;&#1585; &#1589;&#1601;&#1581;&#1607; 
                        &#1575;&#1582;&#1578;&#1589;&#1575;&#1589;&#1740; &#1587;&#1575;&#1740;&#1578; &#1576;&#1575;&#1606;&#1705; &#1575;&#1606;&#1580;&#1575;&#1605; &#1583;&#1607;&#1606;&#1583;&#1607; &#1608;&#1575;&#1585;&#1583; &#1605;&#1740; &#1588;&#1608;&#1583; &#1608; &#1575;&#1605;&#1705;&#1575;&#1606; &#1607;&#1740;&#1670;&#1711;&#1608;&#1606;&#1607; &#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1607; &#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1576;&#1575;&#1606;&#1705;&#1740; 
                        &#1588;&#1605;&#1575; &#1578;&#1608;&#1587;&#1591; &#1588;&#1582;&#1589; &#1583;&#1740;&#1711;&#1585;&#1740; &#1608;&#1580;&#1608;&#1583; &#1606;&#1583;&#1575;&#1585;&#1583;.<br /> </div>
                    <br />
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelOnlineCredit" runat="server" 
                                Text="&#1605;&#1576;&#1604;&#1594; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578;&#1740;:" CssClass="FormLabel"
                                AssociatedControlID="TextBoxOnlineCredit"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxOnlineCredit" runat="server" CssClass="TextBoxRequiredL2R"
                                Width="75px" TabIndex="5"></asp:TextBox>
                            <asp:Label ID="Label12" runat="server" CssClass="FormValidation" 
                                Text="&#1585;&#1740;&#1575;&#1604;"></asp:Label>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorOnlineCredit" 
                                runat="server" ControlToValidate="TextBoxOnlineCredit" 
                                CssClass="FormValidation" ErrorMessage="&#1605;&#1576;&#1604;&#1594; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" 
                                ValidationGroup="Online"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelOnlineBank" runat="server" 
                                
                                
                                Text="&#1662;&#1575;&#1740;&#1575;&#1606;&#1607; &#1576;&#1575;&#1606;&#1705; &#1575;&#1606;&#1580;&#1575;&#1605; &#1583;&#1607;&#1606;&#1583;&#1607;:" CssClass="FormLabel"
                                AssociatedControlID="RadioButtonListOnlineBank"></asp:Label>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonListOnlineBank" runat="server">
                                            <asp:ListItem Text=" " Value=" Parsian" Selected="True">  </asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <asp:Image ID="Image28" runat="server" Height="24px" 
                                            ImageUrl="~/images/banks/ParsianLogo24.jpg" Width="24px" />
                                        <asp:Label ID="Label24" runat="server" CssClass="FormLabel" Text="&#1662;&#1575;&#1585;&#1587;&#1740;&#1575;&#1606;"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label25" runat="server" CssClass="DescriptionsText" 
                                
                                Text="* &#1588;&#1605;&#1575; &#1576;&#1575; &#1578;&#1605;&#1575;&#1605;&#1740; &#1705;&#1575;&#1585;&#1578; &#1607;&#1575;&#1740; &#1576;&#1575;&#1606;&#1705; &#1607;&#1575;&#1740; &#1593;&#1590;&#1608; &#1588;&#1578;&#1575;&#1576; &#1605;&#1740; &#1578;&#1608;&#1575;&#1606;&#1740;&#1583; &#1593;&#1605;&#1604; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1585;&#1575; &#1575;&#1606;&#1580;&#1575;&#1605; &#1583;&#1607;&#1740;&#1583;."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <Controls:Captcha ID="captchaOnline" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonOnline" runat="server" 
                                ImageUrl="~/images/Buttons/send-off.png" ValidationGroup="Online" 
                                onclick="ImageButtonOnline_Click" />
                            <asp:Label ID="LabelAddMinimum" runat="server" CssClass="ErrorMessage" 
                                Text="&#1605;&#1576;&#1604;&#1594; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578;&#1740; &#1605;&#1740; &#1576;&#1575;&#1740;&#1587;&#1578; &#1581;&#1583;&#1575;&#1602;&#1604; 1000 &#1585;&#1740;&#1575;&#1604; &#1576;&#1575;&#1588;&#1583;." Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel ID="PanelAddCard" runat="server" BackColor="#FAFAFA" Width="650px" 
                    Visible="False">
                 <div style="font-family: Tahoma; font-size: 12px;">&#1578;&#1608;&#1587;&#1591; &#1583;&#1587;&#1578;&#1711;&#1575;&#1607; &#1607;&#1575;&#1740; ATM &#1576;&#1575;&#1606;&#1705;&#1740; &#1605;&#1576;&#1604;&#1594; &#1605;&#1608;&#1585;&#1583; &#1606;&#1592;&#1585; &#1585;&#1575; &#1576;&#1607; &#1588;&#1605;&#1575;&#1585;&#1607; &#1705;&#1575;&#1585;&#1578; &#1586;&#1740;&#1585; 
                     &#1575;&#1606;&#1578;&#1602;&#1575;&#1604; &#1583;&#1607;&#1740;&#1583;:<br />
                     <br />
                     &#1588;&#1605;&#1575;&#1585;&#1607; &#1705;&#1575;&#1585;&#1578;: 3013-4698-0610-6221<br /> 
                     &#1589;&#1575;&#1581;&#1576; &#1705;&#1575;&#1585;&#1578;: &#1570;&#1602;&#1575;&#1740; &#1575;&#1601;&#1578;&#1582;&#1575;&#1585;&#1740;<br /> &#1576;&#1575;&#1606;&#1705; 
                     &#1589;&#1575;&#1583;&#1585;&#1705;&#1606;&#1606;&#1583;&#1607; &#1705;&#1575;&#1585;&#1578;: &#1576;&#1575;&#1606;&#1705; &#1662;&#1575;&#1585;&#1587;&#1740;&#1575;&#1606;<br /> <br /> </div>
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelCardDate" runat="server" 
                                
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604;:" CssClass="FormLabel"
                                AssociatedControlID="TextBoxCardDate"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCardDate" runat="server" CssClass="TextBoxRequiredL2R"
                                Width="125px" TabIndex="8" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="TextBoxCardDate" CssClass="FormValidation" 
                                ErrorMessage="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" ValidationGroup="Card"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelCardCredit" runat="server" 
                                
                                Text="&#1605;&#1576;&#1604;&#1594; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604;&#1740;:" CssClass="FormLabel"
                                AssociatedControlID="TextBoxCardCredit"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCardCredit" runat="server" CssClass="TextBoxRequiredL2R" 
                                Width="125px" TabIndex="9" MaxLength="20"></asp:TextBox>
                            <asp:Label ID="Label15" runat="server" CssClass="FormValidation" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBoxCardCredit" CssClass="FormValidation" 
                                
                                ErrorMessage="&#1605;&#1576;&#1604;&#1594; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" 
                                ValidationGroup="Card"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelCardNumber" runat="server" 
                                AssociatedControlID="TextBoxCardNumber" CssClass="FormLabel" 
                                Text="4 &#1585;&#1602;&#1605; &#1570;&#1582;&#1585; &#1705;&#1575;&#1585;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCardNumber" runat="server" CssClass="TextBoxRequiredL2R" 
                                Width="125px" TabIndex="10" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBoxCardNumber" CssClass="FormValidation" 
                                ErrorMessage="4 &#1585;&#1602;&#1605; &#1570;&#1582;&#1585; &#1705;&#1575;&#1585;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" ValidationGroup="Card"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelCardName" runat="server" 
                                AssociatedControlID="TextBoxCardName" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1589;&#1575;&#1581;&#1576; &#1705;&#1575;&#1585;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCardName" runat="server" CssClass="TextBoxRequiredR2L" 
                                TabIndex="13" Width="200px" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="TextBoxCardName" CssClass="FormValidation" 
                                ErrorMessage="&#1606;&#1575;&#1605; &#1589;&#1575;&#1581;&#1576; &#1705;&#1575;&#1585;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" ValidationGroup="Card"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <Controls:Captcha ID="captchaCard" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonCard" runat="server" 
                                ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonCard_Click" 
                                TabIndex="11" ValidationGroup="Card" />
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel ID="PanelAddAccount" runat="server" BackColor="#FAFAFA" 
                    Width="650px" Visible="False">
                    <div style="font-family: Tahoma; font-size: 12px;">&#1583;&#1585; &#1589;&#1608;&#1585;&#1578; &#1593;&#1583;&#1605; &#1575;&#1605;&#1705;&#1575;&#1606; &#1576;&#1607; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; 
                        &#1570;&#1606;&#1604;&#1575;&#1740;&#1606; &#1608; &#1740;&#1575; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604; &#1705;&#1575;&#1585;&#1578; &#1576;&#1607; &#1705;&#1575;&#1585;&#1578;&#1548; &#1588;&#1605;&#1575; &#1605;&#1740; &#1578;&#1608;&#1575;&#1606;&#1740;&#1583; &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1608;&#1575;&#1585;&#1740;&#1586; &#1576;&#1607; &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; 
                        &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1608;&#1583; &#1585;&#1575; &#1575;&#1601;&#1586;&#1575;&#1740;&#1588; &#1583;&#1607;&#1740;&#1583;.<br /> &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; &#1607;&#1575;&#1740; &#1605;&#1593;&#1578;&#1576;&#1585; &#1576;&#1585;&#1575;&#1740; &#1608;&#1575;&#1585;&#1740;&#1586; &#1576;&#1607; &#1588;&#1585;&#1581; &#1586;&#1740;&#1585; &#1605;&#1740; 
                        &#1576;&#1575;&#1588;&#1583;:<br />
                        <br />
                        &#1576;&#1575;&#1606;&#1705; &#1662;&#1575;&#1585;&#1587;&#1740;&#1575;&#1606; - &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; 2-13845-21-1036 - &#1576;&#1607; &#1606;&#1575;&#1605; &#1588;&#1585;&#1705;&#1578; &#1582;&#1583;&#1605;&#1575;&#1578; &#1585;&#1575;&#1740;&#1575;&#1606;&#1607; &#1575;&#1740; &#1607;&#1575;&#1605; 
                        &#1662;&#1585;&#1583;&#1575;&#1586;&#1588; &#1662;&#1575;&#1585;&#1587;&#1740;&#1575;&#1606;<br />
                        <br />
                        &#1576;&#1575;&#1606;&#1705; &#1587;&#1575;&#1605;&#1575;&#1606; - &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; 1-1397871-810-833 - &#1576;&#1607; &#1606;&#1575;&#1605; &#1588;&#1585;&#1705;&#1578; &#1582;&#1583;&#1605;&#1575;&#1578; &#1585;&#1575;&#1740;&#1575;&#1606;&#1607; &#1575;&#1740; &#1607;&#1575;&#1605; 
                        &#1662;&#1585;&#1583;&#1575;&#1586;&#1588; &#1662;&#1575;&#1585;&#1587;&#1740;&#1575;&#1606;<br /> <br /> </div>
                    <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelAccountDate" runat="server" 
                                AssociatedControlID="TextBoxAccountDate" CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1608;&#1575;&#1585;&#1740;&#1586;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxAccountDate" runat="server" CssClass="TextBoxRequiredL2R" 
                                Width="125px" TabIndex="12" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="TextBoxAccountDate" CssClass="FormValidation" 
                                ErrorMessage="&#1578;&#1575;&#1585;&#1740;&#1582; &#1608;&#1575;&#1585;&#1740;&#1586; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" ValidationGroup="Account"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="LabelAccountCredit" runat="server" AssociatedControlID="TextBoxAccountCredit" 
                                    CssClass="FormLabel" 
                                    Text="&#1605;&#1576;&#1604;&#1594; &#1608;&#1575;&#1585;&#1740;&#1586;&#1740;:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxAccountCredit" runat="server" CssClass="TextBoxRequiredL2R" 
                                    Width="125px" TabIndex="13" MaxLength="20"></asp:TextBox>
                                <asp:Label ID="Label16" runat="server" CssClass="FormValidation" Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBoxAccountCredit" CssClass="FormValidation" 
                                    
                                    ErrorMessage="&#1605;&#1576;&#1604;&#1594; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" 
                                    ValidationGroup="Account"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelAccountAccount" runat="server" 
                                
                                
                                Text="&#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; &#1608;&#1575;&#1585;&#1740;&#1586;&#1740;:" CssClass="FormLabel"
                                AssociatedControlID="DropDownListAccountAccount"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListAccountAccount" runat="server" 
                                CssClass="DropDownRequiredR2L" TabIndex="14">
                                <asp:ListItem Value="&#1576;&#1575;&#1606;&#1705; &#1662;&#1575;&#1585;&#1587;&#1740;&#1575;&#1606; - &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; 2-13845-21-1036">&#1576;&#1575;&#1606;&#1705; &#1662;&#1575;&#1585;&#1587;&#1740;&#1575;&#1606; - &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; 2-13845-21-1036</asp:ListItem>
                                <asp:ListItem Value="&#1576;&#1575;&#1606;&#1705; &#1587;&#1575;&#1605;&#1575;&#1606; - &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; 1-1397871-810-833">&#1576;&#1575;&#1606;&#1705; &#1587;&#1575;&#1605;&#1575;&#1606; - &#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576; 1-1397871-810-833</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="LabelAccountAccount0" runat="server" 
                                    AssociatedControlID="TextBoxAccountName" CssClass="FormLabel" 
                                    Text="&#1606;&#1575;&#1605; &#1608;&#1575;&#1585;&#1740;&#1586; &#1705;&#1606;&#1606;&#1583;&#1607;:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxAccountName" runat="server" CssClass="TextBoxRequiredR2L" 
                                    TabIndex="13" Width="200px" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="TextBoxAccountName" CssClass="FormValidation" 
                                    ErrorMessage="&#1606;&#1575;&#1605; &#1608;&#1575;&#1585;&#1740;&#1586; &#1705;&#1606;&#1606;&#1583;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" ValidationGroup="Account"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <Controls:Captcha ID="captchaAccount" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButtonAccount" runat="server" 
                                    ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonAccount_Click" 
                                    TabIndex="15" ValidationGroup="Account" />
                            </td>
                        </tr>
                </table>
                </asp:Panel>
                <asp:Panel ID="PanelSuccess" runat="server" BackColor="#FAFAFA" 
                    Width="650px" Visible="False">
                        <asp:Image ID="Image26" runat="server" Height="22px" 
                            ImageUrl="~/images/icons/check22.png" Width="22px" />
                        <br />
                        <asp:Label ID="Label18" runat="server" CssClass="SuccessMessage" 
                            
                            
                            Text="&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1588;&#1605;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1575;&#1585;&#1587;&#1575;&#1604; &#1588;&#1583;. &#1705;&#1575;&#1585;&#1588;&#1606;&#1575;&#1587;&#1575;&#1606; &#1662;&#1588;&#1578;&#1740;&#1576;&#1575;&#1606;&#1740; &#1576;&#1575; &#1605;&#1591;&#1575;&#1576;&#1602;&#1578; &#1575;&#1591;&#1604;&#1575;&#1593;&#1575;&#1578; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1608;&#1583;&#1607; &#1578;&#1608;&#1587;&#1591; &#1588;&#1605;&#1575; &#1608; &#1575;&#1591;&#1604;&#1575;&#1593;&#1575;&#1578; &#1576;&#1575;&#1606;&#1705;&#1740;&#1548; &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1662;&#1606;&#1604; &#1576;&#1582;&#1588; &#1585;&#1608;&#1740;&#1583;&#1575;&#1583;&#1607;&#1575; &#1606;&#1578;&#1575;&#1740;&#1580; &#1585;&#1575; &#1583;&#1585; &#1575;&#1587;&#1585;&#1593; &#1608;&#1602;&#1578; &#1576;&#1607; &#1575;&#1591;&#1604;&#1575;&#1593; &#1588;&#1605;&#1575; &#1582;&#1608;&#1575;&#1607;&#1606;&#1583; &#1585;&#1587;&#1575;&#1606;&#1740;&#1583;. &#1576;&#1575; &#1578;&#1588;&#1705;&#1585;."></asp:Label>
                        <br />
                </asp:Panel>
            </td>
		</tr>
	</table>
             </asp:Panel>
         </div>
         <div class="ShowHidePanel1">
             <asp:Image ID="Image1" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/clock24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonLog" runat="server" CssClass="MessageSender" 
                 onclick="LinkButtonHistory_Click" TabIndex="16" 
                 >&#1587;&#1575;&#1576;&#1602;&#1607; &#1578;&#1585;&#1575;&#1705;&#1606;&#1588; &#1607;&#1575;</asp:LinkButton>
             <br />
             <asp:Panel ID="PanelLog" runat="server" Visible="False" Width="100%">
                 <br />
                 <asp:Label ID="LabelLogNoRecord" runat="server" CssClass="FormValidation" 
                     Text="&#1607;&#1740;&#1670; &#1587;&#1575;&#1576;&#1602;&#1607; &#1578;&#1585;&#1575;&#1705;&#1606;&#1588;&#1740; &#1576;&#1585;&#1575;&#1740; &#1588;&#1605;&#1575; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1579;&#1576;&#1578; &#1606;&#1588;&#1583;&#1607; &#1575;&#1587;&#1578;." Visible="False"></asp:Label>
                 <asp:GridView ID="GridViewCreditLog" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="900px" AllowSorting="True" 
                     DataSourceID="SqlDataSourceLog">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:ImageField DataImageUrlField="Type" 
                             DataImageUrlFormatString="~/images/CreditTypes/{0}.png" 
                             HeaderText="&#1606;&#1608;&#1593; &#1587;&#1575;&#1576;&#1602;&#1607;">
                             <ItemStyle HorizontalAlign="Right" Width="185px" />
                         </asp:ImageField>
                         <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582;" SortExpression="SubmitDate">
                            <ItemStyle Width="175px" />
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField HeaderText="&#1605;&#1576;&#1604;&#1594;" DataField="Credit">
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" Width="75px" />
                         </asp:BoundField>
                         <asp:BoundField HeaderText="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1602;&#1576;&#1604;" 
                             DataField="BeforeCredit">
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" Width="75px" />
                         </asp:BoundField>
                         <asp:BoundField HeaderText="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1576;&#1593;&#1583;" 
                             DataField="AfterCredit">
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" Width="75px" />
                         </asp:BoundField>
                         <asp:BoundField HeaderText="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578;" 
                             DataField="Text">
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle Width="315px" />
                         </asp:BoundField>
                     </Columns>
                     <EditRowStyle BackColor="#2461BF" />
                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#507CD1" CssClass="GridViewHeader" Font-Bold="True" 
                        ForeColor="White" />
                     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#EFF3FB" CssClass="GridViewText" />
                     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#F5F7FB" />
                     <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                     <SortedDescendingCellStyle BackColor="#E9EBEF" />
                     <SortedDescendingHeaderStyle BackColor="#4870BE" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSourceLog" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                     SelectCommand="sp_userCreditLog" SelectCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:SessionParameter Name="UserId" SessionField="UserId" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:Panel>
         </div>
         </asp:Panel>
        <asp:Panel ID="PanelNoAccess" runat="server" Visible="False" Width="100%">
        </asp:Panel>
   </div>
</asp:Content>

