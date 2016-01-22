<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminAdmins.aspx.cs" Inherits="AdminAdmins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/admin/admin32.png" Width="32px" />
     <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1583;&#1605;&#1740;&#1606; &#1607;&#1575;"></asp:Label>
        <br />
     <br />
        </div>
     <div style=" direction:rtl;">
    <asp:UpdatePanel ID="UpdatePanelManage" runat="server" AssociatedUpdatePanelID="UpdatePanelManage ">
    <ContentTemplate>
         <div class="ShowHidePanel1">
             <asp:Image ID="Image24" runat="server" Height="22px" 
                 ImageUrl="~/images/icons/admin22.png" Width="22px" />
             <asp:LinkButton ID="LinkButtonManage" runat="server" CssClass="MessageSender" onclick="LinkButtonManage_Click" 
                 >&#1575;&#1583;&#1605;&#1740;&#1606; &#1607;&#1575;</asp:LinkButton>
             <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                 <br />
    <asp:UpdateProgress ID="UpdateProgressManage" runat="server" AssociatedUpdatePanelID="UpdatePanelManage">
        <ProgressTemplate>
            <img src="images/loading.gif"  alt="" style="width:21px; height:21px;"/>
        </ProgressTemplate>
        </asp:UpdateProgress>
                 <asp:GridView ID="GridViewAdmins" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="900px" 
                     DataSourceID="SqlDataSourceAdmins" AllowSorting="True">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="UserId" HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;" SortExpression="UserId">
                         <ItemStyle HorizontalAlign="Center" Width="50px" />
                         </asp:BoundField>
                         <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1575;&#1583;&#1605;&#1740;&#1606;" 
                             DataField="FullName" SortExpression="FullName">
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Right" Width="150px" />
                         </asp:BoundField>
                         <asp:TemplateField HeaderText="&#1575;&#1582;&#1578;&#1740;&#1575;&#1585;&#1575;&#1578;">
                             <ItemStyle Width="515px" HorizontalAlign="Center" />
                             <ItemTemplate>
                                <asp:Image runat="server" ID="ImagePremAdmins" Height="24px" Width="24px" ImageUrl='<%# Eval("PremAdmins", "~/images/controlpanel/admin/premissions/Admins{0}.png") %>' ToolTip="Admins" />
                                <asp:Image runat="server" ID="ImagePremAds" Height="24px" Width="24px" ImageUrl='<%# Eval("PremAds", "~/images/controlpanel/admin/premissions/Ads{0}.png") %>' ToolTip="Ads" />
                                <asp:Image runat="server" ID="ImagePremAgencies" Height="24px" Width="24px" ImageUrl='<%# Eval("PremAgencies", "~/images/controlpanel/admin/premissions/Agencies{0}.png") %>' ToolTip="Agencies" />
                                <asp:Image runat="server" ID="ImagePremBlog" Height="24px" Width="24px" ImageUrl='<%# Eval("PremBlog", "~/images/controlpanel/admin/premissions/Blog{0}.png") %>' ToolTip="Blog" />
                                <asp:Image runat="server" ID="ImagePremCharity" Height="24px" Width="24px" ImageUrl='<%# Eval("PremCharity", "~/images/controlpanel/admin/premissions/Charity{0}.png") %>' ToolTip="Charity" />
                                <asp:Image runat="server" ID="ImagePremCompanies" Height="24px" Width="24px" ImageUrl='<%# Eval("PremCompanies", "~/images/controlpanel/admin/premissions/Companies{0}.png") %>' ToolTip="Companies" />
                                <asp:Image runat="server" ID="ImagePremContent" Height="24px" Width="24px" ImageUrl='<%# Eval("PremContent", "~/images/controlpanel/admin/premissions/Content{0}.png") %>' ToolTip="Content" />
                                <asp:Image runat="server" ID="ImagePremCoupons" Height="24px" Width="24px" ImageUrl='<%# Eval("PremCoupons", "~/images/controlpanel/admin/premissions/Coupons{0}.png") %>' ToolTip="Coupons" />
                                <asp:Image runat="server" ID="ImagePremCredit" Height="24px" Width="24px" ImageUrl='<%# Eval("PremCredit", "~/images/controlpanel/admin/premissions/Credit{0}.png") %>' ToolTip="Credit" />
                                <asp:Image runat="server" ID="ImagePremCurrencies" Height="24px" Width="24px" ImageUrl='<%# Eval("PremCurrencies", "~/images/controlpanel/admin/premissions/Currencies{0}.png") %>' ToolTip="Currencies" />
                                <asp:Image runat="server" ID="ImagePremLocations" Height="24px" Width="24px" ImageUrl='<%# Eval("PremLocations", "~/images/controlpanel/admin/premissions/Locations{0}.png") %>' ToolTip="Locations" />
                                <asp:Image runat="server" ID="ImagePremNewsletter" Height="24px" Width="24px" ImageUrl='<%# Eval("PremNewsletter", "~/images/controlpanel/admin/premissions/Newsletter{0}.png") %>' ToolTip="Newsletter" />
                                <asp:Image runat="server" ID="ImagePremOffers" Height="24px" Width="24px" ImageUrl='<%# Eval("PremOffers", "~/images/controlpanel/admin/premissions/Offers{0}.png") %>' ToolTip="Offers" />
                                <asp:Image runat="server" ID="ImagePremSettings" Height="24px" Width="24px" ImageUrl='<%# Eval("PremSettings", "~/images/controlpanel/admin/premissions/Settings{0}.png") %>' ToolTip="Settings" />
                                <asp:Image runat="server" ID="ImagePremStats" Height="24px" Width="24px" ImageUrl='<%# Eval("PremStats", "~/images/controlpanel/admin/premissions/Stats{0}.png") %>' ToolTip="Stats" />
                                <asp:Image runat="server" ID="ImagePremSupport" Height="24px" Width="24px" ImageUrl='<%# Eval("PremSupport", "~/images/controlpanel/admin/premissions/Support{0}.png") %>' ToolTip="Support" />
                                <asp:Image runat="server" ID="ImagePremUsers" Height="24px" Width="24px" ImageUrl='<%# Eval("PremUsers", "~/images/controlpanel/admin/premissions/Users{0}.png") %>' ToolTip="Users" />
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:ImageField DataImageUrlField="Status" 
                             DataImageUrlFormatString="~/images/controlpanel/admin/premissions/status{0}.png" 
                             HeaderText="&#1608;&#1590;&#1593;&#1740;&#1578;" SortExpression="Status">
                             <ItemStyle HorizontalAlign="Center" Width="75px" />
                         </asp:ImageField>
                         <asp:HyperLinkField HeaderText="&#1578;&#1594;&#1740;&#1740;&#1585;" 
                             DataNavigateUrlFields="UserId" 
                             
                             DataNavigateUrlFormatString="~/AdminPages/Admins.aspx?Mode=Edit&amp;UserId={0}" 
                             Target="_blank" Text="&#1578;&#1594;&#1740;&#1740;&#1585;" >
                         <ControlStyle CssClass="NormalLink" />
                         <ItemStyle Width="50px" HorizontalAlign="Center" />
                         </asp:HyperLinkField>
                         <asp:HyperLinkField HeaderText="&#1601;&#1575;&#1740;&#1604; &#1604;&#1575;&#1711;" 
                             DataNavigateUrlFields="UserId" 
                             DataNavigateUrlFormatString="~/AdminPages/Admins.aspx?Mode=Log&amp;UserId={0}" 
                             Target="_blank" Text="&#1601;&#1575;&#1740;&#1604; &#1604;&#1575;&#1711;" >
                         <ControlStyle CssClass="NormalLink" />
                         <ItemStyle Width="60px" HorizontalAlign="Center" />
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
                 <asp:SqlDataSource ID="SqlDataSourceAdmins" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                     
                     
                     
                     SelectCommand="sp_admins" SelectCommandType="StoredProcedure">
                 </asp:SqlDataSource>
             </asp:Panel>
         </div>
         <div class="ShowHidePanel1">
             <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/add24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonAdd" runat="server" CssClass="MessageSender" onclick="LinkButtonAdd_Click" 
                 >&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1575;&#1583;&#1605;&#1740;&#1606;</asp:LinkButton>
             <br />
             <asp:Panel ID="PanelAdd" runat="server" Visible="False" Width="100%">
                 <br />
                 <table class="style1" style="direction:rtl;">
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelUserId" runat="server" 
                                 AssociatedControlID="TextBoxUserId" CssClass="FormLabel" 
                                 
                                 Text="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;:"></asp:Label>
                         </td>
                         <td>
                                     <asp:TextBox ID="TextBoxUserId" runat="server" CssClass="L2RControlsRequired" 
                                         ValidationGroup="Regeant" Width="100px"></asp:TextBox>
                                     &nbsp;
                                     <asp:ImageButton ID="ImageButtonUserId" runat="server" 
                                         ImageUrl="~/images/Buttons/check-off.png"
                                         ValidationGroup="Add" onclick="ImageButtonUserId_Click" />
                                     &nbsp;
                                     <asp:Label ID="LabelName" runat="server" CssClass="FormLabel"></asp:Label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserId" runat="server" 
                                         ControlToValidate="TextBoxUserId" CssClass="FormValidation" 
                                         ErrorMessage="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td valign="top" class="style2">
                             <asp:Label ID="LabelPremissions" runat="server" 
                                 AssociatedControlID="CheckBoxListPremissions" CssClass="FormLabel" 
                                 Text="&#1575;&#1582;&#1578;&#1740;&#1575;&#1585;&#1575;&#1578;:"></asp:Label>
                         </td>
                         <td>
                             <asp:CheckBoxList ID="CheckBoxListPremissions" runat="server" 
                                 CssClass="FormLabel">
                                 <asp:ListItem Value="Admins">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1583;&#1605;&#1740;&#1606; &#1607;&#1575;</asp:ListItem>
                                 <asp:ListItem Value="Ads">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1578;&#1576;&#1604;&#1740;&#1594;&#1575;&#1578;</asp:ListItem>
                                 <asp:ListItem Value="Agencies">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1606;&#1605;&#1575;&#1740;&#1606;&#1583;&#1711;&#1740; &#1607;&#1575;</asp:ListItem>
                                 <asp:ListItem Value="Blog">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1576;&#1604;&#1575;&#1711;</asp:ListItem>
                                 <asp:ListItem Value="Charity">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1582;&#1740;&#1585;&#1740;&#1607;</asp:ListItem>
                                 <asp:ListItem Value="Companies">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1588;&#1575;&#1594;&#1604;</asp:ListItem>
                                 <asp:ListItem Value="Content">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1581;&#1578;&#1608;&#1575;</asp:ListItem>
                                 <asp:ListItem Value="Credit">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:ListItem>
                                 <asp:ListItem Value="Currencies">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1608;&#1575;&#1581;&#1583;&#1607;&#1575;&#1740; &#1662;&#1608;&#1604;&#1740;</asp:ListItem>
                                 <asp:ListItem Value="Locations">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1607;&#1575; &#1608; &#1586;&#1576;&#1575;&#1606; &#1607;&#1575;</asp:ListItem>
                                 <asp:ListItem Value="Newsletter">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1582;&#1576;&#1585;&#1606;&#1575;&#1605;&#1607;</asp:ListItem>
                                 <asp:ListItem Value="Offers">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;</asp:ListItem>
                                 <asp:ListItem Value="Settings">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1578;&#1606;&#1592;&#1740;&#1605;&#1575;&#1578;</asp:ListItem>
                                 <asp:ListItem Value="Stats">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1570;&#1605;&#1575;&#1585;</asp:ListItem>
                                 <asp:ListItem Value="Support">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1662;&#1588;&#1578;&#1740;&#1576;&#1575;&#1606;&#1740;</asp:ListItem>
                                 <asp:ListItem Value="Users">&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:ListItem>
                             </asp:CheckBoxList>
                         </td>
                     </tr>
                     <tr>
                         <td class="style5">
                             &nbsp;</td>
                         <td class="style6">
                             <asp:ImageButton ID="ImageButtonAdd" runat="server" 
                                 ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Add" 
                                 onclick="ImageButtonAdd_Click" style="height: 30px" />
                         </td>
                     </tr>
                     <tr>
                         <td class="style5">
                             &nbsp;</td>
                         <td class="style6">
                             <asp:Label ID="LabelAddMessage" runat="server"></asp:Label>
                         </td>
                     </tr>
                 </table>
             </asp:Panel>
         </div>
        </ContentTemplate>
    </asp:UpdatePanel>
   </div>
</asp:Content>

