<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowCoupon.aspx.cs" Inherits="ShowCoupon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="_shared/jQuery/SlideImage/fotorama.css" rel="stylesheet" type="text/css" />
 
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
            jq14("#writecomment").fancybox({
                'titlePosition': 'inside',
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'type': 'iframe',
                'width': '5',
                'height': '4'
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

  <!-- gallery -->
		<script src="_Shared/jQuery/prettyPhoto/js/jquery-1.4.4.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="_Shared/jQuery/prettyPhoto/css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<script src="_Shared/jQuery/prettyPhoto/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
				<script type="text/javascript" charset="utf-8">
				    $(document).ready(function () {
				        $(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({ animationSpeed: 'slow', theme: 'facebook', slideshow: 2000, autoplay_slideshow: false });
				        $(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({ animationSpeed: 'fast', slideshow: 10000 });

				        $("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
				            custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
				            changepicturecallback: function () { initialize(); }
				        });

				        $("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
				            custom_markup: '<div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
				            changepicturecallback: function () { _bsap.exec(); }
				        });
				    });
		</script>
		<style type="text/css" media="screen">
			ul li { display: inline; }
		</style>


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
                                                    <td style="width: 671px; height: 95px; background-image: url('images/coupons/header.png');">
                                                        <div style="width: 671px; height: 95px; position:relative;">
                                                            <div style="position:absolute; top:35px; right:20px;" >
                                                                <asp:Label ID="LabelTitle" runat="server" CssClass="OfferTitle"></asp:Label>
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
                                                                            <td valign="top" style="height: 182px; background-image: url('images/coupons/datesbg.png');
                                                                                background-repeat: no-repeat; text-align: right; padding-top: 5px;">
                                                                                <div style="height: 172px; width: 190px; position:relative; ">
                                                                                            <div style="position:absolute; top:45px; right:15px" >
                                                                                            <asp:Label ID="LabelStartCoupon" runat="server" CssClass="OfferPriceData"></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:93px; right:15px" >
                                                                                                    <asp:Label ID="LabelEndCoupon" runat="server" CssClass="OfferPriceData"></asp:Label>
                                                                                            </div>
                                                                                            <div style="position:absolute; top:132px; right:15px" >
                                                                                                <div dir="ltr">
                                                                                                    <p id="time" class="time"></p>
                                                                                                </div>
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
                                                                                <a id="A9" href="Purchase.aspx?Mode=CouponsSingle&ItemId=<% Response.Write(HiddenFieldCouponId.Value); %>"><img style="border-style:none" alt="" height="30" src="images/Buttons/printcoupon140-off.png" width="140" onmouseover="this.src='images/Buttons/printcoupon140-on.png';" onmouseout="this.src='images/Buttons/printcoupon140-off.png';"/></a>
                                                                                        <br />
                                                                                        <asp:ImageButton ID="ImageButtonFavorite" runat="server" Height="30px" 
                                                                                            ImageUrl="~/images/Buttons/addfavorite140-off.png" Width="140px" 
                                                                                            onclick="ImageButtonFavorite_Click" />
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
														        <td valign="middle" style="width: 440px; height: 300px;background-image:url('images/offers/img-frame.png');text-align:center; padding-left:1px;">
                                                                    <asp:Image ID="ImageMainPhoto" runat="server" Height="267px" Width="400px" />
&nbsp;</td>
													        </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    <asp:HyperLink ID="HyperLinkLink3" runat="server" Target="_blank" 
                                                                        Visible="False">[HyperLinkLink3]</asp:HyperLink>
                                                                    &nbsp;
                                                                    <asp:HyperLink ID="HyperLinkLink2" runat="server" Target="_blank" 
                                                                        Visible="False">[HyperLinkLink2]</asp:HyperLink>
                                                                    &nbsp;
                                                                    <asp:HyperLink ID="HyperLinkLink1" runat="server" Target="_blank" 
                                                                        Visible="False">[HyperLinkLink1]</asp:HyperLink>
                                                                </td>
                                                            </tr>
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
                                                <asp:Image ID="Image24" runat="server" 
                                                    ImageUrl="~/images/mainicons/coupons24.png" />
                                                <asp:Label ID="Label50" runat="server" CssClass="ShowHideHeader" 
                                                    Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1608;&#1662;&#1606;"></asp:Label>
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
                                            <a name="gallery"></a>
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/icons/gallery24.png" />
                                                <asp:Label ID="Label51" runat="server" CssClass="ShowHideHeader" 
                                                    Text="&amp;#1711;&amp;#1575;&amp;#1604;&amp;#1585;&amp;#1740; &amp;#1593;&amp;#1705;&amp;#1587;"></asp:Label>
                                                <br />
                                                <asp:Repeater ID="RepeaterGallery" runat="server" 
                                                    DataSourceID="SqlDataSourceGallery">
                                                <HeaderTemplate>
                                                    <table style="width: 560px" align="center" cellspacing="0" cellpadding="0" class="style8">
	                                                    <tr>
		                                                    <td>
			                                                    <table style="width: 100%" cellspacing="0" cellpadding="0">
				                                                    <tr>
					                                                    <td>
						                                                    <table style="width: 100%" cellspacing="0" cellpadding="0" dir="rtl">
							                                                    <tr>
								                                                    <td><ul class="gallery clearfix">
                                                </HeaderTemplate>
                                                <ItemTemplate>
									                                                    <li><a href="<%# "Files/Photos/" + Eval("PhotoId") + ".jpg" %>" rel="prettyPhoto[gallery2]">
									                                                    <img src="<%# "Files/Photos/" + Eval("PhotoId") + "t.jpg" %>" width="60" height="40" alt="<%# Eval("Text") %>" style="border: 1px solid #000000" /></a></li>
                                                </ItemTemplate>
                                                <FooterTemplate>
								                                                    </ul></td>
							                                                    </tr>
						                                                    </table>
					                                                    </td>
				                                                    </tr>
			                                                    </table>
		                                                    </td>
	                                                    </tr>
                                                    </table>
                                                </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSourceGallery" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                                    SelectCommand="sp_couponPhotosVerified" 
                                                    SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="CouponId" QueryStringField="CouponId" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="description">
                                                <a name="company"></a>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icons/shop24.png" />
                                                <asp:Label ID="Label52" runat="server" CssClass="ShowHideHeader" 
                                                    Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1575;&#1585;&#1575;&#1574;&#1607; &#1583;&#1607;&#1606;&#1583;&#1607;"></asp:Label>
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
                                                                            <asp:Label ID="Label13" runat="server" Text="&#1570;&#1605;&#1575;&#1585; &#1705;&#1608;&#1662;&#1606; &#1607;&#1575;"
                                                                                CssClass="Header"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding-right: 24px;">
                                                                            <asp:Image ID="Image14" runat="server" Height="24px" ImageUrl="~/images/mainicons/offers24.png"
                                                                                Width="24px" />
                                                                            <asp:Label ID="Label19" runat="server" CssClass="FormLabel" Text="&#1578;&#1593;&#1583;&#1575;&#1583; &#1705;&#1608;&#1662;&#1606;:"></asp:Label>
                                                                            <asp:Label ID="LabelCouponsCount" runat="server" CssClass="FormData"></asp:Label>
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
                                                <br />
                                                <asp:Panel ID="PanelComments" runat="server" Width="670px">
                                                    <table cellpadding="0" align="center" cellspacing="0" dir="rtl" style="width: 670px;">
                                                        <tr>
                                                            <td valign="top" style="text-align: center;">
                                                                <a id="writecomment" href="Pages/WriteComment.aspx?Mode=Coupons&ItemId=<% Response.Write(HiddenFieldCouponId.Value); %>">
                                                                    <img alt="" src="images/Buttons/writecomment140-off.png" width="140" height="30" onmouseover="this.src='images/Buttons/writecomment140-on.png';"
                                                                        onmouseout="this.src='images/Buttons/writecomment140-off.png';" border="0" /></a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                <br />
                                                                <asp:Literal ID="LiteralComment" runat="server"></asp:Literal>
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
                                            <a href="Coupons.aspx">
                                                <img alt="" src="images/coupons/allcoupons-off.png" width="190" height="60" onmouseover="this.src='images/coupons/allcoupons-on.png';"
                                                    onmouseout="this.src='images/coupons/allcoupons-off.png';" border="0" /></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; width: 270px;">
                                            <a id="offerslink-about" href="images/coupons/about.png" target="_blank">
                                                <img alt="" height="196" src="images/offers/help.png" style="float: left" width="190"
                                                    border="0" /></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a id="offerslink-submitoffer" href="images/coupons/marketing.png" target="_blank">
                                                <img alt="" height="140" src="images/offers/order.png" style="float: left" width="190"
                                                    border="0" /></a>
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
    <asp:HiddenField ID="HiddenFieldCouponId" runat="server" />
    <asp:HiddenField ID="HiddenFieldGoogleId" runat="server" />
    <asp:HiddenField ID="HiddenFieldEndDate" runat="server" />
    </div>
</asp:Content>