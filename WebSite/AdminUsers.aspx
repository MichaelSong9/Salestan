<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminUsers.aspx.cs" Inherits="AdminUsers" %>

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
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/users32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;"></asp:Label>
        <br />
        <br />
    </div>
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/user_woman24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonManage" runat="server" CssClass="MessageSender" onclick="LinkButtonManage_Click" 
                 >&#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:LinkButton>
            <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="900px" 
                    DataSourceID="SqlDataSourceUsers" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;" 
                            DataField="UserId" SortExpression="UserId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605;" DataField="FullName" 
                            SortExpression="FullName" >
                        <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:ImageField HeaderText="&#1580;&#1606;&#1587;&#1740;&#1578;" 
                            DataImageUrlField="Gender" SortExpression="Gender" 
                            DataImageUrlFormatString="~/images/icons/gender24{0}.png">
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="City" HeaderText="&#1588;&#1607;&#1585;" SortExpression="City">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="InvitedUsersCount" HeaderText="&#1583;&#1593;&#1608;&#1578;" 
                            SortExpression="InvitedUsersCount">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;" SortExpression="MemberSince">
                            <ItemStyle Width="150px" />
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("MemberSince")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PurchasedOffersCount" HeaderText="&#1582;&#1585;&#1740;&#1583; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;" 
                            SortExpression="PurchasedOffersCount">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:HyperLinkField HeaderText="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;" 
                            DataNavigateUrlFields="UserId" 
                            DataNavigateUrlFormatString="~/AdminPages/Users.aspx?Mode=Info&amp;UserId={0}" 
                            Target="_blank" 
                            Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;" >
                        <ControlStyle CssClass="NormalLink" />
                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                        </asp:HyperLinkField>
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
                <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    SelectCommand="sp_users" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/search24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonSearch" runat="server" CssClass="MessageSender" onclick="LinkButtonSearch_Click" 
                 >&#1580;&#1587;&#1578;&#1580;&#1608;&#1740; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelSearch" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelSearchId" runat="server" 
                                AssociatedControlID="TextBoxSearchUserId" CssClass="FormLabel" 
                                
                                
                                
                                Text="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;:"></asp:Label>
                        </td>
                        <td>
                                <asp:TextBox ID="TextBoxSearchUserId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    Width="75px"></asp:TextBox>
                                &nbsp;
                                <asp:ImageButton ID="ImageButtonSearch" runat="server" 
                                    ImageUrl="~/images/Buttons/check-off.png" 
                                    onclick="ImageButtonSearch_Click" ValidationGroup="Search" />
                        </td>
                    </tr>
                </table>
                            <asp:GridView ID="GridViewSearch" runat="server" 
                                AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceSearch" 
                                ForeColor="#333333" GridLines="None" Width="900px" 
                    Visible="False">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="UserId" HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;" SortExpression="UserId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FullName" HeaderText="&#1606;&#1575;&#1605;" SortExpression="FullName">
                                    <ItemStyle Width="300px" />
                                    </asp:BoundField>
                                    <asp:ImageField DataImageUrlField="Gender" 
                                        DataImageUrlFormatString="~/images/icons/gender24{0}.png" HeaderText="&#1580;&#1606;&#1587;&#1740;&#1578;" 
                                        SortExpression="Gender">
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:ImageField>
                                    <asp:BoundField DataField="City" HeaderText="&#1588;&#1607;&#1585;" SortExpression="City">
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="InvitedUsersCount" HeaderText="&#1583;&#1593;&#1608;&#1578;" 
                                        SortExpression="InvitedUsers">
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;" SortExpression="MemberSince">
                                        <ItemStyle Width="150px" />
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("MemberSince")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PurchasedOffersCount" HeaderText="&#1582;&#1585;&#1740;&#1583; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;" 
                                        SortExpression="PurchasedOffers">
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField DataNavigateUrlFields="UserId" 
                                        DataNavigateUrlFormatString="~/AdminPages/Users.aspx?Mode=Info&amp;UserId={0}" 
                                        
                                        HeaderText="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;" 
                                        Target="_blank" 
                                        Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;">
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:HyperLinkField>
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
                            <asp:SqlDataSource ID="SqlDataSourceSearch" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                
                    SelectCommand="sp_usersSearchById" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBoxSearchUserId" Name="UserId" 
                                        PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image3" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/stats24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonStats" runat="server" CssClass="MessageSender" onclick="LinkButtonStats_Click"
                 >&#1570;&#1605;&#1575;&#1585; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelStats" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Image ID="ImageStatsRefresh" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonStatsRefresh" runat="server" 
                                CssClass="NormalLink" onclick="LinkButtonStatsRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1570;&#1605;&#1575;&#1585;</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label14" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1570;&#1582;&#1585;&#1740;&#1606; &#1576;&#1607; &#1585;&#1608;&#1586;&#1585;&#1587;&#1575;&#1606;&#1740;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelStatsDate" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label7" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelStatsUsers" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="Label8" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1580;&#1606;&#1587;&#1740;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelStatsGenderFemale" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                            <br />
                            <asp:Label ID="LabelStatsGenderMale" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label10" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1608;&#1585;&#1608;&#1583; &#1587;&#1575;&#1740;&#1578; &#1583;&#1585; 1 &#1605;&#1575;&#1607; &#1575;&#1582;&#1740;&#1585;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelStatsLogin" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    </ContentTemplate>
</asp:Content>

