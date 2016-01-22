<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1607;&#1575; &#1608; &#1586;&#1576;&#1575;&#1606; &#1607;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLocations.aspx.cs" Inherits="AdminLocations" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/globe32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1607;&#1575; &#1608; &#1586;&#1576;&#1575;&#1606; &#1607;&#1575;"></asp:Label>
        <br />
        <br />
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/location24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonLocations" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonLocations_Click"
                 >&#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1607;&#1575;</asp:LinkButton>
            <asp:Panel ID="PanelLocations" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewLocations" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="350px" 
                    DataKeyNames="LocationId" DataSourceID="SqlDataSourceLocations">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1705;&#1583; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578;" 
                            DataField="LocationId" SortExpression="LocationId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578;" 
                            DataField="LocationName" SortExpression="LocationName" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/images/icons/delete16.png" HeaderText="&#1581;&#1584;&#1601;" 
                            ShowDeleteButton="True" >
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:CommandField>
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
                <asp:SqlDataSource ID="SqlDataSourceLocations" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    DeleteCommand="sp_locationDelete" 
                    SelectCommand="sp_locations" SelectCommandType="StoredProcedure" 
                    DeleteCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" class="style2">
                            <asp:Image ID="Image27" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/add16.png" Width="16px" />
                            <asp:Label ID="Label7" runat="server" CssClass="FormData" 
                                Text="&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocationId" runat="server" 
                                AssociatedControlID="TextBoxLocationId" CssClass="FormLabel" 
                                Text="&#1705;&#1583; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578;:"></asp:Label>
                        </td>
                        <td>
                                <asp:TextBox ID="TextBoxLocationId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    ValidationGroup="Location" Width="50px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationCode" 
                                    runat="server" ControlToValidate="TextBoxLocationId" 
                                    CssClass="FormValidation" ErrorMessage="&#1705;&#1583; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                    ValidationGroup="Location"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocationName" runat="server" 
                                AssociatedControlID="TextBoxLocationName" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxLocationName" runat="server" 
                                ValidationGroup="Location" Width="125px" CssClass="TextBoxRequiredR2L"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationName" 
                                runat="server" ControlToValidate="TextBoxLocationName" 
                                CssClass="FormValidation" ErrorMessage="&#1606;&#1575;&#1605; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Location"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <Controls:Captcha ID="captchaLocation" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonLocationAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Location" 
                                onclick="ImageButtonLocationAdd_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="LabelAddLocationMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/globe24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonLanguages" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonLanguages_Click" 
                 >&#1586;&#1576;&#1575;&#1606; &#1607;&#1575;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelLanguages" runat="server" Visible="False" Width="100%">
                <br />
                <asp:SqlDataSource ID="SqlDataSourceLanguages" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_languages" 
                    DeleteCommand="sp_languageDelete" 
                    SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewLanguages" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="350px" 
                    DataKeyNames="LanguageId" DataSourceID="SqlDataSourceLanguages">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1705;&#1583; &#1586;&#1576;&#1575;&#1606;" 
                            DataField="LanguageId" SortExpression="LanguageId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1586;&#1576;&#1575;&#1606;" 
                            DataField="LanguageName" SortExpression="LanguageName" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/images/icons/delete16.png" HeaderText="&#1581;&#1584;&#1601;" 
                            ShowDeleteButton="True" >
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:CommandField>
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
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Image ID="Image29" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/add16.png" Width="16px" />
                            <asp:Label ID="Label8" runat="server" CssClass="FormData" 
                                Text="&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1586;&#1576;&#1575;&#1606;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLanguageId" runat="server" 
                                AssociatedControlID="TextBoxLanguageId" CssClass="FormLabel" 
                                Text="&#1705;&#1583; &#1586;&#1576;&#1575;&#1606;:"></asp:Label>
                        </td>
                        <td>
                            <ContentTemplate>
                                <asp:TextBox ID="TextBoxLanguageId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    ValidationGroup="Language" Width="50px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLanguageCode" 
                                    runat="server" ControlToValidate="TextBoxLanguageId" 
                                    CssClass="FormValidation" ErrorMessage="&#1705;&#1583; &#1586;&#1576;&#1575;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                    ValidationGroup="Language"></asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLanguageName" runat="server" 
                                AssociatedControlID="TextBoxLanguageName" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1586;&#1576;&#1575;&#1606;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxLanguageName" runat="server" 
                                ValidationGroup="Language" Width="125px" CssClass="TextBoxRequiredR2L"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLanguageName" 
                                runat="server" ControlToValidate="TextBoxLanguageName" 
                                CssClass="FormValidation" ErrorMessage="&#1606;&#1575;&#1605; &#1586;&#1576;&#1575;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Language"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <Controls:Captcha ID="captchaLanguage" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonLanguageAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Language" 
                                onclick="ImageButtonLanguageAdd_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="LabelAddLanguageMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    </ContentTemplate>
</asp:Content>

