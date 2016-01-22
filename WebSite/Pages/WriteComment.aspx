<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WriteComment.aspx.cs" Inherits="Pages_WriteComment" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />

<!-- Google Analytics -->
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-3824008-2']);
        _gaq.push(['_setDomainName', 'salestan.ir']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div dir="rtl" >
    
            <asp:Panel ID="PanelComment" runat="server">
                <asp:Image ID="Image4" runat="server" Height="24px" 
                ImageUrl="~/images/icons/comment24.png" Width="24px" />
                <asp:Label ID="Label7" runat="server" CssClass="FormLabel" 
                Text="نظر/سوال شما:" 
                AssociatedControlID="TextBoxComment"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserId" runat="server" 
                    ControlToValidate="TextBoxComment" CssClass="FormValidation" 
                    ErrorMessage="نظر خود را وارد نمایید." ValidationGroup="Add"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="TextBoxComment" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                    Height="120px" MaxLength="1000" TextMode="MultiLine" Width="450px"></asp:TextBox>
                <br />
                <asp:Label ID="Label9" runat="server" AssociatedControlID="TextBoxComment" 
                    CssClass="FormLabel" Text="پاسخ دهید:"></asp:Label>
                <br />
                <Controls:Captcha ID="captcha" CalcMode="1" runat="server" />
                <br />
                <asp:ImageButton ID="ImageButtonSubmit" runat="server" 
                ImageUrl="~/images/Buttons/send-off.png" onclick="ImageButtonSubmit_Click" 
                    ValidationGroup="Add" />
            </asp:Panel>
            <asp:Panel ID="PanelSuccessful" runat="server" Visible="False">
                <div style="text-align: center">
                <asp:Image ID="Image5" runat="server" Height="22px" 
                    ImageUrl="~/images/icons/check22.png" Width="22px" />
                <asp:Label ID="Label8" runat="server" 
                    Text="نظر/سوال شما با موفقیت ثبت گردید و پس از تایید در سایت نمایش داده می شود." 
                    CssClass="SuccessMessage"></asp:Label>
                    </div>
            </asp:Panel>
    
    </div>
    </form>
<!-- STATISTICS -->

<!-- Get Clicky -->
<script src="//static.getclicky.com/js" type="text/javascript"></script>
<script type="text/javascript">    try { clicky.init(66479060); } catch (e) { }</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/66479060ns.gif" /></p></noscript>
</body>
</html>
