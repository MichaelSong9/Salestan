<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1578;&#1576;&#1604;&#1740;&#1594;&#1575;&#1578;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminAds.aspx.cs" Inherits="AdminAds" %>

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
            ImageUrl="~/images/icons/ads32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1578;&#1576;&#1604;&#1740;&#1594;&#1575;&#1578;"></asp:Label>
        <br />
        <br />
    </div>
    <div style=" direction:rtl;">
                <div class="ShowHidePanel1">
                    <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/controlpanel/menu/information24.png" Width="24px" />
                    <asp:LinkButton ID="LinkButtonManage" runat="server" CssClass="MessageSender" onclick="LinkButtonManage_Click" 
                 >&#1578;&#1576;&#1604;&#1740;&#1594;&#1575;&#1578;</asp:LinkButton>
                    <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                            <table class="style1" style="direction:rtl;">
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelAbout" runat="server" CssClass="FormLabel" 
                                        Text="&#1576;&#1575;&#1604;&#1575;&#1740; &#1587;&#1575;&#1740;&#1578;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxTop" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelBirthDate21" runat="server" 
                                        AssociatedControlID="TextBoxTopLink" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxTopLink" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="LabelBirthDate22" runat="server" 
                                        AssociatedControlID="TextBoxTopImage" CssClass="FormLabel" Text="&#1578;&#1589;&#1608;&#1740;&#1585;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxTopImage" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="TextBoxTopImage" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Top"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:ImageButton ID="ImageButtonTop" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Top" 
                                        onclick="ImageButtonTop_Click" />
                                    <br />
                                    &nbsp;<br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelSuggestions" runat="server" CssClass="FormLabel" 
                                        
                                        Text="&#1662;&#1575;&#1740;&#1740;&#1606; &#1587;&#1575;&#1740;&#1578;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxBottom" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelBirthDate23" runat="server" 
                                        AssociatedControlID="TextBoxBottomLink" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxBottomLink" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="LabelBirthDate24" runat="server" 
                                        AssociatedControlID="TextBoxBottomImage" CssClass="FormLabel" Text="&#1578;&#1589;&#1608;&#1740;&#1585;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxBottomImage" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                        ControlToValidate="TextBoxBottomImage" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Bottom"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:ImageButton ID="ImageButtonBottom" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Bottom" 
                                        onclick="ImageButtonBottom_Click" />
                                    <br />
                                    &nbsp;<br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelContact" runat="server" CssClass="FormLabel" 
                                        
                                        Text="&#1578;&#1575;&#1740; &#1589;&#1601;&#1581;&#1607;:"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxFold" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelBirthDate25" runat="server" 
                                        AssociatedControlID="TextBoxFoldLink" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxFoldLink" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="LabelBirthDate26" runat="server" 
                                        AssociatedControlID="TextBoxFoldImage" CssClass="FormLabel" Text="&#1578;&#1589;&#1608;&#1740;&#1585;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxFoldImage" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                        ControlToValidate="TextBoxFoldImage" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Fold"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:ImageButton ID="ImageButtonFold" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Fold" 
                                        onclick="ImageButtonFold_Click" />
                                    <br />
                                    &nbsp;<br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelRules0" runat="server" CssClass="FormLabel" 
                                        
                                        
                                        Text="&#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxOffers" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelBirthDate31" runat="server" 
                                        AssociatedControlID="TextBoxOffersLink" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxOffersLink" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="LabelBirthDate32" runat="server" 
                                        AssociatedControlID="TextBoxOffersImage" CssClass="FormLabel" Text="&#1578;&#1589;&#1608;&#1740;&#1585;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxOffersImage" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                                        runat="server" ControlToValidate="TextBoxOffersImage" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Offers"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:ImageButton ID="ImageButtonOffers" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Offers" 
                                        onclick="ImageButtonOffers_Click" />
                                    <br />
                                    &nbsp;<br />
                                </td>
                            </tr>
                                <tr>
                                    <td class="style2">
                                        <asp:Label ID="LabelRules" runat="server" 
                                            CssClass="FormLabel" Text="&#1705;&#1608;&#1662;&#1606; &#1607;&#1575;"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:CheckBox ID="CheckBoxCoupons" runat="server" CssClass="FormLabel" 
                                            Text="&#1601;&#1593;&#1575;&#1604;" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelBirthDate27" runat="server" 
                                            AssociatedControlID="TextBoxCouponsLink" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                                        <asp:TextBox ID="TextBoxCouponsLink" runat="server" CssClass="TextBoxL2R" 
                                            Width="300px"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="LabelBirthDate28" runat="server" 
                                            AssociatedControlID="TextBoxCouponsImage" CssClass="FormLabel" Text="&#1578;&#1589;&#1608;&#1740;&#1585;:"></asp:Label>
                                        <asp:TextBox ID="TextBoxCouponsImage" runat="server" CssClass="TextBoxL2R" 
                                            Width="300px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                                            ControlToValidate="TextBoxOffersImage" CssClass="FormValidation" 
                                            ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                            ValidationGroup="Coupons"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:ImageButton ID="ImageButtonCoupons" runat="server" 
                                            ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Coupons" 
                                            onclick="ImageButtonCoupons_Click" />
                                        <br />
                                        &nbsp;<br />
                                    </td>
                                </tr>
                            <tr>
                                <td class="style2">
                                    <asp:Label ID="LabelPrivacy" runat="server" CssClass="FormLabel" 
                                        
                                        
                                        Text="&#1608;&#1585;&#1608;&#1583; &#1576;&#1607; &#1587;&#1740;&#1587;&#1578;&#1605;"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:CheckBox ID="CheckBoxLogin" runat="server" CssClass="FormLabel" 
                                        Text="&#1601;&#1593;&#1575;&#1604;" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelBirthDate29" runat="server" 
                                        AssociatedControlID="TextBoxOffersLink" CssClass="FormLabel" Text="&#1604;&#1740;&#1606;&#1705;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxLoginLink" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="LabelBirthDate30" runat="server" 
                                        AssociatedControlID="TextBoxOffersImage" CssClass="FormLabel" Text="&#1578;&#1589;&#1608;&#1740;&#1585;:"></asp:Label>
                                    <asp:TextBox ID="TextBoxLoginImage" runat="server" CssClass="TextBoxL2R" 
                                        Width="300px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                                        ControlToValidate="TextBoxOffersImage" CssClass="FormValidation" 
                                        ErrorMessage="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                        ValidationGroup="Login"></asp:RegularExpressionValidator>
                                    <br />
                                    <asp:ImageButton ID="ImageButtonLogin" runat="server" 
                                        ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Login" 
                                        onclick="ImageButtonLogin_Click" />
                                    <br />
                                    &nbsp;<br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td class="style6">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </asp:Panel>
                </div>
    </div>
</asp:Content>

