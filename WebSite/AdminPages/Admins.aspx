<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admins.aspx.cs" Inherits="AdminPages_Admins" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Salestan : مدیریت ادمین ها</title>
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
            <asp:Image ID="Image24" runat="server" Height="22px" 
                ImageUrl="~/images/icons/admin22.png" Width="22px" />
            <asp:Label ID="Label1" runat="server" CssClass="Header" Text="تغییر اختیارات ادمین"></asp:Label>
            <br />
            &nbsp;<br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelUserId1" runat="server" CssClass="FormLabel" 
                            Text="شناسه کاربری:"></asp:Label>
                    </td>
                    <td>
                        <ContentTemplate>
                            <asp:Label ID="LabelUserId" runat="server" CssClass="FormLabel"></asp:Label>
                        </ContentTemplate>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelUserId0" runat="server" CssClass="FormLabel" Text="نام:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelName" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions" runat="server" 
                            AssociatedControlID="CheckBoxListPremissions" CssClass="FormLabel" 
                            Text="اختیارات:"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxListPremissions" runat="server" 
                            CssClass="FormLabel">
                            <asp:ListItem Value="Admins">مدیریت ادمین ها</asp:ListItem>
                            <asp:ListItem Value="Ads">مدیریت تبلیغات</asp:ListItem>
                            <asp:ListItem Value="Agencies">مدیریت نمایندگی ها</asp:ListItem>
                            <asp:ListItem Value="Blog">مدیریت بلاگ</asp:ListItem>
                            <asp:ListItem Value="Charity">مدیریت خیریه</asp:ListItem>
                            <asp:ListItem Value="Companies">مدیریت مشاغل</asp:ListItem>
                            <asp:ListItem Value="Content">مدیریت محتوا</asp:ListItem>
                            <asp:ListItem Value="Coupons">مدیریت کوپن ها</asp:ListItem>
                            <asp:ListItem Value="Credit">مدیریت اعتبار</asp:ListItem>
                            <asp:ListItem Value="Currencies">مدیریت واحدهای پولی</asp:ListItem>
                            <asp:ListItem Value="Locations">مدیریت موقعیت ها و زبان ها</asp:ListItem>
                            <asp:ListItem Value="Newsletter">مدیریت خبرنامه</asp:ListItem>
                            <asp:ListItem Value="Offers">مدیریت پیشنهادهای ویژه</asp:ListItem>
                            <asp:ListItem Value="Settings">مدیریت تنظیمات</asp:ListItem>
                            <asp:ListItem Value="Stats">مدیریت آمار</asp:ListItem>
                            <asp:ListItem Value="Support">مدیریت پشتیبانی</asp:ListItem>
                            <asp:ListItem Value="Users">مدیریت کاربران</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions0" runat="server" 
                            AssociatedControlID="DropDownListStatus" CssClass="FormLabel" Text="وضعیت:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="DropDownR2L">
                            <asp:ListItem Value="1">فعال</asp:ListItem>
                            <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        &nbsp;</td>
                    <td>
                        <asp:HyperLink ID="HyperLinkEditLog" runat="server" CssClass="NormalLink">(مشاهده لاگ)</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style6">
                        <asp:ImageButton ID="ImageButtonSubmit" runat="server" 
                            ImageUrl="~/images/Buttons/edit-off.png" onclick="ImageButtonSubmit_Click" 
                            ValidationGroup="Add" />
                        <asp:Label ID="LabelEditMessage" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="PanelLog" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image25" runat="server" Height="22px" 
                ImageUrl="~/images/icons/admin22.png" Width="22px" />
            <asp:Label ID="Label2" runat="server" CssClass="Header" 
                Text="فایل لاگ ادمین"></asp:Label>
            <br />
            <br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelUserId2" runat="server" CssClass="FormLabel" 
                            Text="شناسه کاربری:"></asp:Label>
                    </td>
                    <td>
                        <ContentTemplate>
                            <asp:Label ID="LabelLogUserId" runat="server" CssClass="FormLabel"></asp:Label>
                        </ContentTemplate>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelUserId4" runat="server" CssClass="FormLabel" Text="نام:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelLogName" runat="server" CssClass="FormLabel"></asp:Label>
                        &nbsp;<asp:HyperLink ID="HyperLinkLogEdit" runat="server" CssClass="NormalLink">(تغییر اختیارات)</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style2">
                        <asp:GridView ID="GridViewManage" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceLog" 
                            ForeColor="#333333" GridLines="None" Width="700px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="تاریخ" SortExpression="LogDate">
                                    <ItemStyle Width="150px" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("LogDate")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LogType" HeaderText="نوع لاگ" 
                                    SortExpression="LogType">
                                <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ItemId" HeaderText="شناسه آیتم">
                                <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Value" HeaderText="مقدار">
                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LogName" HeaderText="نام لاگ" 
                                    SortExpression="LogName">
                                <ItemStyle Width="200px" />
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
                        <asp:SqlDataSource ID="SqlDataSourceLog" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                            
                            SelectCommand="sp_adminLog" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
