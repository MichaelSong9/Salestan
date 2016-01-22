<%@ Page Title="Salestan : &#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        #preloader
        {
            width: 30px;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1" __designer:mapid="ef">
            <asp:Image ID="Image24" runat="server" 
                ImageUrl="~/images/icons/key24.gif" Height="24px" Width="24px" />
            <asp:LinkButton ID="LinkButtonPassword" runat="server" CssClass="MessageSender" onclick="LinkButtonPassword_Click" 
                >&#1578;&#1594;&#1740;&#1740;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585;</asp:LinkButton>
            <br __designer:mapid="f2" />
    <asp:Panel ID="PanelPassword" runat="server" Width="100%" Visible="False">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
            <ContentTemplate>
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelOld" runat="server" Text="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1601;&#1593;&#1604;&#1740;:" CssClass="FormLabel"
                                AssociatedControlID="TextBoxOld"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxOld" runat="server" CssClass="TextBoxRequiredL2R" TextMode="Password"
                                Width="125px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName0" runat="server"
                                ControlToValidate="TextBoxOld" CssClass="FormValidation" ErrorMessage="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1601;&#1593;&#1604;&#1740; &#1585;&#1575; &#1578;&#1575;&#1740;&#1662; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!"
                                ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelNew" runat="server" Text="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1580;&#1583;&#1740;&#1583;:" CssClass="FormLabel"
                                AssociatedControlID="TextBoxNew"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxNew" runat="server" CssClass="TextBoxRequiredL2R" TextMode="Password"
                                Width="125px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName1" runat="server"
                                ControlToValidate="TextBoxNew" CssClass="FormValidation" ErrorMessage="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1580;&#1583;&#1740;&#1583; &#1585;&#1575; &#1578;&#1575;&#1740;&#1662; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!"
                                ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelNew2" runat="server" Text="&#1578;&#1575;&#1740;&#1662; &#1583;&#1608;&#1576;&#1575;&#1585;&#1607;:" CssClass="FormLabel"
                                AssociatedControlID="TextBoxNew2"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxNew2" runat="server" CssClass="TextBoxRequiredL2R" TextMode="Password"
                                Width="125px"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxNew"
                                ControlToValidate="TextBoxNew2" CssClass="FormValidation" ErrorMessage="&#1578;&#1575;&#1740;&#1662; &#1583;&#1608;&#1576;&#1575;&#1585;&#1607; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1605;&#1740; &#1576;&#1575;&#1740;&#1587;&#1578; &#1576;&#1585;&#1575;&#1576;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1580;&#1583;&#1740;&#1583; &#1576;&#1575;&#1588;&#1583;!"
                                ValidationGroup="ChangePassword"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonChangePassword" runat="server" OnClick="ImageButtonChangePassword_Click"
                                ImageUrl="~/images/Buttons/save-off.png" 
                                ValidationGroup="ChangePassword" />
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                <ProgressTemplate>
                                    <img id="preloader" src="images/loading.gif" alt="" /></ProgressTemplate>
                            </asp:UpdateProgress>
                            <br />
                            <asp:Label ID="lblerror" runat="server" Visible="False" CssClass="ErrorMessage">&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1601;&#1593;&#1604;&#1740; &#1575;&#1588;&#1578;&#1576;&#1575;&#1607; &#1575;&#1587;&#1578;! &#1604;&#1591;&#1601;&#1575; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1589;&#1581;&#1740;&#1581; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;.</asp:Label>
                            <br />
                            <asp:Label ID="lblsuccess" runat="server" Visible="False" CssClass="SuccessMessage">&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1588;&#1605;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1578;&#1594;&#1740;&#1740;&#1585; &#1583;&#1575;&#1583;&#1607; &#1588;&#1583;!</asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
        </div>
<div class="ShowHidePanel1">
            <asp:Image ID="Image1" runat="server" 
                ImageUrl="~/images/icons/paperplane24.png" Height="24px" Width="24px" />
            <asp:LinkButton ID="LinkButtonCommunications" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonCommunications_Click" 
                >&#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740;</asp:LinkButton>
            <br />
    <asp:Panel ID="PanelCommunications" runat="server" Width="100%" Visible="False">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="True">
            <ContentTemplate>
                <table class="style1">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="&#1578;&#1604;&#1601;&#1606; &#1607;&#1605;&#1585;&#1575;&#1607;:" CssClass="FormLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelCommunicationsMobile" runat="server" AssociatedControlID="TextBoxNew" 
                                CssClass="FormLabel"></asp:Label>
                            &nbsp;<asp:HyperLink ID="HyperLink19" runat="server" CssClass="NormalLink" 
                                NavigateUrl="~/Profile.aspx">(&#1578;&#1594;&#1740;&#1740;&#1585; &#1588;&#1605;&#1575;&#1585;&#1607; &#1583;&#1585; &#1602;&#1587;&#1605;&#1578; &#1605;&#1588;&#1582;&#1589;&#1575;&#1578;)</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;:" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelCommunicationsEmail" runat="server" AssociatedControlID="TextBoxNew" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="width: 100%">
	                            <tr>
		                            <td>&nbsp;</td>
		                            <td class="auto-style1" style="width: 10%">
                                        <asp:Image ID="Image26" runat="server" Height="24px" 
                                            ImageUrl="~/images/icons/cellphone24.png" Width="24px" 
                                            ToolTip="&#1578;&#1604;&#1601;&#1606; &#1607;&#1605;&#1585;&#1575;&#1607;" 
                                            Visible="False" />
                                    </td>
		                            <td class="auto-style1" style="width: 10%">
                                        <asp:Image ID="Image27" runat="server" Height="24px" 
                                            ImageUrl="~/images/icons/messages24.png" Width="24px" 
                                            ToolTip="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;" />
                                    </td>
	                            </tr>
	                            <tr>
		                            <td>
                                        <asp:Label ID="Label10" runat="server" CssClass="FormLabel" 
                                            Text="&#1575;&#1591;&#1604;&#1575;&#1593; &#1575;&#1586; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607; &#1580;&#1583;&#1740;&#1583; &#1583;&#1585; &#1607;&#1606;&#1711;&#1575;&#1605; &#1602;&#1585;&#1575;&#1585;&#1711;&#1740;&#1585;&#1740; &#1583;&#1585; &#1587;&#1575;&#1740;&#1578;"></asp:Label>
                                    </td>
		                            <td class="auto-style1" style="width: 10%">
                                        &nbsp;</td>
		                            <td class="auto-style1" style="width: 10%">
                                        <asp:CheckBox ID="CheckBoxCommunicationsOffersNewEmail" runat="server" 
                                            Text=" " />
                                    </td>
	                            </tr>
	                            <tr>
		                            <td>
                                        <asp:Label ID="Label11" runat="server" CssClass="FormLabel" 
                                            Text="&#1578;&#1594;&#1740;&#1740;&#1585;&#1575;&#1578; &#1583;&#1585; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;"></asp:Label>
                                    </td>
		                            <td class="auto-style1" style="width: 10%">
                                        &nbsp;</td>
		                            <td class="auto-style1" style="width: 10%">
                                        <asp:CheckBox ID="CheckBoxCommunicationsCreditEmail" runat="server" Text=" " />
                                    </td>
	                            </tr>
	                            <tr>
		                            <td>
                                        <asp:Label ID="Label12" runat="server" CssClass="FormLabel" 
                                            Text="&#1575;&#1585;&#1587;&#1575;&#1604; &#1705;&#1583; &#1582;&#1585;&#1740;&#1583; &#1662;&#1587; &#1575;&#1586; &#1582;&#1585;&#1740;&#1583; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;"></asp:Label>
                                    </td>
		                            <td class="auto-style1" style="width: 10%">
                                        &nbsp;</td>
		                            <td class="auto-style1" style="width: 10%">
                                        <asp:CheckBox ID="CheckBoxCommunicationsOffersPurchaseEmail" runat="server" 
                                            Text=" " />
                                    </td>
	                            </tr>
	                            <tr>
		                            <td>
                                        <asp:Label ID="Label13" runat="server" CssClass="FormLabel" 
                                            Text="&#1575;&#1582;&#1576;&#1575;&#1585; &#1608; &#1578;&#1594;&#1740;&#1740;&#1585;&#1575;&#1578; &#1587;&#1575;&#1740;&#1578;"></asp:Label>
                                    </td>
		                            <td class="auto-style1" style="width: 10%">
                                        &nbsp;</td>
		                            <td class="auto-style1" style="width: 10%">
                                        <asp:CheckBox ID="CheckBoxCommunicationsUpdatesEmail" runat="server" Text=" " />
                                    </td>
	                            </tr>
	                            <tr>
		                            <td>
                                        <asp:Label ID="Label14" runat="server" CssClass="FormLabel" 
                                            Text="&#1575;&#1591;&#1604;&#1575;&#1593; &#1575;&#1586; &#1605;&#1608;&#1585;&#1583; &#1580;&#1583;&#1740;&#1583; &#1583;&#1585; &#1576;&#1582;&#1588; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1607;&#1575;"></asp:Label>
                                    </td>
		                            <td class="auto-style1" style="width: 10%">
                                        &nbsp;</td>
		                            <td class="auto-style1" style="width: 10%">
                                        <asp:CheckBox ID="CheckBoxCommunicationsRequestsEmail" runat="server" 
                                            Text=" " />
                                    </td>
	                            </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" CssClass="FormLabel" 
                                            Text="&#1575;&#1591;&#1604;&#1575;&#1593; &#1575;&#1586; &#1605;&#1608;&#1585;&#1583; &#1580;&#1583;&#1740;&#1583; &#1583;&#1585; &#1576;&#1582;&#1588; &#1585;&#1608;&#1740;&#1583;&#1575;&#1583;&#1607;&#1575;"></asp:Label>
                                    </td>
                                    <td class="auto-style1" style="width: 10%">
                                        &nbsp;</td>
                                    <td class="auto-style1" style="width: 10%">
                                        <asp:CheckBox ID="CheckBoxCommunicationsEventsEmail" runat="server" Text=" " />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left;">
                                        <asp:Image ID="ImageCommunicationsChanged" runat="server" Height="22px" 
                                            ImageUrl="~/images/icons/check22.png" Width="22px" />
                                        <asp:Label ID="LabelCommunicationsChanged" runat="server" 
                                            CssClass="SuccessMessage" Visible="False">&#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1578;&#1594;&#1740;&#1740;&#1585; &#1740;&#1575;&#1601;&#1578;&#1606;&#1583;.</asp:Label>
                                    </td>
                                    <td colspan="2" class="auto-style1" style="width: 10%">
                                        <asp:ImageButton ID="ImageButtonChangeCommunications" runat="server" 
                                            ImageUrl="~/images/Buttons/save-off.png" 
                                            OnClick="ImageButtonChangeCommunications_Click" 
                                            ValidationGroup="ChangePassword" />
                                    </td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
        </div>
    &nbsp;<div style="text-align: right;">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </div>
    </div>
</asp:Content>
