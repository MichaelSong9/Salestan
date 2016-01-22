<%@ Page Title="Salestan : &#1662;&#1588;&#1578;&#1740;&#1576;&#1575;&#1606;&#1740;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Support" %><%@ Register src="NumCaptcha.ascx" tagname="Captcha" tagprefix="Controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" align="right">
        <asp:Panel ID="PanelUser" runat="server">
    <div style=" direction:rtl;">
        <br />
                <div class="ShowHidePanel1">
                    <asp:Image ID="Image33" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/support24.png" Width="24px" />
                    <asp:LinkButton ID="LinkButtonHistory" runat="server" 
                        CssClass="MessageSender" onclick="LinkButtonHistory_Click"
                 >&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1607;&#1575;&#1740; &#1711;&#1584;&#1588;&#1578;&#1607;</asp:LinkButton>
                    &nbsp;<asp:Label ID="LabelRequestsNewCount" runat="server" CssClass="FormValidation" 
                        Text="(1 &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1662;&#1575;&#1587;&#1582; &#1583;&#1575;&#1583;&#1607; &#1588;&#1583;&#1607;)"></asp:Label>
                    <asp:Panel ID="PanelHistory" runat="server" Visible="False" Width="100%">
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceRequests" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_supportRequestsUser" 
                    SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="UserId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
                        <ItemStyle Width="200px" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField HeaderText="&#1608;&#1590;&#1593;&#1740;&#1578; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;" 
                        DataImageUrlField="Status" SortExpression="Status" 
                        DataImageUrlFormatString="~/images/TypesImages/SupportStatus{0}.png">
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
                        <asp:Panel ID="PanelRequestInfo" runat="server" Visible="False" Width="100%">
                            <table class="style1" style="direction: rtl; width: 100%;">
                                <tr>
                                    <td class="style3" colspan="2">
                                        <table class="style1" style="direction: rtl;">
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
                                                    <asp:Label ID="Label123" runat="server" CssClass="FormLabel" 
                                                        Text="&#1608;&#1590;&#1593;&#1740;&#1578; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="ImageRequestStatus" runat="server" Height="24px" Width="100px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2" style="width: 50%">
                                        <asp:Label ID="Label118" runat="server" CssClass="FormLabel" Text="&#1605;&#1705;&#1575;&#1604;&#1605;&#1607;:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="TextBoxConversation" runat="server" CssClass="FormData" 
                                            Height="150px" ReadOnly="True" Text='<%# Eval("Comment") %>' 
                                            TextMode="MultiLine" Width="95%"></asp:TextBox>
                                    </td>
                                    <td style="width: 50%">
                                        <asp:Label ID="Label117" runat="server" AssociatedControlID="TextBoxAnswer" 
                                            CssClass="FormLabel" Text="&#1662;&#1575;&#1587;&#1582;:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="TextBoxAnswer" runat="server" CssClass="TextBoxMultiR2L" 
                                            Height="150px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2" colspan="2" style="text-align: left;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 50%; text-align: right">
                                                    <asp:ImageButton ID="ImageButtonAnswer" runat="server" 
                                                        ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonAnswer_Click" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:ImageButton ID="ImageButtonArchive" runat="server" 
                                                        ImageUrl="~/images/Buttons/archive-off.png" 
                                                        onclick="ImageButtonArchive_Click" />
                                                </td>
                                                <td style="width: 50%; text-align: left">
                                                    <asp:ImageButton ID="ImageButtonDelete" runat="server" 
                                                        ImageUrl="~/images/Buttons/delete-off.png" onclick="ImageButtonDelete_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2" colspan="2" style="text-align: center;">
                                        <hr />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </div>
    </div>
        </asp:Panel>
    <div style=" direction:rtl;">
    <div class="ShowHidePanel1">
                    <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/submit22.png" Width="24px" />
                    <asp:LinkButton ID="LinkButtonSend" runat="server" CssClass="MessageSender" onclick="LinkButtonSend_Click"
                 >&#1575;&#1585;&#1587;&#1575;&#1604; &#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;</asp:LinkButton>
                    <asp:Panel ID="PanelSend" runat="server" Visible="False" Width="100%">
                        <br />
                        <asp:Label ID="Label2" runat="server" CssClass="FormLabel" 
                    Text="&#1587;&#1591;&#1581; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740; &#1588;&#1605;&#1575;:"></asp:Label>
&nbsp;
                <asp:Image ID="ImageUserTpe" runat="server" Height="24px" Width="60px" />
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" CssClass="FormLabel" 
                    Text="&#1604;&#1591;&#1601;&#1575;&#1611; &#1740;&#1705;&#1740; &#1575;&#1586; &#1605;&#1608;&#1590;&#1608;&#1593;&#1575;&#1578; &#1586;&#1740;&#1585; &#1585;&#1575; &#1575;&#1606;&#1578;&#1582;&#1575;&#1576; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewTopics" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="550px" 
                    DataKeyNames="TopicId" DataSourceID="SqlDataSourceTopics" 
                    ShowHeader="False" 
                    onselectedindexchanged="GridViewTopics_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ButtonType="Image" ShowSelectButton="True" 
                            SelectImageUrl="~/images/icons/selectLeft24.png">
                        <ItemStyle Width="50px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Topic" 
                            HeaderText="&#1605;&#1608;&#1590;&#1608;&#1593;">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Right" Width="500px" />
                        </asp:BoundField>
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
                <asp:SqlDataSource ID="SqlDataSourceTopics" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    
                    SelectCommand="sp_supportTopicsByUserType" 
                    DeleteCommand="sp_offersCategoryDelete" 
                    DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="UserType" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Panel ID="PanelRequest" runat="server" Visible="False">
                    <asp:Label ID="LabelPrivacy0" runat="server" CssClass="FormLabel" Text="&#1605;&#1608;&#1590;&#1608;&#1593;:"></asp:Label>
                    &nbsp;<asp:Label ID="LabelTopic" runat="server" CssClass="FormLabel"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="LabelDescriptions" runat="server" CssClass="FormLabel"></asp:Label>
                    <br />
                    <br />
                    <table class="style1" style="direction:rtl;">
                        <tr>
                            <td class="style2" style="vertical-align:top;">
                                <asp:Label ID="LabelPrivacy" runat="server" 
                                    AssociatedControlID="TextBoxRequest" CssClass="FormLabel" Text="&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578;:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxRequest" runat="server" 
                                    CssClass="TextBoxMultiRequiredR2L" Height="150px" TextMode="MultiLine" 
                                    Width="500px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName3" runat="server" 
                                    ControlToValidate="TextBoxRequest" CssClass="FormValidation" 
                                    ErrorMessage="&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Request"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" style="vertical-align:top;">
                                &nbsp;</td>
                            <td>
                                <Controls:Captcha ID="captcha" runat="server" CalcMode="1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" style="vertical-align:top;">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style6">
                                <asp:ImageButton ID="ImageButtonRequest" runat="server" 
                                    ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonRequest_Click" 
                                    ValidationGroup="Request" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="PanelSent" runat="server" Visible="False">
                    <asp:Image ID="ImageSent" runat="server" 
                        ImageUrl="~/images/icons/check22.png" />
                    <asp:Label ID="LabelSent" runat="server" 
    CssClass="SuccessMessage" Text="&#1583;&#1585;&#1582;&#1608;&#1575;&#1587;&#1578; &#1662;&#1588;&#1578;&#1740;&#1576;&#1575;&#1606;&#1740; &#1588;&#1605;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1575;&#1585;&#1587;&#1575;&#1604; &#1711;&#1585;&#1583;&#1740;&#1583;."></asp:Label>
                    <br />
                </asp:Panel>
                
                <asp:HiddenField ID="HiddenFieldUserType" runat="server" />
                
            </td>
        </tr>
    </table>


                
                
</asp:Content>

