<%@ Page Title="Salestan : &#1662;&#1740;&#1594;&#1575;&#1605; &#1607;&#1575;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#link-newmessage").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'type': 'iframe',
	            'width': '6',
	            'height': '3'
	        });
	    });
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div dir="rtl" align="right">
                        <table style="width: 100%" cellspacing="0" cellpadding="0">
					<tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
									<td style="border-bottom: 1px solid #e9e9e9; width: 24px;">
									    &nbsp;</td>
									<td style="border-bottom: 1px solid #e9e9e9; width: 58px;">
																	&nbsp;</td>
									<td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #e9e9e9;">
																	<asp:Image ID="Image6" runat="server" Height="16px" 
                                            ImageUrl="~/images/icons/write16.png" Width="16px" />
                                            <a class="MessageNew" id="link-newmessage" href="Pages/NewMessage.aspx">
                                &#1575;&#1585;&#1587;&#1575;&#1604; &#1662;&#1740;&#1594;&#1575;&#1605;</a>
                                    </td>
									<td style="border-bottom: 1px solid #e9e9e9; width: 200px;">
									    &nbsp;</td>
									<td style="border-bottom: 1px solid #e9e9e9; width: 24px;">
									    &nbsp;</td>
					</tr>
                        	</table>
                            <asp:GridView ID="GridViewMessagesLists" runat="server" DataSourceID="SqlDataSourceMessagesLists" 
                          AutoGenerateColumns="False" DataKeyNames="MessageListId" BorderStyle="None" 
                        GridLines="None" ShowHeader="False" Width="950px"  >
                       <Columns>
                           <asp:TemplateField ShowHeader="False" ItemStyle-BorderStyle="None">
                               <ItemTemplate>
                        <table style="width: 100%" cellspacing="0" cellpadding="0">
					<tr style='<%# FormatTrStyle(Eval("Unread")) %>'>
									<td onclick="location.href='ShowMessages.aspx?Id=<%# Eval("OtherId") %>&Type=<%# Eval("OtherType") %>';" style="border-bottom: 1px solid #e9e9e9; width: 55px; height: 70px; cursor: pointer;">
																	<asp:Image runat="server" id="ImagePhoto" Visible="false" 
                                            Height="60px" Width="60px" ImageUrl="~/images/samples/charicon.png" />
																</td>
									<td onclick="location.href='ShowMessages.aspx?Id=<%# Eval("OtherId") %>&Type=<%# Eval("OtherType") %>';" style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #e9e9e9; width: 675px; height: 70px; cursor: pointer">
									    <asp:HyperLink ID="HyperLinkSubject" CssClass="MessageSender" runat="server"><%# Eval("UserName") %></asp:HyperLink>
                                        <br />
                                        <asp:Label ID="LabelBeriefBody" runat="server" CssClass="MessageBrief" Text='<%# Eval("Brief", "{0}...") %>'></asp:Label>
                                    </td>
									<td onclick="location.href='ShowMessages.aspx?Id=<%# Eval("OtherId") %>&Type=<%# Eval("OtherType") %>';" style="border-bottom: 1px solid #e9e9e9; width: 120px; height: 70px; cursor: pointer">
									    <asp:Label ID="LabelDate" CssClass="MessageDate" runat="server" Text='<%# FormatPassedDate(Eval("SubmitDate")) %>'></asp:Label>
                                    </td>
					</tr>
                        	</table>
                        </ItemTemplate>
                               <ItemStyle BorderStyle="None" />
                           </asp:TemplateField>
                           <asp:CommandField ButtonType="Image" 
                               DeleteImageUrl="~/images/icons/delete16.png" ShowDeleteButton="True" >
                           <ItemStyle HorizontalAlign="Center" Width="25px" />
                           </asp:CommandField>
                       </Columns>
                </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceMessagesLists" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" 
        DeleteCommand="sp_messagesListDelete" 
                            SelectCommand="sp_messagesLists" SelectCommandType="StoredProcedure" 
                            DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="MessageListId" DefaultValue="" />
            <asp:SessionParameter DefaultValue="" Name="OwnerId" SessionField="UserId" />
            <asp:Parameter DefaultValue="1" Name="OwnerType" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="UserId" />
            <asp:Parameter DefaultValue="1" Name="OwnerType" />
        </SelectParameters>
    </asp:SqlDataSource>
                        <br />
        <asp:Label ID="LabelNoRecord" runat="server" CssClass="FormLabel" 
            
            
                            
                            Text="&#1583;&#1585; &#1581;&#1575;&#1604; &#1581;&#1575;&#1590;&#1585; &#1662;&#1740;&#1594;&#1575;&#1605;&#1740; &#1605;&#1608;&#1580;&#1608;&#1583; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                            Visible="False"></asp:Label>
    </div>
</div>
</asp:Content>

