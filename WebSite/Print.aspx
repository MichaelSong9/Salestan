<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print.aspx.cs" Inherits="Print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title></title>
    <link rel="icon" href="salestan.ico" type="image/x-icon" />
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />

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
	    .Title 
	    {
	        font-family: Tahoma;
	        font-size: 18px;
	        font-weight:bold;
	    }
	    .Header 
	    {
	        font-family: Tahoma;
	        font-size: 12px;
	        font-weight:bold;
	    }
	    .Text 
	    {
	        font-family: Tahoma;
	        font-size: 12px;
	        font-weight:normal;
	    }
	    .Print 
	    {
	        font-family: Tahoma;
	        font-size: 12px;
	        font-weight:bold;
	    }
        .auto-style1 {
	        text-align: left;
        }
        .style2
        {
            width: 37px;
            height: 29px;
        }
        .style3
        {
            width: 34px;
            height: 31px;
        }
        .style4
        {
            width: 11px;
            height: 31px;
        }
        .style5
        {
            width: 34px;
            height: 34px;
        }
        .auto-style2
        {
	        text-align: center;
        }
        .style6
        {
            width: 24px;
            height: 24px;
        }
    .FormData
        {
            font-family: Tahoma;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="PanelError" runat="server" Width="100%" 
            Visible="False">
            <asp:HyperLink ID="HyperLink2" runat="server" 
                ImageUrl="~/images/messages/falserequest.png">HyperLink</asp:HyperLink>
        </asp:Panel>
        <asp:Panel ID="PanelOffers" runat="server" Width="100%" Visible="False">
            <div class="style1">
                <table style="width: 750px">
					<tr>
						<td style="width: 50%">
						<table style="width: 100%">
							<tr>
                            
								<td class="auto-style2">
								<asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/images/logomain.png" NavigateUrl="~/Default.aspx">HyperLink</asp:HyperLink>
								</td>
								<td class="auto-style1" valign="top">
								<span class="Print"><a href="#" onClick="window.print()">&#1670;&#1575;&#1662; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;</a></span></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>
						    <img alt="" class="style6" 
                                src="images/mainicons/offers24.png" />
						<asp:Label ID="LabelTitle" runat="server" CssClass="Title" Width="650px"></asp:Label>
						</td>
					</tr>

					<tr>
						<td>
                            <table style="width: 100%">
	                            <tr>
		                            <td style="width: 70%">
                                        <asp:Image ID="ImagePhoto" runat="server" />
                                    </td>
		                            <td style="width: 30%">
                                        <asp:Label ID="LabelPriceOffer1" runat="server" CssClass="Header" 
                                            Text="&#1602;&#1740;&#1605;&#1578; &#1608;&#1740;&#1688;&#1607;:  "></asp:Label>
                                        <asp:Label ID="LabelPriceOffer" runat="server" CssClass="Header"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelPriceNormal1" runat="server" CssClass="Text" 
                                            Text="&#1602;&#1740;&#1605;&#1578; &#1593;&#1575;&#1583;&#1740;:  "></asp:Label>
                                        <asp:Label ID="LabelPriceNormal" runat="server" CssClass="Text"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelPriceDiscount1" runat="server" CssClass="Text" 
                                            Text="&#1578;&#1582;&#1601;&#1740;&#1601;: "></asp:Label>
                                        <asp:Label ID="LabelPriceDiscount" runat="server" CssClass="Text"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelPricePercent1" runat="server" CssClass="Header" 
                                            Text="&#1583;&#1585;&#1589;&#1583; &#1578;&#1582;&#1601;&#1740;&#1601;: "></asp:Label>
                                        <asp:Label ID="LabelPricePercent" runat="server" CssClass="Header"></asp:Label>
                                    </td>
	                            </tr>
                            </table>
                        </td>
					</tr>
					<tr>
						<td style="width: 50%;">
						<table style="width: 100%">
							<tr>
								<td style="width:350px;vertical-align:top;">
                                <div><asp:Label ID="Label1" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;:"></asp:Label></div>
		<div><asp:Literal ID="LiteralHighlights" runat="server"></asp:Literal></div>
								</td>
								<td style="vertical-align:top;">
                                <div>
								<asp:Label ID="Label6" runat="server" CssClass="Header" Text="&#1606;&#1705;&#1575;&#1578; &#1602;&#1575;&#1576;&#1604; &#1578;&#1608;&#1580;&#1607;:"></asp:Label></div>
                                <div><asp:Literal ID="LiteralDetails" runat="server"></asp:Literal></div>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" CssClass="Header" Text="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578;:"></asp:Label>
                        </td>
                    </tr>
					<tr>
						<td>
						<asp:Literal ID="LiteralDescriptions" runat="server"></asp:Literal>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<img alt="" class="style2" 
                                src="images/print/address.png" />
						<asp:Label ID="LabelAddress" runat="server" CssClass="FormData"></asp:Label>
						</td>
					</tr>
					<tr>
						<td>
						<table style="width: 100%">
							<tr>
								<td style="width: 33%">
								<img alt="" class="style4" 
                                        src="images/print/phone.png" />
								<asp:Label ID="LabelTel" runat="server" CssClass="FormData"></asp:Label>
								</td>
								<td style="width: 33%">
								<img alt="" class="style3" src="images/print/mail.png" />
								<asp:Label ID="LabelEmail" runat="server" CssClass="FormData"></asp:Label>
								</td>
								<td style="width: 33%">
								<img alt="" class="style5" src="images/print/site.png" />
								<asp:Label ID="LabelWebsite" runat="server" CssClass="FormData"></asp:Label>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
                <asp:Label ID="LabelLink" runat="server" CssClass="Text" 
                    Text="www.salestan.ir/ShowOffer.aspx?OfferId="></asp:Label>
                <br />
            </div>
        </asp:Panel>
    </form>
<!-- STATISTICS -->

<!-- Get Clicky -->
<script src="//static.getclicky.com/js" type="text/javascript"></script>
<script type="text/javascript">    try { clicky.init(66479060); } catch (e) { }</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/66479060ns.gif" /></p></noscript>
</body>
</html>
