<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1582;&#1740;&#1585;&#1740;&#1607;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminCharity.aspx.cs" Inherits="AdminCharity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        
        </style>
	<script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#news-add").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe',
	            'width': '7',
	            'height': '6'
	        });
	        jq14("#organizations-add").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe',
	            'width': '7',
	            'height': '6'
	        });
	    });
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/favorites32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1582;&#1740;&#1585;&#1740;&#1607;"></asp:Label>
        <br />
        <br />
    </div>
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/note24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonNews" runat="server" CssClass="MessageSender" onclick="LinkButtonNews_Click" 
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1582;&#1576;&#1575;&#1585;</asp:LinkButton>
            <asp:Panel ID="PanelNews" runat="server" Visible="False" Width="100%">
            <br />
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Image ID="Image27" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/add16.png" />
                                <a class="NormalLink" id="news-add" href="AdminPages/Charity.aspx?Mode=NewsAdd">&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1582;&#1576;&#1585; &#1580;&#1583;&#1740;&#1583;</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                
                                SelectCommand="sp_charityNews" 
                                DeleteCommand="sp_charityNewsDelete" DeleteCommandType="StoredProcedure" 
                                SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridViewNews" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="900px" 
                                DataSourceID="SqlDataSourceNews" AllowSorting="True" 
                                DataKeyNames="NewsId">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607; &#1582;&#1576;&#1585;" 
                                        DataField="NewsId" SortExpression="NewsId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;" 
                                        DataField="SubmitDate" SortExpression="SubmitDate" >
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField HeaderText="&#1593;&#1606;&#1608;&#1575;&#1606; &#1582;&#1576;&#1585;" 
                                        DataNavigateUrlFields="NewsId" 
                                        DataNavigateUrlFormatString="~/CharityNews.aspx?NewsId={0}" 
                                        DataTextField="Subject" Target="_blank" SortExpression="Subject" >
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="425px" />
                                    </asp:HyperLinkField>
                                    <asp:BoundField HeaderText="&#1605;&#1608;&#1602;&#1593;&#1740;&#1578;" 
                                        DataField="Locations" >
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1576;&#1575;&#1586;&#1583;&#1740;&#1583;" 
                                        DataField="ViewCount" SortExpression="ViewCount" >
                                    <ItemStyle Width="75px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField HeaderText="&#1578;&#1594;&#1740;&#1740;&#1585;" 
                                        DataNavigateUrlFields="NewsId" Text="&#1578;&#1594;&#1740;&#1740;&#1585;" 
                                        DataNavigateUrlFormatString="~/AdminPages/Charity.aspx?Mode=NewsEdit&amp;NewsId={0}" 
                                        Target="_blank" >
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="75px" HorizontalAlign="Center" />
                                    </asp:HyperLinkField>
                                    <asp:CommandField ButtonType="Image" 
                                        DeleteImageUrl="~/images/icons/delete16.png" HeaderText="&#1581;&#1584;&#1601;" 
                                        ShowDeleteButton="True" >
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
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/shop24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonOrganizations" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonOrganizations_Click" 
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1608;&#1587;&#1587;&#1575;&#1578;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelOrganizations" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Image ID="Image5" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/add16.png" />
                                <a class="NormalLink" id="organizations-add" href="AdminPages/Charity.aspx?Mode=OrganizationsAdd">
                            &#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1605;&#1608;&#1587;&#1587;&#1607; &#1580;&#1583;&#1740;&#1583;</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewOrganizations" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="900px" 
                                DataKeyNames="OrganizationId" DataSourceID="SqlDataSourceOrganizations" 
                                style="margin-top: 0px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607; &#1605;&#1608;&#1587;&#1587;&#1607;" 
                                        DataField="OrganizationId" SortExpression="OrganizationId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1605;&#1608;&#1587;&#1587;&#1607;" 
                                        DataField="Name" >
                                    <ItemStyle Width="500px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1605;&#1608;&#1602;&#1593;&#1740;&#1578;" 
                                        DataField="Locations" >
                                    <ItemStyle Width="150px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField HeaderText="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;" 
                                        DataNavigateUrlFields="OrganizationId" 
                                        DataNavigateUrlFormatString="~/AdminPages/Charity.aspx?Mode=OrganizationsEdit&amp;OrganizationId={0}" 
                                        Target="_blank" 
                                        Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;" >
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                                    </asp:HyperLinkField>
                                    <asp:CommandField ButtonType="Image" 
                                        DeleteImageUrl="~/images/icons/delete16.png" HeaderText="&#1581;&#1584;&#1601;" 
                                        ShowDeleteButton="True" >
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
                            <asp:SqlDataSource ID="SqlDataSourceOrganizations" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                DeleteCommand="sp_charityOrganizationsDelete" 
                                DeleteCommandType="StoredProcedure" 
                                SelectCommand="sp_charityOrganizations" 
                                SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    </ContentTemplate>
</asp:Content>

