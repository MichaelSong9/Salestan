<%@ Page Title="Salestan : &#1579;&#1576;&#1578; &#1606;&#1575;&#1605;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .style3
        {
            text-align: right;
            width: 150px;
            height: 23px;
        }
        .style4
        {
            height: 23px;
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" style="direction:rtl;">
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image7" runat="server" Height="32px" 
                        ImageUrl="~/images/icons/register32.png" Width="32px" />
        <asp:Label ID="Label7" runat="server" Text="&#1579;&#1576;&#1578; &#1606;&#1575;&#1605;" 
                        Font-Bold="True" CssClass="Header"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
               
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    
                    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image6" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/keyboard24.png" Width="24px" />
                    <asp:Label ID="Label10" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelEmail" runat="server" Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740;:" 
                        CssClass="FormLabel"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelEmailValue" runat="server" CssClass="FormLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLastName1" runat="server" Text="&#1705;&#1583; &#1605;&#1593;&#1585;&#1601;&#1740;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxRegeantId"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ImageButtonRegeant" EventName="click" />
                    
                    </Triggers>
                    <ContentTemplate>
                    <asp:TextBox ID="TextBoxRegeantId" runat="server" 
                        CssClass="TextBoxL2R" Width="125px" ValidationGroup="Regeant"></asp:TextBox>&nbsp;
                    <asp:ImageButton ID="ImageButtonRegeant" runat="server" 
                        ImageUrl="~/images/Buttons/check-off.png" 
                        onclick="ImageButtonRegeant_Click" ValidationGroup="Regeant" />&nbsp;
                    <asp:Label ID="LabelRegeant" runat="server"></asp:Label>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLastName0" runat="server" Text="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxPassword"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server" 
                        CssClass="TextBoxRequiredL2R" TextMode="Password" Width="125px" 
                        TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName0" 
                        runat="server" ControlToValidate="TextBoxPassword" 
                        
                        ErrorMessage="&#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1585;&#1575; &#1578;&#1593;&#1740;&#1740;&#1606; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        CssClass="FormValidation" ValidationGroup="Register"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelJob0" runat="server" Text="&#1578;&#1575;&#1740;&#1662; &#1583;&#1608;&#1576;&#1575;&#1585;&#1607; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxPassword2"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPassword2" runat="server" 
                        CssClass="TextBoxRequiredL2R" TextMode="Password" Width="125px" 
                        TabIndex="2"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxPassword2" 
                        CssClass="FormValidation" 
                        
                        
                        ErrorMessage="&#1578;&#1575;&#1740;&#1662; &#1583;&#1608;&#1576;&#1575;&#1585;&#1607; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1605;&#1740; &#1576;&#1575;&#1740;&#1587;&#1578; &#1576;&#1585;&#1575;&#1576;&#1585; &#1705;&#1604;&#1605;&#1607; &#1593;&#1576;&#1608;&#1585; &#1576;&#1575;&#1588;&#1583;." 
                        ValidationGroup="Register"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image5" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/user_woman24.png" Width="24px" />
                    <asp:Label ID="Label9" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1601;&#1585;&#1583;&#1740;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="LabelFirstName" runat="server" Text="&#1606;&#1575;&#1605;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxFirstName"></asp:Label>
                </td>
                <td class="style6">
                    <asp:TextBox ID="TextBoxFirstName" runat="server" 
                        CssClass="TextBoxRequiredR2L" Width="125px" TabIndex="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" 
                        ControlToValidate="TextBoxFirstName" 
                        ErrorMessage="&#1606;&#1575;&#1605; &#1585;&#1575; &#1578;&#1705;&#1605;&#1740;&#1604; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        CssClass="FormValidation" ValidationGroup="Register"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLastName" runat="server" Text="&#1606;&#1575;&#1605; &#1582;&#1575;&#1606;&#1608;&#1575;&#1583;&#1711;&#1740;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxLastName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxLastName" runat="server" 
                        CssClass="TextBoxRequiredR2L" Width="125px" TabIndex="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" 
                        ControlToValidate="TextBoxLastName" 
                        
                        ErrorMessage="&#1606;&#1575;&#1605; &#1582;&#1575;&#1606;&#1608;&#1575;&#1583;&#1711;&#1740; &#1585;&#1575; &#1578;&#1705;&#1605;&#1740;&#1604; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        CssClass="FormValidation" ValidationGroup="Register"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelBirthDate" runat="server" Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1578;&#1608;&#1604;&#1583;:" 
                        CssClass="FormLabel" AssociatedControlID="DropDownListBirthDay"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListBirthDay" runat="server" 
                        CssClass="DropDownRequiredR2L" TabIndex="5">
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownListBirthMonth" runat="server" 
                        CssClass="DropDownRequiredR2L" TabIndex="6">
                        <asp:ListItem Value="01">&#1601;&#1585;&#1608;&#1585;&#1583;&#1740;&#1606;</asp:ListItem>
                        <asp:ListItem Value="02">&#1575;&#1585;&#1583;&#1740;&#1576;&#1607;&#1588;&#1578;</asp:ListItem>
                        <asp:ListItem Value="03">&#1582;&#1585;&#1583;&#1575;&#1583;</asp:ListItem>
                        <asp:ListItem Value="04">&#1578;&#1740;&#1585;</asp:ListItem>
                        <asp:ListItem Value="05">&#1605;&#1585;&#1583;&#1575;&#1583;</asp:ListItem>
                        <asp:ListItem Value="06">&#1588;&#1607;&#1585;&#1740;&#1608;&#1585;</asp:ListItem>
                        <asp:ListItem Value="07">&#1605;&#1607;&#1585;</asp:ListItem>
                        <asp:ListItem Value="08">&#1570;&#1576;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="09">&#1570;&#1584;&#1585;</asp:ListItem>
                        <asp:ListItem Value="10">&#1583;&#1740;</asp:ListItem>
                        <asp:ListItem Value="11">&#1576;&#1607;&#1605;&#1606;</asp:ListItem>
                        <asp:ListItem Value="12">&#1575;&#1587;&#1601;&#1606;&#1583;</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownListBirthYear" runat="server" 
                        CssClass="DropDownRequiredR2L" TabIndex="7">
                        <asp:ListItem>1378</asp:ListItem>
                        <asp:ListItem>1377</asp:ListItem>
                        <asp:ListItem>1376</asp:ListItem>
                        <asp:ListItem>1375</asp:ListItem>
                        <asp:ListItem>1374</asp:ListItem>
                        <asp:ListItem>1373</asp:ListItem>
                        <asp:ListItem>1372</asp:ListItem>
                        <asp:ListItem>1371</asp:ListItem>
                        <asp:ListItem>1370</asp:ListItem>
                        <asp:ListItem>1369</asp:ListItem>
                        <asp:ListItem>1368</asp:ListItem>
                        <asp:ListItem>1367</asp:ListItem>
                        <asp:ListItem>1366</asp:ListItem>
                        <asp:ListItem>1367</asp:ListItem>
                        <asp:ListItem>1366</asp:ListItem>
                        <asp:ListItem>1365</asp:ListItem>
                        <asp:ListItem>1364</asp:ListItem>
                        <asp:ListItem>1363</asp:ListItem>
                        <asp:ListItem>1362</asp:ListItem>
                        <asp:ListItem>1361</asp:ListItem>
                        <asp:ListItem>1360</asp:ListItem>
                        <asp:ListItem>1359</asp:ListItem>
                        <asp:ListItem>1358</asp:ListItem>
                        <asp:ListItem>1357</asp:ListItem>
                        <asp:ListItem>1356</asp:ListItem>
                        <asp:ListItem>1357</asp:ListItem>
                        <asp:ListItem>1356</asp:ListItem>
                        <asp:ListItem>1355</asp:ListItem>
                        <asp:ListItem>1354</asp:ListItem>
                        <asp:ListItem>1353</asp:ListItem>
                        <asp:ListItem>1352</asp:ListItem>
                        <asp:ListItem>1351</asp:ListItem>
                        <asp:ListItem>1350</asp:ListItem>
                        <asp:ListItem>1349</asp:ListItem>
                        <asp:ListItem>1348</asp:ListItem>
                        <asp:ListItem>1347</asp:ListItem>
                        <asp:ListItem>1346</asp:ListItem>
                        <asp:ListItem>1347</asp:ListItem>
                        <asp:ListItem>1346</asp:ListItem>
                        <asp:ListItem>1345</asp:ListItem>
                        <asp:ListItem>1344</asp:ListItem>
                        <asp:ListItem>1343</asp:ListItem>
                        <asp:ListItem>1342</asp:ListItem>
                        <asp:ListItem>1341</asp:ListItem>
                        <asp:ListItem>1340</asp:ListItem>
                        <asp:ListItem>1339</asp:ListItem>
                        <asp:ListItem>1338</asp:ListItem>
                        <asp:ListItem>1337</asp:ListItem>
                        <asp:ListItem>1336</asp:ListItem>
                        <asp:ListItem>1337</asp:ListItem>
                        <asp:ListItem>1336</asp:ListItem>
                        <asp:ListItem>1335</asp:ListItem>
                        <asp:ListItem>1334</asp:ListItem>
                        <asp:ListItem>1333</asp:ListItem>
                        <asp:ListItem>1332</asp:ListItem>
                        <asp:ListItem>1331</asp:ListItem>
                        <asp:ListItem>1330</asp:ListItem>
                        <asp:ListItem>1329</asp:ListItem>
                        <asp:ListItem>1328</asp:ListItem>
                        <asp:ListItem>1327</asp:ListItem>
                        <asp:ListItem>1326</asp:ListItem>
                        <asp:ListItem>1327</asp:ListItem>
                        <asp:ListItem>1326</asp:ListItem>
                        <asp:ListItem>1325</asp:ListItem>
                        <asp:ListItem>1324</asp:ListItem>
                        <asp:ListItem>1323</asp:ListItem>
                        <asp:ListItem>1322</asp:ListItem>
                        <asp:ListItem>1321</asp:ListItem>
                        <asp:ListItem>1320</asp:ListItem>
                        <asp:ListItem>1319</asp:ListItem>
                        <asp:ListItem>1318</asp:ListItem>
                        <asp:ListItem>1317</asp:ListItem>
                        <asp:ListItem>1316</asp:ListItem>
                        <asp:ListItem>1317</asp:ListItem>
                        <asp:ListItem>1316</asp:ListItem>
                        <asp:ListItem>1315</asp:ListItem>
                        <asp:ListItem>1314</asp:ListItem>
                        <asp:ListItem>1313</asp:ListItem>
                        <asp:ListItem>1312</asp:ListItem>
                        <asp:ListItem>1311</asp:ListItem>
                        <asp:ListItem>1310</asp:ListItem>
                        <asp:ListItem>1309</asp:ListItem>
                        <asp:ListItem>1308</asp:ListItem>
                        <asp:ListItem>1307</asp:ListItem>
                        <asp:ListItem>1306</asp:ListItem>
                        <asp:ListItem>1307</asp:ListItem>
                        <asp:ListItem>1306</asp:ListItem>
                        <asp:ListItem>1305</asp:ListItem>
                        <asp:ListItem>1304</asp:ListItem>
                        <asp:ListItem>1303</asp:ListItem>
                        <asp:ListItem>1302</asp:ListItem>
                        <asp:ListItem>1301</asp:ListItem>
                        <asp:ListItem>1300</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="LabelGender" runat="server" 
                        Text="&#1580;&#1606;&#1587;&#1740;&#1578;:" CssClass="FormLabel" 
                        AssociatedControlID="DropDownListGender"></asp:Label>
                </td>
                <td class="style4">
                    <asp:DropDownList ID="DropDownListGender" runat="server" 
                        CssClass="DropDownRequiredR2L" TabIndex="8">
                        <asp:ListItem Value="False">&#1605;&#1585;&#1583;</asp:ListItem>
                        <asp:ListItem Value="True">&#1586;&#1606;</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelJob" runat="server" Text="&#1588;&#1594;&#1604;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxJob"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="TextBoxJob" runat="server" CssClass="TextBoxR2L" Width="125px" 
                        TabIndex="9"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelEducations" runat="server" Text="&#1578;&#1581;&#1589;&#1740;&#1604;&#1575;&#1578;:" 
                        CssClass="FormLabel" AssociatedControlID="DropDownListEducations"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListEducations" runat="server" 
                        CssClass="DropDownR2L" TabIndex="10">
                        <asp:ListItem Selected="True" Value="0">&#1575;&#1606;&#1578;&#1582;&#1575;&#1576; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;</asp:ListItem>
                        <asp:ListItem Value="Diploma">&#1583;&#1740;&#1662;&#1604;&#1605;</asp:ListItem>
                        <asp:ListItem Value="HigherDiploma">&#1601;&#1608;&#1602; &#1583;&#1740;&#1662;&#1604;&#1605;</asp:ListItem>
                        <asp:ListItem Value="BSc">&#1604;&#1740;&#1587;&#1575;&#1606;&#1587;</asp:ListItem>
                        <asp:ListItem Value="MSc">&#1601;&#1608;&#1602; &#1604;&#1740;&#1587;&#1575;&#1606;&#1587;</asp:ListItem>
                        <asp:ListItem Value="Dr">&#1583;&#1705;&#1578;&#1585;&#1575;</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Image ID="Image4" runat="server" Height="24px" 
                        ImageUrl="~/images/icons/phone24.png" Width="24px" />
                    <asp:Label ID="Label8" runat="server" CssClass="Header" Text="&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelHomePhone" runat="server" Text="&#1578;&#1604;&#1601;&#1606; &#1605;&#1606;&#1586;&#1604;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxHomePhone"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxHomePhone" runat="server" 
                        CssClass="TextBoxL2R" Width="125px" TabIndex="11"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelWorkPhone" runat="server" Text="&#1578;&#1604;&#1601;&#1606; &#1605;&#1581;&#1604; &#1705;&#1575;&#1585;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxWorkPhone"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxWorkPhone" runat="server" 
                        CssClass="TextBoxL2R" Width="125px" TabIndex="12"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelMobile" runat="server" Text="&#1578;&#1604;&#1601;&#1606; &#1607;&#1605;&#1585;&#1575;&#1607;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxMobile"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMobile" runat="server" 
                        CssClass="TextBoxRequiredL2R" Width="125px" TabIndex="13"></asp:TextBox>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                        runat="server" ControlToValidate="TextBoxMobile" CssClass="FormValidation" 
                        ErrorMessage="...09" ValidationGroup="Register" 
                        ValidationExpression="^(\d){5,18}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName2" runat="server" 
                        ControlToValidate="TextBoxMobile" 
                        
                        ErrorMessage="&#1578;&#1604;&#1601;&#1606; &#1607;&#1605;&#1585;&#1575;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." 
                        CssClass="FormValidation" ValidationGroup="Register"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelLocation" runat="server" Text="&#1605;&#1581;&#1604; &#1586;&#1606;&#1583;&#1711;&#1740;:" 
                        CssClass="FormLabel" AssociatedControlID="DropDownListLocationProvince"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListLocationCountry" runat="server" 
                        Enabled="False" CssClass="FormData" TabIndex="14">
                        <asp:ListItem Value="IR">&#1575;&#1740;&#1585;&#1575;&#1606;</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="LabelLocationState" runat="server" CssClass="FormData" 
                        Text="&#1575;&#1587;&#1578;&#1575;&#1606;:" 
                        AssociatedControlID="DropDownListLocationProvince"></asp:Label>
                    <asp:DropDownList ID="DropDownListLocationProvince" AutoPostBack="True" 
                        runat="server" CssClass="DropDownRequiredR2L" 
                        onselectedindexchanged="DropDownListLocationProvince_SelectedIndexChanged" 
                        TabIndex="15" >
                        <asp:ListItem Value="1">&#1570;&#1584;&#1585;&#1576;&#1575;&#1740;&#1580;&#1575;&#1606; &#1588;&#1585;&#1602;&#1740;</asp:ListItem>
                        <asp:ListItem Value="2">&#1570;&#1584;&#1585;&#1576;&#1575;&#1740;&#1580;&#1575;&#1606; &#1594;&#1585;&#1576;&#1740;</asp:ListItem>
                        <asp:ListItem Value="3">&#1575;&#1585;&#1583;&#1576;&#1740;&#1604;</asp:ListItem>
                        <asp:ListItem Value="4">&#1575;&#1589;&#1601;&#1607;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="5">&#1575;&#1604;&#1576;&#1585;&#1586;</asp:ListItem>
                        <asp:ListItem Value="6">&#1575;&#1740;&#1604;&#1575;&#1605;</asp:ListItem>
                        <asp:ListItem Value="7">&#1576;&#1608;&#1588;&#1607;&#1585;</asp:ListItem>
                        <asp:ListItem Value="8" Selected="True">&#1578;&#1607;&#1585;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="9">&#1670;&#1607;&#1575;&#1585;&#1605;&#1581;&#1575;&#1604; &#1608; &#1576;&#1582;&#1578;&#1740;&#1575;&#1585;&#1740;</asp:ListItem>
                        <asp:ListItem Value="10">&#1582;&#1585;&#1575;&#1587;&#1575;&#1606; &#1580;&#1606;&#1608;&#1576;&#1740;</asp:ListItem>
                        <asp:ListItem Value="11">&#1582;&#1585;&#1575;&#1587;&#1575;&#1606; &#1585;&#1590;&#1608;&#1740;</asp:ListItem>
                        <asp:ListItem Value="12">&#1582;&#1585;&#1575;&#1587;&#1575;&#1606; &#1588;&#1605;&#1575;&#1604;&#1740;</asp:ListItem>
                        <asp:ListItem Value="13">&#1582;&#1608;&#1586;&#1587;&#1578;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="14">&#1586;&#1606;&#1580;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="15">&#1587;&#1605;&#1606;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="16">&#1587;&#1740;&#1587;&#1578;&#1575;&#1606; &#1608; &#1576;&#1604;&#1608;&#1670;&#1587;&#1578;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="17">&#1601;&#1575;&#1585;&#1587;</asp:ListItem>
                        <asp:ListItem Value="18">&#1602;&#1586;&#1608;&#1740;&#1606;</asp:ListItem>
                        <asp:ListItem Value="19">&#1602;&#1605;</asp:ListItem>
                        <asp:ListItem Value="20">&#1705;&#1585;&#1583;&#1587;&#1578;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="21">&#1705;&#1585;&#1605;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="22">&#1705;&#1585;&#1605;&#1575;&#1606;&#1588;&#1575;&#1607;</asp:ListItem>
                        <asp:ListItem Value="23">&#1705;&#1607;&#1711;&#1740;&#1604;&#1608;&#1740;&#1607; &#1608; &#1576;&#1608;&#1740;&#1585;&#1575;&#1581;&#1605;&#1583;</asp:ListItem>
                        <asp:ListItem Value="24">&#1711;&#1604;&#1587;&#1578;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="25">&#1711;&#1740;&#1604;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="26">&#1604;&#1585;&#1587;&#1578;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="27">&#1605;&#1575;&#1586;&#1606;&#1583;&#1585;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="28">&#1605;&#1585;&#1705;&#1586;&#1740;</asp:ListItem>
                        <asp:ListItem Value="29">&#1607;&#1585;&#1605;&#1586;&#1711;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="30">&#1607;&#1605;&#1583;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="31">&#1740;&#1586;&#1583;</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="LabelLocationCity" runat="server" CssClass="FormData" 
                        Text="&#1588;&#1607;&#1585;:" 
                        AssociatedControlID="DropDownListLocationCity"></asp:Label>
                    <asp:DropDownList ID="DropDownListLocationCity" 
                        runat="server" CssClass="DropDownRequiredR2L" 
                        TabIndex="16" >
                    </asp:DropDownList>
                </td>
            </tr>
      
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelAddress" runat="server" Text="&#1570;&#1583;&#1585;&#1587;:" 
                        CssClass="FormLabel" AssociatedControlID="TextBoxAddress"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxAddress" runat="server" 
                        CssClass="TextBoxR2L" Width="350px" TabIndex="17"></asp:TextBox>
                </td>
            </tr>
      
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
      
            <tr>
                <td class="style2">
                    <asp:Label ID="LabelIntroduction" runat="server" Text="&#1606;&#1581;&#1608;&#1607; &#1570;&#1588;&#1606;&#1575;&#1740;&#1740;:" 
                        CssClass="FormLabel" AssociatedControlID="DropDownListIntroduction"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListIntroduction" runat="server" 
                        CssClass="DropDownR2L" TabIndex="18">
                        <asp:ListItem Value="0">&#1575;&#1606;&#1578;&#1582;&#1575;&#1576; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;</asp:ListItem>
                        <asp:ListItem Value="1">&#1575;&#1586;&#1591;&#1585;&#1740;&#1602; &#1583;&#1608;&#1587;&#1578;&#1575;&#1606;</asp:ListItem>
                        <asp:ListItem Value="2">&#1578;&#1576;&#1604;&#1740;&#1594;&#1575;&#1578; &#1662;&#1740;&#1575;&#1605; &#1705;&#1608;&#1578;&#1575;&#1607;</asp:ListItem>
                        <asp:ListItem Value="3">&#1578;&#1576;&#1604;&#1740;&#1594;&#1575;&#1578; &#1606;&#1588;&#1585;&#1740;&#1575;&#1578;</asp:ListItem>
                        <asp:ListItem Value="4">&#1588;&#1576;&#1705;&#1607; &#1607;&#1575;&#1740; &#1605;&#1580;&#1575;&#1586;&#1740;</asp:ListItem>
                        <asp:ListItem Value="5">&#1605;&#1608;&#1578;&#1608;&#1585;&#1607;&#1575;&#1740; &#1580;&#1587;&#1578;&#1580;&#1608;&#1711;&#1585;</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
        
                <br />
                <a id="register-rules" class="NormalLink" href="Content.aspx?Page=Rules" target="_blank">(&#1605;&#1591;&#1575;&#1604;&#1593;&#1607; &#1602;&#1608;&#1575;&#1606;&#1740;&#1606; &#1608; &#1605;&#1602;&#1585;&#1585;&#1575;&#1578;)</a><br />
                <br />
                <asp:ImageButton ID="ImageButtonSubmit" runat="server" 
                    ImageUrl="~/images/Buttons/registerAccept-off.png" onclick="ImageButtonSubmit_Click" 
                    TabIndex="19" ValidationGroup="Register" />
                </td>
                    

             
            </tr>
               
        </table>
</asp:Content>

