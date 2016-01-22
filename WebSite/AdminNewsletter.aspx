<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminNewsletter.aspx.cs" Inherits="AdminNewsletter" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/admin/newsletter32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1582;&#1576;&#1585;&#1606;&#1575;&#1605;&#1607;"></asp:Label>
        <br />
        <br />
    </div>
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/controlpanel/menu/information24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonSend" runat="server" CssClass="MessageSender" onclick="LinkButtonSend_Click" 
                 >&#1575;&#1585;&#1587;&#1575;&#1604; &#1582;&#1576;&#1585;&#1606;&#1575;&#1605;&#1607;</asp:LinkButton>
            <asp:Panel ID="PanelSend" runat="server" Visible="False" Width="100%">
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelAbout" runat="server" CssClass="FormLabel" 
                                        
                                Text="&#1583;&#1585;&#1740;&#1575;&#1601;&#1578; &#1705;&#1606;&#1606;&#1583;&#1711;&#1575;&#1606;:" 
                                AssociatedControlID="RadioButtonListReceivers"></asp:Label>
                            <br />
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListReceivers" runat="server" 
                                AutoPostBack="True" CssClass="FormLabel" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="members">&#1607;&#1605;&#1607; &#1575;&#1593;&#1590;&#1575;</asp:ListItem>
                                <asp:ListItem Value="email">&#1601;&#1607;&#1585;&#1587;&#1578; &#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740;</asp:ListItem>
                                <asp:ListItem Value="offers" Selected="True">&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;" class="style2">
                            <asp:Label ID="LabelPrivacy0" runat="server" CssClass="FormLabel" 
                                        
                                        
                                        Text="&#1601;&#1585;&#1605;&#1578;:" AssociatedControlID="RadioButtonListFormat"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListFormat" runat="server" 
                                AutoPostBack="True" CssClass="FormLabel" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">HTML</asp:ListItem>
                                <asp:ListItem>Text</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="vertical-align:top;">
                            <asp:Label ID="LabelPrivacy1" runat="server" CssClass="FormLabel" 
                                Text="&#1593;&#1606;&#1608;&#1575;&#1606;:" AssociatedControlID="TextBoxTitle"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="TextBoxRequiredR2L" TabIndex="17" 
                                Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName2" runat="server" 
                                ControlToValidate="TextBoxTitle" CssClass="FormValidation" 
                                
                                ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="vertical-align:top;">
                            <asp:Label ID="LabelPrivacy" runat="server" CssClass="FormLabel" 
                                Text="&#1605;&#1578;&#1606;:" AssociatedControlID="TextBoxBody"></asp:Label>
                            <br />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxBody" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                                Height="200px" TextMode="MultiLine" Width="580px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName3" runat="server" 
                                ControlToValidate="TextBoxBody" CssClass="FormValidation" 
                                ErrorMessage="&#1605;&#1578;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                                    &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonSend" runat="server" 
                                ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonSend_Click" 
                                ValidationGroup="Add" />
                            <asp:Label ID="LabelAddMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
             <asp:Image ID="Image1" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/clock24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonLog" runat="server" CssClass="MessageSender" 
                 onclick="LinkButtonLog_Click" TabIndex="16" 
                 >&#1587;&#1575;&#1576;&#1602;&#1607; &#1582;&#1576;&#1585;&#1606;&#1575;&#1605;&#1607; &#1607;&#1575;</asp:LinkButton>
             <br />
             <asp:Panel ID="PanelLog" runat="server" Visible="False" Width="100%">
                 <br />
                 <asp:Label ID="LabelLogNoRecord" runat="server" CssClass="FormValidation" 
                     Text="&#1607;&#1740;&#1670; &#1587;&#1575;&#1576;&#1602;&#1607; &#1575;&#1585;&#1587;&#1575;&#1604; &#1582;&#1576;&#1585;&#1606;&#1575;&#1605;&#1607; &#1575;&#1740; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1579;&#1576;&#1578; &#1606;&#1588;&#1583;&#1607; &#1575;&#1587;&#1578;." Visible="False"></asp:Label>
                 <asp:GridView ID="GridViewLog" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="700px" 
                     DataSourceID="SqlDataSourceLog">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="NewsletterId" HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;">
                         <ItemStyle HorizontalAlign="Center" Width="75px" />
                         </asp:BoundField>
                         <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;" SortExpression="SubmitDate">
                            <ItemStyle Width="175px" />
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:ImageField DataImageUrlField="ReceiversType" 
                             DataImageUrlFormatString="~/images/TypesImages/NewsletterReceivers{0}.png" 
                             
                             HeaderText="&#1583;&#1585;&#1740;&#1575;&#1601;&#1578; &#1705;&#1606;&#1606;&#1583;&#1711;&#1575;&#1606;">
                             <ItemStyle HorizontalAlign="Center" Width="100px" />
                         </asp:ImageField>
                         <asp:ImageField DataImageUrlField="Format" 
                             DataImageUrlFormatString="~/images/TypesImages/NewsletterFormat{0}.png" 
                             HeaderText="&#1601;&#1585;&#1605;&#1578;">
                             <ItemStyle HorizontalAlign="Center" Width="100px" />
                         </asp:ImageField>
                         <asp:BoundField DataField="ReceiversCount" 
                             HeaderText="&#1578;&#1593;&#1583;&#1575;&#1583; &#1583;&#1585;&#1740;&#1575;&#1601;&#1578; &#1705;&#1606;&#1606;&#1583;&#1711;&#1575;&#1606;">
                         <ItemStyle HorizontalAlign="Center" Width="150px" />
                         </asp:BoundField>
                         <asp:HyperLinkField HeaderText="&#1605;&#1588;&#1575;&#1607;&#1583;&#1607; &#1605;&#1578;&#1606;" 
                             Text="&#1605;&#1588;&#1575;&#1607;&#1583;&#1607; &#1605;&#1578;&#1606;" 
                             DataNavigateUrlFields="NewsletterId" 
                             
                             DataNavigateUrlFormatString="~/AdminPages/Newsletter.aspx?NewsletterId={0}" 
                             Target="_blank">
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
                 <asp:SqlDataSource ID="SqlDataSourceLog" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                     SelectCommand="sp_newsletters" SelectCommandType="StoredProcedure">
                 </asp:SqlDataSource>
             </asp:Panel>
         </div>
    </div>
</asp:Content>

