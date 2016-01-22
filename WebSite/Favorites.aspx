<%@ Page Title="Salestan : &#1605;&#1608;&#1585;&#1583; &#1593;&#1604;&#1575;&#1602;&#1607; &#1607;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Favorites.aspx.cs" Inherits="Favorites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            height: 33px;
        }
        .style2
        {
            height: 33px;
            width: 200px;
        }
        .style3
        {
            width: 102px;
        }
        .style4
        {
            width: 125px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" AssociatedUpdatePanelID="UpdatePanel1 ">
    <ContentTemplate>
    <div style=" direction:rtl;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <img src="images/loading.gif"  alt="" style="width:21px; height:21px;"/>
        </ProgressTemplate>
        </asp:UpdateProgress>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                ImageUrl="~/images/mainicons/offers24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonOffers" runat="server" CssClass="MessageSender" 
                onclick="LinkButtonOffers_Click">&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelOffers" runat="server" Visible="False" Width="100%">
                <br />
                <asp:Label ID="LabelOffersNoRecord" runat="server" CssClass="FormValidation" 
                    
                    Text="&#1607;&#1740;&#1670; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1605;&#1608;&#1585;&#1583; &#1593;&#1604;&#1575;&#1602;&#1607; &#1575;&#1740; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1579;&#1576;&#1578; &#1606;&#1588;&#1583;&#1607; &#1575;&#1587;&#1578;." 
                    Visible="False"></asp:Label>
                <br />
                <asp:GridView ID="GridViewOffers" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceOffers" 
                    ForeColor="#333333" GridLines="None" Width="875px" DataKeyNames="RecordId">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="MainPhoto" 
                            DataImageUrlFormatString="~/Files/Photos/{0}t.jpg">
                            <ControlStyle Height="40px" Width="60px" />
                            <ItemStyle Width="75px" />
                        </asp:ImageField>
                        <asp:HyperLinkField DataNavigateUrlFields="ItemId,BrowserTitle" 
                            DataNavigateUrlFormatString="~/ShowOffer.aspx?OfferId={0}&amp;Title={1}" 
                            DataTextField="Title" 
                            HeaderText="&#1593;&#1606;&#1608;&#1575;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;" SortExpression="Title" 
                            Target="_blank">
                        <ControlStyle CssClass="NormalLink" />
                        <ItemStyle Width="400px" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="PriceDiscountPercent" HeaderText="&#1583;&#1585;&#1589;&#1583; &#1578;&#1582;&#1601;&#1740;&#1601;">
                        <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PriceOffer" HeaderText="&#1602;&#1740;&#1605;&#1578; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PriceNormal" HeaderText="&#1602;&#1740;&#1605;&#1578; &#1575;&#1589;&#1604;&#1740;">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="ItemId,BrowserTitle" 
                            DataNavigateUrlFormatString="~/ShowOffer.aspx?OfferId={0}&amp;BrowserTitle={1}" 
                            
                            Text="&#1605;&#1588;&#1575;&#1607;&#1583;&#1607; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;">
                        <ControlStyle CssClass="NormalLink" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:HyperLinkField>
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/images/icons/delete16.png" HeaderText="&#1581;&#1584;&#1601;" 
                            ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="25px" />
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
                <br />
                <asp:SqlDataSource ID="SqlDataSourceOffers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    DeleteCommand="sp_favoriteOfferDelete" 
                    SelectCommand="sp_userFavoriteOffers" SelectCommandType="StoredProcedure" 
                    DeleteCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="RecordId" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:Panel>
        </div>
    <br />
</div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

