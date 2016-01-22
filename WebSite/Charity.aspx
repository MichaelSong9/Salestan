<%@ Page Title="Salestan : &#1582;&#1740;&#1585;&#1740;&#1607;" Language="C#"
    MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Charity.aspx.cs"
    Inherits="Charity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- StartStopSlider -->
    <link rel="stylesheet" href="_Shared/jQuery/StartStopSlider/css/style.css" type="text/css"
        media="screen" charset="utf-8" />
    <script type="text/javascript" src="_Shared/jQuery/StartStopSlider/js/jquery-1.2.6.js"></script>
    <script type="text/javascript" src="_Shared/jQuery/StartStopSlider/js/startstop-slider.js"></script>
    <style type="text/css">
        .style1
        {
            height: 31px;
        }
    </style>
    <script type="text/javascript">
        jq14(document).ready(function () {
            jq14("#aboutcharity").fancybox({
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%" cellspacing="0" cellpadding="0">
        <tr>
            <td style="width: 250px" valign="top" dir="rtl">
                <table style="width: 100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <span lang="fa">
                                <img alt="" src="images/charity/titles/partners.png" width="140" height="32" /></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="Label8" runat="server" CssClass="smalltext" 
                                Text="&#1583;&#1585; &#1581;&#1575;&#1604; &#1581;&#1575;&#1590;&#1585; &#1605;&#1608;&#1587;&#1587;&#1607; &#1607;&#1605;&#1705;&#1575;&#1585;&#1740; &#1608;&#1580;&#1608;&#1583; &#1606;&#1583;&#1575;&#1585;&#1583;."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a id="aboutcharity" href="Pages/Content.aspx?Page=CharityAbout">
                                <img alt="" height="132" src="images/charity/about.png" style="width="190"
                                    border="0" /></a>
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="HiddenFieldH2" runat="server" />
                <asp:HiddenField ID="HiddenFieldH3" runat="server" />
                <asp:HiddenField ID="HiddenFieldP1" runat="server" />
                <asp:HiddenField ID="HiddenFieldH1" runat="server" />
                <asp:HiddenField ID="HiddenFieldP3" runat="server" />
                <asp:HiddenField ID="HiddenFieldP2" runat="server" />
                <asp:HiddenField ID="HiddenFieldId1" runat="server" />
                <asp:HiddenField ID="HiddenFieldId2" runat="server" />
                <asp:HiddenField ID="HiddenFieldId3" runat="server" />
            </td>
            <td valign="top" align="right" style="width: 700px">
                <table style="width: 650px" dir="ltr" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 650px;">
                            <!-- StartStopSlider -->
                            <div id="page-wrap">
                                <div id="slider">
                                    <div id="mover">
                                        <div id="slide-1" class="slide">
                                            <h1 id="hn1"><% Response.Write(HiddenFieldH1.Value); %>
                                            </h1>
                                            <p id="pn1"><% Response.Write(HiddenFieldP1.Value); %>
                                                <br />
                                                  <a  href="CharityNews.aspx?NewsId=<% Response.Write(HiddenFieldId1.Value); %>" class="NewsMore">&#1575;&#1583;&#1575;&#1605;&#1607; &#1582;&#1576;&#1585;...</a>
                                                </p>
                                            <a id="an1" href="#"><img alt="news" src="images/charity/news/<% Response.Write(HiddenFieldId1.Value); %>-small.png" /></a>
                                        </div>
                                        <div class="slide">
                                            <h1 id="hn2"><% Response.Write(HiddenFieldH2.Value); %>
                                            </h1>
                                            <p id="pn2"><% Response.Write(HiddenFieldP2.Value); %>
                                                <br />
                                                  <a  href="CharityNews.aspx?NewsId=<% Response.Write(HiddenFieldId2.Value); %>" class="NewsMore">&#1575;&#1583;&#1575;&#1605;&#1607; &#1582;&#1576;&#1585;...</a>
                                              </p>
                                            <a id="an2" href="#"><img alt="news" src="images/charity/news/<% Response.Write(HiddenFieldId2.Value); %>-small.png" /></a>
                                        </div>
                                        <div class="slide">
                                            <h1 id="hn3"><% Response.Write(HiddenFieldH3.Value); %>
                                            </h1>
                                            <p id="pn3"><% Response.Write(HiddenFieldP3.Value); %>
                                                <br />
                                                <a  href="CharityNews.aspx?NewsId=<% Response.Write(HiddenFieldId3.Value); %>" class="NewsMore">&#1575;&#1583;&#1575;&#1605;&#1607; &#1582;&#1576;&#1585;...</a>
                                             </p>
                                            <a id="an3" href="#"><img alt="news" src=  "images/charity/news/<% Response.Write(HiddenFieldId3.Value); %>-small.png" /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 650px; direction: rtl;">
                            <span lang="fa">
                                <img alt="" src="images/charity/titles/news.png" width="140" height="32" /><br />
                                &nbsp;</span><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShopConnectionString2 %>"
                                    
                                SelectCommand="sp_charityNewsMainPage" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 650px; overflow: auto;" dir="rtl">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsId"
                                DataSourceID="SqlDataSource1" GridLines="None" Height="100px" ShowHeader="False"
                                Style="margin-left: 0px" Width="648px">
                                <AlternatingRowStyle Wrap="true" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <table style="width: 100%; height: 108px;" dir="rtl">
                                                <tr>
                                                    <td style="width: 180px;" rowspan="3">
                                                        <asp:HyperLink ID="HyperLink22" runat="server" Height="100px" ImageUrl='<%# "~/images/charity/news/"+Eval("NewsId")+"-small.png" %>'
                                                            NavigateUrl='<%# "~/CharityNews.aspx?NewsId="+Eval("NewsId") %>' ToolTip='<%# Eval("Subject") %>'
                                                            Width="182px">[HyperLink22]</asp:HyperLink>
                                                    </td>
                                                    <td dir="rtl" class="style1">
                                                        <asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl='<%# "~/CharityNews.aspx?NewsId="+Eval("NewsId") %>'
                                                            Text='<%# Eval("Subject") %>' CssClass="NewsTitle"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 468px; max-width: 468px;" dir="rtl">
                                                        <asp:Label ID="LabelDate" runat="server" CssClass="NewsDate" Text='<%# ShamsiDate(Eval("SubmitDate")) %>'></asp:Label>
                                                        <div class="NewsBrief"><asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Brief") %>'></asp:Literal></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" dir="rtl">
                                                        <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl='<%# "~/CharityNews.aspx?NewsId="+Eval("NewsId") %>'
                                                            CssClass="NewsMore">&#1575;&#1583;&#1575;&#1605;&#1607; &#1582;&#1576;&#1585;...</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="left" dir="rtl">
                                                        <hr />
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
</asp:Content>
