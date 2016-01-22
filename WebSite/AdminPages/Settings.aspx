<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="AdminPages_Settings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../salestan.ico" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="PanelStyles" runat="server" Visible="False" Width="100%">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                ImageUrl="~/images/icons/appearance24.png" Width="24px" />
            <asp:Label ID="Label9" runat="server" CssClass="Header" 
                Text="تغییر فایل استایل"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBoxStyles" runat="server" Height="400px" Width="580px" 
                CssClass="TextBoxMultiL2R" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:ImageButton ID="ImageButtonAdd" runat="server" 
                ImageUrl="~/images/Buttons/save-off.png" ValidationGroup="Add" />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
