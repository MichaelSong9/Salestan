<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsersInviteLink.aspx.cs" Inherits="Pages_UsersInviteLink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <style type="text/css">
<!--
  .normal { background-color: #FFFFFF }
  .highlight { background-color: #EFEFEF}
//-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div dir="rtl" >
    
        <asp:Image ID="Image1" runat="server" Height="24px" 
            ImageUrl="~/images/icons/link24.png" Width="24px" />
    
        <asp:Label ID="Label1" runat="server" 
            Text="دریافت لینک دعوت به عضویت" 
            CssClass="Header"></asp:Label>
    
        <br />
        <br />
		<table style="width: 100%">
			<tr>
				<td style="text-align: center;width: 50%" valign="top" onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
        <asp:Label ID="Label2" runat="server" CssClass="FormLabel" 
            Text="لینک شما برای دعوت دوستان:"></asp:Label>
        		    <br />
        		<br />
        <asp:TextBox ID="TextBoxShareLink" runat="server" CssClass="L2RControls" 
            Enabled="False" Width="275px">www.salestan.ir/refer.aspx?code=</asp:TextBox>
        		</td>
				<td style="text-align: center;width: 50%" valign="top" onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
        <asp:Label ID="Label3" runat="server" CssClass="FormLabel" 
            Text="به اشتراک گذاری مستقیم در شبکه های اجتماعی:"></asp:Label>
        		    <br />
        		<br />
        <asp:HyperLink ID="HyperLinkFaceBook" runat="server" Height="64px" 
            ImageUrl="~/images/social/facebook64.png" Width="64px" 
                        
                        NavigateUrl="http://www.facebook.com/share.php?u=http://www.salestan.ir/refer.aspx?code=" 
                        Target="_blank"></asp:HyperLink>
    
    			&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLinkTwitter" runat="server" Height="64px" 
            ImageUrl="~/images/social/twitter64.png" Width="64px" 
                        
                        NavigateUrl="~/images/social/twitter64.png" 
                        Target="_blank"></asp:HyperLink>
    
    			</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;width: 100%" valign="top" onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <br />
        <asp:Label ID="Label4" runat="server" CssClass="FormLabel" 
            Text="کد HTML اختصاصی برای قراردادن در وبسایت / وبلاگ شما:"></asp:Label>
        		    <br />
        <asp:TextBox ID="TextBoxHtml" runat="server" CssClass="L2RControls" 
            Enabled="False" Width="335px" Height="85px" TextMode="MultiLine" Text=""></asp:TextBox>
        		    <br />
&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;width: 100%" valign="top" onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <br />
                    <asp:Image ID="Image2" runat="server" Height="16px" 
                        ImageUrl="~/images/icons/web_page16.png" Width="16px" />
                    <asp:HyperLink ID="HyperLinkSalestan" runat="server" CssClass="NormalLink" 
                        NavigateUrl="http://www.salestan.ir/refer.aspx?code=" Target="_blank">مشاهده صفحه ای که دوستانتان را به آن دعوت می کنید</asp:HyperLink>
                    <br />
&nbsp;</td>
			</tr>
		</table>
    </div>
  
    </form>
<!-- STATISTICS -->

<!-- Get Clicky -->
<script src="//static.getclicky.com/js" type="text/javascript"></script>
<script type="text/javascript">    try { clicky.init(66479060); } catch (e) { }</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/66479060ns.gif" /></p></noscript>
</body>
</html>
