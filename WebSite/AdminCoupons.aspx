<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminCoupons.aspx.cs" Inherits="AdminCoupons" %>

<%@ Register src="NumCaptcha.ascx" tagname="captcha" tagprefix="controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        
        .style2
        {
            height: 27px;
        }
        
        


        .style1
        {
            width: 100%;
        }
        
        .style3
        {
            height: 18px;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/coupons32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;"></asp:Label>
        <br />
        <br />
    </div>
    <div style=" direction:rtl;">
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/add24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonAdd" runat="server" CssClass="MessageSender" onclick="LinkButtonAdd_Click"
                 >&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1705;&#1608;&#1662;&#1606; &#1580;&#1583;&#1740;&#1583;</asp:LinkButton>
            <asp:Panel ID="PanelAdd" runat="server" Visible="False" Width="100%">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label111" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelSender" runat="server" CssClass="FormLabel" 
                        
                        Text="&#1575;&#1585;&#1575;&#1574;&#1607; &#1583;&#1607;&#1606;&#1583;&#1607;:" 
                        AssociatedControlID="DropDownListCompanies"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListCompanies" runat="server" CssClass="FormLabel" 
                        DataSourceID="SqlDataSourceCompanies" DataTextField="Name" 
                        DataValueField="CompanyId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCompanies" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_companiesIdName" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLastName" runat="server" Text="&#1593;&#1606;&#1608;&#1575;&#1606;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxTitle"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="FormData" 
                        Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout" runat="server" 
                        ControlToValidate="TextBoxTitle" CssClass="FormValidation" 
                        ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelCategory" runat="server" 
                        AssociatedControlID="DropDownListCategory" CssClass="FormLabel" 
                        Text="&#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListCategory" runat="server" CssClass="FormLabel" 
                        DataSourceID="SqlDataSourceCategoriesCoupons" DataTextField="CategoryName" 
                        DataValueField="CategoryId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCategoriesCoupons" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        
                        SelectCommand="sp_couponsCategories" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="vertical-align:top;">
                            <asp:Label ID="LabelHighlights" runat="server" 
                        AssociatedControlID="TextBoxHighlights" CssClass="FormLabel" 
                        Text="&#1608;&#1740;&#1688;&#1711;&#1740; &#1607;&#1575;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxHighlights" runat="server" CssClass="FormData" 
                        Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout0" runat="server" 
                        ControlToValidate="TextBoxHighlights" CssClass="FormValidation" 
                        ErrorMessage="&#1608;&#1740;&#1688;&#1711;&#1740; &#1607;&#1575; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;" class="style2">
                            <asp:Label ID="LabelDetails" runat="server" 
                        Text="&#1588;&#1585;&#1575;&#1740;&#1591; &#1575;&#1587;&#1578;&#1601;&#1575;&#1583;&#1607;:" CssClass="FormLabel" 
                        AssociatedControlID="TextBoxDetails"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDetails" runat="server" CssClass="FormData" 
                        TextMode="MultiLine" Height="100px" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout1" runat="server" 
                        ControlToValidate="TextBoxDetails" CssClass="FormValidation" 
                        ErrorMessage="&#1588;&#1585;&#1575;&#1740;&#1591; &#1575;&#1587;&#1578;&#1601;&#1575;&#1583;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;" class="style2">
                            <asp:Label ID="LabelDescriptions" runat="server" Text="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxDescriptions"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDescriptions" runat="server" CssClass="FormData" 
                        TextMode="MultiLine" Height="100px" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout2" runat="server" 
                        ControlToValidate="TextBoxDescriptions" CssClass="FormValidation" 
                        ErrorMessage="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="vertical-align:top;">
                            <asp:Label ID="LabelCode" runat="server" AssociatedControlID="TextBoxCode" 
                                CssClass="FormLabel" Text="&#1705;&#1583;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCode" runat="server" CssClass="FormData" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="vertical-align:top;">
                            <asp:Label ID="LabelStartCoupon" runat="server" 
                                AssociatedControlID="TextBoxStartCoupon" CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1588;&#1585;&#1608;&#1593; &#1705;&#1608;&#1662;&#1606;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxStartCoupon" runat="server" CssClass="FormData" 
                                Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout12" runat="server" 
                                ControlToValidate="TextBoxStartCoupon" CssClass="FormValidation" 
                                ErrorMessage="&#1578;&#1575;&#1585;&#1740;&#1582; &#1588;&#1585;&#1608;&#1593; &#1705;&#1608;&#1662;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="vertical-align:top;">
                            <asp:Label ID="LabelEndCoupon" runat="server" 
                                AssociatedControlID="TextBoxEndCoupon" CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1662;&#1575;&#1740;&#1575;&#1606; &#1705;&#1608;&#1662;&#1606;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxEndCoupon" runat="server" CssClass="FormData" 
                                Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout13" runat="server" 
                                ControlToValidate="TextBoxEndCoupon" CssClass="FormValidation" 
                                ErrorMessage="&#1578;&#1575;&#1585;&#1740;&#1582; &#1662;&#1575;&#1740;&#1575;&#1606; &#1705;&#1608;&#1662;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                    &nbsp;</td>
                        <td>
                    &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label115" runat="server" CssClass="Header" Text="&#1586;&#1605;&#1575;&#1606; &#1606;&#1605;&#1575;&#1740;&#1588;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="LabelShowDate" runat="server" CssClass="FormLabel" 
                        Text="&#1588;&#1585;&#1608;&#1593; &#1606;&#1605;&#1575;&#1740;&#1588;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Calendar ID="CalendarShowDate" runat="server" FirstDayOfWeek="Saturday">
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelDuration" runat="server" CssClass="FormLabel" 
                        Text="&#1605;&#1583;&#1578; &#1606;&#1605;&#1575;&#1740;&#1588;:" 
                        AssociatedControlID="TextBoxDuration"></asp:Label>
                        </td>
                        <td>
                    &nbsp;<asp:TextBox ID="TextBoxDuration" runat="server" CssClass="FormData" 
                        MaxLength="3" Width="50px" Height="23px"></asp:TextBox>
                            <asp:Label ID="LabelBirthDate13" runat="server" 
                        AssociatedControlID="TextBoxDuration" CssClass="FormLabel" Text="&#1587;&#1575;&#1593;&#1578;"></asp:Label>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout11" runat="server" 
                        ControlToValidate="TextBoxDuration" CssClass="FormValidation" 
                        ErrorMessage="&#1605;&#1583;&#1578; &#1606;&#1605;&#1575;&#1740;&#1588; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                    &nbsp;</td>
                        <td>
                    &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label116" runat="server" CssClass="Header" Text="&#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1608; &#1586;&#1576;&#1575;&#1606;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocations" runat="server" 
                        AssociatedControlID="CheckBoxListLocations" CssClass="FormLabel" 
                        Text="&#1605;&#1608;&#1602;&#1593;&#1740;&#1578; &#1607;&#1575;:"></asp:Label>
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
                            <asp:Label ID="LabelLanguage" runat="server" 
                        AssociatedControlID="DropDownListLanguage" CssClass="FormLabel" 
                        Text="&#1586;&#1576;&#1575;&#1606;:"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="DropDownListLanguage" runat="server" CssClass="FormLabel" 
                        AutoPostBack="True" DataSourceID="SqlDataSourceLanguages" 
                        DataTextField="LanguageName" DataValueField="LanguageId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceLanguages" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_languages" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                    &nbsp;</td>
                        <td>
                    &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:Label ID="Label118" runat="server" CssClass="Header" Text="&#1604;&#1740;&#1606;&#1705; &#1607;&#1575;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLink1" runat="server" 
                        AssociatedControlID="DropDownListLink1" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705; &#1575;&#1608;&#1604;:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListLink1" runat="server" CssClass="FormLabel">
                                <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                <asp:ListItem Value="1">&#1601;&#1607;&#1585;&#1587;&#1578; &#1606;&#1585;&#1605; &#1575;&#1601;&#1586;&#1575;&#1585;&#1607;&#1575;</asp:ListItem>
                                <asp:ListItem Value="2">&#1605;&#1606;&#1608;&#1740; &#1594;&#1584;&#1575;</asp:ListItem>
                            </asp:DropDownList>
                    &nbsp;<asp:TextBox ID="TextBoxLink1" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBoxLink1" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLink2" runat="server" 
                        AssociatedControlID="DropDownListLink2" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705; &#1583;&#1608;&#1605;:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListLink2" runat="server" CssClass="FormLabel" 
                        Height="17px">
                                <asp:ListItem Value="0">&#1594;&#1740;&#1585; &#1601;&#1593;&#1575;&#1604;</asp:ListItem>
                                <asp:ListItem Value="1">&#1601;&#1607;&#1585;&#1587;&#1578; &#1606;&#1585;&#1605; &#1575;&#1601;&#1586;&#1575;&#1585;&#1607;&#1575;</asp:ListItem>
                                <asp:ListItem Value="2">&#1605;&#1606;&#1608;&#1740; &#1594;&#1584;&#1575;</asp:ListItem>
                            </asp:DropDownList>
                    &nbsp;<asp:TextBox ID="TextBoxLink2" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxLink2" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style2">
                            <asp:Label ID="LabelLink3" runat="server" 
                        AssociatedControlID="TextBoxLink3" CssClass="FormLabel" 
                        Text="&#1604;&#1740;&#1606;&#1705; &#1587;&#1608;&#1605;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelBirthDate21" runat="server" 
                        AssociatedControlID="TextBoxDuration" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                            <asp:TextBox ID="TextBoxLink3" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBoxLink3" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
                            <br />
                            <asp:Label ID="LabelBirthDate22" runat="server" 
                        AssociatedControlID="TextBoxLink3Image" CssClass="FormLabel" 
                        Text="&#1583;&#1705;&#1605;&#1607;:"></asp:Label>
                            <asp:TextBox ID="TextBoxLink3Image" runat="server" CssClass="L2RControls" 
                        Width="300px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBoxLink3" CssClass="FormValidation" 
                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Add"></asp:RegularExpressionValidator>
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
                        <td class="style2">
                    &nbsp;</td>
                        <td>
                            <asp:ImageButton ID="ImageButtonAdd" runat="server" 
                        ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Add" 
                        onclick="ImageButtonAdd_Click" />
                            <asp:Label ID="LabelAddMessage" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/mainicons/coupons24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonManage" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonManage_Click" 
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1">
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewOffers" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="900px" 
                                AllowSorting="True" DataSourceID="SqlDataSourceCoupons">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:HyperLinkField DataNavigateUrlFields="CouponId,BrowserTitle" 
                                        DataNavigateUrlFormatString="~/ShowCoupon.aspx?CouponId={0}&amp;Title={1}" 
                                        DataTextField="Title" 
                                        HeaderText="&#1593;&#1606;&#1608;&#1575;&#1606; &#1705;&#1608;&#1662;&#1606;" SortExpression="Title" 
                                        Target="_blank">
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="275px" />
                                    </asp:HyperLinkField>
                                    <asp:HyperLinkField DataNavigateUrlFields="CompanyId" 
                                        DataNavigateUrlFormatString="~/AdminPages/Companies.aspx?Mode=Info&amp;CompanyId={0}" 
                                        DataTextField="Name" HeaderText="&#1606;&#1575;&#1605; &#1605;&#1608;&#1587;&#1587;&#1607;" SortExpression="Name" 
                                        Target="_blank">
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="200px" />
                                    </asp:HyperLinkField>
                                    <asp:BoundField HeaderText="&#1608;&#1590;&#1593;&#1740;&#1578;" >
                                    <ItemStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1578;&#1593;&#1583;&#1575;&#1583; &#1605;&#1588;&#1575;&#1607;&#1583;&#1607;" 
                                        DataField="ViewCount" SortExpression="ViewCount" >
                                    <ItemStyle Width="75px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1578;&#1593;&#1583;&#1575;&#1583; &#1670;&#1575;&#1662;" 
                                        DataField="PrintCount" SortExpression="PrintCount">
                                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1586;&#1605;&#1575;&#1606; &#1576;&#1575;&#1602;&#1740; &#1605;&#1575;&#1606;&#1583;&#1607;" >
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField DataNavigateUrlFields="CouponId" 
                                        DataNavigateUrlFormatString="~/AdminPages/Coupons.aspx?Mode=Photos&amp;CouponId={0}" 
                                        HeaderText="&#1578;&#1589;&#1575;&#1608;&#1740;&#1585;" Target="_blank" 
                                        Text="&#1578;&#1589;&#1575;&#1608;&#1740;&#1585;">
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:HyperLinkField>
                                    <asp:HyperLinkField HeaderText="&#1578;&#1594;&#1740;&#1740;&#1585;" 
                                        DataNavigateUrlFields="CouponId" 
                                        DataNavigateUrlFormatString="~/AdminPages/Coupons.aspx?Mode=Edit&amp;CouponId={0}" 
                                        Text="&#1578;&#1594;&#1740;&#1740;&#1585;" Target="_blank" >
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
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
                            <asp:SqlDataSource ID="SqlDataSourceCoupons" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                
                                SelectCommand="sp_coupons" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image3" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/comment24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonComments" runat="server" CssClass="MessageSender" onclick="LinkButtonComments_Click"
                 >&#1606;&#1592;&#1585;&#1575;&#1578; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:LinkButton>
            &nbsp;<asp:Label ID="LabelCommentNewCount" runat="server" CssClass="FormValidation" 
                Text="(1 &#1606;&#1592;&#1585; &#1662;&#1575;&#1587;&#1582; &#1583;&#1575;&#1583;&#1607; &#1606;&#1588;&#1583;&#1607;)"></asp:Label>
            <br />
            <asp:Panel ID="PanelComments" runat="server" Visible="False" Width="100%">
                <asp:SqlDataSource ID="SqlDataSourceComments" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_commentsCouponsPending" 
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
                <asp:Repeater ID="RepeaterComments" runat="server" 
                        DataSourceID="SqlDataSourceComments" 
                    onitemcommand="RepeaterComments_ItemCommand">
                    <ItemTemplate>
                        <table class="style1" style="direction:rtl; width: 100%;">
                            <tr>
                                <td colspan="2" class="style3">
                                    <asp:HyperLink ID="HyperLinkCommentOffer" runat="server" CssClass="NormalLink" 
                            NavigateUrl='<%# Eval("ItemId", "~/ShowCoupon.aspx?CouponId={0}") %>'><%# Eval("Title") %></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" style="width: 50%">
                                    <asp:HyperLink ID="HyperLinkCommentsUser" runat="server" CssClass="NormalLink" 
                                Target="_blank" NavigateUrl='<%# Eval("UserId", "~/AdminPages/Users.aspx?Mode=Info&UserId={0}") %>'><%# Eval("FullName") %></asp:HyperLink>
                                    <br />
                                    <asp:TextBox ID="TextBoxComment" runat="server" Height="75px" ReadOnly="True" 
                                CssClass="FormData" TextMode="MultiLine" Width="95%" Text='<%# Eval("Comment") %>'></asp:TextBox>
                                </td>
                                <td style="width: 50%">
                                    <asp:Label ID="Label117" runat="server" CssClass="FormLabel" Text="Salestan:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBoxAnswer" runat="server" Height="75px" 
                                CssClass="FormData" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center;" colspan="2" class="style2">
                                    <asp:ImageButton ID="ImageButtonCommentReject" runat="server" Height="32px" 
                                Width="32px" ImageUrl="~/images/icons/thumb_down32.png" CommandArgument='<%# Eval("CommentId") %>' CommandName="CommentReject"/>
                            &nbsp; &nbsp;<asp:ImageButton ID="ImageButtonCommentVerify" runat="server" Height="32px" 
                                Width="32px" ImageUrl="~/images/icons/thumb_up32.png"  CommandArgument='<%# Eval("CommentId") %>' CommandName="CommentVerify"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="2" style="text-align:center;">
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image4" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/categories24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonCategories" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonCategories_Click"
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1586;&#1605;&#1740;&#1606;&#1607; &#1607;&#1575;</asp:LinkButton>
            <asp:Panel ID="PanelCategories" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewCategories" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="350px" 
                    DataKeyNames="CategoryId" DataSourceID="SqlDataSourceCategories">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607;" 
                            DataField="CategoryId" SortExpression="CategoryId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607;" 
                            DataField="CategoryName" SortExpression="CategoryName" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
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
                <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    
                    SelectCommand="sp_couponsCategories" 
                    DeleteCommand="sp_couponsCategoryDelete" 
                    DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" class="style2">
                            <asp:Image ID="Image27" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/add16.png" Width="16px" />
                            <asp:Label ID="Label7" runat="server" CssClass="FormData" 
                                Text="&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1586;&#1605;&#1740;&#1606;&#1607;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocationCode" runat="server" 
                                AssociatedControlID="TextBoxCategoryId" CssClass="FormLabel" 
                                Text="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCategoryId" runat="server" CssClass="L2RControls" 
                                    ValidationGroup="Category" Width="50px" MaxLength="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationCode" 
                                    runat="server" ControlToValidate="TextBoxCategoryId" 
                                    CssClass="FormValidation" ErrorMessage="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                    ValidationGroup="Category"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocationName" runat="server" 
                                AssociatedControlID="TextBoxCategoryName" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCategoryName" runat="server" 
                                ValidationGroup="Category" Width="125px" CssClass="FormData"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationName" 
                                runat="server" ControlToValidate="TextBoxCategoryName" 
                                CssClass="FormValidation" ErrorMessage="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Category"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonCategoryAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Category" onclick="ImageButtonCategoryAdd_Click"
                                 />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="LabelAddCategoryMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image1" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/stats24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonStats" runat="server" CssClass="MessageSender" onclick="LinkButtonStats_Click" 
                 >&#1570;&#1605;&#1575;&#1585; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelStats" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Image ID="ImageStatsRefresh" runat="server" Height="16px" Width="16px" 
                                ImageUrl="~/images/icons/refresh16.png" />
                            <asp:LinkButton ID="LinkButtonStatsRefresh" runat="server" 
                                CssClass="NormalLink" onclick="LinkButtonStatsRefresh_Click">&#1576;&#1607; &#1585;&#1608;&#1586; &#1585;&#1587;&#1575;&#1606;&#1740; &#1570;&#1605;&#1575;&#1585;</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1570;&#1582;&#1585;&#1740;&#1606; &#1576;&#1607; &#1585;&#1608;&#1586;&#1585;&#1587;&#1575;&#1606;&#1740;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelStatsDate" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;:"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LabelStatsOffers" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label5" runat="server" CssClass="FormLabel" 
                                
                                Text="&#1705;&#1608;&#1662;&#1606; &#1607;&#1575;&#1740; &#1601;&#1593;&#1575;&#1604;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelStatsActive" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label9" runat="server" 
                                CssClass="FormLabel" 
                                Text="&#1705;&#1608;&#1662;&#1606; &#1607;&#1575;&#1740; &#1711;&#1584;&#1588;&#1578;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelStatsPast" runat="server" 
                                CssClass="FormLabel"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    </ContentTemplate>
</asp:Content>

