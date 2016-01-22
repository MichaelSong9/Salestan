<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Offers.aspx.cs" Inherits="AdminPages_Offers" %>

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
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <asp:Panel ID="PanelEdit" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image26" runat="server" Height="24px" 
                ImageUrl="~/images/mainicons/offers24.png" Width="24px" />
            <asp:Label ID="Label10" runat="server" CssClass="Header" 
                Text="تغییر مشخصات پیشنهاد"></asp:Label>
            <br />
            <br />
            <table style="width:100%;">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label111" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelCompany" runat="server" CssClass="FormLabel" 
                        
                        Text="&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1583;&#1607;&#1606;&#1583;&#1607;:" 
                        AssociatedControlID="DropDownListCompany"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCompany" runat="server" CssClass="DropDownRequiredR2L" 
                        DataSourceID="SqlDataSourceCompanies" DataTextField="Name" 
                        DataValueField="CompanyId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCompanies" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_companiesIdName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLastName" runat="server" Text="&#1593;&#1606;&#1608;&#1575;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxTitle"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="TextBoxRequiredR2L" 
                        Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout" runat="server" 
                        ControlToValidate="TextBoxTitle" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelBrowserTitle" runat="server" 
                        AssociatedControlID="TextBoxBrowserTitle" CssClass="FormLabel" 
                        Text="&#1593;&#1606;&#1608;&#1575;&#1606; &#1583;&#1585; &#1605;&#1585;&#1608;&#1585;&#1711;&#1585;:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxBrowserTitle" runat="server" CssClass="TextBoxRequiredR2L" 
                        Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout12" runat="server" 
                        ControlToValidate="TextBoxBrowserTitle" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1583;&#1585; &#1605;&#1585;&#1608;&#1585;&#1711;&#1585; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelCategory" runat="server" 
                        AssociatedControlID="DropDownListCategory" CssClass="FormLabel" 
                        Text="&#1586;&#1605;&#1740;&#1606;&#1607; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCategory" runat="server" CssClass="DropDownRequiredR2L" 
                        DataSourceID="SqlDataSourceCategoriesOffers" DataTextField="CategoryName" 
                        DataValueField="CategoryId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCategoriesOffers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_offersCategories" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2" style="vertical-align:top;">
                    <asp:Label ID="LabelHighlights" runat="server" 
                        AssociatedControlID="TextBoxHighlights" CssClass="FormLabel" 
                        Text="&#1608;&#1740;&#1688;&#1711;&#1740; &#1607;&#1575;:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxHighlights" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout0" runat="server" 
                        ControlToValidate="TextBoxHighlights" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1608;&#1740;&#1688;&#1711;&#1740; &#1607;&#1575; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;" class="style2">
                    <asp:Label ID="LabelDetails" runat="server" 
                        Text="&#1588;&#1585;&#1575;&#1740;&#1591; &#1575;&#1587;&#1578;&#1601;&#1575;&#1583;&#1607;:" CssClass="FormLabel" 
                        AssociatedControlID="TextBoxDetails"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxDetails" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        TextMode="MultiLine" Height="100px" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout1" runat="server" 
                        ControlToValidate="TextBoxDetails" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1588;&#1585;&#1575;&#1740;&#1591; &#1575;&#1587;&#1578;&#1601;&#1575;&#1583;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;" class="style2">
                    <asp:Label ID="LabelDescriptions" runat="server" Text="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxDescriptions"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxDescriptions" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout14" runat="server" 
                        ControlToValidate="TextBoxDescriptions" CssClass="FormValidation" 
                        ErrorMessage="توضیحات را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label113" runat="server" CssClass="Header" Text="قیمت ها"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelPriceOffer" runat="server" CssClass="FormLabel" 
                        Text="قیمت پیشنهاد:" 
                        AssociatedControlID="TextBoxPriceOffer"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPriceOffer" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="7" Width="75px"></asp:TextBox>
                    <asp:Label ID="LabelBirthDate17" runat="server" CssClass="FormLabel" 
                        Text="تومان"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout3" runat="server" 
                        ControlToValidate="TextBoxPriceOffer" CssClass="FormValidation" 
                        ErrorMessage="قیمت پیشنهاد را وارد نمایید." ValidationGroup="Add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelPriceNormal" runat="server" CssClass="FormLabel" 
                        Text="قیمت اصلی:" 
                        AssociatedControlID="TextBoxPriceNormal"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPriceNormal" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="7" Width="75px"></asp:TextBox>
                    <asp:Label ID="LabelBirthDate14" runat="server" CssClass="FormLabel" 
                        Text="تومان"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout4" runat="server" 
                        ControlToValidate="TextBoxPriceNormal" CssClass="FormValidation" 
                        ErrorMessage="قیمت اصلی را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label5" runat="server" 
                        AssociatedControlID="TextBoxPriceNormal" CssClass="FormLabel" 
                        Text="&#1607;&#1586;&#1740;&#1606;&#1607; &#1575;&#1585;&#1587;&#1575;&#1604;:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPostPrice" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="7" Width="75px">0</asp:TextBox>
                    <asp:Label ID="Label7" runat="server" CssClass="FormLabel" 
                        Text="&#1578;&#1608;&#1605;&#1575;&#1606;"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBoxPostPrice" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1607;&#1586;&#1740;&#1606;&#1607; &#1575;&#1585;&#1587;&#1575;&#1604; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelPriceGift" runat="server" 
                        AssociatedControlID="TextBoxPriceGift" CssClass="FormLabel" 
                        Text="سقف اعتبار هدیه:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPriceGift" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="7" Width="75px"></asp:TextBox>
                    <asp:Label ID="LabelBirthDate19" runat="server" CssClass="FormLabel" 
                        Text="تومان"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout6" 
                        runat="server" ControlToValidate="TextBoxPriceGift" CssClass="FormValidation" 
                        ErrorMessage="سقف اعتبار هدیه را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelPriceOurs" runat="server" CssClass="FormLabel" 
                        Text="قیمت برای سایت:" AssociatedControlID="TextBoxPriceOurs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPriceOurs" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="7" Width="75px"></asp:TextBox>
                    <asp:Label ID="LabelBirthDate23" runat="server" CssClass="FormLabel" 
                        Text="تومان"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout13" runat="server" 
                        ControlToValidate="TextBoxPriceOurs" CssClass="FormValidation" 
                        ErrorMessage="قیمت برای سایت را وارد نمایید." ValidationGroup="Add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelPricePercent" runat="server" 
                        AssociatedControlID="TextBoxPricePercent" CssClass="FormLabel" 
                        
                        Text="درصد تخفیف:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPricePercent" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="2" Width="50px"></asp:TextBox>
                    <asp:Label ID="LabelBirthDate15" runat="server" CssClass="FormLabel" 
                        Text="%"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout7" runat="server" 
                        ControlToValidate="TextBoxPricePercent" CssClass="FormValidation" 
                        ErrorMessage="درصد تخفیف را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label114" runat="server" CssClass="Header" 
                        
                        Text="تعداد خرید"></asp:Label>
                </td>
            </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelMinBuy" runat="server" 
                            AssociatedControlID="TextBoxMinBuy" CssClass="FormLabel" 
                            Text="حداقل خرید:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxMinBuy" runat="server" CssClass="TextBoxRequiredL2R" 
                            MaxLength="3" Width="50px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout8" runat="server" 
                            ControlToValidate="TextBoxMinBuy" CssClass="FormValidation" 
                            ErrorMessage="حداقل خرید را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelMaxBuy" runat="server" 
                        AssociatedControlID="TextBoxMaxBuy" CssClass="FormLabel" 
                        Text="حداکثر خرید:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMaxBuy" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="3" Width="50px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout9" runat="server" 
                        ControlToValidate="TextBoxMaxBuy" CssClass="FormValidation" 
                        
                        ErrorMessage="حداکثر خرید را وارد نمایید." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelMaxUser" runat="server" 
                        AssociatedControlID="TextBoxMaxUser" CssClass="FormLabel" 
                        Text="سقف خرید برای هر نفر:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMaxUser" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="3" Width="50px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout10" 
                        runat="server" ControlToValidate="TextBoxMaxUser" CssClass="FormValidation" 
                        ErrorMessage="سقف خرید برای هر نفر را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label3" runat="server" 
                        AssociatedControlID="TextBoxMinUser" CssClass="FormLabel" 
                        Text="&#1581;&#1583;&#1575;&#1602;&#1604; &#1582;&#1585;&#1740;&#1583; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMinUser" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="3" Width="50px">1</asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBoxMinUser" CssClass="FormValidation" 
                        ErrorMessage="&#1581;&#1583;&#1575;&#1602;&#1604; &#1582;&#1585;&#1740;&#1583; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label115" runat="server" 
                        CssClass="Header" 
                        Text="زمان نمایش"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelShowDate" runat="server" 
                        CssClass="FormLabel" 
                        Text="شروع نمایش:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelShowDateValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelEndDate" runat="server" CssClass="FormLabel" 
                        Text="اتمام نمایش:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelEndDateValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelDuration" runat="server" 
                        AssociatedControlID="TextBoxDuration" CssClass="FormLabel" 
                        Text="تغییر مدت نمایش:"></asp:Label>
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="TextBoxDuration" runat="server" CssClass="TextBoxRequiredL2R" 
                        MaxLength="4" Width="50px">0</asp:TextBox>
                    <asp:Label ID="LabelBirthDate13" runat="server" 
                        AssociatedControlID="TextBoxDuration" CssClass="FormLabel" Text="ساعت"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout11" runat="server" 
                        ControlToValidate="TextBoxDuration" CssClass="FormValidation" 
                        ErrorMessage="مدت نمایش را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label116" runat="server" CssClass="Header" 
                        Text="موقعیت و زبان"></asp:Label>
                </td>
            </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelLocations" runat="server" CssClass="FormLabel" 
                            Text="مکان های نمایش:" AssociatedControlID="CheckBoxListLocations"></asp:Label>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSourceLocations" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                            SelectCommand="sp_locations">
                        </asp:SqlDataSource>
                        <asp:CheckBoxList ID="CheckBoxListLocations" runat="server" 
                            CssClass="FormLabel" DataSourceID="SqlDataSourceLocations" 
                            DataTextField="LocationName" DataValueField="LocationId">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLanguage" runat="server" CssClass="FormLabel" 
                        Text="زبان پیشنهاد:" 
                        AssociatedControlID="DropDownListLanguage"></asp:Label>
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
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label118" runat="server" CssClass="Header" Text="لینک ها"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLink1" runat="server" CssClass="FormLabel" 
                        Text="&#1604;&#1740;&#1606;&#1705; &#1575;&#1608;&#1604;:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelLink3" runat="server" 
                        AssociatedControlID="TextBoxLink1Name" CssClass="FormLabel" Text="&#1606;&#1575;&#1605; &#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                    <asp:TextBox ID="TextBoxLink1Name" runat="server" CssClass="TextBoxR2L" 
                        Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout15" runat="server" 
                        ControlToValidate="TextBoxLink1Name" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1575;&#1605; &#1604;&#1740;&#1606;&#1705; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelLink4" runat="server" AssociatedControlID="TextBoxLink1Url" 
                        CssClass="FormLabel" Text="&#1570;&#1583;&#1585;&#1587; &#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TextBoxLink1Url" runat="server" CssClass="TextBoxL2R" 
                        Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBoxLink1Url" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLink2" runat="server" CssClass="FormLabel" 
                        Text="&#1604;&#1740;&#1606;&#1705; &#1583;&#1608;&#1605;:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelLink5" runat="server" 
                        AssociatedControlID="TextBoxLink2Name" CssClass="FormLabel" Text="&#1606;&#1575;&#1605; &#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                    <asp:TextBox ID="TextBoxLink2Name" runat="server" CssClass="TextBoxR2L" 
                        Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout16" runat="server" 
                        ControlToValidate="TextBoxLink2Name" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1575;&#1605; &#1604;&#1740;&#1606;&#1705; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="LabelLink6" runat="server" AssociatedControlID="TextBoxLink2Url" 
                        CssClass="FormLabel" Text="&#1570;&#1583;&#1585;&#1587; &#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TextBoxLink2Url" runat="server" CssClass="TextBoxL2R" 
                        Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="TextBoxLink2Url" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButtonEdit" runat="server" 
                        ImageUrl="~/images/Buttons/edit-off.png" onclick="ImageButtonEdit_Click" 
                        ValidationGroup="Edit" />
                    <asp:Label ID="LabelEditMessage" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        </asp:Panel>
        <asp:Panel ID="PanelBuyers" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                ImageUrl="~/images/icons/note24.png" Width="24px" />
            <asp:Label ID="Label9" runat="server" CssClass="Header" 
                Text="فهرست خریداران پیشنهاد"></asp:Label>
            <br />
            <br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label12" runat="server" 
                            CssClass="FormLabel" Text="نام مجموعه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelBuyersCompanyName" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label13" runat="server" 
                            CssClass="FormLabel" Text="کد مجموعه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelBuyersCompanyId" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label14" runat="server" 
                            CssClass="FormLabel" Text="عنوان پیشنهاد ویژه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelBuyersTitle" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label15" runat="server" 
                            CssClass="FormLabel" Text="کد پیشنهاد:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelBuyersOfferId" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label16" runat="server" 
                            CssClass="FormLabel" Text="تاریخ نمایش:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelBuyersDate" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label17" runat="server" 
                            CssClass="FormLabel" Text="تعداد خرید:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelBuyersSold" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="450px" 
                AllowSorting="True" DataSourceID="SqlDataSourceBuyers">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="کد خرید" DataField="PurchasedCode">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="نام کاربر" DataField="FullName" >
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="تعداد" DataField="Quantity" SortExpression="Quantity" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
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
            <asp:SqlDataSource ID="SqlDataSourceBuyers" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                
                SelectCommand="sp_offerBuyersUsers" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="OfferId" QueryStringField="OfferId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
<asp:Panel ID="PanelPhotos" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image1" runat="server" Height="24px" 
                ImageUrl="~/images/icons/gallery24.png" Width="24px" />
            <asp:Label ID="Label1" runat="server" CssClass="Header" 
                Text="تصاویر پیشنهاد"></asp:Label>
            <br />
            <br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label2" runat="server" 
                            CssClass="FormLabel" Text="نام مجموعه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelPhotosCompanyName" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label4" runat="server" 
                            CssClass="FormLabel" Text="کد مجموعه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelPhotosCompanyId" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" 
                            CssClass="FormLabel" Text="عنوان پیشنهاد ویژه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelPhotosOfferTitle" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label8" runat="server" 
                            CssClass="FormLabel" Text="کد پیشنهاد:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelPhotosOfferId" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="style2" style="vertical-align: top;">
                        <asp:Label ID="LabelImageMain" runat="server" CssClass="FormLabel" 
                            Text="تصویر اصلی:"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="ImageMainPhoto" runat="server" Height="267px" Width="400px" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style2" style="vertical-align: top;">
                        <asp:Label ID="LabelImageGallery" runat="server" CssClass="FormLabel" 
                            Text="سایر تصاویر:"></asp:Label>
                    </td>
                    <td>
                        <asp:GridView ID="GridViewPhotos" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PhotoId" 
                            DataSourceID="SqlDataSourcePhotos" ForeColor="#333333" GridLines="None" 
                            Width="400px" onrowcommand="GridViewPhotos_RowCommand" 
                            onrowdeleted="GridViewPhotos_RowDeleted">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="PhotoId" HeaderText="شناسه" SortExpression="PhotoId">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                </asp:BoundField>
                                <asp:ImageField DataAlternateTextField="Text" DataImageUrlField="PhotoId" 
                                    DataImageUrlFormatString="~/Files/Photos/{0}t.jpg" HeaderText="تصویر">
                                    <ControlStyle Height="40px" Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                                </asp:ImageField>
                                <asp:HyperLinkField HeaderText="سایز بزرگ" Text="سایز بزرگ" 
                                    DataNavigateUrlFields="PhotoId" 
                                    DataNavigateUrlFormatString="~/Files/Photos/{0}.jpg" Target="_blank">
                                <ControlStyle CssClass="NormalLink" />
                                <ItemStyle HorizontalAlign="Center" Width="75px" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="عکس اصلی">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonChangeMainPhoto" Visible="true" runat="server" CssClass="NormalLink" CausesValidation="False" CommandName="MainPhoto" CommandArgument='<%# Eval("PhotoId") %>'>
                                    </asp:LinkButton>
                                    </ItemTemplate>                                
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Image" 
                                    DeleteImageUrl="~/images/icons/delete16.png" HeaderText="حذف" 
                                    ShowDeleteButton="True">
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
                        <asp:SqlDataSource ID="SqlDataSourcePhotos" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                            
                            SelectCommand="sp_itemPhotos" 
                            DeleteCommand="sp_photoDelete" DeleteCommandType="StoredProcedure" 
                            SelectCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:QueryStringParameter Name="ItemId" QueryStringField="OfferId" />
                                <asp:ControlParameter ControlID="GridViewPhotos" Name="PhotoId" 
                                    PropertyName="SelectedValue" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ItemId" QueryStringField="OfferId" />
                                <asp:Parameter DefaultValue="1" Name="Type" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2" style="vertical-align: top;">
                        <asp:Label ID="LabelImageGallery0" runat="server" CssClass="FormLabel" 
                            Text="تصویر جدید:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelImageGallery2" runat="server" 
                            AssociatedControlID="FileUploadPhotoNew" CssClass="FormLabel" Text="فایل:"></asp:Label>
                        <asp:FileUpload ID="FileUploadPhotoNew" runat="server" />
                        <br />
                        <asp:Label ID="LabelImageGallery1" runat="server" 
                            AssociatedControlID="TextBoxPhotoText" CssClass="FormLabel" 
                            Text="توضیح:"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBoxPhotoText" runat="server" CssClass="TextBoxR2L" 
                            MaxLength="200" Width="350px"></asp:TextBox>
                        <br />
                        <asp:ImageButton ID="ImageButtonPhotoSave" runat="server" 
                            ImageUrl="~/images/Buttons/save-off.png" 
                            onclick="ImageButtonPhotoSave_Click" />
                        <asp:Label ID="LabelPhotoMessage" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
