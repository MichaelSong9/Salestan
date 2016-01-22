<%@ Page Title="Salestan : &#1576;&#1604;&#1575;&#1711;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td valign="top" align="right" style="width: 700px">
                <table style="width: 650px" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 700px;">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShopConnectionString2 %>"
                                    
                                SelectCommand="sp_blogMainPage" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 650px; overflow: auto;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BlogId"
                                DataSourceID="SqlDataSource1" GridLines="None" Height="100px" ShowHeader="False"
                                Style="margin-left: 0px" Width="648px">
                                <AlternatingRowStyle Wrap="true" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLinkTitle" runat="server" NavigateUrl='<%# "~/ShowBlog.aspx?BlogId="+ Eval("BlogId") + "&Title=" + Eval("BrowserTitle") %>'
                                                            Text='<%# Eval("Title") %>' CssClass="NewsTitle"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table style="width: 100%">
															<tr>
																<td style="width: 50%">
                                                        <asp:Label ID="LabelCat0" runat="server" CssClass="NewsDate" Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;:"></asp:Label>
                                                        <asp:Label ID="LabelDate" runat="server" CssClass="NewsDate" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                                                    			</td>
																<td style="width: 50%">
                                                        <asp:Label ID="LabelCat" runat="server" CssClass="NewsDate" Text="&#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                                                        <asp:Label ID="LabelCategory" runat="server" CssClass="NewsDate" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                                    			</td>
															</tr>
														</table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center;">
                                                        <asp:HyperLink ID="HyperLinkImage" runat="server" ImageUrl='<%# Eval("PhotoLink") %>'
                                                            NavigateUrl='<%# "~/ShowBlog.aspx?BlogId="+ Eval("BlogId") + "&Title=" + Eval("BrowserTitle") %>' ToolTip='<%# Eval("Title") %>'></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="NewsBrief"><asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Brief") %>'></asp:Literal></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl='<%# "~/ShowBlog.aspx?BlogId="+ Eval("BlogId") + "&Title=" + Eval("BrowserTitle") %>'
                                                            CssClass="NewsMore">&#1575;&#1583;&#1575;&#1605;&#1607; &#1605;&#1591;&#1604;&#1576;...</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="left">
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
