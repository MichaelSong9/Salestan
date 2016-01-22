<%@ Page Title="Salestan : &#1582;&#1608;&#1588; &#1570;&#1605;&#1583;&#1740;&#1583;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Refer.aspx.cs" Inherits="Refer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#link-about").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	        });
	        jq14("#link-offers").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	        });
	        jq14("#link-giftplan").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	        });
	    });
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div dir="rtl" >
    
        <asp:Image ID="Image1" runat="server" Height="24px" 
            ImageUrl="~/images/icons/link24.png" Width="24px" />
    
        <asp:Label ID="Label1" runat="server" 
            Text="&#1705;&#1575;&#1585;&#1576;&#1585; &#1711;&#1585;&#1575;&#1605;&#1740; &#1576;&#1607; &#1587;&#1575;&#1740;&#1578; Salestan &#1582;&#1608;&#1588; &#1575;&#1605;&#1583;&#1740;&#1583;!" 
            CssClass="Header"></asp:Label>
    
        <br />
        <br />
    
        <asp:Label ID="Label2" runat="server" 
            Text="&#1605;&#1593;&#1585;&#1601; &#1588;&#1605;&#1575;:" 
            CssClass="FormLabel"></asp:Label>
    
        <asp:Label ID="LabelName" runat="server" 
            CssClass="Header"></asp:Label>
    
        <br />
        <br />
		<table style="width: 100%">
			<tr>
				<td style="text-align: center;width: 33%" valign="top">
        		    <br />
                    <a id="link-about" href="images/about/About.png"><img alt="" border="0" height="196" src="images/about.png" width="190" /></a>
        		    <br />
        		<br />
        		</td>
				<td style="text-align: center;width: 33%" valign="top">
        		    <br />
        		        <a id="link-offers" href="images/offers/about.png"><img alt="" height="196" src="images/offers/help.png" width="190"border="0" /></a>
                    <br />
    			</td>
				<td style="text-align: center;width: 33%" valign="top">
        		    <br />
                <a id="link-giftplan" href="images/about/Gift800.png"><img alt="" height="196" src="images/giftplan.png" width="190"border="0" /></a>
        		<br />
    
    			&nbsp;&nbsp;
            
    			</td>
			</tr>
            </table>
            <div style="text-align:center; position:relative">
                    <br />
            <asp:Label ID="LabelLoginEmail0" runat="server" 
                AssociatedControlID="TextBoxEmail" CssClass="FormLabel" 
                Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;:"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBoxEmail" runat="server" Width="180px" 
                                    CssClass="TextBoxRequiredR2L"></asp:TextBox>
                            	&nbsp;<br />
                            	<asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidatorRegister" runat="server" 
                                    ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                                    ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1589;&#1581;&#1740;&#1581; &#1606;&#1605;&#1740; &#1576;&#1575;&#1588;&#1583;." 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="Enter"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegister" runat="server" 
                                    ControlToValidate="TextBoxEmail" CssClass="FormValidation"  ValidationGroup="Enter"
                                    ErrorMessage="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;."></asp:RequiredFieldValidator>
                       <asp:Label ID="LabelEmailError" Visible="False"  runat="server"  
                        CssClass="FormValidation" > &#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740; &#1608;&#1575;&#1585;&#1583; &#1588;&#1583;&#1607; &#1583;&#1585; &#1587;&#1740;&#1587;&#1578;&#1605; &#1608;&#1580;&#1608;&#1583; &#1583;&#1575;&#1585;&#1583;!</asp:Label>
                        <br />
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                <asp:ImageButton 
                                    ID="ImageButtonSubmit" runat="server" 
                                                ImageUrl="~/images/Buttons/register-off.png" 
                                    ValidationGroup="Enter" onclick="ImageButtonSubmit_Click" />
                                    <br />
                         <asp:Image ID="imgok"  runat="server"   ImageUrl="~/images/icons/check22.png"  Visible="false" />
                         <asp:Label ID="LabelRegisterSent" Visible="False"    runat="server" 
                        Text=" &#1604;&#1740;&#1606;&#1705; &#1601;&#1593;&#1575;&#1604; &#1587;&#1575;&#1586;&#1740; &#1579;&#1576;&#1578; &#1606;&#1575;&#1605; &#1583;&#1585; &#1587;&#1575;&#1740;&#1578; &#1576;&#1607; &#1575;&#1740;&#1605;&#1740;&#1604; &#1588;&#1605;&#1575; &#1601;&#1585;&#1587;&#1578;&#1575;&#1583;&#1607; &#1588;&#1583;. &#1583;&#1585; &#1589;&#1608;&#1585;&#1578;&#1740; &#1705;&#1607; &#1575;&#1740;&#1605;&#1740;&#1604; &#1583;&#1585; Inbox &#1588;&#1605;&#1575; &#1605;&#1608;&#1580;&#1608;&#1583; &#1606;&#1576;&#1608;&#1583; &#1604;&#1591;&#1601;&#1575;&#1611; &#1601;&#1608;&#1604;&#1583;&#1585; Spam &#1585;&#1575; &#1606;&#1740;&#1586; &#1605;&#1588;&#1575;&#1607;&#1583;&#1607; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;!" 
                                             CssClass="SuccessMessage" ></asp:Label>
</div>
    </div>
</asp:Content>
