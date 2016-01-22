<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminSupport.aspx.cs" Inherits="AdminSupport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/admin/support32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1662;&#1588;&#1578;&#1740;&#1576;&#1575;&#1606;&#1740;"></asp:Label>
        <br />
    <div class="ShowHidePanel1">
        <asp:Image ID="Image3" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/support24.png" Width="24px" />
        <asp:LinkButton ID="LinkButtonRequests" runat="server" CssClass="MessageSender" onclick="LinkButtonRequests_Click"
                 >&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1607;&#1575;</asp:LinkButton>
            &nbsp;<asp:Label ID="LabelRequestsNewCount" runat="server" CssClass="FormValidation" 
                Text="(1 &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1662;&#1575;&#1587;&#1582; &#1583;&#1575;&#1583;&#1607; &#1606;&#1588;&#1583;&#1607;)"></asp:Label>
        <br />
        <asp:Panel ID="PanelRequests" runat="server" Visible="False" Width="100%">
            <asp:SqlDataSource ID="SqlDataSourceRequests" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_supportRequestsPending" 
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <br />
            <asp:Label ID="LabelRequestsNoRecord" runat="server" CssClass="FormValidation" 
                Text="&#1607;&#1740;&#1670; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1662;&#1588;&#1578;&#1740;&#1576;&#1575;&#1606;&#1740; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1579;&#1576;&#1578; &#1606;&#1588;&#1583;&#1607; &#1575;&#1587;&#1578;." Visible="False"></asp:Label>
            <asp:GridView ID="GridViewRequests" runat="server" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RequestId" 
                DataSourceID="SqlDataSourceRequests" ForeColor="#333333" GridLines="None" 
                Width="875px" 
                onselectedindexchanged="GridViewRequests_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;" 
                        DataField="RequestId" SortExpression="RequestId">
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;" SortExpression="SubmitDate">
                        <ItemStyle Width="150px" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField HeaderText="&#1587;&#1591;&#1581; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;" 
                        DataImageUrlField="UserType" SortExpression="UserType" 
                        DataImageUrlFormatString="~/images/TypesImages/SupportUserType{0}.png">
                        <ItemStyle HorizontalAlign="Center" Width="125px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="Topic" HeaderText="&#1605;&#1608;&#1590;&#1608;&#1593;" 
                        SortExpression="Topic">
                    <ItemStyle Width="400px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="&#1606;&#1605;&#1575;&#1740;&#1588;" SelectText="&#1606;&#1605;&#1575;&#1740;&#1588;" ShowSelectButton="True">
                    <ControlStyle CssClass="NormalLink" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
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
            <asp:Panel ID="PanelRequest" runat="server" Visible="False" Width="100%">
                    <table class="style1" style="direction:rtl; width: 100%;">
                        <tr>
                            <td colspan="2" class="style3">
                                <table class="style1" style="direction:rtl;">
                                    <tr>
                                        <td class="style2">
                                            <asp:Label ID="Label129" runat="server" CssClass="FormLabel" 
                                                Text="&#1588;&#1606;&#1575;&#1587;&#1607; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelRequestRequestId" runat="server" CssClass="FormLabel"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            <asp:Label ID="Label123" runat="server" CssClass="FormLabel" Text="&#1587;&#1591;&#1581; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="ImageRequestUserType" runat="server" Height="24px" 
                                                Width="60px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            <asp:Label ID="Label124" runat="server" CssClass="FormLabel" 
                                                Text="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelRequestUserId" runat="server" CssClass="FormLabel"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" style="width: 50%">
                                <asp:Label ID="Label118" runat="server" CssClass="FormLabel" Text="&#1605;&#1705;&#1575;&#1604;&#1605;&#1607;:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBoxConversation" runat="server" Height="150px" ReadOnly="True" 
                                CssClass="FormData" TextMode="MultiLine" Width="95%" 
                                    Text='<%# Eval("Comment") %>'></asp:TextBox>
                            </td>
                            <td style="width: 50%">
                                <asp:Label ID="Label117" runat="server" CssClass="FormLabel" 
                                    Text="&#1662;&#1575;&#1587;&#1582;:" AssociatedControlID="TextBoxAnswer"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBoxAnswer" runat="server" Height="150px" 
                                CssClass="TextBoxMultiR2L" TextMode="MultiLine" Width="95%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align:left;" colspan="2" class="style2">
                            <table style="width: 100%">
	                            <tr>
		                            <td style="width: 50%; text-align: right">
                                        <asp:ImageButton ID="ImageButtonAnswer1" runat="server" 
                                            ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonAnswer_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButtonArchive" runat="server" 
                                            ImageUrl="~/images/Buttons/archive-off.png" 
                                            onclick="ImageButtonArchive_Click" />
                                    </td>
		                            <td style="width: 50%; text-align: left">
                                        <asp:ImageButton ID="ImageButtonDelete" runat="server" 
                                            ImageUrl="~/images/Buttons/delete-off.png" 
                                            onclick="ImageButtonDelete_Click" />
                                    </td>
	                            </tr>
                            </table>
                                </td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="2" style="text-align:center;">
                                <hr />
                            </td>
                        </tr>
                    </table>
            </asp:Panel>
        </asp:Panel>
    </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image4" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/categories24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonTopics" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonTopics_Click"
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1608;&#1590;&#1608;&#1593;&#1575;&#1578;</asp:LinkButton>
            <asp:Panel ID="PanelTopics" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewTopics" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="675px" 
                    DataKeyNames="TopicId" DataSourceID="SqlDataSourceTopics">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField HeaderText="&#1587;&#1591;&#1581; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;" 
                            DataImageUrlField="UserType" SortExpression="UserType" 
                            DataImageUrlFormatString="~/images/TypesImages/SupportUserType{0}.png">
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Sort" HeaderText="&#1578;&#1585;&#1578;&#1740;&#1576;" 
                            SortExpression="Sort">
                        <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Topic" HeaderText="&#1605;&#1608;&#1590;&#1608;&#1593;" 
                            SortExpression="Topic">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Right" Width="400px" />
                        </asp:BoundField>
                        <asp:HyperLinkField HeaderText="&#1578;&#1594;&#1740;&#1740;&#1585;" 
                            Text="&#1578;&#1594;&#1740;&#1740;&#1585;" DataNavigateUrlFields="TopicId" 
                            DataNavigateUrlFormatString="~/AdminPages/Support.aspx?Mode=EditTopic&amp;TopicId={0}" 
                            Target="_blank">
                        <ControlStyle CssClass="NormalLink" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:HyperLinkField>
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/images/icons/delete16.png" HeaderText="&#1581;&#1584;&#1601;" 
                            ShowDeleteButton="True">
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
                <asp:SqlDataSource ID="SqlDataSourceTopics" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    
                    SelectCommand="sp_supportTopics" 
                    DeleteCommand="sp_offersCategoryDelete" 
                    DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" class="style2">
                            <asp:Image ID="Image27" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/add16.png" Width="16px" />
                            <asp:Label ID="Label7" runat="server" CssClass="FormData" 
                                Text="&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1605;&#1608;&#1590;&#1608;&#1593;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelTopicsUserType" runat="server" 
                                AssociatedControlID="DropDownListTopicsUserType" CssClass="FormLabel" 
                                Text="&#1587;&#1591;&#1581; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;:"></asp:Label>
                        </td>
                        <td>
                                <asp:DropDownList ID="DropDownListTopicsUserType" runat="server" 
                                    CssClass="DropDownRequiredR2L" TabIndex="8">
                                    <asp:ListItem Value="0">&#1605;&#1607;&#1605;&#1575;&#1606;</asp:ListItem>
                                    <asp:ListItem Value="1">&#1593;&#1590;&#1608;</asp:ListItem>
                                    <asp:ListItem Value="2">&#1575;&#1583;&#1605;&#1740;&#1606;</asp:ListItem>
                                </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelTopicsSort" runat="server" 
                                AssociatedControlID="TextBoxTopicsSort" CssClass="FormLabel" 
                                Text="&#1578;&#1585;&#1578;&#1740;&#1576;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTopicsSort" runat="server" 
                                ValidationGroup="Category" Width="50px" CssClass="TextBoxRequiredR2L"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationName" 
                                runat="server" ControlToValidate="TextBoxTopicsSort" 
                                CssClass="FormValidation" ErrorMessage="&#1578;&#1585;&#1578;&#1740;&#1576; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Topics"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelTopicsTopic" runat="server" 
                                AssociatedControlID="TextBoxTopicsTopic" CssClass="FormLabel" Text="&#1605;&#1608;&#1590;&#1608;&#1593;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTopicsTopic" runat="server" 
                                CssClass="TextBoxRequiredR2L" ValidationGroup="Category" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationName0" 
                                runat="server" ControlToValidate="TextBoxTopicsTopic" CssClass="FormValidation" 
                                ErrorMessage="&#1605;&#1608;&#1590;&#1608;&#1593; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Topics"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;" class="style2">
                            <asp:Label ID="LabelTopicsDescriptions" runat="server" 
                                AssociatedControlID="TextBoxTopicsDescriptions" CssClass="FormLabel" 
                                Text="&#1578;&#1608;&#1590;&#1740;&#1581;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTopicsDescriptions" runat="server" 
                                CssClass="TextBoxMultiR2L" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonTopicsAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Topics" onclick="ImageButtonTopicsAdd_Click"
                                 />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="LabelAddTopicMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        </asp:Content>

