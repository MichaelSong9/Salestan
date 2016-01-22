<%@ Page Title="Salestan : &#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1576;&#1604;&#1575;&#1711;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminBlog.aspx.cs" Inherits="AdminBlog" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:Image ID="Image26" runat="server" Height="32px" 
            ImageUrl="~/images/controlpanel/menu/blog32.png" Width="32px" />
        <asp:Label ID="LabelHeader" runat="server" CssClass="Header" 
            Text="&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1576;&#1604;&#1575;&#1711;"></asp:Label>
        <br />
        <br />
        <div class="ShowHidePanel1">
            <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/add24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonAdd" runat="server" CssClass="MessageSender" onclick="LinkButtonAdd_Click"
                 >&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1605;&#1591;&#1604;&#1576;</asp:LinkButton>
            <asp:Panel ID="PanelAdd" runat="server" Visible="False" Width="100%">
            <br />
<table style="width:100%;">
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLastName" runat="server" Text="&#1593;&#1606;&#1608;&#1575;&#1606;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxTitle"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxTitle" runat="server" CssClass="TextBoxRequiredR2L" 
                        Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout" runat="server" 
                        ControlToValidate="TextBoxTitle" CssClass="FormValidation" 
                        ErrorMessage="&#1593;&#1606;&#1608;&#1575;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelCategory" runat="server" 
                        AssociatedControlID="DropDownListCategory" CssClass="FormLabel" 
                        Text="&#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCategory" runat="server" CssClass="DropDownRequiredR2L" 
                        DataSourceID="SqlDataSourceCategoriesBlog" DataTextField="CategoryName" 
                        DataValueField="CategoryId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCategoriesBlog" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_blogCategories" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2" style="vertical-align:top;">
                    <asp:Label ID="LabelHighlights" runat="server" 
                        AssociatedControlID="TextBoxBrief" CssClass="FormLabel" 
                        Text="&#1582;&#1604;&#1575;&#1589;&#1607;:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxBrief" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout0" runat="server" 
                        ControlToValidate="TextBoxBrief" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1582;&#1604;&#1575;&#1589;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;" class="style2">
                    <asp:Label ID="LabelDetails" runat="server" 
                        Text="&#1605;&#1578;&#1606;:" CssClass="FormLabel" 
                        AssociatedControlID="TextBoxBody"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxBody" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                        TextMode="MultiLine" Height="100px" Width="350px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAbout1" runat="server" 
                        ControlToValidate="TextBoxBody" CssClass="FormValidation" 
                        
                        ErrorMessage="&#1605;&#1578;&#1606; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        ValidationGroup="Add"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLocations0" runat="server" 
                        AssociatedControlID="TextBoxPhotoLink" CssClass="FormLabel" 
                        Text="&#1604;&#1740;&#1606;&#1705; &#1578;&#1589;&#1608;&#1740;&#1585;:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPhotoLink" runat="server" CssClass="TextBoxRequiredL2R" 
                        Width="350px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBoxPhotoLink" CssClass="FormValidation" 
                        ErrorMessage="&#1604;&#1740;&#1606;&#1705; &#1578;&#1589;&#1608;&#1740;&#1585; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="Information"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLocations" runat="server" 
                        AssociatedControlID="CheckBoxListLocations" CssClass="FormLabel" 
                        Text="&#1605;&#1705;&#1575;&#1606; &#1607;&#1575;&#1740; &#1606;&#1605;&#1575;&#1740;&#1588;:"></asp:Label>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceLocations" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_locations" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                    <asp:CheckBoxList ID="CheckBoxListLocations" runat="server" 
                        CssClass="FormLabel" DataSourceID="SqlDataSourceLocations" 
                        DataTextField="LocationName" DataValueField="LocationId">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLanguage" runat="server" 
                        AssociatedControlID="DropDownListLanguage" CssClass="FormLabel" 
                        Text="&#1586;&#1576;&#1575;&#1606;:"></asp:Label>
                </td>
                <td class="style2">
                    <asp:DropDownList ID="DropDownListLanguage" runat="server" CssClass="DropDownRequiredR2L" 
                        AutoPostBack="True" DataSourceID="SqlDataSourceLanguages" 
                        DataTextField="LanguageName" DataValueField="LanguageId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceLanguages" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                        SelectCommand="sp_languages" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <Controls:Captcha ID="captcha" runat="server" CalcMode="1" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButtonAdd" runat="server" 
                        ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Add" 
                        onclick="ImageButtonAdd_Click" />
                    <asp:Label ID="LabelAddMessage" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/controlpanel/menu/blog24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonManage" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonManage_Click"
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1605;&#1591;&#1575;&#1604;&#1576;</asp:LinkButton>
            <br />
            <asp:Panel ID="PanelManage" runat="server" Visible="False" Width="100%">
                <br />
                <table class="style1">
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewBlog" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="900px" 
                                AllowSorting="True" DataSourceID="SqlDataSourceBlog">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="BlogId" 
                                        HeaderText="&#1588;&#1606;&#1575;&#1587;&#1607;" SortExpression="BlogId" >
                                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                                    </asp:BoundField>
                                    <asp:HyperLinkField DataNavigateUrlFields="BlogId,BrowserTitle" 
                                        DataNavigateUrlFormatString="~/ShowBlog.aspx?BlogId={0}&amp;Title={1}" 
                                        DataTextField="Title" HeaderText="&#1593;&#1606;&#1608;&#1575;&#1606;" SortExpression="Title" 
                                        Target="_blank">
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="400px" />
                                    </asp:HyperLinkField>
                                    <asp:BoundField HeaderText="&#1605;&#1588;&#1575;&#1607;&#1583;&#1607;" DataField="ViewCount" 
                                        SortExpression="ViewCount" >
                                    <ItemStyle Width="75px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="&#1586;&#1605;&#1740;&#1606;&#1607;" 
                                        DataField="CategoryName" SortExpression="CategoryName" >
                                    <ItemStyle Width="150px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1740;&#1582; &#1575;&#1585;&#1587;&#1575;&#1604;" SortExpression="SubmitDate">
                                        <ItemStyle Width="150px" />
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# ShowDate(Eval("SubmitDate")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:HyperLinkField HeaderText="&#1578;&#1594;&#1740;&#1740;&#1585;" 
                                        DataNavigateUrlFields="BlogId" 
                                        DataNavigateUrlFormatString="~/AdminPages/Blog.aspx?Mode=Edit&amp;BlogId={0}" 
                                        Text="&#1578;&#1594;&#1740;&#1740;&#1585;" Target="_blank" >
                                    <ControlStyle CssClass="NormalLink" />
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                    </asp:HyperLinkField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" CssClass="GridViewHeader" Font-Bold="True" 
                                    ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" CssClass="GridViewText" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceBlog" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                                
                                SelectCommand="sp_blog" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image3" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/comment24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonComments" runat="server" CssClass="MessageSender" onclick="LinkButtonComments_Click"
                 >&#1606;&#1592;&#1585;&#1575;&#1578; &#1705;&#1575;&#1585;&#1576;&#1585;&#1575;&#1606;</asp:LinkButton>
            &nbsp;<asp:Label ID="LabelCommentNewCount" runat="server" CssClass="FormValidation" 
                Text="(1 &#1606;&#1592;&#1585; &#1662;&#1575;&#1587;&#1582; &#1583;&#1575;&#1583;&#1607; &#1606;&#1588;&#1583;&#1607;)"></asp:Label>
            <br />
            <asp:Panel ID="PanelComments" runat="server" Visible="False" Width="100%">
                <asp:SqlDataSource ID="SqlDataSourceComments" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    SelectCommand="sp_commentsBlogPending" 
                    SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <asp:Repeater ID="RepeaterComments" runat="server" 
                        DataSourceID="SqlDataSourceComments" 
                    onitemcommand="RepeaterComments_ItemCommand">
                        <ItemTemplate>
                <table class="style1" style="direction:rtl; width: 100%;">
                    <tr>
                        <td colspan="2" class="style3">
                            <asp:HyperLink ID="HyperLinkCommentBlog" runat="server" CssClass="NormalLink" 
                            NavigateUrl='<%# Eval("ItemId", "~/ShowBlog.aspx?BlogId={0}") %>'><%# Eval("Title") %></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="width: 50%">
                            <asp:HyperLink ID="HyperLinkCommentsUser" runat="server" CssClass="NormalLink" 
                                Target="_blank" NavigateUrl='<%# Eval("UserId", "~/AdminPages/Users.aspx?Mode=Info&UserId={0}") %>'><%# Eval("FullName") %></asp:HyperLink>
                            <br />
                            <asp:TextBox ID="TextBoxComment" runat="server" Height="75px" ReadOnly="True" 
                                CssClass="FormData" TextMode="MultiLine" Width="95%" Text='<%# Eval("Comment") %>'></asp:TextBox>
                        </td>
                        <td style="width: 50%">
                            <asp:Label ID="Label117" runat="server" CssClass="FormLabel" Text="Salestan:"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBoxAnswer" runat="server" Height="75px" 
                                CssClass="TextBoxR2L" TextMode="MultiLine" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center;" colspan="2" class="style2">
                            <asp:ImageButton ID="ImageButtonCommentReject" runat="server" Height="32px" 
                                Width="32px" ImageUrl="~/images/icons/thumb_down32.png" CommandArgument='<%# Eval("CommentId") %>' CommandName="CommentReject"/>
                            &nbsp; &nbsp;<asp:ImageButton ID="ImageButtonCommentVerify" runat="server" Height="32px" 
                                Width="32px" ImageUrl="~/images/icons/thumb_up32.png"  CommandArgument='<%# Eval("CommentId") %>' CommandName="CommentVerify"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2" style="text-align:center;">
                            <hr /></td>
                    </tr>
                </table>
                        </ItemTemplate>
                    </asp:Repeater>
            </asp:Panel>
        </div>
        <div class="ShowHidePanel1">
            <asp:Image ID="Image4" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/categories24.png" Width="24px" />
            <asp:LinkButton ID="LinkButtonCategories" runat="server" 
                CssClass="MessageSender" onclick="LinkButtonCategories_Click"
                 >&#1605;&#1583;&#1740;&#1585;&#1740;&#1578; &#1586;&#1605;&#1740;&#1606;&#1607; &#1607;&#1575;</asp:LinkButton>
            <asp:Panel ID="PanelCategories" runat="server" Visible="False" Width="100%">
                <br />
                <asp:GridView ID="GridViewCategories" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" 
                     ForeColor="#333333" GridLines="None" Width="350px" 
                    DataKeyNames="CategoryId" DataSourceID="SqlDataSourceCategories">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607;" 
                            DataField="CategoryId" SortExpression="CategoryId">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607;" 
                            DataField="CategoryName" SortExpression="CategoryName" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/images/icons/delete16.png" HeaderText="&#1581;&#1584;&#1601;" 
                            ShowDeleteButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" CssClass="GridViewHeader" Font-Bold="True" 
                         ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" CssClass="GridViewText" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
                    
                    
                    
                    SelectCommand="sp_blogCategories" 
                    DeleteCommand="sp_blogCategoryDelete" 
                    DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <table class="style1" style="direction:rtl;">
                    <tr>
                        <td colspan="2" class="style2">
                            <asp:Image ID="Image27" runat="server" Height="16px" 
                                ImageUrl="~/images/icons/add16.png" Width="16px" />
                            <asp:Label ID="Label7" runat="server" CssClass="FormData" 
                                Text="&#1575;&#1590;&#1575;&#1601;&#1607; &#1705;&#1585;&#1583;&#1606; &#1586;&#1605;&#1740;&#1606;&#1607;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocationCode" runat="server" 
                                AssociatedControlID="TextBoxCategoryId" CssClass="FormLabel" 
                                Text="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                                <asp:TextBox ID="TextBoxCategoryId" runat="server" CssClass="TextBoxRequiredL2R" 
                                    ValidationGroup="Category" Width="50px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationCode" 
                                    runat="server" ControlToValidate="TextBoxCategoryId" 
                                    CssClass="FormValidation" ErrorMessage="&#1705;&#1583; &#1586;&#1605;&#1740;&#1606;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                    ValidationGroup="Category"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="LabelLocationName" runat="server" 
                                AssociatedControlID="TextBoxCategoryName" CssClass="FormLabel" 
                                Text="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607;:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCategoryName" runat="server" 
                                ValidationGroup="Category" Width="125px" CssClass="TextBoxRequiredR2L"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocationName" 
                                runat="server" ControlToValidate="TextBoxCategoryName" 
                                CssClass="FormValidation" ErrorMessage="&#1606;&#1575;&#1605; &#1586;&#1605;&#1740;&#1606;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                                ValidationGroup="Category"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:ImageButton ID="ImageButtonCategoryAdd" runat="server" 
                                ImageUrl="~/images/Buttons/add-off.png" ValidationGroup="Category" onclick="ImageButtonCategoryAdd_Click"
                                 />
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="LabelAddCategoryMessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

