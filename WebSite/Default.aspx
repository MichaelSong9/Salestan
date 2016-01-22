<%@ Page Title="Salestan : &amp;#1582;&amp;#1608;&amp;#1588; &amp;#1570;&amp;#1605;&amp;#1583;&amp;#1740;&amp;#1583;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
	    jq14(document).ready(function () {
	        jq14("#about-users").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'width': '7',
	            'height': '5'
	        });
	        jq14("#about-companies").fancybox({
	            'titlePosition': 'inside',
	            'transitionIn': 'elastic',
	            'transitionOut': 'elastic',
	            'width': '7',
	            'height': '5'
	        });
	    });
	</script>

    	<style type="text/css">

    .window
    {
        webkit-border-top-right-radius:10px;
	    webkit-border-top-left-radius:10px;
        -moz-border-radius-topright:10px;
        -moz-border-radius-topleft:10px;
        border-radius:10px 10px 10px 10px;
        -moz-border-bottom-colors: none;
        -moz-border-image: none;
        -moz-border-left-colors: none;
        -moz-border-right-colors: none;
        -moz-border-top-colors: none;
        border-color: #FFFFFF;
        border-style: solid;
        border-width: 1px;
        clear: both;
        position:absolute; 
        cursor: pointer;
    }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:962px; height: 550px; position:relative; right:0px; top:0px">
        <div class="newOffer" style=" background-color:#000000">
            <div onclick="location.href='Offers.aspx';"  class="window" style="width:700px; height: 550px; position:absolute; right:0px; top:0px; background-image: url('images/home/main.jpg')">
            </div>
            <div onclick="location.href='http://www.salestan.ir/ShowBlog.aspx?BlogId=3';" class="window" style="width:250px; height: 410px; position:absolute; right:710px; top:0px; background-image: url('images/home/gift.png')">
            </div>
            <div onclick="location.href='http://www.salestan.ir/ShowBlog.aspx?BlogId=4';" class="window" style="width:250px; height: 130px; position:absolute; right:710px; top:420px; background-image: url('images/home/heram.png')">
            </div>
        </div>
    </div>
</asp:Content>

