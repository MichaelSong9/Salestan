<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowOffer.aspx.cs" Inherits="ShowOffer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="_shared/jQuery/SlideImage/fotorama.css" rel="stylesheet" type="text/css" />
 
    <script type="text/javascript">
        jq14(document).ready(function () {
            jq14("#writecomment").fancybox({
                'titlePosition': 'inside',
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'type': 'iframe',
                'width': '5',
                'height': '3'
            });
            jq14("#showmap").fancybox({
                'titlePosition': 'inside',
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'type': 'iframe',
                'width': '6',
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
<script type="text/javascript">
    jq17(document).ready(function () {
        jq17("#time").countdown({
            date: "<% Response.Write(HiddenFieldEndDate.Value); %>",
            onComplete: function (event) {
                jq17(this).html("&#1662;&#1575;&#1740;&#1575;&#1606; &#1740;&#1575;&#1601;&#1578;");
            },
            leadingZero: true
        });
    });
</script>

  <!-- WOWSlider -->
	<link rel="stylesheet" type="text/css" href="_Shared/jQuery/wowslider/style.css" />
	<script type="text/javascript" src="_Shared/jQuery/wowslider/jquery.js"></script>



    <style type="text/css">
        .style2
        {
            width: 50%;
            height: 27px;
        }
        .style3
        {
            width: 100%;
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <table cellpadding="0" cellspacing="0" dir="rtl" style="width: 940px">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td style="width: 670px" valign="top">
                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" style="width: 671px">
                                                <tr>
                                                    <td style="width: 671px; height: 95px; background-image: url('images/offers/header.png');">
                                                        <div style="width: 671px; height: 95px; position:relative;">
                                                            <div style="position:absolute; top:35px; right:20px;" >
                                                                <asp:Label ID="LabelTitle" runat="server" CssClass="OfferTitle"></asp:Label>
                                                            </div>
                                                            <div style="position:absolute; top:35px; left:40px;" >
                                                                <asp:Label ID="LabelPriceDiscountPercent" runat="server" CssClass="OfferTitle"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                <tr>
                                                    <td valign="top" style="width: 220px">
                                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                            <tr>
                                                                <td>
                                                                    <table cellpadding="0" cellspacing="0" style="width: 190px">
                                                                        <tr>
                                                                            <td valign="top" style="height: 220px; background-image: url('images/offers/pricebg.png');
                                                                                background-repeat: no-repeat; text-align: right; padding-top: 5px;">
                                                                                <div style="height: 220px; width: 190px; position:relative; top: 0px; right: 0px;">
                                                                                            <div style="position:absolute; top:45px; right:15px" >
                                                                                            <asp:Label ID="LabelPriceOffer" runat="server" CssClass="highlightPrice"></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:95px; right:15px" >
                                                                                                    <asp:Label ID="LabelPriceNormal" runat="server" CssClass="OfferPriceData"></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:141px; right:15px" >
                                                                                                    <asp:Label ID="LabelPriceDiscount" runat="server" CssClass="OfferPriceData"></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:186px; right:15px" >
                                                                                                    <asp:Label ID="LabelPriceGift" runat="server" CssClass="highlightPrice"></asp:Label>
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
                                                                            <td style="text-align:center;">
                                                                                        <asp:Panel ID="PanelBuyActive" runat="server">
                                                                                            <a href="Purchase.aspx?Mode=Offers&ItemId=<% Response.Write(HiddenFieldOfferId.Value); %>">
                                                                                            <img style="border-style: none" alt="&#1582;&#1585;&#1740;&#1583; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;" height="30" src="images/Buttons/buyoffer160-off.png"
                                                                                                width="160" 
                                                                                            onmouseover="this.src='images/Buttons/buyoffer160-on.png';" 
                                                                                            onmouseout="this.src='images/Buttons/buyoffer160-off.png';" /></a><br />
                                                                                        </asp:Panel>
                                                                                        <asp:Panel ID="PanelBuyInactive" runat="server" Visible="False">
                                                                                            <img style="border-style: none" alt="&#1582;&#1585;&#1740;&#1583; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;" height="30" src="images/Buttons/timeout-off.png"
                                                                                                width="160" />
                                                                                        </asp:Panel>
                                                                                        <a id="PrintLink" target="_blank" href="Print.aspx?Mode=Offers&ItemId=<% Response.Write(HiddenFieldOfferId.Value); %>">
                                                                                        <img alt="&#1670;&#1575;&#1662; &#1605;&#1588;&#1582;&#1589;&#1575;&#1578;" height="30" style="border-style: none" src="images/Buttons/printinfo140-off.png" width="140" onmouseover="this.src='images/Buttons/printinfo140-on.png';" onmouseout="this.src='images/Buttons/printinfo140-off.png';" /></a>
                                                                                        <br />
                                                                                        <asp:ImageButton ID="ImageButtonFavorite" runat="server" Height="30px" ImageUrl="~/images/Buttons/addfavorite140-off.png" Width="140px" onclick="ImageButtonFavorite_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                    <asp:Image ID="ImageActionImage" runat="server" Height="16px" Visible="False" 
                                                                        Width="16px" />&nbsp;<asp:Label ID="LabelAction" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table cellpadding="0" cellspacing="0" style="width: 190px">
                                                                        <tr>
                                                                            <td valign="center" style="height: 60px; background-image: url('images/offers/timebg.png');
                                                                                text-align: left; direction: ltr;">
                                                                                 <p id="time" class="time"></p>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table cellpadding="0" cellspacing="0" style="width: 190px">
                                                                        <tr>
                                                                            <td valign="bottom" style="height: 56px; background-image: url('images/offers/sharebg.png');
                                                                                text-align: center;">
                                                                                <a id="A5" href="http://www.facebook.com/share.php?u=<% Response.Write(Request.Url.AbsoluteUri); %>"
                                                                                    target="_blank" class="fade">
                                                                                    <img alt="" style="border-style: none" height="24" src="images/social/facebook24.png"
                                                                                        width="24" /></a>&nbsp; <a id="A6" href="http://twitter.com/home?status=<% Response.Write(Request.Url.AbsoluteUri); %>"
                                                                                            class="fade">
                                                                                            <img alt="" style="border-style: none" height="24" src="images/social/twitter24.png"
                                                                                                width="24" /></a>&nbsp;
                                                                                <!-- Place this tag where you want the +1 button to render -->
                                                                                <g:plusone size="medium" annotation="none"></g:plusone>
                                                                                <!-- Place this render call where appropriate -->
                                                                                <script type="text/javascript">
                                                                                    (function () {
                                                                                        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                                                                        po.src = 'https://apis.google.com/js/plusone.js';
                                                                                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                                                                                    })();
                                                                                </script>
                                                                                &nbsp; <a id="A3" href="http://www.cloob.com/share/link/add?url=<% Response.Write(Request.Url.AbsoluteUri); %>"
                                                                                    target="_blank" class="fade">
                                                                                    <img alt="" style="border-style: none" height="24" src="images/social/cloob24.png"
                                                                                        width="24" /></a>&nbsp; <a id="A8" class="fade" href="mailto:?subject=<% Response.Write(Page.Title); %>&body=<% Response.Write(Request.Url.AbsoluteUri); %>">
                                                                                            <img alt="" style="border-width: 0px; border-style: none;" height="24" src="images/icons/messages24.png"
                                                                                                width="24" /></a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td valign="top" style="width: 450px">
                                                        <table style="width: 440px; height: 300px">
													        <tr>
                                                                <td>
                                                                    	
                                                                            <asp:Repeater ID="RepeaterGallery" runat="server" 
                                                    DataSourceID="SqlDataSourceGallery">
                                                <HeaderTemplate>
                                                    <div id="wowslider-container1"><div class="ws_images"><ul>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <li><img src="<%# "Files/Photos/" + Eval("PhotoId") + ".jpg" %>"/></li>
                                                </ItemTemplate>
                                                <FooterTemplate>
								                 </ul></div>
                                                <div class="ws_bullets"><div>
                                                </div></div>
	                                                <div class="ws_shadow"></div>
	                                                </div>
	                                                <script type="text/javascript" src="_Shared/jQuery/wowslider/wowslider.js"></script>
	                                                <script type="text/javascript" src="_Shared/jQuery/wowslider/script.js"></script>
                                                </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                                    SelectCommand="sp_offerPhotosVerified" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="OfferId" QueryStringField="OfferId" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    &nbsp;
                                                                    &nbsp;
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    <div style="width: 430px; height: 97px; position:relative; background-image: url('images/offers/reportbg.png');">
                                                                    <div style="position:absolute; top:26px; left:27px; width:<% Response.Write(HiddenFieldProgressSize.Value); %>px; height: 20px; background-image: url('images/progress/<% Response.Write(HiddenFieldProgressColor.Value); %>.png'); z-index:1;" >
                                                                    </div>
                                                                    <div style="position:absolute; top:70px; left:50px;" >
                                                                        <asp:Label ID="LabelPurchasedRemained" runat="server" CssClass="OfferPriceData" Text="1"></asp:Label>
                                                                    </div>
                                                                    <div style="position:absolute; top:70px; left:210px;" >
                                                                        <asp:Label ID="LabelPurchasedCount" runat="server" CssClass="OfferPriceData" Text="1"></asp:Label>
                                                                    </div>
                                                                    <div style="position:absolute; top:70px; right:15px;" >
                                                                        <asp:Label ID="LabelActivePurchased" runat="server" CssClass="OfferPriceData" 
                                                                            Text="2"></asp:Label>
                                                                        <asp:Label ID="LabelActiveMessage" runat="server" CssClass="OfferPriceData"></asp:Label>
                                                                    </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <asp:Panel ID="PanelLink1" runat="server" Visible="False">
                                                            <tr>
                                                                <td style="text-align: right;">
                                                                    <asp:Image ID="Image3" runat="server" Height="24" Width="24" ImageUrl="~/images/icons/download24.png" /> <asp:HyperLink ID="HyperLinkLink1" runat="server" Target="_blank" CssClass="NormalLink"></asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                            </asp:Panel>
                                                            <asp:Panel ID="PanelLink2" runat="server" Visible="False">
                                                            <tr>
                                                                <td style="text-align: right;">
                                                                    <asp:Image ID="Image4" runat="server" Height="24" Width="24" ImageUrl="~/images/icons/download24.png" /> <asp:HyperLink ID="HyperLinkLink2" runat="server" Target="_blank" CssClass="NormalLink"></asp:HyperLink>
                                                                    </td>
                                                            </tr>
                                                            </asp:Panel>
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="description">
                                            <a name="details"></a>
                                                <asp:Image ID="Image24" runat="server" ImageUrl="~/images/mainicons/offers24.png" />
                                                <asp:Label ID="Label50" runat="server" CssClass="ShowHideHeader" 
                                                    Text="&amp;#1605;&amp;#1588;&amp;#1582;&amp;#1589;&amp;#1575;&amp;#1578; &amp;#1662;&amp;#1740;&amp;#1588;&amp;#1606;&amp;#1607;&amp;#1575;&amp;#1583;"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Panel ID="PanelDetails" runat="server" Width="670px">
                                                    <table cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                    <tr>
                                                                        <td class="style2" style="padding-left:10px;">
                                                                            <asp:Image ID="Image18" runat="server" Height="24px" ImageUrl="~/images/icons/check22.png"
                                                                                Width="24px" />
                                                                            <asp:Label ID="Label33" runat="server" CssClass="Header" Text="&#1608;&#1740;&#1688;&#1711;&#1740; &#1607;&#1575;"></asp:Label>
                                                                            <br />
                                                                        </td>
                                                                        <td class="style2" style="padding-right:10px;">
                                                                            <asp:Image ID="Image19" runat="server" Height="24px" ImageUrl="~/images/icons/alert22.png"
                                                                                Width="24px" />
                                                                            <asp:Label ID="Label34" runat="server" CssClass="Header" Text="&#1588;&#1585;&#1575;&#1740;&#1591; &#1575;&#1587;&#1578;&#1601;&#1575;&#1583;&#1607;"></asp:Label>
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" style="width: 50%; padding-left:10px;">
                                                                                <asp:Literal ID="LiteralHighlights" runat="server"></asp:Literal>
                                                                            <br />
                                                                        </td>
                                                                        <td valign="top" style="width: 50%; padding-right:20px;">
                                                                                <asp:Literal ID="LiteralDetails" runat="server"></asp:Literal>
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <br />
                                                                <asp:Image ID="Image17" runat="server" Height="24px" ImageUrl="~/images/icons/note24.png"
                                                                    Width="24px" />
                                                                <asp:Label ID="Label32" runat="server" CssClass="Header" Text="&#1578;&#1608;&#1590;&#1740;&#1581;&#1575;&#1578;"></asp:Label>
                                                                <br />
                                                                <asp:Literal ID="LiteralDescriptions" runat="server"></asp:Literal>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="description">
                                                <a name="company"></a>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/shop24.png" />
                                                <asp:Label ID="Label52" runat="server" CssClass="ShowHideHeader" 
                                                    Text="&amp;#1605;&amp;#1588;&amp;#1582;&amp;#1589;&amp;#1575;&amp;#1578; &amp;#1662;&amp;#1740;&amp;#1588;&amp;#1606;&amp;#1607;&amp;#1575;&amp;#1583; &amp;#1583;&amp;#1607;&amp;#1606;&amp;#1583;&amp;#1607;"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Panel ID="PanelSender" runat="server" Width="670px">
                                                    <table cellpadding="0" align="center" cellspacing="0" dir="rtl" style="width: 670px;">
                                                        <tr>
                                                            <td valign="top">
                                                                <table cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
                                                                    <tr>
                                                                        <td>
                                                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                                <tr>
                                                                                    <td style="width: 125px">
                                                                                        <asp:Image ID="ImageCompany" runat="server" Height="120px" Width="120px" 
                                                                                            BorderColor="#CAE1E6" BorderWidth="1px" />
                                                                                    </td>
                                                                                    <td style="vertical-align: top;">
                                                                                        <asp:Label ID="LabelCompanyName" runat="server" CssClass="Header"></asp:Label>
                                                                                        <br />
                                                                                        <br />
                                                                                        <asp:Label ID="LabelCompanyAbout" runat="server" CssClass="FormData"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <br />
                                                                            <asp:Image ID="Image7" runat="server" Height="24px" Width="24px" ImageUrl="~/images/icons/wirephone24.png" />
                                                                            <asp:Label ID="Label12" runat="server" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740;"
                                                                                CssClass="Header"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                                <tr>
                                                                                    <td valign="top" style="width: 50%; padding-right: 24px;">
                                                                                        <asp:Image ID="Image9" runat="server" Height="24px" ImageUrl="~/images/icons/phone24.png"
                                                                                            Width="24px" />
                                                                                        <asp:Label ID="Label14" runat="server" CssClass="FormLabel" Text="&#1578;&#1604;&#1601;&#1606;:"></asp:Label>
                                                                                        <asp:Label ID="LabelTel" runat="server" CssClass="FormData"></asp:Label>
                                                                                        <br />
                                                                                        <asp:Image ID="Image10" runat="server" Height="24px" ImageUrl="~/images/icons/fax24.png"
                                                                                            Width="24px" />
                                                                                        <asp:Label ID="Label15" runat="server" CssClass="FormLabel" Text="&#1606;&#1605;&#1575;&#1576;&#1585;:"></asp:Label>
                                                                                        <asp:Label ID="LabelFax" runat="server" CssClass="FormData"></asp:Label>
                                                                                        <br />
                                                                                        <asp:Image ID="Image11" runat="server" Height="24px" ImageUrl="~/images/icons/cellphone24.png"
                                                                                            Width="24px" />
                                                                                        <asp:Label ID="Label16" runat="server" CssClass="FormLabel" Text="&#1607;&#1605;&#1585;&#1575;&#1607;:"></asp:Label>
                                                                                        <asp:Label ID="LabelMobile" runat="server" CssClass="FormData"></asp:Label>
                                                                                        <br />
                                                                                        <asp:Image ID="Image12" runat="server" Height="24px" Width="24px" ImageUrl="~/images/icons/messages24.png" />
                                                                                        <asp:Label ID="Label17" runat="server" CssClass="FormLabel" Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;:"></asp:Label>
                                                                                        <asp:Label ID="LabelEmail" runat="server" CssClass="FormData"></asp:Label>
                                                                                        <br />
                                                                                        <asp:Image ID="Image13" runat="server" Height="24px" Width="24px" ImageUrl="~/images/icons/globe24.png" />
                                                                                        <asp:Label ID="Label18" runat="server" CssClass="FormLabel" Text="&#1606;&#1588;&#1575;&#1606;&#1740; &#1575;&#1740;&#1606;&#1578;&#1585;&#1606;&#1578;&#1740;:"></asp:Label>
                                                                                        <asp:HyperLink ID="HyperLinkWebsite" runat="server" CssClass="NormalLink" 
                                                                                            Target="_blank">HyperLink</asp:HyperLink>
                                                                                        <br />
                                                                                        <asp:Image ID="Image16" runat="server" Height="24px" ImageUrl="~/images/icons/map24.png"
                                                                                            Width="24px" />
                                                                                        <asp:Label ID="Label21" runat="server" CssClass="FormLabel" Text="&#1570;&#1583;&#1585;&#1587;:"></asp:Label>
                                                                                        <asp:Label ID="LabelAddress" runat="server" CssClass="FormData"></asp:Label>
                                                                                        <br />
                                                                                    </td>
                                                                                    <td valign="top" style="width: 50%; text-align: center;">
                                                                                        <div class="map-block">
                                                                                            <a id="showmap" class="SocialLogo" href="Pages/Map.aspx?GoogleId=<% Response.Write(HiddenFieldGoogleId.Value); %>"
                                                                                                target="_blank">
                                                                                                <img src="http://maps.google.com/maps/api/staticmap?center=<% Response.Write(HiddenFieldGoogleId.Value); %>&amp;zoom=16&amp;size=350x150&amp;markers=color:pink|label:M|<% Response.Write(HiddenFieldGoogleId.Value); %>&amp;sensor=false"
                                                                                                    alt="" />
                                                                                                <span class="FormLabel">(&#1605;&#1588;&#1575;&#1607;&#1583;&#1607; &#1606;&#1602;&#1588;&#1607;
                                                                                                    &#1576;&#1586;&#1585;&#1711;)</span></a>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <br />
                                                                            <asp:Image ID="Image8" runat="server" Height="24px" Width="24px" ImageUrl="~/images/icons/stats24.png" />
                                                                            <asp:Label ID="Label13" runat="server" Text="&#1570;&#1605;&#1575;&#1585; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583;&#1607;&#1575;"
                                                                                CssClass="Header"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding-right: 24px;">
                                                                            <asp:Image ID="Image14" runat="server" Height="24px" ImageUrl="~/images/mainicons/offers24.png"
                                                                                Width="24px" />
                                                                            <asp:Label ID="Label19" runat="server" CssClass="FormLabel" Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1662;&#1740;&#1588;&#1606;&#1607;&#1575;&#1583; &#1608;&#1740;&#1688;&#1607;:"></asp:Label>
                                                                            <asp:Label ID="LabelOffersCount" runat="server" CssClass="FormData"></asp:Label>
                                                                            <br />
                                                                            <asp:Image ID="Image15" runat="server" Height="24px" ImageUrl="~/images/icons/sale24.png"
                                                                                Width="24px" />
                                                                            <asp:Label ID="Label20" runat="server" CssClass="FormLabel" Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1601;&#1585;&#1608;&#1588;:"></asp:Label>
                                                                            <asp:Label ID="LabelSaleCount" runat="server" CssClass="FormData"></asp:Label>
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="description">
                                                <a name="comments"></a>
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/icons/comment24.png" />
                                                <asp:Label ID="Label53" runat="server" CssClass="ShowHideHeader" 
                                                    Text="&amp;#1587;&amp;#1608;&amp;#1575;&amp;#1604;&amp;#1575;&amp;#1578; &amp;#1608; &amp;#1606;&amp;#1592;&amp;#1585;&amp;#1575;&amp;#1578;"></asp:Label>
                                                <br />
                                                <asp:Panel ID="PanelComments" runat="server" Width="670px">
                                                    <table cellpadding="0" align="center" cellspacing="0" dir="rtl" style="width: 670px;">
                                                        <tr>
                                                            <td valign="top" style="text-align: center;">
                                                                <a id="writecomment" href="Pages/WriteComment.aspx?Mode=Offers&ItemId=<% Response.Write(HiddenFieldOfferId.Value); %>">
                                                                    <img alt="" src="images/Buttons/writecomment140-off.png" width="140" height="30" onmouseover="this.src='images/Buttons/writecomment140-on.png';"
                                                                        onmouseout="this.src='images/Buttons/writecomment140-off.png';" border="0" /></a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                <br />
                                                                <asp:Literal ID="LiteralComments" runat="server"></asp:Literal>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 270px" valign="top">
                                <table style="width: 100%" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td class="style3" style="text-align: left;">
                                            <a href="Offers.aspx">
                                                <img alt="" src="images/offers/alloffers-off.png" width="190" height="60" onmouseover="this.src='images/offers/alloffers-on.png';"
                                                    onmouseout="this.src='images/offers/alloffers-off.png';" border="0" /></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="float: left;">
                <asp:SqlDataSource ID="SqlDataSourceOthers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    SelectCommand="SELECT 
	OfferId, 
	Title, 
	BrowserTitle, 
	PriceDiscountPercent, 
	MainPhoto
FROM Offers 
WHERE 
(EndDate &gt; GETDATE()) 
AND (ShowDate &lt; GETDATE())
ORDER BY ShowDate">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OfferId" QueryStringField="OfferId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                 <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceOthers" 
                          AutoGenerateColumns="False" DataKeyNames="OfferId" BorderStyle="None" 
                        GridLines="None" ShowHeader="False"  >
                       <Columns>
                           <asp:TemplateField ShowHeader="False" ItemStyle-BorderStyle="None">
                               <ItemTemplate>
                                 <table cellpadding="0" cellspacing="0" style="width: 190px; float: left;" dir="rtl">
	                                <tr>
		                                <td style="width: 190px; height: 190px; background-image: url('images/offers/othersbg.png');">
                                            <div style="width: 190px; height: 190px; position:relative;">
                                                <div style="position:absolute; top:5px; right:5px; width:180px;" >
                                                    <a class="NormalLink" href='<%# "ShowOffer.aspx?OfferId=" + Eval("OfferId") + "&Title=" + Eval("BrowserTitle") %>'>
													<%# Eval("Title") %>
                                                    </a>
                                                </div>
                                                <div style="position:absolute; top:90px; left:30px;" >
                                                    <asp:Label ID="LabelDiscount" runat="server" CssClass="ShowHideHeader" Text='<%# Eval("PriceDiscountPercent") + "%" %>'></asp:Label>
                                                </div>
                                                <div style="position:absolute; top:67px; right:10px;" >
                                                    <a ID="A1" class="fade" href='<%# "ShowOffer.aspx?OfferId=" + Eval("OfferId") + "&Title=" + Eval("BrowserTitle") %>'>
                                                        <img alt="" height="60" style="border-style:none" src='<%# "Files/Photos/" + Eval("MainPhoto") + "t.jpg" %>' width="90" />
                                                    </a>
                                                </div>
                                                <div style="position:absolute; top:145px; right:15px;" >
                                                    <a id="button" href='<%# "ShowOffer.aspx?OfferId=" + Eval("OfferId") + "&Title=" + Eval("BrowserTitle") %>'><img style="border-style:none" alt="" height="30" src="images/Buttons/seeoffer160-off.png" width="160" onmouseover="this.src='images/Buttons/seeoffer160-on.png';" onmouseout="this.src='images/Buttons/seeoffer160-off.png';"/></a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
	                                <tr>
		                                <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                               </ItemTemplate>
                               <ItemStyle BorderStyle="None" />
                           </asp:TemplateField>
                       </Columns>
                </asp:GridView>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </p>
        <div style="display: none;">
        <div id="offers-submitoffer" style="width: 500px; height: 300px; overflow: auto;
            direction: rtl;">
            <strong>
                <img src="images/bottom/offers28.png" />
                <span class="InlineText">!</span></strong><br />
            <br />
            <span class="InlineText">.</span></div>
    <asp:HiddenField ID="HiddenFieldOfferId" runat="server" />
    <asp:HiddenField ID="HiddenFieldGoogleId" runat="server" />
    <asp:HiddenField ID="HiddenFieldEndDate" runat="server" />
    <asp:HiddenField ID="HiddenFieldProgressSize" runat="server" />
    <asp:HiddenField ID="HiddenFieldProgressColor" runat="server" />
    </div>
</asp:Content>
