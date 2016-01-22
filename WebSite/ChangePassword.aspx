<%@ Page Title="Salestan : &#1578;&#1594;&#1740;&#1740;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .redborder
        {
            border: 1px dotted red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="body" dir="rtl">
        <div id="h2">
            <p>
                <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl="~/images/icons/lostpassword32.png"
                    Width="32px" />
                <asp:Label ID="Label1" runat="server" Text="&#1578;&#1594;&#1740;&#1740;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585;"
                    CssClass="Header"></asp:Label>
            </p>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <div style="width: 100px; text-align: left; float: right;">
                        <asp:Label ID="lblNewPaa" runat="server" Text="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1580;&#1583;&#1740;&#1583; :"
                            CssClass="FormLabel"></asp:Label>
                    </div>
                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" 
                        ValidationGroup="ChangePass" CssClass="TextBoxRequiredL2R"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPass"
                        ErrorMessage="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1580;&#1583;&#1740;&#1583; &#1585;&#1575; &#1578;&#1575;&#1740;&#1662; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!"
                        Font-Size="Small" ForeColor="Red" ValidationGroup="ChangePass" CssClass="FormValidation"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div>
                    <div style="width: 100px; text-align: left; float: right;">
                        <asp:Label ID="lblNewPassRepeat" runat="server" Text=" &#1578;&#1705;&#1585;&#1575;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&amp;#1585:"
                            CssClass="FormLabel"></asp:Label></div>
                    <div style="width: 800px; text-align: right; float: right;">
                        <asp:TextBox ID="txtNewPassRepeat" runat="server" TextMode="Password" 
                            ValidationGroup="ChangePass" CssClass="TextBoxRequiredL2R"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPass"
                            ErrorMessage="&#1578;&#1705;&#1585;&#1575;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1585;&#1575; &#1578;&#1575;&#1740;&#1662; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!"
                            Font-Size="Small" ForeColor="Red" ValidationGroup="ChangePass" CssClass="FormValidation"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div style="width: 800px; text-align: right;">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass"
                        ControlToValidate="txtNewPassRepeat" ErrorMessage="&#1578;&#1705;&#1585;&#1575;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1605;&#1740; &#1576;&#1575;&#1740;&#1587;&#1578; &#1576;&#1585;&#1575;&#1576;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1580;&#1583;&#1740;&#1583; &#1576;&#1575;&#1588;&#1583;!"
                        Font-Size="Small" ForeColor="Red" ValidationGroup="ChangePass" CssClass="FormValidation"></asp:CompareValidator>
                </div>
                <div style="text-align: right;">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </div>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img id="preloader" alt="" src="images/loading.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <div style="text-align: right; float: right;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Buttons/save-off.png"
                        OnClick="ImageButton1_Click" ValidationGroup="ChangePass" />
                    <asp:Image ID="Imageok" runat="server" ImageUrl="~/images/icons/check22.png" Visible="false" />
                    <asp:Label ID="lblsucces" runat="server" Visible="False" CssClass="SuccessMessage">  &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1740;&#1578; &#1578;&#1594;&#1740;&#1740;&#1585; &#1705;&#1585;&#1583;.</asp:Label>
                </div>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
