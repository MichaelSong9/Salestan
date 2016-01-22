<%@ Page Title="&#1608;&#1585;&#1608;&#1583; &#1705;&#1575;&#1585;&#1576;&#1585; | &#1579;&#1576;&#1578; &#1606;&#1575;&#1605;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

	.Controls
	{
    border-width:2px;
    border-color:#CCCC00;
    border-style:solid;
    font-family:Arial;
    font-size:16px;
    font-weight:bold;
    color:#003005;
    direction:ltr;
    text-align:left;
	}
			* {
	margin: 0;
	padding: 0;
}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <div dir=rtl>
<table style="width: 100%;">
						<tr>
							<td style="width: 50%; vertical-align:top;">
                                <div class="description">
									<table style="width: 100%">
										<tr>
											<td>
											<table style="width: 100%">
												<tr>
													<td style="width: 150px; vertical-align:top">
        <asp:Image ID="Image2" runat="server" Height="170px" 
                ImageUrl="~/images/home/loginImage.png" Width="150px" />
                                    				</td>
													<td>
                                    <table>
                                        <tr>
                                            <td>
                    <asp:Label ID="LabelLoginEmail" runat="server" 
                        AssociatedControlID="TextBoxLoginEmail" CssClass="FormLabel" 
                        Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;:"></asp:Label>
                                            </td>
                                            <td>
                    <asp:TextBox ID="TextBoxLoginEmail" runat="server" CssClass="TextBoxL2R" 
                        TabIndex="1" Width="150px" Height="25px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLoginEmail" 
                    runat="server" ControlToValidate="TextBoxLoginEmail" CssClass="FormValidation" 
                    ErrorMessage="*" 
                    ValidationGroup="Login"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                    <asp:Label ID="Label5" runat="server" 
                        AssociatedControlID="TextBoxLoginPassword" CssClass="FormLabel" 
                        Text="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585;:"></asp:Label>
                                            </td>
                                            <td>
                    <asp:TextBox ID="TextBoxLoginPassword" runat="server" CssClass="TextBoxL2R" 
                        TabIndex="2" TextMode="Password" Width="150px" Height="25px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLoginPassword" 
                    runat="server" ControlToValidate="TextBoxLoginPassword" 
                    CssClass="FormValidation" ErrorMessage="*" 
                    ValidationGroup="Login"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                <asp:CheckBox ID="CheckBoxLoginRemember" runat="server" CssClass="FormLabel" 
                    TabIndex="3" 
                    Text="&#1605;&#1585;&#1575; &#1576;&#1607; &#1582;&#1575;&#1591;&#1585; &#1576;&#1587;&#1662;&#1575;&#1585;" />
                							</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                <asp:ImageButton ID="ImageButtonLogin" runat="server" 
                    ImageUrl="~/images/Buttons/login-off.png"
                    TabIndex="4" ValidationGroup="Login" onclick="ImageButtonLogin_Click" />
            								</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
            <a ID="top-forgot-password" class="NormalLink" href="ForgotPassword.aspx" 
                >&#1705;&#1604;&#1605;&#1607; 
            &#1593;&#1576;&#1608;&#1585; &#1585;&#1575; &#1601;&#1585;&#1575;&#1605;&#1608;&#1588; &#1606;&#1605;&#1608;&#1583;&#1607; &#1575;&#1740;&#1583;&#1567;</a><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorogin" runat="server"
                ControlToValidate="TextBoxLoginEmail" CssClass="FormValidation" ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;."
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="Login"></asp:RegularExpressionValidator>
                                    <br />
            <asp:Label ID="LabelLoginError" runat="server" Visible="False" CssClass="FormValidation"
                Font-Bold="False">&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&nbsp;&#1740;&#1575; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1608;&#1575;&#1585;&#1583; &#1588;&#1583;&#1607; &#1575;&#1588;&#1578;&#1576;&#1575;&#1607; &#1575;&#1587;&#1578;!</asp:Label>
                                			</td>
                                        </tr>
                                    </table>
                									</td>
												</tr>
											</table>
											</td>
										</tr>
										</table>
                                </div>
                            </td>
							<td style="width: 50%; vertical-align:top;">
                                <div class="description">
<table style="width: 100%">
												<tr>
													<td style="width: 150px; vertical-align:top">
        <asp:Image ID="Image3" runat="server" Height="170px" 
                ImageUrl="~/images/home/registerImage.png" Width="150px" />
                                    				</td>
													<td style=" vertical-align:top;">
                                    <table>
                                        <tr>
                                            <td>
                    						<span class="TopText">
            <asp:Label ID="LabelLoginEmail0" runat="server" 
                AssociatedControlID="TextBoxEmail" CssClass="FormLabel" 
                
                Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;:"></asp:Label>
           
            </span>
                                            </td>
                                            <td>
                    						<span class="TopText">
            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="TextBoxL2R" Height="25px" 
                Width="150px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegister" runat="server" 
                ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                
                ErrorMessage="*" 
                ValidationGroup="Enter"></asp:RequiredFieldValidator>
           
            </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                							<span class="TopText">
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorRegister" 
                runat="server" ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="Enter"></asp:RegularExpressionValidator>
           
            								<br />
            <asp:Label ID="LabelEmailError" runat="server" Font-Bold="False" 
                Visible="False" CssClass="ErrorMessage"> &#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1608;&#1575;&#1585;&#1583; &#1588;&#1583;&#1607; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1608;&#1580;&#1608;&#1583; &#1583;&#1575;&#1585;&#1583;!</asp:Label>
           
            </span>
                							</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                							<span class="TopText">
                <asp:ImageButton ID="ImageButtonRegister" runat="server" 
                    ImageUrl="~/images/Buttons/register-off.png" 
                    ValidationGroup="Enter" onclick="ImageButtonRegister_Click" />
           
            </span>
            								</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                <asp:Image ID="ImageRegisterSuccessful" runat="server" ImageUrl="~/images/icons/check22.png" 
                    Visible="false" />
                <asp:Label ID="LabelRegisterSent" runat="server" Font-Bold="False" 
                    
                    Text=" &#1604;&#1740;&#1606;&#1705; &#1601;&#1593;&#1575;&#1604; &#1587;&#1575;&#1586;&#1740; &#1579;&#1576;&#1578; &#1606;&#1575;&#1605; &#1583;&#1585; &#1587;&#1575;&#1740;&#1578; &#1576;&#1607; &#1575;&#1740;&#1605;&#1740;&#1604; &#1588;&#1605;&#1575; &#1601;&#1585;&#1587;&#1578;&#1575;&#1583;&#1607; &#1588;&#1583;. &#1583;&#1585; &#1589;&#1608;&#1585;&#1578;&#1740; &#1705;&#1607; &#1575;&#1740;&#1605;&#1740;&#1604; &#1583;&#1585; Inbox &#1588;&#1605;&#1575; &#1605;&#1608;&#1580;&#1608;&#1583; &#1606;&#1576;&#1608;&#1583; &#1604;&#1591;&#1601;&#1575;&#1611; &#1601;&#1608;&#1604;&#1583;&#1585; Spam &#1585;&#1575; &#1606;&#1740;&#1586; &#1605;&#1588;&#1575;&#1607;&#1583;&#1607; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" 
                    Visible="False" CssClass="SuccessMessage"></asp:Label>
                                			</td>
                                        </tr>
                                    </table>
                									</td>
												</tr>
											</table>

                                </div>
                            </td>
						</tr>
					</table>
    </div>
     </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

