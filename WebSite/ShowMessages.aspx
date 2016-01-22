<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowMessages.aspx.cs" Inherits="ShowMessages" %>

<%@ Register src="NumCaptcha.ascx" tagname="captcha" tagprefix="controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Panel ID="PanelMessage" runat="server">
            <table style="width:100%;">
            <tr>
                <td style="text-align:center;">
                    <asp:TextBox ID="TextBoxMessage" runat="server" CssClass="TextBoxMultiR2L" 
                        Height="32px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout0" runat="server" 
                        ControlToValidate="TextBoxMessage" CssClass="FormValidation" ErrorMessage="*" 
                        ValidationGroup="Send"></asp:RequiredFieldValidator>
                    <asp:ImageButton ID="ImageButtonSend" runat="server" 
                        ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonSend_Click" 
                        ValidationGroup="Send" />
                </td>
            </tr>
        </table>
        </asp:Panel>
&nbsp;<asp:GridView ID="GridViewMessages" runat="server" DataSourceID="SqlDataSourceMessages" 
                          AutoGenerateColumns="False" DataKeyNames="MessageId" BorderStyle="None" 
                        GridLines="None" ShowHeader="False" Width="950px" 
        ondatabound="GridViewMessages_DataBound"  >
        <Columns>
            <asp:TemplateField ShowHeader="False" ItemStyle-BorderStyle="None">
                <ItemTemplate>
                    <table style="width: 100%" cellspacing="0" cellpadding="0">
                        <tr style='<%# FormatTrStyle(Eval("Unread")) %>'>
                            <td dir="rtl" style="border-bottom: 1px solid #e9e9e9; width: 805px;">
                                <asp:Image runat="server" id="ImagePhoto" Visible="false" 
                                    Height="24px" Width="24px" ImageUrl='<%# FormatSenderImage(Eval("Sender")) %>' />
                                    <asp:HyperLink ID="HyperLinkSubject" CssClass="MessageSender" runat="server"><%# FormatSenderName(Eval("Sender")) %></asp:HyperLink> : 
                                    <span class="InlineText"><%# Eval("Message") %></span>
                            </td>
                            <td style="border-bottom: 1px solid #e9e9e9; width: 120px; vertical-align:top;">
                                <asp:Label ID="LabelDate" CssClass="MessageDate" runat="server" Text='<%# FormatPassedDate(Eval("SubmitDate")) %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle BorderStyle="None" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" 
                DeleteImageUrl="~/images/icons/delete16.png" ShowDeleteButton="True">
            <ItemStyle HorizontalAlign="Center" Width="25px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceMessages" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
        DeleteCommand="sp_messagesDelete" 
                            SelectCommand="sp_messages" 
        SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="MessageId" />
            <asp:SessionParameter Name="OwnerId" SessionField="UserId" />
            <asp:Parameter DefaultValue="1" Name="OwnerType" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="OwnerId" SessionField="UserId" />
            <asp:Parameter DefaultValue="1" Name="OwnerType" />
            <asp:QueryStringParameter DefaultValue="" Name="OtherId" 
                QueryStringField="Id" />
            <asp:QueryStringParameter Name="OtherType" QueryStringField="Type" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:HiddenField ID="HiddenFieldOwnerName" runat="server" />
        <asp:HiddenField ID="HiddenFieldOtherName" runat="server" />
</asp:Content>

