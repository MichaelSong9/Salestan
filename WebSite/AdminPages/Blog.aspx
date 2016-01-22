<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="AdminPages_Blog" %>
<%@ Register src="../NumCaptcha.ascx" tagname="captcha" tagprefix="controls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../salestan.ico" type="image/x-icon" />
    <style type="text/css">
        .style2
        {
            text-align: right;
            width: 150px;
        }
        

        .style1
        {
            width: 100%;
        }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="PanelEdit" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image26" runat="server" Height="24px" 
                ImageUrl="~/images/controlpanel/menu/blog24.png" Width="24px" />
            <asp:Label ID="Label10" runat="server" CssClass="Header" 
                Text="بلاگ"></asp:Label>
            <br />
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelUserId0" runat="server" CssClass="FormLabel" 
                            Text="تاریخ خبر:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelDate" runat="server"></asp:Label>
                    </td>
                </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLastName" runat="server" Text="&#1593;&#1606;&#1608;&#1575;&#1606;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxTitle"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="TextBoxRequiredR2L" 
                        Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout" runat="server" 
                        ControlToValidate="TextBoxTitle" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelCategory" runat="server" 
                        AssociatedControlID="DropDownListCategory" CssClass="FormLabel" 
                        Text="&#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCategory" runat="server" CssClass="DropDownRequiredR2L" 
                        DataSourceID="SqlDataSourceCategoriesBlog" DataTextField="CategoryName" 
                        DataValueField="CategoryId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCategoriesBlog" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_blogCategories" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2" style="vertical-align:top;">
                    <asp:Label ID="LabelHighlights" runat="server" 
                        AssociatedControlID="TextBoxBrief" CssClass="FormLabel" 
                        Text="&#1582;&#1604;&#1575;&#1589;&#1607;:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxBrief" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout0" runat="server" 
                        ControlToValidate="TextBoxBrief" CssClass="FormValidation" 
                        
                        ErrorMessage="خلاصه را وارد نمایید." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;" class="style2">
                    <asp:Label ID="LabelDetails" runat="server" 
                        Text="&#1605;&#1578;&#1606;:" CssClass="FormLabel" 
                        AssociatedControlID="TextBoxBody"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxBody" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        TextMode="MultiLine" Height="100px" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout1" runat="server" 
                        ControlToValidate="TextBoxBody" CssClass="FormValidation" 
                        
                        ErrorMessage="متن را وارد نمایید." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelLocations0" runat="server" 
                            AssociatedControlID="TextBoxPhotoLink" CssClass="FormLabel" Text="لینک تصویر:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPhotoLink" runat="server" CssClass="TextBoxL2R" 
                            Width="350px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBoxPhotoLink" CssClass="FormValidation" 
                            ErrorMessage="لینک تصویر صحیح نمی باشد." 
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                            ValidationGroup="Information"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLocations" runat="server" 
                        AssociatedControlID="CheckBoxListLocations" CssClass="FormLabel" 
                        Text="&#1605;&#1705;&#1575;&#1606; &#1607;&#1575;&#1740; &#1606;&#1605;&#1575;&#1740;&#1588;:"></asp:Label>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceLocations" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_locations" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                    <asp:CheckBoxList ID="CheckBoxListLocations" runat="server" 
                        CssClass="FormLabel" DataSourceID="SqlDataSourceLocations" 
                        DataTextField="LocationName" DataValueField="LocationId">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLanguage" runat="server" 
                        AssociatedControlID="DropDownListLanguage" CssClass="FormLabel" 
                        Text="&#1586;&#1576;&#1575;&#1606;:"></asp:Label>
                </td>
                <td class="style2">
                    <asp:DropDownList ID="DropDownListLanguage" runat="server" CssClass="DropDownRequiredR2L" 
                        AutoPostBack="True" DataSourceID="SqlDataSourceLanguages" 
                        DataTextField="LanguageName" DataValueField="LanguageId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceLanguages" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_languages" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <Controls:Captcha ID="captcha" runat="server" CalcMode="1" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButtonEdit" runat="server" 
                        ImageUrl="~/images/Buttons/edit-off.png" ValidationGroup="Edit" 
                        onclick="ImageButtonEdit_Click" />
                    <asp:Label ID="LabelEditMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        </asp:Panel>
    <div>
    
    </div>
    </form>
</body>
</html>
