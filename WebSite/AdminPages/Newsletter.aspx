<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Newsletter.aspx.cs" Inherits="AdminPages_Newsletter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Salestan : نمایش خبرنامه</title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../salestan.ico" type="image/x-icon" />
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        
        .style2
        {
            text-align: right;
            width: 150px;
        }
        .style5
    {
        text-align: right;
        width: 150px;
        height: 27px;
    }
    .style6
    {
        height: 27px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <asp:Image ID="Image24" runat="server" Height="22px" 
                ImageUrl="~/images/controlpanel/admin/newsletter24.png" Width="22px" />
            <asp:Label ID="Label1" runat="server" CssClass="Header" Text="خبرنامه"></asp:Label>
            <br />
            &nbsp;<br />
            <table class="style1" style="direction:rtl;">
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelUserId1" runat="server" CssClass="FormLabel" 
                            Text="شناسه خبرنامه:"></asp:Label>
                    </td>
                    <td>
                        <ContentTemplate>
                            <asp:Label ID="LabelNewsletterId" runat="server" CssClass="FormLabel"></asp:Label>
                        </ContentTemplate>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="LabelUserId0" runat="server" CssClass="FormLabel" Text="فرمت:"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="ImageFormat" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions" runat="server" CssClass="FormLabel" 
                            Text="تعداد دریافت کنندگان:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelReceiversCount" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions0" runat="server" CssClass="FormLabel" 
                            Text="نوع دریافت کنندگان:"></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="ImageReceiversType" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions2" runat="server" CssClass="FormLabel" 
                            Text="عنوان:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelTitle" runat="server" CssClass="FormLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        <asp:Label ID="LabelPremissions1" runat="server" CssClass="FormLabel" 
                            Text="متن:"></asp:Label>
                    </td>
                    <td>
                        <asp:Literal ID="LiteralBody" runat="server"></asp:Literal>
                    </td>
                </tr>
                </table>
    </div>
    </form>
</body>
</html>
