<%@ Page Title="Salestan : &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1575;&#1578;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Connections.aspx.cs" Inherits="Connections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .FormStaticData
        {
            font-family: Tahoma;
            font-size: 14px;
            color:Gray;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="ShowHidePanel1">
        <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/user_woman24.png" Width="24px" />
        <asp:LinkButton ID="LinkButtonFriends" runat="server" CssClass="MessageSender" Enabled="False" 
                 >&#1583;&#1608;&#1587;&#1578;&#1575;&#1606;</asp:LinkButton>
        <asp:Panel ID="PanelFriends" runat="server" Width="100%">
            <br />
            <asp:Label ID="LabelFriendsNoRecord" runat="server" CssClass="FormValidation" 
                Text="&#1601;&#1585;&#1583;&#1740; &#1583;&#1585; &#1601;&#1607;&#1585;&#1587;&#1578; &#1583;&#1608;&#1587;&#1578;&#1575;&#1606; &#1588;&#1605;&#1575; &#1608;&#1580;&#1608;&#1583; &#1606;&#1583;&#1575;&#1585;&#1583;." Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="GridViewFriends" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="600px" 
                    DataSourceID="SqlDataSourceFriends" AllowSorting="True" 
                DataKeyNames="OtherId">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="&#1606;&#1575;&#1605;" DataField="FullName" 
                            SortExpression="FullName" >
                    <ItemStyle Width="350px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="&#1588;&#1607;&#1585;" SortExpression="City">
                    <ItemStyle HorizontalAlign="Center" Width="125px" />
                    </asp:BoundField>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Width="16px" Height="16px" ImageUrl="~/images/icons/mail16.png" Target="_blank" ToolTip="&#1575;&#1585;&#1587;&#1575;&#1604; &#1662;&#1740;&#1594;&#1575;&#1605;" NavigateUrl='<%# Eval("OtherId", "~/Pages/NewMessage.aspx?ReceiverId={0}&Type=1") %>'>HyperLink</asp:HyperLink>
                    </ItemTemplate>
                        <ItemStyle Width="100px" />
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
                <RowStyle BackColor="#EFF3FB" CssClass="GridViewText" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceFriends" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    SelectCommand="sp_connectionsFriends" 
                SelectCommandType="StoredProcedure" DeleteCommand="sp_connectionsFriendDelete" 
                DeleteCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    <asp:Parameter Name="OtherId" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Image ID="Image25" runat="server" Height="16px" 
                ImageUrl="~/images/icons/search16.png" Width="16px" />
            <asp:LinkButton ID="LinkButtonFriendsSearch" runat="server" 
                CssClass="MessageSender" 
                onclick="LinkButtonFriendsSearch_Click">&#1580;&#1587;&#1578;&#1580;&#1608;&#1740; &#1583;&#1608;&#1587;&#1578;&#1575;&#1606;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelFriendsSearch" runat="server" Visible="False">
                <asp:Label ID="LabelFriendsSearchEmail" runat="server" 
                    AssociatedControlID="TextBoxFriendsSearchEmail" CssClass="FormLabel" 
                    Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740;:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBoxFriendsSearchEmail" runat="server" 
                    CssClass="TextBoxRequiredL2R" Width="150px"></asp:TextBox>
                <span class="TopText">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegister" runat="server" 
                    ControlToValidate="TextBoxFriendsSearchEmail" CssClass="FormValidation" 
                    ErrorMessage="*" ValidationGroup="FriendsSearch"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorRegister" 
                    runat="server" ControlToValidate="TextBoxFriendsSearchEmail" 
                    CssClass="FormValidation" ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="FriendsSearch"></asp:RegularExpressionValidator>
                </span>
                <br />
                <br />
                <asp:ImageButton ID="ImageButtonFriendsSearch" runat="server" 
                    ImageUrl="~/images/Buttons/search-off.png" onclick="ImageButtonFriendsSearch_Click" 
                    style="height: 30px" ValidationGroup="FriendsSearch" />
                <br />
                <asp:Panel ID="PanelFriendsSearchResult" runat="server" Visible="False">
                    <br />
                    <asp:Label ID="LabelFirstName" runat="server" CssClass="FormLabel" Text="&#1606;&#1575;&#1605;:"></asp:Label>
                    &nbsp;<asp:Label ID="LabelFriendsSearchFullName" runat="server" 
                        CssClass="FormStaticData"></asp:Label>
                    <br />
                    <asp:HiddenField ID="HiddenFieldFriendsSearchUserId" runat="server" />
                    <br />
                    <asp:Image ID="Image27" runat="server" Height="16px" 
                        ImageUrl="~/images/icons/mail16.png" Width="16px" />
                    <asp:LinkButton ID="LinkButtonFriendsRequest" runat="server" 
                        CssClass="MessageSender" onclick="LinkButtonFriendsRequest_Click">&#1575;&#1585;&#1587;&#1575;&#1604; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1575;&#1601;&#1586;&#1608;&#1583;&#1606; &#1576;&#1607; &#1583;&#1608;&#1587;&#1578;&#1575;&#1606;</asp:LinkButton>
                </asp:Panel>
                <br />
                <asp:Panel ID="PanelFriendsSearchNotFound" runat="server" Visible="False">
                    <asp:Label ID="LabelFriendsSearchNotFound0" runat="server" 
                        CssClass="FormValidation" 
                        Text="&#1601;&#1585;&#1583; &#1576;&#1575; &#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1608;&#1583;&#1607; &#1583;&#1585; &#1587;&#1575;&#1740;&#1578; &#1579;&#1576;&#1578; &#1606;&#1575;&#1605; &#1606;&#1705;&#1585;&#1583;&#1607; &#1575;&#1587;&#1578;."></asp:Label>
                    <br />
                    <br />
                    <asp:Image ID="Image26" runat="server" Height="16px" 
                        ImageUrl="~/images/icons/mail16.png" Width="16px" />
                    <asp:LinkButton ID="LinkButtonFriendsSearchInvite" runat="server" 
                        CssClass="MessageSender" onclick="LinkButtonFriendsSearchInvite_Click">&#1575;&#1585;&#1587;&#1575;&#1604; &#1583;&#1593;&#1608;&#1578;&#1606;&#1575;&#1605;&#1607;</asp:LinkButton>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="PanelFriendsSearchInvitationSent" runat="server" Visible="False">
                        <asp:Image ID="ImageSent" runat="server" Height="22px" 
                            ImageUrl="~/images/icons/check22.png" Width="22px" />
                        <asp:Label ID="LabelSent" runat="server" CssClass="SuccessMessage" 
                            Text="&#1662;&#1740;&#1594;&#1575;&#1605; &#1588;&#1605;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1575;&#1585;&#1587;&#1575;&#1604; &#1711;&#1585;&#1583;&#1740;&#1583;."></asp:Label>
                    </asp:Panel>
            <asp:Panel ID="PanelFriendsSearchError" runat="server" Visible="False">
                <asp:Label ID="LabelFriendsSearchErrorMessage" runat="server" 
                    CssClass="FormValidation"></asp:Label>
            </asp:Panel>
            </asp:Panel>
    </div>

</asp:Content>

