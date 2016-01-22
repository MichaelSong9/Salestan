<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword2" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="PanelForgot" runat="server" Width="100%">
    <p>
            <asp:Image ID="Image1" runat="server" Height="32px" 
                ImageUrl="~/images/icons/lostpassword32.png" Width="32px" />
            <asp:Label ID="Label1" runat="server" Text="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1582;&#1608;&#1583; &#1585;&#1575; &#1601;&#1585;&#1575;&#1605;&#1608;&#1588; &#1705;&#1585;&#1583;&#1607; &#1575;&#1740;&#1583;&#1567;" 
                CssClass="Header"></asp:Label>
          </p>
        <p>
            &nbsp;</p>
    <p>
                        <asp:Label ID="Label2" runat="server" 
                            
            Text="&#1604;&#1591;&#1601;&#1575;&#1611; &#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705; &#1582;&#1608;&#1583; &#1585;&#1575; &#1576;&#1585;&#1575;&#1740; &#1583;&#1585;&#1740;&#1575;&#1601;&#1578; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." CssClass="FormLabel"></asp:Label>
                    </p>
        <p>
            &nbsp;</p>
    <p>
                            <asp:Label ID="LabelEmail" runat="server" 
                                
            Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705; :" 
                                CssClass="FormLabel" AssociatedControlID="txtEmail"></asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" 
            ValidationGroup="ForgotPasss" CssClass="TextBoxRequiredL2R" Width="180px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1582;&#1608;&#1583; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!"
                                Font-Size="Small" 
            ValidationGroup="ForgotPasss" CssClass="ErrorMessage"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;."
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="Small" ControlToValidate="txtEmail" 
            ValidationGroup="ForgotPasss" CssClass="ErrorMessage"></asp:RegularExpressionValidator>
                        </p>
    <p>
                        <asp:Label ID="LabelError" runat="server" Visible="False" CssClass="ErrorMessage">  &#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1608;&#1575;&#1585;&#1583; &#1588;&#1583;&#1607; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1605;&#1608;&#1580;&#1608;&#1583; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;!</asp:Label>
                    </p>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    
                <br />
                    
                <Controls:Captcha ID="captcha" CalcMode="1" runat="server" />
    <p>
                        &nbsp;</p>
        <p>
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/images/Buttons/send-off.png" OnClick="ImageButton1_Click" 
                ValidationGroup="ForgotPasss" />
        </p>
    <p>
                        <asp:Image ID="ImageOk" runat="server" ImageUrl="~/images/icons/check22.png" 
                            Visible="false" /> 
        <asp:Label ID="lblSucces" 
                            runat="server" Visible="False" CssClass="SuccessMessage" > &#1575;&#1740;&#1605;&#1740;&#1604; &#1578;&#1594;&#1740;&#1740;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1576;&#1607; &#1570;&#1583;&#1585;&#1587; &#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1588;&#1605;&#1575; &#1601;&#1585;&#1587;&#1578;&#1575;&#1583;&#1607; &#1588;&#1583;.</asp:Label>  
                    
                    </p>
    </asp:Panel>
    <asp:Panel ID="PanelError" runat="server" Width="100%" Visible="False">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/icons/delete16.png" />
        <asp:Label ID="Label3" runat="server" 
    Text="&#1588;&#1605;&#1575; &#1583;&#1585; &#1581;&#1575;&#1604; &#1581;&#1575;&#1590;&#1585; &#1608;&#1575;&#1585;&#1583; &#1587;&#1740;&#1587;&#1578;&#1605; &#1605;&#1740; &#1576;&#1575;&#1588;&#1740;&#1583;!" CssClass="ErrorMessage"></asp:Label>
    </asp:Panel>
</asp:Content>

