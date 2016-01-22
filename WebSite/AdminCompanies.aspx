<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1588;&#1575;&#1594;&#1604;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminCompanies.aspx.cs" Inherits="AdminCompanies" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/icons/suitcase32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1588;&#1575;&#1594;&#1604;"></asp:Label>
        <br />
        <br />
    </div>
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/suitcase24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonManage" runat="server" CssClass="MessageSender" onclick="LinkButtonManage_Click" 
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1588;&#1575;&#1594;&#1604;</asp:LinkButton>
            <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewCompanies" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="900px" 
                    DataSourceID="SqlDataSourceCompanies" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;" 
                            DataField="CompanyId" SortExpression="CompanyId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1601;&#1585;&#1608;&#1588;&#1711;&#1575;&#1607;" 
                            DataField="Name" SortExpression="Name" >
                        <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:HyperLinkField HeaderText="&#1605;&#1583;&#1740;&#1585;" 
                            DataNavigateUrlFields="OwnerId" DataTextField="OwnerName" 
                            DataNavigateUrlFormatString="~/AdminPages/Users.aspx?Mode=Info&amp;UserId={0}" 
                            SortExpression="OwnerName" Target="_blank" >
                        <ControlStyle CssClass="NormalLink" />
                        <ItemStyle Width="200px" HorizontalAlign="Center" />
                        </asp:HyperLinkField>
                        <asp:BoundField HeaderText="&#1606;&#1608;&#1593;" DataField="TypeName" 
                            SortExpression="TypeName" >
                        <ItemStyle Width="75px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1586;&#1605;&#1740;&#1606;&#1607;" 
                            DataField="FieldName" SortExpression="FieldName">
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1740;&#1580;&#1575;&#1583;" SortExpression="MemberSince">
                                        <ItemStyle Width="150px" />
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("MemberSince")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="CompanyId" 
                            DataNavigateUrlFormatString="~/AdminPages/Companies.aspx?Mode=Info&amp;CompanyId={0}" 
                            
                            HeaderText="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;" 
                            Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1605;&#1604;" 
                            Target="_blank">
                        <ControlStyle CssClass="NormalLink" />
                        <ItemStyle Width="100px" />
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
                <asp:SqlDataSource ID="SqlDataSourceCompanies" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    
                    
                    SelectCommand="sp_companies" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/add24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonAdd" runat="server" CssClass="MessageSender" onclick="LinkButtonAdd_Click" 
                 >&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1605;&#1588;&#1575;&#1594;&#1604;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelAdd" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1601;&#1585;&#1608;&#1588;&#1711;&#1575;&#1607;"></asp:Label>
                </td>
            </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocation" runat="server" 
                                AssociatedControlID="CheckBoxListLocations" CssClass="FormLabel" 
                                Text="&#1605;&#1608;&#1602;&#1593;&#1740;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSourceLocations" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                SelectCommand="sp_locations" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                            <asp:CheckBoxList ID="CheckBoxListLocations" runat="server" 
                                CssClass="FormLabel" DataSourceID="SqlDataSourceLocations" 
                                DataTextField="LocationName" DataValueField="LocationId">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelOwnerId" runat="server" 
                                AssociatedControlID="TextBoxOwnerId" CssClass="FormLabel" 
                                Text="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740; &#1605;&#1583;&#1740;&#1585;:"></asp:Label>
                        </td>
                        <td>
                            <ContentTemplate>
                                <asp:TextBox ID="TextBoxOwnerId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    Width="75px"></asp:TextBox>
                                &nbsp;<asp:ImageButton ID="ImageButtonOwner" runat="server" 
                                    ImageUrl="~/images/Buttons/check-off.png" ValidationGroup="Owner" 
                                    onclick="ImageButtonOwner_Click" />
                                &nbsp;<asp:Label ID="LabelOwnerName" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName3" runat="server" 
                                    ControlToValidate="TextBoxOwnerId" CssClass="FormValidation" 
                                    ErrorMessage="&#1588;&#1606;&#1575;&#1587;&#1607; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740; &#1605;&#1583;&#1740;&#1585; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelName" runat="server" 
                                AssociatedControlID="TextBoxName" CssClass="FormLabel" 
                                
                                
                                Text="&#1606;&#1575;&#1605; &#1601;&#1585;&#1608;&#1588;&#1711;&#1575;&#1607;/&#1588;&#1585;&#1705;&#1578;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxName" runat="server" CssClass="TextBoxRequiredR2L" 
                                Width="300px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName2" runat="server" 
                                ControlToValidate="TextBoxName" CssClass="FormValidation" 
                                
                                ErrorMessage="&#1606;&#1575;&#1605; &#1601;&#1585;&#1608;&#1588;&#1711;&#1575;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelType" runat="server" 
                                AssociatedControlID="DropDownListType" CssClass="FormLabel" 
                                Text="&#1606;&#1608;&#1593; &#1588;&#1594;&#1604;:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListType" runat="server" 
                                CssClass="DropDownR2L" DataSourceID="SqlDataSourceTypes" 
                                DataTextField="TypeName" DataValueField="TypeId">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelField" runat="server" 
                                AssociatedControlID="DropDownListField" CssClass="FormLabel" 
                                Text="&#1586;&#1605;&#1740;&#1606;&#1607; &#1705;&#1575;&#1585;&#1740;:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListField" runat="server" 
                                CssClass="DropDownR2L" DataSourceID="SqlDataSourceFields" 
                                DataTextField="FieldName" DataValueField="FieldId">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="LabelAbout" runat="server" 
                                AssociatedControlID="TextBoxAbout" CssClass="FormLabel" 
                                
                                Text="&#1583;&#1585;&#1576;&#1575;&#1585;&#1607; &#1601;&#1585;&#1608;&#1588;&#1711;&#1575;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxAbout" runat="server" Height="100px" 
                                TextMode="MultiLine" Width="350px" CssClass="TextBoxMultiR2L"></asp:TextBox>
                        </td>
                    </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label8" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740;"></asp:Label>
                </td>
            </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelPhone" runat="server" CssClass="FormLabel" 
                                Text="&#1578;&#1604;&#1601;&#1606;:" AssociatedControlID="TextBoxPhone"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="TextBoxL2R" 
                                Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelFax" runat="server" CssClass="FormLabel" 
                                Text="&#1606;&#1605;&#1575;&#1576;&#1585;:" AssociatedControlID="TextBoxFax"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxFax" runat="server" CssClass="TextBoxL2R" 
                                Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelMobile" runat="server" CssClass="FormLabel" 
                                Text="&#1607;&#1605;&#1585;&#1575;&#1607;:" AssociatedControlID="TextBoxMobile"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxMobile" runat="server" CssClass="TextBoxL2R" 
                                Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelEmail" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;:" 
                                AssociatedControlID="TextBoxEmail"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="TextBoxL2R" 
                                Width="200px"></asp:TextBox>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                                ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="Add"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelWebsite" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740;:" 
                                AssociatedControlID="TextBoxWebsite"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxWebsite" runat="server" CssClass="TextBoxL2R" 
                                Width="200px"></asp:TextBox>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TextBoxWebsite" CssClass="FormValidation" 
                                ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                ValidationGroup="Add"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelAddress" runat="server" CssClass="FormLabel" 
                                Text="&#1570;&#1583;&#1585;&#1587;:" AssociatedControlID="TextBoxAddress"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxAddress" runat="server" 
                                Width="300px" CssClass="TextBoxR2L"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelGoogleMap" runat="server" CssClass="FormLabel" 
                                Text="&#1588;&#1606;&#1575;&#1587;&#1607; GoogleMap:" 
                                AssociatedControlID="TextBoxGoogleMap"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxGoogleMap" runat="server" CssClass="TextBoxL2R" 
                                Width="200px"></asp:TextBox>
                            &nbsp;<asp:HyperLink ID="HyperLink19" runat="server" CssClass="NormalLink" 
                                NavigateUrl="http://www.maps.google.com" Target="_blank">&#1583;&#1585;&#1740;&#1575;&#1601;&#1578; &#1705;&#1583; &#1575;&#1586; Google Map</asp:HyperLink>
                        </td>
                    </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label1" runat="server" CssClass="Header" Text="&#1593;&#1705;&#1587; &#1607;&#1575;"></asp:Label>
                </td>
            </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLogo" runat="server" AssociatedControlID="FileUploadLogo" 
                                CssClass="FormLabel" Text="&#1604;&#1608;&#1711;&#1608;&#1740; &#1601;&#1585;&#1608;&#1588;&#1711;&#1575;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUploadLogo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            <Controls:Captcha ID="captcha" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                             &nbsp;</td>
                        <td style="text-align:left;" class="style6">
                            <asp:Label ID="LabelAddMessage" runat="server" Visible="False"></asp:Label>
                            <asp:ImageButton ID="ImageButtonAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" onclick="ImageButtonAdd_Click" 
                                ValidationGroup="Add" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image1" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/categories24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonTypes" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonTypes_Click"
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1606;&#1608;&#1593; &#1607;&#1575; &#1608; &#1586;&#1605;&#1740;&#1606;&#1607; &#1607;&#1575;</asp:LinkButton>
            <asp:Panel ID="PanelTypes" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewTypes" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="350px" 
                    DataKeyNames="TypeId" DataSourceID="SqlDataSourceTypes">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1705;&#1583; &#1606;&#1608;&#1593;" 
                            DataField="TypeId" SortExpression="TypeId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1606;&#1608;&#1593;" 
                            DataField="TypeName" SortExpression="TypeName" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
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
                <asp:SqlDataSource ID="SqlDataSourceTypes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    DeleteCommand="sp_companyTypeDelete" 
                    
                    SelectCommand="sp_companyTypes" DeleteCommandType="StoredProcedure" 
                    SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="TypeId" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" class="style2">
                            <asp:Image ID="Image27" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/add16.png" Width="16px" />
                            <asp:Label ID="Label7" runat="server" CssClass="FormData" 
                                Text="&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1606;&#1608;&#1593;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelTypeId" runat="server" 
                                AssociatedControlID="TextBoxTypeId" CssClass="FormLabel" 
                                Text="&#1705;&#1583; &#1606;&#1608;&#1593;:"></asp:Label>
                        </td>
                        <td>
                                <asp:TextBox ID="TextBoxTypeId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    ValidationGroup="Type" Width="50px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationCode" 
                                    runat="server" ControlToValidate="TextBoxTypeId" 
                                    CssClass="FormValidation" ErrorMessage="&#1705;&#1583; &#1606;&#1608;&#1593; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                    ValidationGroup="Type"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelTypeName" runat="server" 
                                AssociatedControlID="TextBoxTypeName" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1606;&#1608;&#1593;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTypeName" runat="server" 
                                ValidationGroup="Type" Width="125px" CssClass="TextBoxRequiredR2L"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationName" 
                                runat="server" ControlToValidate="TextBoxTypeName" 
                                CssClass="FormValidation" ErrorMessage="&#1606;&#1575;&#1605; &#1606;&#1608;&#1593; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Type"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <Controls:Captcha ID="captchaType" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonTypeAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" onclick="ImageButtonTypeAdd_Click" 
                                ValidationGroup="Type" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="LabelAddTypeMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
<br />
                <asp:GridView ID="GridViewFields" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="350px" 
                    DataKeyNames="FieldId" DataSourceID="SqlDataSourceFields">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607;" 
                            DataField="FieldId" SortExpression="FieldId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607;" 
                            DataField="FieldName" SortExpression="FieldName" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
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
                <asp:SqlDataSource ID="SqlDataSourceFields" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    DeleteCommand="sp_companyFieldDelete" 
                    
                    
                    SelectCommand="sp_companyFields" DeleteCommandType="StoredProcedure" 
                    SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="TypeId" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" class="style2">
                            <asp:Image ID="Image2" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/add16.png" Width="16px" />
                            <asp:Label ID="Label3" runat="server" CssClass="FormData" 
                                Text="&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1586;&#1605;&#1740;&#1606;&#1607;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label4" runat="server" 
                                AssociatedControlID="TextBoxTypeId" CssClass="FormLabel" 
                                Text="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                                <asp:TextBox ID="TextBoxFieldId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    ValidationGroup="Fields" Width="50px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                    runat="server" ControlToValidate="TextBoxFieldId" 
                                    CssClass="FormValidation" ErrorMessage="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                    ValidationGroup="Fields"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label5" runat="server" 
                                AssociatedControlID="TextBoxTypeName" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxFieldName" runat="server" 
                                ValidationGroup="Fields" Width="125px" CssClass="TextBoxRequiredR2L"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                runat="server" ControlToValidate="TextBoxFieldName" 
                                CssClass="FormValidation" ErrorMessage="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Fields"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <Controls:Captcha ID="captchaField" runat="server" CalcMode="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonFieldAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" onclick="ImageButtonFieldAdd_Click" 
                                ValidationGroup="Fields" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="LabelAddFieldMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

