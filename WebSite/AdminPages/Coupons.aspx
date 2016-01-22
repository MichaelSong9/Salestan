<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Coupons.aspx.cs" Inherits="AdminPages_Coupons" %>

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
    <form id="form2" runat="server" enctype="multipart/form-data">
    <div>
    
        <asp:Panel ID="PanelEdit" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image26" runat="server" Height="24px" 
                ImageUrl="~/images/mainicons/Coupons24.png" Width="24px" />
            <asp:Label ID="Label10" runat="server" CssClass="Header" 
                Text="تغییر مشخصات کوپن"></asp:Label>
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
                    <asp:DropDownList ID="DropDownListCompany" runat="server" CssClass="FormLabel" 
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
                    <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="FormData" 
                        Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout" runat="server" 
                        ControlToValidate="TextBoxTitle" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelCategory" runat="server" 
                        AssociatedControlID="DropDownListCategory" CssClass="FormLabel" 
                        Text="زمینه:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCategory" runat="server" CssClass="FormLabel" 
                        DataSourceID="SqlDataSourceCategoriesCoupons" DataTextField="CategoryName" 
                        DataValueField="CategoryId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCategoriesCoupons" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_CouponsCategories" SelectCommandType="StoredProcedure">
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
                    <asp:TextBox ID="TextBoxHighlights" runat="server" CssClass="FormData" 
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
                    <asp:TextBox ID="TextBoxDetails" runat="server" CssClass="FormData" 
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
                    <asp:TextBox ID="TextBoxDescriptions" runat="server" CssClass="FormData" 
                        Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout14" runat="server" 
                        ControlToValidate="TextBoxDescriptions" CssClass="FormValidation" 
                        ErrorMessage="توضیحات را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
            </tr>
                <tr>
                    <td class="style2" style="vertical-align:top;">
                        <asp:Label ID="LabelCode" runat="server" AssociatedControlID="TextBoxCode" 
                            CssClass="FormLabel" Text="کد:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxCode" runat="server" CssClass="FormData" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" style="vertical-align:top;">
                        <asp:Label ID="LabelStartCoupon" runat="server" 
                            AssociatedControlID="TextBoxStartCoupon" CssClass="FormLabel" 
                            Text="تاریخ شروع کوپن:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxStartCoupon" runat="server" CssClass="FormData" 
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout12" runat="server" 
                            ControlToValidate="TextBoxStartCoupon" CssClass="FormValidation" 
                            ErrorMessage="تاریخ شروع کوپن را وارد نمایید." ValidationGroup="Add"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2" style="vertical-align:top;">
                        <asp:Label ID="LabelEndCoupon" runat="server" 
                            AssociatedControlID="TextBoxEndCoupon" CssClass="FormLabel" 
                            Text="تاریخ پایان کوپن:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxEndCoupon" runat="server" CssClass="FormData" 
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout13" runat="server" 
                            ControlToValidate="TextBoxEndCoupon" CssClass="FormValidation" 
                            ErrorMessage="تاریخ پایان کوپن را وارد نمایید." ValidationGroup="Add"></asp:RequiredFieldValidator>
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
                    &nbsp;<asp:TextBox ID="TextBoxDuration" runat="server" CssClass="L2RControls" 
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
                        CssClass="FormLabel" DataSourceID="SqlDataSourceLanguages" 
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
                    <asp:Label ID="LabelLink1" runat="server" 
                        AssociatedControlID="DropDownListLink1" CssClass="FormLabel" 
                        Text="لینک اول:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListLink1" runat="server" CssClass="FormLabel">
                        <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                        <asp:ListItem Value="1">فهرست نرم افزارها</asp:ListItem>
                        <asp:ListItem Value="2">منوی غذا</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:TextBox ID="TextBoxLink1" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBoxLink1" CssClass="FormValidation" 
                        ErrorMessage="نشانی اینترنتی صحیح نمی باشد." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLink2" runat="server" 
                        AssociatedControlID="DropDownListLink2" CssClass="FormLabel" 
                        Text="لینک دوم:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListLink2" runat="server" CssClass="FormLabel" 
                        Height="17px">
                        <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                        <asp:ListItem Value="1">فهرست نرم افزارها</asp:ListItem>
                        <asp:ListItem Value="2">منوی غذا</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:TextBox ID="TextBoxLink2" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxLink2" CssClass="FormValidation" 
                        ErrorMessage="نشانی اینترنتی صحیح نمی باشد." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" valign="top">
                    <asp:Label ID="LabelLink3" runat="server" AssociatedControlID="TextBoxLink3" 
                        CssClass="FormLabel" Text="لینک سوم:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelBirthDate21" runat="server" 
                        AssociatedControlID="TextBoxDuration" CssClass="FormLabel" Text="لینک:"></asp:Label>
                    <asp:TextBox ID="TextBoxLink3" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBoxLink3" CssClass="FormValidation" 
                        ErrorMessage="نشانی اینترنتی صحیح نمی باشد." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                    <br />
                    <asp:Label ID="LabelBirthDate22" runat="server" 
                        AssociatedControlID="TextBoxLink3Image" CssClass="FormLabel" Text="دکمه:"></asp:Label>
                    <asp:TextBox ID="TextBoxLink3Image" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBoxLink3" CssClass="FormValidation" 
                        ErrorMessage="نشانی اینترنتی صحیح نمی باشد." 
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
<asp:Panel ID="PanelPhotos" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image1" runat="server" Height="24px" 
                ImageUrl="~/images/icons/gallery24.png" Width="24px" />
            <asp:Label ID="Label1" runat="server" CssClass="Header" 
                Text="تصاویر کوپن"></asp:Label>
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
                            CssClass="FormLabel" Text="عنوان کوپن:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelPhotosCouponTitle" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label8" runat="server" 
                            CssClass="FormLabel" Text="کد کوپن:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelPhotosCouponId" runat="server" CssClass="FormData"></asp:Label>
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
                                <asp:QueryStringParameter Name="ItemId" QueryStringField="CouponId" />
                                <asp:ControlParameter ControlID="GridViewPhotos" Name="PhotoId" 
                                    PropertyName="SelectedValue" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="CouponId" QueryStringField="ItemId" />
                                <asp:Parameter DefaultValue="2" Name="Type" />
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
                        &nbsp;<asp:TextBox ID="TextBoxPhotoText" runat="server" CssClass="FormData" 
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
