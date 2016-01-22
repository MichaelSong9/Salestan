<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminSettings.aspx.cs" Inherits="AdminSettings" %>

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
        </style>
	<script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#change-styles").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe',
	            'width': '7',
	            'height': '6'
	        });
	    });
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/settings32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578;"></asp:Label>
        <br />
        <br />
                <div class="ShowHidePanel1">
                    <asp:Image ID="Image33" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/information24.png" Width="24px" />
                    <asp:LinkButton ID="LinkButtonInformation" runat="server" 
                        CssClass="MessageSender" onclick="LinkButtonInformation_Click" 
                 >&#1605;&#1588;&#1582;&#1589;&#1575;&#1578;</asp:LinkButton>
                    <asp:Panel ID="PanelInformation" runat="server" Visible="False" Width="100%">
                        <br />
                        <table class="style1" style="direction:rtl;">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelLanguage0" runat="server" 
                                        AssociatedControlID="TextBoxSiteName" CssClass="FormLabel" 
                                        Text="&#1606;&#1575;&#1605; &#1587;&#1575;&#1740;&#1578;:"></asp:Label>
                                </td>
                                <td>
                                            <asp:TextBox ID="TextBoxSiteName" runat="server" CssClass="TextBoxRequiredR2L" 
                                                Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout0" runat="server" 
                                                ControlToValidate="TextBoxSiteName" CssClass="FormValidation" 
                                                ErrorMessage="&#1608;&#1740;&#1688;&#1711;&#1740; &#1607;&#1575; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Information"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelLanguage1" runat="server" 
                                        AssociatedControlID="TextBoxSiteUrl" CssClass="FormLabel" Text="&#1606;&#1588;&#1575;&#1606;&#1740; &#1587;&#1575;&#1740;&#1578;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxSiteUrl" runat="server" CssClass="TextBoxRequiredL2R" 
                                        Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout1" runat="server" 
                                        ControlToValidate="TextBoxSiteUrl" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1587;&#1575;&#1740;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Information"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="TextBoxSiteUrl" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1587;&#1575;&#1740;&#1578; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Information"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="style2">
                                    <asp:Label ID="Label1" runat="server" 
                                        AssociatedControlID="TextBoxDefaultTitle" CssClass="FormLabel" 
                                        
                                        Text="&#1593;&#1606;&#1608;&#1575;&#1606; &#1589;&#1601;&#1581;&#1607; &#1575;&#1589;&#1604;&#1740;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxDefaultTitle" runat="server" CssClass="TextBoxRequiredR2L" 
                                        Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBoxDefaultTitle" CssClass="FormValidation" 
                                        ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1589;&#1601;&#1581;&#1607; &#1575;&#1589;&#1604;&#1740; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                        ValidationGroup="Information"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelLanguage2" runat="server" 
                                        AssociatedControlID="TextBoxSocialFacebook" CssClass="FormLabel" 
                                        Text="Facebook:"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxSocialFacebook" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                    &nbsp;<asp:TextBox ID="TextBoxSocialFacebook" runat="server" CssClass="TextBoxL2R" 
                                        Width="350px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="TextBoxSocialFacebook" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Information"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelLanguage3" runat="server" 
                                        AssociatedControlID="TextBoxSocialTwitter" CssClass="FormLabel" Text="Twitter:"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxSocialTwitter" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                    &nbsp;<asp:TextBox ID="TextBoxSocialTwitter" runat="server" CssClass="TextBoxL2R" 
                                        Width="350px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                        ControlToValidate="TextBoxSocialTwitter" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Information"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelLanguage4" runat="server" 
                                        AssociatedControlID="TextBoxSocialYoutube" CssClass="FormLabel" Text="YouTube:"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxSocialYoutube" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                    &nbsp;<asp:TextBox ID="TextBoxSocialYoutube" runat="server" CssClass="TextBoxL2R" 
                                        Width="350px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                        ControlToValidate="TextBoxSocialYoutube" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Information"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonInformation" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Information" 
                                        onclick="ImageButtonInformation_Click" />
                                    <asp:Label ID="LabelInformationMessage" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
    </div>
    <div style=" direction:rtl;">
    <div class="ShowHidePanel1">
                    <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/unlock24.png" Width="24px" />
                    <asp:LinkButton ID="LinkButtonAccess" runat="server" CssClass="MessageSender" onclick="LinkButtonAccess_Click" 
                 >&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1607;&#1575;</asp:LinkButton>
                    <asp:Panel ID="PanelAccess" runat="server" Visible="False" Width="100%">
                        <br />
                        <table class="style1" style="direction:rtl;">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelLanguage" runat="server" CssClass="FormLabel" 
                                        Text="&#1587;&#1575;&#1740;&#1578;:"></asp:Label>
                                </td>
                                <td>
                                            <asp:RadioButtonList ID="RadioButtonListAccessGeneral" runat="server" CssClass="FormLabel" 
                                                RepeatDirection="Horizontal" AutoPostBack="True" 
                                                onselectedindexchanged="RadioButtonListAccessGeneral_SelectedIndexChanged">
                                                <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                                <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                                <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                                <asp:ListItem Value="3">&#1601;&#1602;&#1591; &#1575;&#1593;&#1590;&#1575;</asp:ListItem>
                                                <asp:ListItem Value="4">&#1601;&#1602;&#1591; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                            </asp:RadioButtonList>
                                </td>
                                <td>
                                            <asp:TextBox ID="TextBoxAccessGeneralPassword" runat="server" MaxLength="8" 
                                                Visible="False" CssClass="TextBoxL2R" Width="100px"></asp:TextBox>
                                            <asp:ImageButton ID="ImageButtonAccessGeneralPassword" runat="server" 
                                                ImageUrl="~/images/icons/submit22.png" Visible="False" Width="22px" 
                                                onclick="ImageButtonAccessGeneralPassword_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelAbout" runat="server" CssClass="FormLabel" 
                                        
                                        Text="&#1662;&#1576;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListAccessOffers" runat="server" CssClass="FormLabel" 
                                        RepeatDirection="Horizontal" AutoPostBack="True" 
                                        onselectedindexchanged="RadioButtonListAccessOffers_SelectedIndexChanged">
                                        <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                        <asp:ListItem Value="3">&#1601;&#1602;&#1591; &#1575;&#1593;&#1590;&#1575;</asp:ListItem>
                                        <asp:ListItem Value="4">&#1601;&#1602;&#1591; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAccessOffersPassword" runat="server" MaxLength="8" 
                                        Visible="False" CssClass="TextBoxL2R" Width="100px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAccessOffersPassword" runat="server" 
                                        ImageUrl="~/images/icons/submit22.png" Visible="False" Width="22px" 
                                        onclick="ImageButtonAccessOffersPassword_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelAbout0" runat="server" CssClass="FormLabel" Text="&#1705;&#1608;&#1662;&#1606; &#1607;&#1575;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListAccessCoupons" runat="server" 
                                        AutoPostBack="True" CssClass="FormLabel" 
                                        RepeatDirection="Horizontal" 
                                        onselectedindexchanged="RadioButtonListAccessCoupons_SelectedIndexChanged">
                                        <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                        <asp:ListItem Value="3">&#1601;&#1602;&#1591; &#1575;&#1593;&#1590;&#1575;</asp:ListItem>
                                        <asp:ListItem Value="4">&#1601;&#1602;&#1591; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAccessCouponsPassword" runat="server" 
                                        CssClass="TextBoxL2R" MaxLength="8" Visible="False" Width="100px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAccessCouponsPassword" runat="server" 
                                        ImageUrl="~/images/icons/submit22.png" 
                                        Visible="False" Width="22px" 
                                        onclick="ImageButtonAccessCouponsPassword_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelSuggestions" runat="server" CssClass="FormLabel" 
                                        
                                        Text="&#1582;&#1740;&#1585;&#1740;&#1607;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListAccessCharity" runat="server" CssClass="FormLabel" 
                                        RepeatDirection="Horizontal" AutoPostBack="True" 
                                        onselectedindexchanged="RadioButtonListAccessCharity_SelectedIndexChanged">
                                        <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                        <asp:ListItem Value="3">&#1601;&#1602;&#1591; &#1575;&#1593;&#1590;&#1575;</asp:ListItem>
                                        <asp:ListItem Value="4">&#1601;&#1602;&#1591; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAccessCharityPassword" runat="server" MaxLength="8" 
                                        Visible="False" CssClass="TextBoxL2R" Width="100px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAccessCharityPassword" runat="server" 
                                        ImageUrl="~/images/icons/submit22.png" Visible="False" Width="22px" 
                                        onclick="ImageButtonAccessCharityPassword_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelContact" runat="server" CssClass="FormLabel" 
                                        
                                        Text="&#1579;&#1576;&#1578; &#1606;&#1575;&#1605;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListAccessRegister" runat="server" CssClass="FormLabel" 
                                        RepeatDirection="Horizontal" AutoPostBack="True" 
                                        onselectedindexchanged="RadioButtonListAccessRegister_SelectedIndexChanged">
                                        <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAccessRegisterPassword" runat="server" MaxLength="8" 
                                        Visible="False" CssClass="TextBoxL2R" Width="100px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAccessRegisterPassword" runat="server" 
                                        ImageUrl="~/images/icons/submit22.png" Visible="False" Width="22px" 
                                        onclick="ImageButtonAccessRegisterPassword_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelRules" runat="server" CssClass="FormLabel" 
                                        
                                        
                                        Text="&#1608;&#1585;&#1608;&#1583; &#1576;&#1607; &#1587;&#1740;&#1587;&#1578;&#1605;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListAccessLogin" runat="server" CssClass="FormLabel" 
                                        RepeatDirection="Horizontal" AutoPostBack="True" 
                                        onselectedindexchanged="RadioButtonListAccessLogin_SelectedIndexChanged">
                                        <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                        <asp:ListItem Value="4">&#1601;&#1602;&#1591; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAccessLoginPassword" runat="server" MaxLength="8" 
                                        Visible="False" CssClass="TextBoxL2R" Width="100px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAccessLoginPassword" runat="server" 
                                        ImageUrl="~/images/icons/submit22.png" Visible="False" Width="22px" 
                                        onclick="ImageButtonAccessLoginPassword_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelPrivacy" runat="server" CssClass="FormLabel" 
                                        
                                        
                                        Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;:"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListAccessCredit" runat="server" CssClass="FormLabel" 
                                        RepeatDirection="Horizontal" AutoPostBack="True" 
                                        onselectedindexchanged="RadioButtonListAccessCredit_SelectedIndexChanged">
                                        <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                        <asp:ListItem Value="3">&#1601;&#1602;&#1591; &#1575;&#1593;&#1590;&#1575;</asp:ListItem>
                                        <asp:ListItem Value="4">&#1601;&#1602;&#1591; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAccessCreditPassword" runat="server" MaxLength="8" 
                                        Visible="False" CssClass="TextBoxL2R" Width="100px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAccessCreditPassword" runat="server" 
                                        ImageUrl="~/images/icons/submit22.png" Visible="False" Width="22px" 
                                        onclick="ImageButtonAccessCreditPassword_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <asp:Label ID="LabelPrivacy0" runat="server" CssClass="FormLabel" 
                                        Text="&#1582;&#1585;&#1740;&#1583;:"></asp:Label>
                                </td>
                                <td class="style6">
                                    <asp:RadioButtonList ID="RadioButtonListAccessPurchase" runat="server" CssClass="FormLabel" 
                                        RepeatDirection="Horizontal" AutoPostBack="True" 
                                        onselectedindexchanged="RadioButtonListAccessPurchase_SelectedIndexChanged">
                                        <asp:ListItem Value="1">&#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                        <asp:ListItem Value="2">&#1583;&#1587;&#1578;&#1585;&#1587;&#1740; &#1576;&#1575; &#1585;&#1605;&#1586;</asp:ListItem>
                                        <asp:ListItem Value="4">&#1601;&#1602;&#1591; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="TextBoxAccessPurchasePassword" runat="server" MaxLength="8" 
                                        Visible="False" CssClass="TextBoxL2R" Width="100px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAccessPurchasePassword" runat="server" 
                                        ImageUrl="~/images/icons/submit22.png" Visible="False" Width="22px" 
                                        onclick="ImageButtonAccessPurchasePassword_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image3" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/appearance24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonAppearance" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonAppearance_Click"
                 >&#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578; &#1592;&#1575;&#1607;&#1585;&#1740;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelAppearance" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="LabelLogo" runat="server" CssClass="FormLabel" 
                                Text="&#1604;&#1608;&#1711;&#1608;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="ImageLogo" runat="server" ImageUrl="~/images/logomain.png" />
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUploadLogo" runat="server" />
                            <br />
                            <asp:ImageButton ID="ImageButtonLogo" runat="server" 
                                ImageUrl="~/images/Buttons/save-off.png" onclick="ImageButtonLogo_Click" />
                            <asp:Label ID="LabelMessageLogo" runat="server"></asp:Label>
                            <br />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="LabelBackground" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1662;&#1587; &#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="ImageBackground" runat="server" 
                                ImageUrl="~/images/background/background.png" />
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUploadBackground" runat="server" />
                            <br />
                            <asp:ImageButton ID="ImageButtonBackground" runat="server" 
                                ImageUrl="~/images/Buttons/save-off.png" 
                                onclick="ImageButtonBackground_Click" />
                            <asp:Label ID="LabelMessageBackground" runat="server"></asp:Label>
                            <br />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="LabelTop" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1606;&#1608;&#1575;&#1585; &#1576;&#1575;&#1604;&#1575;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="ImageTop" runat="server" ImageUrl="~/images/top.png" />
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUploadTop" runat="server" />
                            <br />
                            <asp:ImageButton ID="ImageButtonTop" runat="server" 
                                ImageUrl="~/images/Buttons/save-off.png" onclick="ImageButtonTop_Click" />
                            <asp:Label ID="LabelMessageTop" runat="server"></asp:Label>
                            <br />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="LabelBottom" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1606;&#1608;&#1575;&#1585; &#1662;&#1575;&#1740;&#1740;&#1606;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Image ID="ImageBottom" runat="server" ImageUrl="~/images/bottom.png" />
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUploadBottom" runat="server" />
                            <br />
                            <asp:ImageButton ID="ImageButtonBottom" runat="server" 
                                ImageUrl="~/images/Buttons/save-off.png" 
                                onclick="ImageButtonBottom_Click" />
                            <asp:Label ID="LabelMessageBottom" runat="server"></asp:Label>
                            <br />
                            &nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" valign="top">
                            <asp:Label ID="LabelStyles" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1601;&#1575;&#1740;&#1604; &#1575;&#1587;&#1578;&#1575;&#1740;&#1604; &#1607;&#1575;:"></asp:Label>
                        </td>
                        <td>
                         <a class="NormalLink" id="change-styles" href="AdminPages/Settings.aspx?Mode=Styles">&#1578;&#1594;&#1740;&#1740;&#1585; &#1601;&#1575;&#1740;&#1604;</a>
                         </td>
                    </tr>
                    <tr>
                        <td class="style2" valign="top">
                            &nbsp;</td>
                        <td style="text-align:left;">
                            <asp:Image ID="Image32" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/back16.png" />
                            <asp:LinkButton ID="LinkButtonDefault" runat="server" CssClass="NormalLink" 
                                onclick="LinkButtonDefault_Click">&#1576;&#1575;&#1586;&#1711;&#1588;&#1578; &#1576;&#1607; &#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578; &#1662;&#1740;&#1588; &#1601;&#1585;&#1590;</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    </ContentTemplate>
</asp:Content>

