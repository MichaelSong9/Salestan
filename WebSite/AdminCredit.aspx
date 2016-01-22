<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminCredit.aspx.cs" Inherits="AdminCredit" %>

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
        .FormStaticData
        {
            font-family: Tahoma;
            font-size: 14px;
            color:Gray;
        }
        </style>
        	<script type="text/javascript">
        	    jq14(document).ready(function () {
        	        jq14("#log").fancybox({
        	            'titlePosition': 'inside',
        	            'transitionIn': 'elastic',
        	            'transitionOut': 'elastic',
        	            'type': 'iframe',
        	            'width': '9',
        	            'height': '6'
        	        });
        	        jq14("#userlog").fancybox({
        	            'titlePosition': 'inside',
        	            'transitionIn': 'elastic',
        	            'transitionOut': 'elastic',
        	            'type': 'iframe',
        	            'width': '9',
        	            'height': '6'
        	        });
        	    });
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/credit24.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;"></asp:Label>
        <br />
        <br />
    </div>
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/user_woman24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonUsers" runat="server" CssClass="MessageSender" onclick="LinkButtonUsers_Click"
                 >&#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:LinkButton>
            <asp:Panel ID="PanelUsers" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewCredit" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="900px" AllowSorting="True" 
                    DataSourceID="SqlDataSourceCredit">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;" 
                            DataField="UserId" SortExpression="UserId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605;" DataField="FullName" 
                            SortExpression="FullName" >
                        <ItemStyle Width="225px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1605;&#1608;&#1580;&#1608;&#1583;" 
                            DataField="Credit" SortExpression="Credit" >
                        <ItemStyle Width="125px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;" 
                            DataField="GiftCredit" SortExpression="GiftCredit" >
                        <ItemStyle Width="125px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;" 
                            DataField="SpentCredit" SortExpression="SpentCredit" >
                        <ItemStyle Width="125px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;" 
                            DataField="SpentGift" SortExpression="SpentGift" >
                        <ItemStyle Width="125px" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="UserId" 
                            DataNavigateUrlFormatString="~/AdminPages/Credit.aspx?Mode=UserLog&amp;UserId={0}" 
                            HeaderText="&#1601;&#1575;&#1740;&#1604; &#1604;&#1575;&#1711;" 
                            Text="&#1601;&#1575;&#1740;&#1604; &#1604;&#1575;&#1711;" Target="_blank">
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
                <asp:SqlDataSource ID="SqlDataSourceCredit" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_usersCreditInfo" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/credit24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonManage" runat="server" CssClass="MessageSender" onclick="LinkButtonManage_Click"
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelSearchId" runat="server" 
                                AssociatedControlID="TextBoxManageUserId" CssClass="FormLabel" 
                                
                                
                                
                                Text="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;:"></asp:Label>
                        </td>
                        <td>
                            <ContentTemplate>
                                <asp:TextBox ID="TextBoxManageUserId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    Width="75px"></asp:TextBox>
                                &nbsp;
                                <asp:ImageButton ID="ImageButtonManage" runat="server" 
                                    ImageUrl="~/images/Buttons/check-off.png" 
                                    onclick="ImageButtonManage_Click" ValidationGroup="Manage" />
                                &nbsp;<asp:Label ID="LabelMessage" runat="server" CssClass="ErrorMessage" 
                                    Visible="False">&#1705;&#1575;&#1585;&#1576;&#1585; &#1576;&#1575; &#1588;&#1606;&#1575;&#1587;&#1607; &#1608;&#1575;&#1585;&#1583; &#1588;&#1583;&#1607; &#1605;&#1608;&#1580;&#1608;&#1583; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;.</asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserId" runat="server" 
                                    ControlToValidate="TextBoxManageUserId" CssClass="FormValidation" 
                                    ErrorMessage="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Manage"></asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </td>
                    </tr>
                    </table>
                    <asp:Panel runat="server" ID="PanelManageUser" Visible="false">
                    <table class="style1" style="direction:rtl;">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelName" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1606;&#1575;&#1605;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelManageName" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label24" runat="server" CssClass="FormLabel" 
                                Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1605;&#1608;&#1580;&#1608;&#1583;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelManageActiveCredit" runat="server" CssClass="FormLabel"></asp:Label>
                            &nbsp;<asp:ImageButton ID="ImageButtonManageCreditEdit" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/edit16.png" 
                                Width="16px" onclick="ImageButtonManageCreditEdit_Click" />
                            &nbsp;<asp:TextBox ID="TextBoxManageCredit" runat="server" CssClass="TextBoxRequiredL2R" 
                                Visible="False" Width="50px"></asp:TextBox>
                            &nbsp;<asp:ImageButton ID="ImageButtonManageMinus" runat="server" Height="22px" 
                                ImageUrl="~/images/icons/minus22.png" onclick="ImageButtonManageMinus_Click" 
                                Visible="False" Width="22px" ValidationGroup="Credit" />
                            &nbsp;<asp:ImageButton ID="ImageButtonManagePlus" runat="server" Height="22px" 
                                ImageUrl="~/images/icons/plus22.png" onclick="ImageButtonManagePlus_Click" 
                                Visible="False" Width="22px" ValidationGroup="Credit" />
                            &nbsp;&nbsp;<asp:ImageButton ID="ImageButtonManageCancel" runat="server" 
                                ImageUrl="~/images/icons/cancel24.png" onclick="ImageButtonManageCancel_Click" 
                                Visible="False" />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorCredit" runat="server" 
                                ControlToValidate="TextBoxManageCredit" CssClass="FormValidation" 
                                ErrorMessage="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1605;&#1608;&#1585;&#1583; &#1606;&#1592;&#1585; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1705;&#1606;&#1740;&#1583;." ValidationGroup="Credit"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label25" runat="server" CssClass="FormLabel" 
                                Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelManageGiftCredit" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label27" runat="server" CssClass="FormLabel" 
                                Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelManageSpentCredit" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label28" runat="server" CssClass="FormLabel" 
                                Text="&#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelManageSpentGift" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                             &nbsp;</td>
                        <td class="style6">
                            <a class="NormalLink" id="userlog" href="AdminPages/Credit.aspx?Mode=UserLog&UserId=<% Response.Write(TextBoxManageUserId.Text); %>">
                            &#1587;&#1575;&#1576;&#1602;&#1607; &#1578;&#1585;&#1575;&#1705;&#1606;&#1588; &#1607;&#1575;</a></td>
                    </tr>
                </table>
                </asp:Panel>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image4" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/request24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonRequests" runat="server" CssClass="MessageSender" onclick="LinkButtonRequests_Click"
                 >&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1607;&#1575;&#1740; &#1575;&#1601;&#1586;&#1575;&#1740;&#1588; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:LinkButton>
            <asp:Label ID="LabelRequestsNewCount" runat="server" CssClass="FormValidation" 
                Text="(1 &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1662;&#1575;&#1587;&#1582; &#1583;&#1575;&#1583;&#1607; &#1606;&#1588;&#1583;&#1607;)"></asp:Label>
            <br />
            <asp:Panel ID="PanelRequests" runat="server" Visible="False" Width="100%">
                <br />
                <asp:Repeater ID="RepeaterRequests" runat="server" 
                    DataSourceID="SqlDataSourceRequests" 
                    onitemcommand="RepeaterRequests_ItemCommand">
                <HeaderTemplate>
                    <table class="style1" style="direction:rtl;">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label31" runat="server" CssClass="FormLabel" 
                                Text="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;:"></asp:Label>
                        </td>
                        <td>
                             <asp:Label ID="LabelRequstUserId" runat="server" CssClass="FormLabel" Text='<%# Eval("UserId") %>'></asp:Label>
                        </td>
                    </tr>
                    </table>
                    <table class="style1" style="direction:rtl;">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1606;&#1575;&#1605;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelRequestUserName" runat="server" CssClass="FormLabel" Text='<%# Eval("UserName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label5" runat="server" CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelRequestDate" runat="server" CssClass="FormLabel" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label9" runat="server" CssClass="FormLabel" 
                                Text="&#1606;&#1608;&#1593;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelRequestType" runat="server" CssClass="FormLabel" Text='<%# Eval("Type") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label11" runat="server" CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1606;&#1578;&#1602;&#1575;&#1604;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelRequestTransactionDate" runat="server" CssClass="FormLabel" Text='<%# Eval("Date") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label13" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1576;&#1604;&#1594;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelRequestCredit" runat="server" CssClass="FormLabel" Text='<%# Eval("Credit") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label29" runat="server" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1608;&#1575;&#1585;&#1740;&#1586;&#1705;&#1606;&#1606;&#1583;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelRequestName" runat="server" CssClass="FormLabel" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                    </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label32" runat="server" CssClass="FormLabel" 
                                    Text="&#1705;&#1575;&#1585;&#1578;/&#1588;&#1605;&#1575;&#1585;&#1607; &#1581;&#1587;&#1575;&#1576;:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelRequestNumber" runat="server" CssClass="FormLabel" Text='<%# Eval("Number") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label33" runat="server" CssClass="FormLabel" 
                                    Text="&#1605;&#1576;&#1604;&#1594; &#1578;&#1575;&#1740;&#1740;&#1583;&#1740;:" 
                                    AssociatedControlID="TextBoxRequestVerifiedCredit"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxRequestVerifiedCredit" runat="server" 
                                    CssClass="TextBoxRequiredL2R" Visible="true" 
                                    Width="50px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label34" runat="server" CssClass="FormLabel" 
                                    Text="&#1605;&#1578;&#1606;:" AssociatedControlID="TextBoxRequestText"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxRequestText" runat="server" CssClass="TextBoxR2L" Visible="true" 
                                    Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                    <tr>
                        <td class="style5">
                             &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonRequestReject" runat="server" Height="32px" 
                                Width="32px" ImageUrl="~/images/icons/thumb_down32.png" 
                                CommandArgument='<%# Eval("RecordId") %>' CommandName="RequestReject" />
                            &nbsp; &nbsp;<asp:ImageButton ID="ImageButtonRequestVerify" runat="server" Height="32px" 
                                Width="32px" ImageUrl="~/images/icons/thumb_up32.png"  
                                CommandArgument='<%# Eval("RecordId") %>' CommandName="RequestVerify" 
                                ValidationGroup="Request"/>
                            </td>
                    </tr>
                        <tr>
                            <td colspan="2">
                                <hr />
                            </td>
                        </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSourceRequests" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_creditRequestsPending" 
                    SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image1" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/clock24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonLog" runat="server" CssClass="MessageSender" onclick="LinkButtonLog_Click" 
                 >&#1604;&#1575;&#1711; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelLog" runat="server" Visible="False" Width="100%">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td style="text-align:center;">
                            <a ID="log" class="NormalLink" 
                                href="AdminPages/Credit.aspx?Mode=Log">&#1606;&#1605;&#1575;&#1740;&#1588; &#1601;&#1575;&#1740;&#1604; &#1604;&#1575;&#1711;</a></td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image3" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/stats24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonStats" runat="server" CssClass="MessageSender" onclick="LinkButtonStats_Click"
                 >&#1570;&#1605;&#1575;&#1585; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelStats" runat="server" Visible="False" Width="100%">
                <br />
                <table style="direction:rtl; width: 100%;">
                    <tr>
                        <td colspan="4" style="text-align:center;">
                            <asp:Image ID="ImageStatsRefresh" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonStatsRefresh" runat="server" 
                                CssClass="NormalLink" onclick="LinkButtonStatsRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1570;&#1605;&#1575;&#1585;</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label14" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1570;&#1582;&#1585;&#1740;&#1606; &#1576;&#1607; &#1585;&#1608;&#1586;&#1585;&#1587;&#1575;&#1606;&#1740;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsDate" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label7" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1605;&#1608;&#1580;&#1608;&#1583;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsActiveCredit" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label18" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsActiveCreditAverage" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label8" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsGiftCredit" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label20" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsGiftCreditAverage" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label16" runat="server" CssClass="FormLabel" 
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentCredit" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label22" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentCreditAverage" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 25%">
                            <asp:Label ID="Label17" runat="server" CssClass="FormLabel" 
                                Text="&#1580;&#1605;&#1593; &#1575;&#1593;&#1578;&#1576;&#1575;&#1585; &#1607;&#1583;&#1740;&#1607; &#1582;&#1585;&#1580; &#1588;&#1583;&#1607;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentGift" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="Label23" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1740;&#1575;&#1606;&#1711;&#1740;&#1606; &#1576;&#1585;&#1575;&#1740; &#1607;&#1585; &#1606;&#1601;&#1585;:"></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="LabelStatsSpentGiftAverage" runat="server" CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

