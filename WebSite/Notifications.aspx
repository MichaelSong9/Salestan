<%@ Page Title="Salestan : &#1585;&#1608;&#1740;&#1583;&#1575;&#1583; &#1607;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Label ID="LabelNoRecord" runat="server" CssClass="FormValidation" 
            Text="&#1607;&#1740;&#1670; &#1585;&#1608;&#1740;&#1583;&#1575;&#1583;&#1740; &#1576;&#1585;&#1575;&#1740; &#1588;&#1605;&#1575; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1579;&#1576;&#1578; &#1606;&#1588;&#1583;&#1607; &#1575;&#1587;&#1578;." Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="GridViewNotifications" runat="server" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="NotificationId" 
            DataSourceID="SqlDataSourceNotifications" ForeColor="#333333" 
            GridLines="None" ShowHeader="False" 
            Width="850px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ImageField DataImageUrlField="NotificationType" 
                    DataImageUrlFormatString="~/images/TypesImages/NotificationsTypes{0}.png">
                    <ControlStyle Height="16px" Width="16px" />
                </asp:ImageField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Literal ID="LiteralText" runat="server" Text='<%# Eval("Text") %>'></asp:Literal>
                        &nbsp;<asp:Label ID="LabelDate" runat="server" Text='<%# ShowDate(Eval("SubmitDate")) %>' ForeColor="#999999" Font-Size="11px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="800px" />
                </asp:TemplateField>
                <asp:CommandField ButtonType="Image" 
                    DeleteImageUrl="~/images/icons/delete16.png" ShowDeleteButton="True">
                <ItemStyle HorizontalAlign="Center" Width="25px" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" CssClass="GridViewHeader" Font-Bold="True" 
                ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" CssClass="GridViewText" Height="30px" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceNotifications" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
            DeleteCommand="sp_notificationDelete" DeleteCommandType="StoredProcedure" 
            SelectCommand="sp_notifications" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="NotificationId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </asp:Content>
