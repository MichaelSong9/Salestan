<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Companies.aspx.cs" Inherits="AdminPages_Companies" %>

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
    
        <asp:Panel ID="PanelEdit" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                ImageUrl="~/images/icons/suitcase24.png" Width="24px" />
            <asp:Label ID="Label9" runat="server" CssClass="Header" 
                Text="تغییر مشخصات مشاغل"></asp:Label>
            <br />
            <asp:Label ID="LabelMessage" runat="server" Visible="False"></asp:Label>
            <br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" CssClass="Header" Text="مشخصات فروشگاه"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelOwnerId" runat="server" 
                            AssociatedControlID="TextBoxOwnerId" CssClass="FormLabel" 
                            Text="شناسه کاربری مدیر:"></asp:Label>
                    </td>
                    <td>
                        <ContentTemplate>
                            <asp:TextBox ID="TextBoxOwnerId" runat="server" CssClass="TextBoxRequiredL2R" 
                                Width="75px"></asp:TextBox>
                            &nbsp;
                            <asp:ImageButton ID="ImageButtonOwner" runat="server" 
                                ImageUrl="~/images/Buttons/check-off.png" 
                                onclick="ImageButtonOwner_Click" />
                            &nbsp;
                            <asp:Label ID="LabelOwnerName" runat="server" CssClass="FormLabel"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName3" runat="server" 
                                ControlToValidate="TextBoxOwnerId" CssClass="FormValidation" 
                                ErrorMessage="شناسه کاربری مدیر را وارد نمایید."></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelName" runat="server" AssociatedControlID="TextBoxName" 
                            CssClass="FormLabel" Text="نام فروشگاه/شرکت:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxName" runat="server" CssClass="TextBoxRequiredR2L" 
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName2" runat="server" 
                            ControlToValidate="TextBoxName" CssClass="FormValidation" 
                            ErrorMessage="نام فروشگاه را وارد نمایید." ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="style2">
                        <asp:Label ID="LabelName0" runat="server" AssociatedControlID="TextBoxAbout" 
                            CssClass="FormLabel" Text="درباره:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxAbout" runat="server" CssClass="TextBoxMultiR2L" 
                            Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelType" runat="server" AssociatedControlID="DropDownListType" 
                            CssClass="FormLabel" Text="نوع شغل:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListType" runat="server" CssClass="DropDownRequiredR2L" 
                            DataSourceID="SqlDataSourceTypes" DataTextField="TypeName" 
                            DataValueField="TypeId">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceTypes" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                            
                            SelectCommand="sp_companyTypes" 
                            SelectCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="TypeId" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelField" runat="server" 
                            AssociatedControlID="DropDownListField" CssClass="FormLabel" Text="زمینه کاری:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListField" runat="server" CssClass="DropDownRequiredR2L" 
                            DataSourceID="SqlDataSourceFields" DataTextField="FieldName" 
                            DataValueField="FieldId">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceFields" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                            
                            
                            SelectCommand="sp_companyFields" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label8" runat="server" CssClass="Header" Text="مشخصات ارتباطی"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelPhone" runat="server" AssociatedControlID="TextBoxPhone" 
                            CssClass="FormLabel" Text="تلفن:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelFax" runat="server" AssociatedControlID="TextBoxFax" 
                            CssClass="FormLabel" Text="نمابر:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxFax" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelMobile" runat="server" AssociatedControlID="TextBoxMobile" 
                            CssClass="FormLabel" Text="همراه:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxMobile" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelEmail" runat="server" AssociatedControlID="TextBoxEmail" 
                            CssClass="FormLabel" Text="پست الکترونیک:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                            ErrorMessage="پست اکترونیکی صحیح نمی باشد." 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelWebsite" runat="server" 
                            AssociatedControlID="TextBoxWebsite" CssClass="FormLabel" 
                            Text="نشانی اینترنتی:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxWebsite" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBoxWebsite" CssClass="FormValidation" 
                            ErrorMessage="نشانی اینترنتی صحیح نمی باشد." 
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                            ValidationGroup="Edit"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelAddress" runat="server" 
                            AssociatedControlID="TextBoxAddress" CssClass="FormLabel" Text="آدرس:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxAddress" runat="server" Width="400px" 
                            CssClass="TextBoxR2L"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelGoogleMap" runat="server" 
                            AssociatedControlID="TextBoxGoogleMap" CssClass="FormLabel" 
                            Text="شناسه GoogleMap:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxGoogleMap" runat="server" CssClass="TextBoxL2R" 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label1" runat="server" CssClass="Header" Text="عکس ها"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelLogo" runat="server" AssociatedControlID="FileUploadLogo" 
                            CssClass="FormLabel" Text="لوگوی فروشگاه:"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUploadLogo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style6">
                        <asp:ImageButton ID="ImageButtonEdit" runat="server" 
                            ImageUrl="~/images/Buttons/edit-off.png" 
                            onclick="ImageButtonEdit_Click" ValidationGroup="Edit" />
                        <asp:Label ID="LabelEditMessage" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="PanelInfo" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image1" runat="server" Height="24px" 
                ImageUrl="~/images/icons/suitcase24.png" Width="24px" />
            <asp:Label ID="Label3" runat="server" CssClass="Header" 
                Text="مشخصات مشاغل"></asp:Label>
            <br />
            <br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" CssClass="Header" Text="مشخصات فروشگاه"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label5" runat="server" CssClass="FormLabel" 
                            Text="شناسه کاربری مدیر:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoOwner" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" 
                            CssClass="FormLabel" Text="نام فروشگاه/شرکت:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoName" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label7" runat="server" 
                            CssClass="FormLabel" Text="نوع شغل:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoType" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label10" runat="server" CssClass="FormLabel" Text="زمینه کاری:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoField" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label21" runat="server" CssClass="FormLabel" Text="درباره:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoAbout" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label11" runat="server" CssClass="Header" Text="مشخصات ارتباطی"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label12" runat="server" 
                            CssClass="FormLabel" Text="تلفن:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoPhone" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label13" runat="server" 
                            CssClass="FormLabel" Text="نمابر:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoFax" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label14" runat="server" 
                            CssClass="FormLabel" Text="همراه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoMobile" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label15" runat="server" 
                            CssClass="FormLabel" Text="پست الکترونیک:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoEmail" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label16" runat="server" CssClass="FormLabel" 
                            Text="نشانی اینترنتی:"></asp:Label>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLinkInfoWebsite" runat="server" CssClass="NormalLink" 
                            Target="_blank">[HyperLinkInfoWebsite]</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label17" runat="server" CssClass="FormLabel" Text="آدرس:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoAddress" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label18" runat="server" CssClass="FormLabel" 
                            Text="شناسه GoogleMap:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelInfoGoogleMap" runat="server" CssClass="FormData"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label19" runat="server" CssClass="Header" Text="عکس ها"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="style2">
                        <asp:Label ID="Label20" runat="server" 
                            CssClass="FormLabel" Text="لوگوی فروشگاه:"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="ImageInfoLogo" runat="server" Visible="False" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style6">
                        <asp:HyperLink ID="HyperLinkInfoChange" runat="server" 
                            ImageUrl="~/images/Buttons/edit-off.png">HyperLink</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
