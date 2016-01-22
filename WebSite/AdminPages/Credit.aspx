<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Credit.aspx.cs" Inherits="AdminPages_Credit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="../salestan.ico" type="image/x-icon" />
    <style type="text/css">

	.Header
        {
            font-family: Tahoma;
            font-size: 14px;
            font-weight: bold;
        }
    
        .FormLabel
        {
            font-family: Tahoma;
            font-size: 14px;
        }
        .GridViewHeader
        {
            font-family: Tahoma;
            font-size: 12px;
            font-weight: bold;
        }
	.GridViewText
        {
            font-family: Tahoma;
            font-size: 12px;
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="PanelLog" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image24" runat="server" Height="22px" 
                ImageUrl="~/images/icons/credit24.png" Width="22px" />
            <asp:Label ID="Label1" runat="server" CssClass="Header" Text="لاگ اعتبار"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceLog" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                SelectCommand="sp_creditLog" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewLog" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceLog" 
                ForeColor="#333333" GridLines="None" Width="900px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="شناسه کاربر" DataField="UserId" 
                        SortExpression="UserId">
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="نام کاربر" DataField="FullName">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="Type" 
                        DataImageUrlFormatString="~/images/CreditTypes/{0}.png" 
                        HeaderText="نوع سابقه">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="زمان" SortExpression="SubmitDate">
                        <ItemStyle Width="175px" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Credit" HeaderText="مبلغ">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BeforeCredit" HeaderText="اعتبار قبل">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AfterCredit" HeaderText="اعتبار بعد">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Text" HeaderText="توضیحات">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AdminId" HeaderText="ادمین">
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
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
            <br />
            </asp:Panel>
        <asp:Panel ID="PanelUserLog" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image25" runat="server" Height="22px" 
                ImageUrl="~/images/icons/credit24.png" Width="22px" />
            <asp:Label ID="Label2" runat="server" CssClass="Header" 
                Text="لاگ اعتبار کاربر"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceUserLog" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                SelectCommand="sp_userCreditLog" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="UserId" QueryStringField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewUserLog" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceUserLog" 
                ForeColor="#333333" GridLines="None" Width="900px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ImageField DataImageUrlField="Type" 
                        DataImageUrlFormatString="~/images/{0}.png" HeaderText="نوع سابقه">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="SubmitDate" HeaderText="زمان">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="175px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Credit" HeaderText="مبلغ">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BeforeCredit" HeaderText="اعتبار قبل">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AfterCredit" HeaderText="اعتبار بعد">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Text" HeaderText="توضیحات">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Width="400px" />
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
            &nbsp;</asp:Panel>
    
    </div>
    </form>
</body>
</html>
