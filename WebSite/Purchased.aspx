<%@ Page Title="Salestan : &#1582;&#1585;&#1740;&#1583; &#1607;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Purchased.aspx.cs" Inherits="Purchased" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .description 
        {
	webkit-border-top-right-radius:10px;
	webkit-border-top-left-radius:10px;
    -moz-border-radius-topright:10px;
      -moz-border-radius-topleft:10px;
            border-radius:10px 10px 10px 10px;
    -moz-border-bottom-colors: none;
    -moz-border-image: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: #cae1e6;
    border-style: solid;
    border-width: 1px;
    background-color: #ebf4ff;
    clear: both;
    margin: 0 0 15px 12px;
    padding: 8px 10px 8px;
    overflow: hidden;
}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <img id="preloader" src="images/loading.gif"  alt="" style="width:30px" />
        </ProgressTemplate>
        </asp:UpdateProgress>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" 
                ImageUrl="~/images/mainicons/offers24.png" Height="24px" Width="24px" />
            <asp:LinkButton ID="LinkButtonOffers" runat="server" CssClass="MessageSender" onclick="LinkButtonOffers_Click" 
                >&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelOffers" runat="server" Visible="False" Width="100%">
                <div>
                    <br />
                    <asp:Label ID="LabelOffersNoRecord" runat="server" CssClass="FormValidation" 
                        
                        Text="&#1588;&#1605;&#1575; &#1578;&#1575;&#1705;&#1606;&#1608;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1740; &#1585;&#1575; &#1582;&#1585;&#1740;&#1583;&#1575;&#1585;&#1740; &#1606;&#1705;&#1585;&#1583;&#1607; &#1575;&#1740;&#1583;!" 
                        Visible="False"></asp:Label>
                </div>
                <asp:GridView ID="GridViewOffers" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSourceOffers" 
                    ForeColor="#333333" GridLines="None" Width="900px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="MainPhoto" 
                            DataImageUrlFormatString="~/Files/Photos/{0}t.jpg">
                            <ControlStyle Height="40px" Width="60px" />
                            <ItemStyle Width="75px" />
                        </asp:ImageField>
                        <asp:HyperLinkField DataNavigateUrlFields="ItemId,BrowserTitle" 
                            DataNavigateUrlFormatString="~/ShowOffer.aspx?OfferId={0}&amp;Title={1}" 
                            DataTextField="Title" HeaderText="&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;" Target="_blank">
                        <ControlStyle CssClass="NormalLink" />
                        <ItemStyle Width="425px" />
                        </asp:HyperLinkField>
                        <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1582;&#1585;&#1740;&#1583;" SortExpression="Date">
                            <ItemStyle Width="175px" />
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("Date")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="&#1588;&#1605;&#1575;&#1585;&#1607; &#1705;&#1608;&#1662;&#1606;" 
                            DataField="Code" >
                        <ItemStyle Width="150px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1578;&#1593;&#1583;&#1575;&#1583;" 
                            DataField="Quantity" SortExpression="Quantity" >
                        <ItemStyle Width="75px" HorizontalAlign="Center" />
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
                <asp:SqlDataSource ID="SqlDataSourceOffers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    SelectCommand="sp_userPurchasedOffers" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
    <br />
    
    
    </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>

