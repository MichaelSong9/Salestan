<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowBlog.aspx.cs" Inherits="ShowBlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" cellspacing="0" cellpadding="0">
        <tr>
            <td colspan="2" style="text-align:center;">
                <asp:Image ID="Image1" runat="server" Height="160px" 
                    ImageUrl="~/images/blog/header.png" Width="850px" />
                <br />
&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 250px" valign="top">
                <table style="width: 100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <td >
                            &nbsp;<asp:Image ID="Image4" runat="server" Height="24px" 
                                        ImageUrl="~/images/controlpanel/menu/blog24.png" Width="24px" />
                            <asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="~/Blog.aspx" 
                                        CssClass="NormalLink">&#1576;&#1575;&#1586;&#1711;&#1588;&#1578; &#1576;&#1607; &#1589;&#1601;&#1581;&#1607; &#1575;&#1608;&#1604; &#1576;&#1604;&#1575;&#1711;</asp:HyperLink>
                                </td>
                    </tr>
                    <tr>
                        <td style="text-align:center; width: 270px;">
								    &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
                                <tr>
                                    <td style="direction:rtl;">
                                        <span lang="fa">
                                        <img alt="" height="32" src="images/charity/titles/lastnews.png" width="140" /><br />&nbsp;</span><asp:SqlDataSource 
                                            ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString2 %>" 
                    SelectCommand="sp_blogOthersTopFive" 
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td dir="rtl">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BlogId" DataSourceID="SqlDataSource1" GridLines="None" ShowHeader="False" style="margin-left: 0px" Width="250px">
                                            <AlternatingRowStyle Wrap="True" />
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <table dir="rtl" style="width:100%">
                                                            <tr>
                                                                <td dir="rtl">
                                                                    <asp:HyperLink ID="HyperLink20" runat="server" CssClass="NormalLink" 
                                                                NavigateUrl='<%# "~/ShowBlog.aspx?BlogId=" + Eval("BlogId") + "&Title=" + Eval("BrowserTitle") %>' 
                                                                Text='<%# Eval("Title") %>' Width="220px"></asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" dir="rtl">
                                                                    <hr style="height: 1px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <ItemStyle Wrap="True" />
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
            <td valign="top" align="right" style="width: 700px">
                <table style="width: 650px" dir="ltr" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 650px;">
                            <table dir="rtl" style="width: 700px;">
                                <tr>
                                    <td>
                                        <asp:Label ID="LabelTitle" runat="server" CssClass="NewsTitle"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 100%">
										    <tr>
											    <td style="width: 50%">
                                        <asp:Label ID="LabelCat0" runat="server" CssClass="NewsDate" Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;:"></asp:Label>
                                        <asp:Label ID="LabelDate" runat="server" CssClass="NewsDate"></asp:Label>
                                                </td>
											    <td style="width: 50%">
                                        <asp:Label ID="LabelCat" runat="server" CssClass="NewsDate" Text="&#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                                        <asp:Label ID="LabelCategory" runat="server" CssClass="NewsDate"></asp:Label>
                                                </td>
										    </tr>
									    </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <body>
                                            <table cellpadding="0" cellspacing="0" style="width: 100%; background-color:#f2f2f2;">
                                                <tr>
                                                    <td style="width: 25%;text-align:center;" >
                                                        <asp:HyperLink ID="HyperLinkShareEmail" runat="server" 
                                                        ImageUrl="~/images/share/share-email.png"></asp:HyperLink>
                                                    </td>
                                                    <td style="width: 25%;text-align:center;" >
                                                        <asp:HyperLink ID="HyperLinkShareFacebook" runat="server" 
                                                        ImageUrl="~/images/share/share-facebook.png" Target="_blank"></asp:HyperLink>
                                                    </td>
                                                    <td style="width: 25%;text-align:center;" >
                                                        <asp:HyperLink ID="HyperLinkShareTwitter" runat="server" 
                                                        ImageUrl="~/images/share/share-twitter.png" Target="_blank"></asp:HyperLink>
                                                    </td>
                                                    <td style="width: 25%;text-align:center;" >
                <!-- Place this tag where you want the +1 button to render -->
                                                        <g:plusone size="medium" annotation="none">
                                                        </g:plusone>

<!-- Place this render call where appropriate -->
<script type="text/javascript">
    (function () {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/plusone.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
    })();
</script>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;">
                                                        <br />
                                                        <asp:Image ID="ImageImage" runat="server" 
                        BorderColor="#999999" BorderWidth="1px" />
                                                        <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelBody" runat="server" CssClass="NewsBody"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        
                                            &nbsp;&nbsp;</td>
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
                                                                <a id="writecomment" href="Pages/WriteComment.aspx?Mode=Blog&ItemId=<% Response.Write(Request.QueryString["BlogId"].ToString()); %>">
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
                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
	                                            <tr>
		                                            <td style="width: 50%">
                                                        <asp:Panel ID="PanelNext" runat="server" Visible="False">
                                                            <asp:Image ID="Image12" runat="server" Height="22px" 
                                                                ImageUrl="~/images/icons/right22.png" Width="22px" />
                                                            <asp:HyperLink ID="HyperLinkNext" runat="server" 
    CssClass="NormalLink">[HyperLinkPervious]</asp:HyperLink>
                                                        </asp:Panel>
                                                    </td>
		                                            <td style="width: 50%; text-align: left">
                                                        <asp:Panel ID="PanelPervious" runat="server" Visible="False">
                                                            <asp:HyperLink ID="HyperLinkPervious" runat="server" 
    CssClass="NormalLink">[HyperLinkPervious]</asp:HyperLink>
                                                            <asp:Image ID="Image11" runat="server" Height="22px" 
                                                                ImageUrl="~/images/icons/left22.png" Width="22px" />
                                                        </asp:Panel>
                                                    </td>
	                                            </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Content>

