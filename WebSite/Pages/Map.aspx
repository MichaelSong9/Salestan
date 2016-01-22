<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="Pages_Map" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <iframe width="560" height="460" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?q=<% Response.Write(HiddenFieldGoogleId.Value); %>&amp;num=1&amp;ie=UTF8&amp;ll=<% Response.Write(HiddenFieldGoogleId.Value); %>&amp;spn=0.007344,0.016512&amp;t=m&amp;z=16&amp;output=embed"></iframe><br />
    </div>
    <asp:HiddenField ID="HiddenFieldGoogleId" runat="server" />

    </form>
</body>
</html>
