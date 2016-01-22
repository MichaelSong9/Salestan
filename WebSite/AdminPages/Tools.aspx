<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tools.aspx.cs" Inherits="AdminPages_Tools" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="PanelHtmlEditor" runat="server">
            <br />
            <asp:ImageButton ID="ImageButtonHtmlConvertHtml" runat="server" />
            <asp:ImageButton ID="ImageButtonHtmlConvertText" runat="server" 
                onclick="ImageButtonHtmlConvertText_Click" />
            <br />
            <asp:TextBox ID="TextBoxHtml" runat="server" Height="171px" 
                TextMode="MultiLine" Width="490px"></asp:TextBox>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
