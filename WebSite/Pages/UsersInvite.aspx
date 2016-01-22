<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsersInvite.aspx.cs" Inherits="Pages_UsersInvite" %>
<%@ Register TagName="Captcha" TagPrefix="Controls" Src="~/NumCaptcha.ascx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <style type="text/css">

	.Controls
	{
    border-width:2px;
    border-color:#CCCC00;
    border-style:solid;
    font-family:Arial;
    font-size:16px;
    font-weight:bold;
    color:#003005;
    direction:ltr;
    text-align:left;
	}
			* {
	margin: 0;
	padding: 0;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div dir="rtl" >
        <asp:Image ID="Image1" runat="server" Height="24px" 
            ImageUrl="~/images/icons/mail32.png" Width="24px" />
    
        <asp:Label ID="Label1" runat="server" 
            Text="دعوت از دوست به عضویت" 
            CssClass="Header"></asp:Label>
    
        <br />
        <br />
            <asp:Label ID="LabelLoginEmail0" runat="server" 
                AssociatedControlID="TextBoxEmail" CssClass="FormLabel" 
                Text="پست الکترونیک:"></asp:Label>
            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="TextBoxRequiredL2R" 
                Width="180px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorRegister" 
                runat="server" ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                ErrorMessage="پست الکترونیکی صحیح نمی باشد." 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="Invite"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegister" runat="server" 
                ControlToValidate="TextBoxEmail" CssClass="FormValidation" 
                ErrorMessage="پست الکترونیکی را وارد نمایید." ValidationGroup="Invite"></asp:RequiredFieldValidator>
            <br />
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        <br />
                <Controls:Captcha ID="captcha" CalcMode="1" runat="server" />
                        <br />
               <div style=" float:right; width:90px;">
               <asp:ImageButton ID="ImageButtonSubmit0" runat="server" 
                    ImageUrl="~/images/Buttons/invite-off.png" 
                    ValidationGroup="Invite" onclick="ImageButtonSubmit0_Click" /></div>
            <div >
                <br />
             <asp:Image ID="imgok" runat="server" ImageUrl="~/images/icons/check22.png" 
                    Visible="false" />
                <asp:Label ID="LabelRegisterSent" runat="server" 
                    Text=" دعوت نامه شما به پست الکترونیکی دوستتان ارسال شد. به دلیل پسوند ir دامنه Salestan ممکن است ایمیل دعوت شما به فولدر Spam دوستتان برود. اگر او را دیدید ضمن رساندن سلام ما به او یادآوری کنید تا ایمیل دعوت شما را پیدا کند!" Visible="False" 
                    CssClass="SuccessMessage"></asp:Label>
               
            </div>
            <div>
                <asp:Label ID="lblEmailError" runat="server" 
                Visible="False" CssClass="FormValidation"> پست الکترونیکی وارد شده در سیستم وجود دارد!</asp:Label>
            
            </div>
        <br />
            <asp:Label ID="LabelLoginEmail1" runat="server" 
                AssociatedControlID="TextBoxEmail" CssClass="FormLabel" 
                
            Text="متن زیر به عنوان متن دعوت برای دوست شما ارسال می گردد:"></asp:Label>
            <br />
        <br />
            <div dir="rtl">
<h1>
<img height="80" src="http://www.salestan.ir/images/logomain.png" width="240" />&nbsp;</h1>
<h1>دعوت به عضویت</h1>
<span style="font-family: Tahoma;">
<h4>سلام!<br />
                </h4>
                <h4>دوستتان 
                    <asp:Label ID="LabelName" runat="server"></asp:Label>
&nbsp;شما را به عضویت در سایت دعوت کرده است!</h4>
                <p>&nbsp;</p>
                <p>با استفاده از لینک زیر شما به صفحه ثبت نام هدایت می شوید و از تسهیلات منحصر به 
                    فرد برخوردار خواهید شد.</p>
<p>پیشاپیش از علاقه جنابعالی به عضویت در سایت تشکر می نماییم و استفاده از خدمات سایت 
    توسط شما را افتخاری بزرگ برای خود می دانیم.</p>
                <p>&nbsp;</p>
                <p>کد معرف شما:
                    <asp:Label ID="LabelCode" runat="server"></asp:Label>
                </p>
                <p>&nbsp;</p>
                <p>&nbsp;<a href="http://www.salestan.ir" >http://www.salestan.ir</a>
</p>
                <p>&nbsp;</p>
                <p>آدرس عضویت مستقیم در سایت:</p>
                <p>(آدرس)</p>
                <p>&nbsp;</p>
                <p>امیدواریم استفاده از خدمات سایت رضایت شما را به همراه داشته باشد.</p>
	
</span>
</div>

    
    </div>
    </form>
<!-- STATISTICS -->

<!-- Get Clicky -->
<script src="//static.getclicky.com/js" type="text/javascript"></script>
<script type="text/javascript">    try { clicky.init(66479060); } catch (e) { }</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/66479060ns.gif" /></p></noscript>
</body>
</html>
