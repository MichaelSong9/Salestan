<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1581;&#1578;&#1608;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminContent.aspx.cs" Inherits="AdminContent" %>

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
            ImageUrl="~/images/controlpanel/admin/content32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1581;&#1578;&#1608;&#1575;"></asp:Label>
        <br />
        <br />
    </div>
            <div style=" direction:rtl;">
                <div class="ShowHidePanel1">
                    <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/controlpanel/menu/information24.png" Width="24px" />
                    <asp:LinkButton ID="LinkButtonContent" runat="server" CssClass="MessageSender" onclick="LinkButtonContent_Click" 
                 >&#1605;&#1581;&#1578;&#1608;&#1575;</asp:LinkButton>
                    <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                        <br />
                        <table class="style1" style="direction:rtl;">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelLanguage" runat="server" 
                                        AssociatedControlID="DropDownListLanguages" CssClass="FormLabel" 
                                        Text="&#1575;&#1606;&#1578;&#1582;&#1575;&#1576; &#1586;&#1576;&#1575;&#1606;:"></asp:Label>
                                </td>
                                <td>
                                            <asp:DropDownList ID="DropDownListLanguages" runat="server" 
                                                CssClass="FormLabel" AutoPostBack="True" 
                                                DataSourceID="SqlDataSourceLanguages" DataTextField="LanguageName" 
                                                DataValueField="LanguageId">
                                            </asp:DropDownList>
                                            &nbsp;<asp:ImageButton ID="ImageButtonContent" runat="server" 
                                                ImageUrl="~/images/Buttons/check-off.png" 
                                                onclick="ImageButtonContent_Click" />
                                            <asp:SqlDataSource ID="SqlDataSourceLanguages" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                                SelectCommand="sp_languages" SelectCommandType="StoredProcedure">
                                            </asp:SqlDataSource>
                                </td>
                            </tr>
                            </table>
                            <asp:Panel ID="PanelContent" runat="server" Visible="False" Width="100%">
                            <table class="style1" style="direction:rtl;">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelAbout" runat="server" 
                                        AssociatedControlID="TextBoxAbout" CssClass="FormLabel" 
                                        Text="&#1583;&#1585;&#1576;&#1575;&#1585;&#1607; &#1605;&#1575;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxAbout" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAbout" runat="server" Height="75px" TextMode="MultiLine" 
                                        Width="450px" CssClass="TextBoxR2L"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonAbout" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="About" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout" runat="server" 
                                        ControlToValidate="TextBoxAbout" CssClass="FormValidation" 
                                        ErrorMessage="&#1605;&#1578;&#1606; &#1583;&#1585;&#1576;&#1575;&#1585;&#1607; &#1605;&#1575; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="About"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelSuggestions" runat="server" 
                                        AssociatedControlID="TextBoxSuggestions" CssClass="FormLabel" 
                                        
                                        Text="&#1606;&#1592;&#1585;&#1575;&#1578; &#1608; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1575;&#1578;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxSuggestions" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxSuggestions" runat="server" Height="75px" TextMode="MultiLine" 
                                        Width="450px" CssClass="TextBoxR2L"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonSuggestions" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Suggestions" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSuggestions" 
                                        runat="server" ControlToValidate="TextBoxSuggestions" CssClass="FormValidation" 
                                        ErrorMessage="&#1605;&#1578;&#1606; &#1606;&#1592;&#1585;&#1575;&#1578; &#1608; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1575;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                        ValidationGroup="Suggestions"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelContact" runat="server" 
                                        AssociatedControlID="TextBoxContact" CssClass="FormLabel" 
                                        
                                        Text="&#1575;&#1585;&#1578;&#1576;&#1575;&#1591; &#1576;&#1575; &#1605;&#1575;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxContact" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxContact" runat="server" Height="75px" TextMode="MultiLine" 
                                        Width="450px" CssClass="TextBoxR2L"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonContact" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Contact" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorContact" runat="server" 
                                        ControlToValidate="TextBoxContact" CssClass="FormValidation" 
                                        ErrorMessage="&#1605;&#1578;&#1606; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591; &#1576;&#1575; &#1605;&#1575; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Contact"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelRules" runat="server" 
                                        AssociatedControlID="TextBoxRules" CssClass="FormLabel" 
                                        
                                        Text="&#1602;&#1608;&#1575;&#1606;&#1740;&#1606; &#1608; &#1605;&#1602;&#1585;&#1585;&#1575;&#1578;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxRules" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxRules" runat="server" Height="75px" TextMode="MultiLine" 
                                        Width="450px" CssClass="TextBoxR2L"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonRules" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Rules" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRules" runat="server" 
                                        ControlToValidate="TextBoxRules" CssClass="FormValidation" 
                                        ErrorMessage="&#1605;&#1578;&#1606; &#1602;&#1608;&#1575;&#1606;&#1740;&#1606; &#1608; &#1605;&#1602;&#1585;&#1585;&#1575;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Rules"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelPrivacy" runat="server" 
                                        AssociatedControlID="TextBoxPrivacy" CssClass="FormLabel" 
                                        
                                        Text="&#1581;&#1601;&#1592; &#1581;&#1585;&#1740;&#1605; &#1588;&#1582;&#1589;&#1740;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxPrivacy" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPrivacy" runat="server" Height="75px" TextMode="MultiLine" 
                                        Width="450px" CssClass="TextBoxR2L"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonPrivacy" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Privacy" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrivacy" runat="server" 
                                        ControlToValidate="TextBoxPrivacy" CssClass="FormValidation" 
                                        ErrorMessage="&#1605;&#1578;&#1606; &#1581;&#1601;&#1592; &#1581;&#1585;&#1740;&#1605; &#1588;&#1582;&#1589;&#1740; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Privacy"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style6">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </asp:Panel>
                        <br />
                    </asp:Panel>
                </div>
                <div class="ShowHidePanel1">
                    <asp:Image ID="Image1" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/seo24.png" Width="24px" />
                    <asp:LinkButton ID="LinkButtonSeo" runat="server" CssClass="MessageSender" onclick="LinkButtonSeo_Click"
                 >SEO</asp:LinkButton>
                    <asp:Panel ID="PanelSeo" runat="server" Visible="False" Width="100%">
                        <br />
                            <table class="style1" style="direction:rtl;">
                            <tr>
                                <td valign="top" class="style2">
                                    <asp:Label ID="LabelKeywords" runat="server" 
                                        AssociatedControlID="TextBoxKeywords" CssClass="FormLabel" 
                                        Text="&#1705;&#1604;&#1605;&#1575;&#1578; &#1705;&#1604;&#1740;&#1583;&#1740;:"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxKeywords" runat="server" Height="75px" TextMode="MultiLine" 
                                        Width="450px" CssClass="TextBoxRequiredL2R" MaxLength="4000"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonKeywrods" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Keywrods" 
                                        onclick="ImageButtonKeywrods_Click" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBoxKeywords" CssClass="FormValidation" 
                                        
                                        ErrorMessage="&#1705;&#1604;&#1605;&#1575;&#1578; &#1705;&#1604;&#1740;&#1583;&#1740; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                        ValidationGroup="Keywrods"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="style2">
                                    <asp:Label ID="LabelDescriptions" runat="server" 
                                        AssociatedControlID="TextBoxDescriptions" CssClass="FormLabel" 
                                        
                                        Text="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578;:"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxDescriptions" runat="server" Height="75px" TextMode="MultiLine" 
                                        Width="450px" CssClass="TextBoxRequiredL2R" MaxLength="4000"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButtonDescriptions" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Descriptions" 
                                        onclick="ImageButtonDescriptions_Click" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                        runat="server" ControlToValidate="TextBoxDescriptions" CssClass="FormValidation" 
                                        ErrorMessage="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                        ValidationGroup="Descriptions"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style6">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </asp:Panel>
                </div>
            </div>
</asp:Content>

