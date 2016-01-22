<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsersInviteList.aspx.cs" Inherits="Pages_UsersInviteList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>فهرست افراد معرفی نموده</title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />

<!-- Google Analytics -->
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-3824008-2']);
        _gaq.push(['_setDomainName', 'salestan.ir']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div dir="rtl" >
    
        <asp:Image ID="Image1" runat="server" Height="24px" 
            ImageUrl="~/images/icons/user24.png" Width="24px" />
    
        <asp:Label ID="Label1" runat="server" 
            Text="فهرست افرادی که به دعوت شما به عضویت سایت درآمده اند:" 
            CssClass="Header"></asp:Label>
    
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    
        <br />
        <asp:Panel ID="PanelNoInvite" runat="server" style="text-align: center" 
            Visible="False">
            <br />
            <asp:Image ID="Image2" runat="server" Height="24px" 
                ImageUrl="~/images/icons/cancel24.png" Width="24px" />
            <asp:Label ID="Label2" runat="server" CssClass="FormLabel" 
                Text="تا این لحظه نام شما به عنوان معرف در سایت ثبت نشده است."></asp:Label>
        </asp:Panel>
    
    </div>
    </form>
<!-- STATISTICS -->

<!-- Get Clicky -->
<script src="//static.getclicky.com/js" type="text/javascript"></script>
<script type="text/javascript">    try { clicky.init(66479060); } catch (e) { }</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/66479060ns.gif" /></p></noscript>
</body>
</html>
