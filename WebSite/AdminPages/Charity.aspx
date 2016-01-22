<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Charity.aspx.cs" Inherits="AdminPages_Charity" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../salestan.ico" type="image/x-icon" />
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="PanelNews" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image26" runat="server" Height="24px" 
                ImageUrl="~/images/icons/note24.png" Width="24px" />
            <asp:Label ID="Label10" runat="server" CssClass="Header" 
                Text="اخبار خیریه"></asp:Label>
            <br />
            <br />
            <table class="style1" style="direction:rtl;">
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
                        <asp:Label ID="LabelUserId" runat="server" CssClass="FormLabel" 
                            Text="عنوان خبر:" AssociatedControlID="TextBoxNewsSubject"></asp:Label>
                    </td>
                    <td>
                        <ContentTemplate>
                            <asp:TextBox ID="TextBoxNewsSubject" runat="server" CssClass="TextBoxRequiredR2L" 
                                Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserId" runat="server" 
                                ControlToValidate="TextBoxNewsSubject" CssClass="FormValidation" 
                                ErrorMessage="عنوان خبر را وارد نمایید." ValidationGroup="News"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions" runat="server" 
                            AssociatedControlID="TextBoxNewsBrief" CssClass="FormLabel" 
                            Text="خلاصه خبر:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxNewsBrief" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                            Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserId0" runat="server" 
                            ControlToValidate="TextBoxNewsBrief" CssClass="FormValidation" 
                            ErrorMessage="خلاصه خبر را وارد نمایید." ValidationGroup="News"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions0" runat="server" 
                            AssociatedControlID="TextBoxNewsBody" CssClass="FormLabel" 
                            Text="متن خبر:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxNewsBody" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                            Height="200px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserId1" runat="server" 
                            ControlToValidate="TextBoxNewsBody" CssClass="FormValidation" 
                            ErrorMessage="متن خبر را وارد نمایید." ValidationGroup="News"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelLocations" runat="server" 
                            AssociatedControlID="CheckBoxListLocations" CssClass="FormLabel" 
                            Text="مکان های نمایش:"></asp:Label>
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
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelLanguage" runat="server" 
                            AssociatedControlID="DropDownListLanguage" CssClass="FormLabel" 
                            Text="زبان:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListLanguage" runat="server" AutoPostBack="True" 
                            CssClass="DropDownRequiredR2L" DataSourceID="SqlDataSourceLanguages" 
                            DataTextField="LanguageName" DataValueField="LanguageId">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceLanguages" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                            SelectCommand="sp_languages" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        &nbsp;</td>
                    <td>
                        <Controls:Captcha ID="captcha" runat="server" CalcMode="1" />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style6">
                        <asp:ImageButton ID="ImageButtonNewsSubmit" runat="server" 
                            ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="News" 
                            onclick="ImageButtonNewsSubmit_Click" />
                        <asp:Label ID="LabelNewsMessage" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="PanelOrganizations" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                ImageUrl="~/images/icons/shop24.png" Width="24px" />
            <asp:Label ID="Label11" runat="server" CssClass="Header" 
                Text="موسسات خیریه"></asp:Label>
            <br />
            <br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label1" runat="server" CssClass="FormLabel" 
                            Text="نام موسسه:" AssociatedControlID="TextBoxName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxName" runat="server" CssClass="TextBoxRequiredR2L" 
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName2" runat="server" 
                            ControlToValidate="TextBoxName" CssClass="FormValidation" 
                            ErrorMessage="نام موسسه  را وارد نمایید." ValidationGroup="Organizations"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="style2">
                        <asp:Label ID="Label3" runat="server" CssClass="FormLabel" 
                            Text="درباره موسسه:" AssociatedControlID="TextBoxAbout"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxAbout" runat="server" CssClass="TextBoxMultiR2L" 
                            Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label12" runat="server" AssociatedControlID="TextBoxEmail" 
                            CssClass="FormLabel" Text="پست الکترونیکی:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                            ErrorMessage="پست اکترونیکی صحیح نمی باشد." 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="Organizations"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label13" runat="server" AssociatedControlID="TextBoxWebsite" 
                            CssClass="FormLabel" Text="نشانی اینترنتی:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxWebsite" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBoxWebsite" CssClass="FormValidation" 
                            ErrorMessage="نشانی اینترنتی صحیح نمی باشد." 
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                            ValidationGroup="Organizations"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label14" runat="server" AssociatedControlID="TextBoxPhone" 
                            CssClass="FormLabel" Text="تلفن:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label15" runat="server" AssociatedControlID="TextBoxFax" 
                            CssClass="FormLabel" Text="نمابر:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxFax" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label16" runat="server" AssociatedControlID="TextBoxAddress" 
                            CssClass="FormLabel" Text="آدرس:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="TextBoxR2L" 
                            Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="Label6" runat="server" 
                            AssociatedControlID="CheckBoxListLocations" CssClass="FormLabel" 
                            Text="موقعیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                            SelectCommand="SELECT [LocationId], [LocationName] FROM [Locations] ORDER BY [LocationName]">
                        </asp:SqlDataSource>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                            CssClass="FormLabel" DataSourceID="SqlDataSourceLocations" 
                            DataTextField="LocationName" DataValueField="LocationId">
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        &nbsp;</td>
                    <td>
                        <Controls:Captcha ID="captcha0" runat="server" CalcMode="1" />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style6">
                        <asp:ImageButton ID="ImageButtonOrganizations" runat="server" 
                            ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Organizations" 
                            onclick="ImageButtonOrganizations_Click" />
                        <asp:Label ID="LabelOrganizationsMessage" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
