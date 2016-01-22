<%@ Page Title="Salestan : &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1607;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Requests.aspx.cs" Inherits="Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
    <asp:Panel ID="PanelRequests" runat="server" Width="100%">
        <br />
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                ImageUrl="~/images/icons/connections24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonFriends" runat="server" CssClass="MessageSender" Enabled="False" 
                >&#1583;&#1608;&#1587;&#1578;&#1575;&#1606;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelOffers" runat="server" Width="100%">
                <asp:Label ID="LabelFriendsNoRecord" runat="server" CssClass="FormValidation" 
                    
                    Text="&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;&#1740; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1579;&#1576;&#1578; &#1606;&#1588;&#1583;&#1607; &#1575;&#1587;&#1578;." 
                    Visible="False"></asp:Label>
                <br />
                <asp:GridView ID="GridViewFriends" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="RequestId" DataSourceID="SqlDataSourceFriends" 
                    GridLines="None" ShowHeader="False" Width="700px" 
                    onrowcommand="GridViewFriends_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="FullName" ShowHeader="False">
                        <ItemStyle Width="250px" CssClass="FormData" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" ShowHeader="False">
                        <ItemStyle Width="250px" CssClass="FormData" />
                        </asp:BoundField>
                        <asp:TemplateField ItemStyle-BorderStyle="None" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonCommentVerify" runat="server" Height="30px" 
                                Width="80px" ImageUrl="~/images/Buttons/accept-off.png"  CommandArgument='<%# Eval("RequestId") %>' CommandName="FriendsAccept"/>
                                &nbsp; &nbsp;<asp:ImageButton ID="ImageButtonCommentReject" runat="server" Height="30px" 
                                Width="80px" ImageUrl="~/images/Buttons/reject-off.png" CommandArgument='<%# Eval("RequestId") %>' CommandName="FriendsReject"/>
                            </ItemTemplate>
                            <ItemStyle BorderStyle="None" Width="200px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceFriends" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_requestsConnectionsFriends" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
            <asp:Repeater ID="Repeater1" runat="server" Visible="False">
            <ItemTemplate>
                    <table cellpadding="0" cellspacing="0" style="width: 100%">
	                    <tr>
		                    <td class="style1">
                                <asp:Image ID="ImageRequestImage" runat="server" Height="16px" Width="16px" 
                                    ImageUrl="~/images/mainicons/offers16.png" />
                                <asp:Label ID="LabelRequestType" runat="server" CssClass="FormLabel">&#1606;&#1592;&#1585;&#1587;&#1606;&#1580;&#1740; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1608;&#1740;&#1688;&#1607; &#1582;&#1585;&#1740;&#1583;&#1575;&#1585;&#1740; &#1588;&#1583;&#1607;</asp:Label>
                                &nbsp;-&nbsp;<asp:Label ID="LabelRequestTitle" runat="server" 
                                    CssClass="FormLabel">&#1576;&#1587;&#1578;&#1607; &#1606;&#1585;&#1605; &#1575;&#1601;&#1586;&#1575;&#1585;&#1740; Best</asp:Label>
                                &nbsp;&nbsp;</td>
	                    </tr>
	                    <tr>
		                    <td style="padding-right:20px;">
                                <asp:Image ID="Image28" runat="server" Height="16px" Width="16px" 
                                    ImageUrl="~/images/icons/check16.png" />
                                <a ID="invitelist0" class="NormalLink" href="Actions/Request.aspx">&#1662;&#1575;&#1587;&#1582; &#1576;&#1607; 
                                &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;</a> &nbsp;<asp:Image 
                                    ID="Image26" runat="server" Height="16px" 
                                    Width="16px" ImageUrl="~/images/icons/gift16.png" />
                                <asp:Label ID="LabelGift" runat="server" CssClass="InlineText" 
                                    Text="&#1580;&#1575;&#1740;&#1586;&#1607;: 1000 &#1578;&#1608;&#1605;&#1575;&#1606; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;"></asp:Label>
                    &nbsp;
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="16px" 
                                    ImageUrl="~/images/icons/delete16.png" ToolTip="&#1581;&#1584;&#1601; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;" Width="16px" />
                            </td>
	                    </tr>
	                    <tr>
		                    <td>&nbsp;</td>
	                    </tr>
                    </table>
            </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
        </div>
</asp:Content>

