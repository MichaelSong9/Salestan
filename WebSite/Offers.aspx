<%@ Page Title="Salestan : &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;&#1740; &#1608;&#1740;&#1688;&#1607;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Offers.aspx.cs" Inherits="Offers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .style3
        {
            width: 250px;
        }

        .offers 
        {
	    -webkit-border-top-right-radius:10px;
	    -webkit-border-top-left-radius:10px;
        -moz-border-radius-topright:10px;
          -moz-border-radius-topleft:10px;
                -border-radius:10px 10px 10px 10px;
        -moz-border-bottom-colors: none;
        -moz-border-image: none;
        -moz-border-left-colors: none;
        -moz-border-right-colors: none;
        -moz-border-top-colors: none;
        border-color: #cae1e6;
        border-style: solid;
        border-width: 1px;
        background-color: #ebf4ff;
        clear: both;
        margin: 0 0 15px 12px;
        padding: 8px 10px 8px;
        overflow: hidden;
        }
        .description 
        {
	    -webkit-border-top-right-radius:10px;
	    -webkit-border-top-left-radius:10px;
        -moz-border-radius-topright:10px;
          -moz-border-radius-topleft:10px;
                -border-radius:10px 10px 10px 10px;
        -moz-border-bottom-colors: none;
        -moz-border-image: none;
        -moz-border-left-colors: none;
        -moz-border-right-colors: none;
        -moz-border-top-colors: none;
        border-color: #cae1e6;
        border-style: solid;
        border-width: 1px;
        background-color: #ebf4ff;
        clear: both;
        margin: 0 0 15px 12px;
        padding: 8px 10px 8px;
        overflow: hidden;
       }
        A.fade
		{
			opacity: 1.00;
		}
		A.fade:hover
		{
			opacity: 0.7;
		}
    </style>
	<script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#offerslink-submitoffer").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'width': '7',
	            'height': '4'
	        });
	        jq14("#offerslink-agents").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'width': '5',
	            'height': '3'
	        });
	        jq14("#offerslink-about").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'width': '7',
	            'height': '5'
	        });
	    });
	</script>

      <!-- jcountdown1.4 -->
  <script src="_Shared/jQuery/jcountdown1.4/script/jquery-1.7.js" type="text/javascript"></script>
        <script type="text/javascript">
            var jq17 = jQuery.noConflict();
		</script>
<script src="_Shared/jQuery/jcountdown1.4/script/jquery.jcountdown1.4.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="_Shared/jQuery/jcountdown1.4/css/style.css" />
<asp:Literal ID="LiteralTimes" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top" class="style3">
                <table style="width: 100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="text-align: right; width: 270px;">
                            <a id="offerslink-about" href="images/offers/about.png" target="_blank">
                                <img alt="" height="196" src="images/offers/help.png" style="float: right" width="190"
                                    border="0" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    </table>
                <asp:SqlDataSource ID="SqlDataSourceOffers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    SelectCommand="SELECT 
	OfferId, 
	Title, 
	BrowserTitle, 
	PriceDiscountPercent, 
	PriceNormal, 
	PriceOffer, 
	PriceNormal - PriceOffer AS PriceDiscount, 
	MaxUser, 
	PurchasedCount, 
	MainPhoto, 
	EndDate, 
	PriceGift 
FROM Offers 
WHERE 
(EndDate &gt; GETDATE()) 
AND (ShowDate &lt; GETDATE())
ORDER BY ShowDate">
                </asp:SqlDataSource>
            </td>
            <td valign="top" align="right" style="width: 700px">
                <asp:Panel ID="PanelError" runat="server" Width="100%">
                <div dir="rtl" style="text-align:center;">
                    <br />
                    <asp:Image ID="Image11" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/warning24.png" Width="24px" />
                    <asp:Label ID="Label1" runat="server" CssClass="FormData" 
                        Text="&#1583;&#1585; &#1581;&#1575;&#1604; &#1581;&#1575;&#1590;&#1585; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1740; &#1576;&#1585;&#1575;&#1740; &#1606;&#1605;&#1575;&#1740;&#1588; &#1605;&#1608;&#1580;&#1608;&#1583; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;!"></asp:Label>
                </div>
                </asp:Panel>
                <asp:Panel ID="PanelOffers" runat="server" Width="100%">
                <div dir="rtl">
 <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceOffers" 
                          AutoGenerateColumns="False" DataKeyNames="OfferId" BorderStyle="None" 
                        GridLines="None" ShowHeader="False"  >
                       <Columns>
                           <asp:TemplateField ShowHeader="False" ItemStyle-BorderStyle="None">
                               <ItemTemplate>
                           <div class="description">
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
	                        <tr>
		                        <td>
                                     <table cellpadding="0" cellspacing="0" style="width: 651px">
                                        <tr>
                                            <td style="width: 671px; height: 95px; background-image: url('images/offers/header.png');">
                                                <div style="width: 671px; height: 95px; position:relative;">
                                                    <div style="position:absolute; top:35px; right:20px;" >
                                                        <asp:Label ID="LabelTitle" runat="server" CssClass="OfferTitle" Text='<%# Eval("Title") %>'></asp:Label>
                                                    </div>
                                                    <div style="position:absolute; top:35px; left:40px;" >
                                                        <asp:Label ID="LabelPriceDiscountPercent" runat="server" CssClass="OfferTitle" Text='<%# Eval("PriceDiscountPercent") + " %" %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
	                        </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" style="width: 680px">
                                        <tr>
                                            <td style="width: 450px" valign="top">
                                                <table style="width: 440px; height: 300px">
													<tr>
														<td valign="middle" style="width: 440px; height: 300px;background-image:url('images/offers/img-frame.png');text-align:center; padding-left:8px;">
														    <a ID="A1" class="fade" href='<%# "ShowOffer.aspx?OfferId=" + Eval("OfferId") + "&Title=" + Eval("BrowserTitle") %>'>
                                                            <img alt="" height="267" style="border-style:none" src='<%# "Files/Photos/" + Eval("MainPhoto") + ".jpg" %>' width="400" />
                                                            </a>
                                                        </td>
													</tr>
												</table>
                                                </td>
                                            <td valign="top" style="width: 230px;">
                                                <table cellpadding="0" cellspacing="0" style="width: 200px;">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0" style="width: 190px">
                                                                <tr>
                                                                    <td valign="top" style="height: 220px; background-image: url('images/offers/pricebg.png');
                                                                                background-repeat: no-repeat; text-align: right; padding-top: 5px;">
                                                                                <div style="height: 220px; width: 190px; position:relative; ">
                                                                                            <div style="position:absolute; top:45px; right:15px" >
                                                                                            <asp:Label ID="LabelPriceOffer" runat="server" CssClass="highlightPrice" Text='<%# Eval("PriceOffer") + " &#1578;&#1608;&#1605;&#1575;&#1606;" %>'></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:95px; right:15px" >
                                                                                                    <asp:Label ID="LabelPriceNormal" runat="server" CssClass="OfferPriceData" Text='<%# Eval("PriceNormal") + " &#1578;&#1608;&#1605;&#1575;&#1606;" %>'></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:141px; right:15px" >
                                                                                                    <asp:Label ID="LabelPriceDiscount" runat="server" CssClass="OfferPriceData" Text='<%# Eval("PriceDiscount") + " &#1578;&#1608;&#1605;&#1575;&#1606;" %>'></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:186px; right:15px" >
                                                                                                    <asp:Label ID="LabelPriceGift" runat="server" CssClass="highlightPrice" Text='<%# Eval("PriceGift") + " &#1578;&#1608;&#1605;&#1575;&#1606;" %>'></asp:Label>
                                                                                            </div>
                                                                                </div>
                                                                            </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0" style="width: 190px">
                                                                <tr>
                                                                    <td valign="center" style="height: 60px; background-image: url('images/offers/timebg.png');
                                                                                text-align: left; direction: ltr;">
                                                                       <p id=<%# "\"time" + Eval("OfferId") + "\"" %> class="time"></p>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align:center;">
                                                            <a id="button" href='<%# "ShowOffer.aspx?OfferId=" + Eval("OfferId") + "&Title=" + Eval("BrowserTitle") %>'><img style="border-style:none" alt="" height="30" src="images/Buttons/seeoffer160-off.png" width="160" onmouseover="this.src='images/Buttons/seeoffer160-on.png';" onmouseout="this.src='images/Buttons/seeoffer160-off.png';"/></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                               </ItemTemplate>
                               <ItemStyle BorderStyle="None" />
                           </asp:TemplateField>
                       </Columns>
                </asp:GridView>
                </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <div style="display: none;">
        <div id="offers-submitoffer" style="width: 500px; height: 300px; overflow: auto;
            direction: rtl;">
            <strong>
                <img src="images/bottom/offers28.png" />
                <span class="InlineText">!</span></strong><br />
            <br />
            <span class="InlineText">.</span></div>
    </div>
    </asp:Content>
