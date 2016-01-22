<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewMessage.aspx.cs" Inherits="Pages_NewMessage" %>
<%@ Register src="../NumCaptcha.ascx" tagname="captcha" tagprefix="controls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

			* {
	margin: 0;
	padding: 0;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div dir="rtl" >
        <asp:Panel ID="PanelMessage" runat="server">
            <table style="width:100%;">
                <tr>
                <td style="width:100px; vertical-align:top;">
                    <asp:Label ID="LabelReceiver" runat="server" 
                        AssociatedControlID="DropDownListReceiver" CssClass="FormLabel" 
                        Text="ارسال به:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListReceiver" runat="server" 
                        CssClass="DropDownRequiredR2L" TabIndex="5" 
                        DataSourceID="SqlDataSourceReceivers" DataTextField="FriendName" 
                        DataValueField="FriendId">
                    </asp:DropDownList>
                    <asp:Label ID="LabelFriendsNoRecord" runat="server" CssClass="FormValidation" 
                        Text="فردی در فهرست دوستان شما وجود ندارد." Visible="False"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSourceReceivers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_messagesFriendsList" SelectCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="RecordId" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="UserId" SessionField="UserId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width:100px; vertical-align:top;">
                    <asp:Label ID="LabelMessage" runat="server" 
                        AssociatedControlID="TextBoxMessage" CssClass="FormLabel" 
                        Text="پیغام:"></asp:Label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout0" runat="server" 
                        ControlToValidate="TextBoxMessage" CssClass="FormValidation" 
                        ErrorMessage="پیغام را وارد نمایید." ValidationGroup="Send"></asp:RequiredFieldValidator>
                    <br />
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMessage" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        Height="150px" TextMode="MultiLine" Width="450px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:100px;">
                    &nbsp;</td>
                <td>
                    <controls:captcha ID="captcha" runat="server" CalcMode="1" />
                </td>
            </tr>
            <tr>
                <td style="width:100px;">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButtonSend" runat="server" 
                        ImageUrl="~/images/Buttons/send-off.png" ValidationGroup="Send" 
                        onclick="ImageButtonSend_Click" />
                </td>
            </tr>
        </table>
        </asp:Panel>
        <asp:Panel ID="PanelSent" runat="server" Visible="False">
            <asp:Image ID="ImageSent" runat="server" 
                        ImageUrl="~/images/icons/check22.png" Height="22px" Width="22px" />
            <asp:Label ID="LabelSent" runat="server" 
    CssClass="SuccessMessage" 
                        Text="پیغام شما با موفقیت ارسال گردید."></asp:Label>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
