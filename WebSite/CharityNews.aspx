<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CharityNews.aspx.cs" Inherits="CharityNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table style="width: 100%" cellspacing="0" cellpadding="0">
					<tr>
						<td style="width: 250px" valign="top" dir="rtl">
						<table style="width: 100%" cellspacing="0" cellpadding="0">

							<tr>
								<td >&nbsp;<asp:Image ID="Image4" runat="server" Height="24px" 
                                        ImageUrl="~/images/mainicons/charity24.png" Width="24px" />
                                    <asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="~/Charity.aspx" 
                                        CssClass="NormalLink">&#1576;&#1575;&#1586;&#1711;&#1588;&#1578; &#1576;&#1607; &#1589;&#1601;&#1581;&#1607; &#1575;&#1608;&#1604; &#1576;&#1582;&#1588; &#1582;&#1740;&#1585;&#1740;&#1607;</asp:HyperLink>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			<td style="direction:rtl;"><span lang="fa">
			<img alt="" height="32" src="images/charity/titles/lastnews.png" width="140" /><br />
			&nbsp;</span><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ShopConnectionString2 %>" 
                    SelectCommand="sp_charityNewsOthersTopFive" 
                    SelectCommandType="StoredProcedure">
			</asp:SqlDataSource>
			</td>
		</tr>
		<tr>
			<td dir="rtl">
			<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsId" DataSourceID="SqlDataSource1" GridLines="None" ShowHeader="False" style="margin-left: 0px" Width="250px">
				<AlternatingRowStyle Wrap="True" />
				<Columns>
					<asp:TemplateField ShowHeader="False">
						<ItemTemplate>
							<table dir="rtl" style="width:100%">
								<tr>
									<td dir="rtl">
									<asp:HyperLink ID="HyperLink20" runat="server" CssClass="NormalLink" 
                                            NavigateUrl='<%# "~/CharityNews.aspx?NewsId="+Eval("NewsId") %>' 
                                            Text='<%# Eval("Subject") %>' Width="220px"></asp:HyperLink>
									</td>
								</tr>
								<tr>
									<td align="left" dir="rtl">
                                                                <hr style="height: 1px" /></td>
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
            <asp:Label ID="LabelDate" runat="server" CssClass="NewsDate"></asp:Label>
        </td>
	</tr>
	<tr>
		<td>
<body>
    <table cellpadding="0" cellspacing="0" style="width: 100%; background-color:#f2f2f2;">
		<tr>
			<td style="width: 20%;text-align:center;" >
                <asp:HyperLink ID="HyperLinkShareEmail" runat="server" 
                    ImageUrl="~/images/share/share-email.png"></asp:HyperLink>
            </td>
			<td style="width: 20%;text-align:center;" >
                <asp:HyperLink ID="HyperLinkSharePrint" runat="server" 
                    ImageUrl="~/images/share/share-print.png" Target="_blank"></asp:HyperLink>
            </td>
			<td style="width: 20%;text-align:center;" >
                <asp:HyperLink ID="HyperLinkShareFacebook" runat="server" 
                    ImageUrl="~/images/share/share-facebook.png" Target="_blank"></asp:HyperLink>
            </td>
			<td style="width: 20%;text-align:center;" >
                <asp:HyperLink ID="HyperLinkShareTwitter" runat="server" 
                    ImageUrl="~/images/share/share-twitter.png" Target="_blank"></asp:HyperLink>
            </td>
			<td style="width: 20%;text-align:center;" >
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
            </td>
		</tr>
	</table>
        </td>
	</tr>
	<tr>
		<td>
		<table style="width: 100%">
			<tr>
				<td>
                    <asp:Image ID="ImageImage" runat="server" Height="338px" Width="600px" 
                        BorderColor="#999999" BorderWidth="1px" />
                </td>
				<td>
                    &nbsp;</td>
			</tr>
		</table>
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
</table>
                                </td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

</asp:Content>

