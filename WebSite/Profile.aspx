<%@ Page Title="Salestan : &#1662;&#1585;&#1608;&#1601;&#1575;&#1740;&#1604;" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .FormStaticData
        {
            font-family: Tahoma;
            font-size: 14px;
            color:Gray;
        }
        .style2
        {
            text-align: right;
            width: 120px;
        }
        .style4
        {
            height: 30px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style=" direction:rtl;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <img src="images/loading.gif" alt="" style="width:30px" />
            </ProgressTemplate>
        </asp:UpdateProgress>
        </div>
    <div style=" text-align:right; ">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    
                        <br />
                    
                    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
    <asp:AsyncPostBackTrigger  ControlID="LinkButtonPersonal" EventName="click"/>
    
    </Triggers>
    <ContentTemplate>
     <div style=" direction:rtl;">
         <div class="ShowHidePanel1">
             <asp:Image ID="Image24" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/user_woman24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonPersonal" runat="server" CssClass="MessageSender" 
                 onclick="LinkButtonPersonal_Click">&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1601;&#1585;&#1583;&#1740;</asp:LinkButton>
             <br />
             <asp:Panel ID="PanelPersonal" runat="server" Visible="False" Width="100%">
                 <table class="style1">
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelFirstName" runat="server" CssClass="FormLabel" Text="&#1606;&#1575;&#1605;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelFirstNameData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonFirstNameEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonFirstNameEdit_Click" 
                                 Width="16px" />
                             <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                                 ValidationGroup="FirstName" Visible="False" Width="125px"></asp:TextBox>
                             <asp:ImageButton ID="ImageButtonFirstNameChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" 
                                 onclick="ImageButtonFirstNameChange_Click" ValidationGroup="FirstName" 
                                 Visible="False" Width="22px" />
                             <asp:ImageButton ID="ImageButtonFirstNameCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonFirstNameCancel_Click" ValidationGroup="FirstName" 
                                 Visible="False" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" 
                                 ControlToValidate="TextBoxFirstName" CssClass="FormValidation" 
                                 ErrorMessage="&#1606;&#1575;&#1605; &#1585;&#1575; &#1578;&#1705;&#1605;&#1740;&#1604; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="FirstName"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelLastName" runat="server" CssClass="FormLabel" 
                                 Text="&#1606;&#1575;&#1605; &#1582;&#1575;&#1606;&#1608;&#1575;&#1583;&#1711;&#1740;:"></asp:Label>
                         </td>
                         <td class="style4">
                             <asp:Label ID="LabelLastNameData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonLastNameEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonLastNameEdit_Click" 
                                 Width="16px" />
                             <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="TextBoxMultiRequiredR2L" 
                                 TabIndex="1" ValidationGroup="LastName" Visible="False" Width="125px"></asp:TextBox>
                             <asp:ImageButton ID="ImageButtonLastNameChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" 
                                 onclick="ImageButtonLastNameChange_Click" ValidationGroup="LastName" 
                                 Visible="False" />
                             <asp:ImageButton ID="ImageButtonLastNameCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonLastNameCancel_Click" ValidationGroup="LastName" 
                                 Visible="False" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" 
                                 ControlToValidate="TextBoxLastName" CssClass="FormValidation" 
                                 ErrorMessage="&#1606;&#1575;&#1605; &#1582;&#1575;&#1606;&#1608;&#1575;&#1583;&#1711;&#1740; &#1585;&#1575; &#1578;&#1705;&#1605;&#1740;&#1604; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="LastName"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelBirthDate" runat="server" CssClass="FormLabel" 
                                 Text="&#1578;&#1575;&#1585;&#1740;&#1582; &#1578;&#1608;&#1604;&#1583;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelBirthDateData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonBirthDateEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonBirthDateEdit_Click" 
                                 Width="16px" />
                             <asp:DropDownList ID="DropDownListBirthDay" runat="server" CssClass="DropDownRequiredR2L" 
                                 TabIndex="2" Visible="False">
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
                                 CssClass="DropDownRequiredR2L" TabIndex="3" Visible="False">
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
                             <asp:DropDownList ID="DropDownListBirthYear" runat="server" CssClass="DropDownRequiredR2L" 
                                 TabIndex="6" Visible="False">
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
                             <asp:ImageButton ID="ImageButtonBirthDateChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" 
                                 onclick="ImageButtonBirthDateChange_Click" Visible="False" />
                             <asp:ImageButton ID="ImageButtonBirthDateCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonBirthDateCancel_Click" Visible="False" />
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelGender" runat="server" CssClass="FormLabel" Text="&#1580;&#1606;&#1587;&#1740;&#1578;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelGenderData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonGenderEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonGenderEdit_Click" 
                                 Width="16px" />
                             <asp:DropDownList ID="DropDownListGender" runat="server" CssClass="DropDownRequiredR2L" 
                                 TabIndex="5" Visible="False">
                                 <asp:ListItem Value="0">&#1605;&#1585;&#1583;</asp:ListItem>
                                 <asp:ListItem Value="1">&#1586;&#1606;</asp:ListItem>
                             </asp:DropDownList>
                             <asp:ImageButton ID="ImageButtonGenderChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" onclick="ImageButtonGenderChange_Click" 
                                 Visible="False" />
                             <asp:ImageButton ID="ImageButtonGenderCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" onclick="ImageButtonGenderCancel_Click" 
                                 Visible="False" />
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelJob" runat="server" CssClass="FormLabel" Text="&#1588;&#1594;&#1604;:"></asp:Label>
                         </td>
                         <td class="style4">
                             <asp:Label ID="LabelJobData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonJobEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonJobEdit_Click" 
                                 Width="16px" />
                             <asp:TextBox ID="TextBoxJob" runat="server" CssClass="TextBoxR2L" TabIndex="6" 
                                 Visible="False" Width="125px"></asp:TextBox>
                             <asp:ImageButton ID="ImageButtonJobChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" onclick="ImageButtonJobChange_Click" 
                                 Visible="False" />
                             <asp:ImageButton ID="ImageButtonJobCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" onclick="ImageButtonJobCancel_Click" 
                                 Visible="False" />
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelEducations" runat="server" CssClass="FormLabel" 
                                 Text="&#1578;&#1581;&#1589;&#1740;&#1604;&#1575;&#1578;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelEducationsData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonEducationsEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonEducationsEdit_Click" 
                                 Width="16px" />
                             <asp:DropDownList ID="DropDownListEducations" runat="server" 
                                 CssClass="DropDownR2L" TabIndex="10" Visible="False">
                                 <asp:ListItem Selected="True" Value="0">&#1575;&#1606;&#1578;&#1582;&#1575;&#1576; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;</asp:ListItem>
                                 <asp:ListItem Value="Diploma">&#1583;&#1740;&#1662;&#1604;&#1605;</asp:ListItem>
                                 <asp:ListItem Value="HigherDiploma">&#1601;&#1608;&#1602; &#1583;&#1740;&#1662;&#1604;&#1605;</asp:ListItem>
                                 <asp:ListItem Value="BSc">&#1604;&#1740;&#1587;&#1575;&#1606;&#1587;</asp:ListItem>
                                 <asp:ListItem Value="MSc">&#1601;&#1608;&#1602; &#1604;&#1740;&#1587;&#1575;&#1606;&#1587;</asp:ListItem>
                                 <asp:ListItem Value="Dr">&#1583;&#1705;&#1578;&#1585;&#1575;</asp:ListItem>
                             </asp:DropDownList>
                             <asp:ImageButton ID="ImageButtonEducationsChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" 
                                 onclick="ImageButtonEducationsChange_Click" Visible="False" />
                             <asp:ImageButton ID="ImageButtonEducationsCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonEducationsCancel_Click" Visible="False" />
                         </td>
                     </tr>
                 </table>
             </asp:Panel>
         </div>
         <div class="ShowHidePanel1">
             <asp:Image ID="Image25" runat="server" Height="24px" 
                 ImageUrl="~/images/icons/cellphone24.png" Width="24px" />
             <asp:LinkButton ID="LinkButtonContact" runat="server" CssClass="MessageSender" 
                 onclick="LinkButtonContact_Click" >&#1605;&#1588;&#1582;&#1589;&#1575;&#1578; &#1575;&#1585;&#1578;&#1576;&#1575;&#1591;&#1740;</asp:LinkButton>
             <br />
             <asp:Panel ID="PanelContact" runat="server" Visible="False" Width="100%">
                 <table class="style1">
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelHomePhone" runat="server" CssClass="FormLabel" 
                                 Text="&#1578;&#1604;&#1601;&#1606; &#1605;&#1606;&#1586;&#1604;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelHomePhoneData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonHomePhoneEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonHomePhoneEdit_Click" 
                                 Width="16px" />
                             <asp:TextBox ID="TextBoxHomePhone" runat="server" CssClass="TextBoxL2R" 
                                 Visible="False" Width="125px"></asp:TextBox>
                             <asp:ImageButton ID="ImageButtonHomePhoneChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" 
                                 onclick="ImageButtonHomePhoneChange_Click" Visible="False" />
                             <asp:ImageButton ID="ImageButtonHomePhoneCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonHomePhoneCancel_Click" Visible="False" />
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelWorkPhone" runat="server" CssClass="FormLabel" 
                                 Text="&#1578;&#1604;&#1601;&#1606; &#1605;&#1581;&#1604; &#1705;&#1575;&#1585;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelWorkPhoneData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonWorkPhoneEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonWorkPhoneEdit_Click" 
                                 Width="16px" />
                             <asp:TextBox ID="TextBoxWorkPhone" runat="server" CssClass="TextBoxL2R" 
                                 TabIndex="1" Visible="False" Width="125px"></asp:TextBox>
                             <asp:ImageButton ID="ImageButtonWorkPhoneChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" 
                                 onclick="ImageButtonWorkPhoneChange_Click" Visible="False" />
                             <asp:ImageButton ID="ImageButtonWorkPhoneCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonWorkPhoneCancel_Click" Visible="False" />
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelMobile" runat="server" CssClass="FormLabel" 
                                 Text="&#1578;&#1604;&#1601;&#1606; &#1607;&#1605;&#1585;&#1575;&#1607;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelMobileData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonMobileEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonMobileEdit_Click" 
                                 Width="16px" />
                             <asp:TextBox ID="TextBoxMobile" runat="server" 
                                 CssClass="TextBoxMultiRequiredR2L" TabIndex="2" 
                                 ValidationGroup="Mobile" Visible="False" Width="125px"></asp:TextBox>
                             <asp:ImageButton ID="ImageButtonMobileChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" onclick="ImageButtonMobileChange_Click" 
                                 ValidationGroup="Mobile" Visible="False" />
                             <asp:ImageButton ID="ImageButtonMobileCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonMobileCancel_Click" Visible="False" />
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                 ControlToValidate="TextBoxMobile" CssClass="FormValidation" 
                                 ErrorMessage="...09" ValidationExpression="^(\d){5,18}" 
                                 ValidationGroup="Mobile"></asp:RegularExpressionValidator>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName2" runat="server" 
                                 ControlToValidate="TextBoxMobile" CssClass="FormValidation" 
                                 ErrorMessage="&#1578;&#1604;&#1601;&#1606; &#1607;&#1605;&#1585;&#1575;&#1607; &#1585;&#1575; &#1608;&#1575;&#1585;&#1583; &#1606;&#1605;&#1575;&#1740;&#1740;&#1583;." ValidationGroup="Mobile"></asp:RequiredFieldValidator>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelEmail" runat="server" CssClass="FormLabel" 
                                 Text="&#1662;&#1587;&#1578; &#1575;&#1604;&#1705;&#1578;&#1585;&#1608;&#1606;&#1740;&#1705;&#1740;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelEmailData" runat="server" CssClass="FormStaticData"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelLocation" runat="server" CssClass="FormLabel" 
                                 Text="&#1605;&#1581;&#1604; &#1586;&#1606;&#1583;&#1711;&#1740;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelLocationData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonLocationEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonLocationEdit_Click" 
                                 Width="16px" />
                             <asp:DropDownList ID="DropDownListLocationCountry" runat="server" 
                                 CssClass="FormData" Enabled="False" TabIndex="3" Visible="False">
                                 <asp:ListItem Value="IR">&#1575;&#1740;&#1585;&#1575;&#1606;</asp:ListItem>
                             </asp:DropDownList>
                             <asp:Label ID="LabelLocationState" runat="server" CssClass="FormData" 
                                 Text="&#1575;&#1587;&#1578;&#1575;&#1606;:" Visible="False"></asp:Label>
                             <asp:DropDownList ID="DropDownListLocationProvince" runat="server" 
                                 CssClass="DropDownRequiredR2L" AutoPostBack="True" 
                                 onselectedindexchanged="DropDownListLocationProvince_SelectedIndexChanged" 
                                 Visible="False">
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
                                 Text="&#1588;&#1607;&#1585;:" Visible="False"></asp:Label>
                             <asp:DropDownList ID="DropDownListLocationCity" runat="server" 
                                 CssClass="DropDownRequiredR2L" Visible="False">
                             </asp:DropDownList>
                             <asp:ImageButton ID="ImageButtonLocationChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" 
                                 onclick="ImageButtonLocationChange_Click" ValidationGroup="Location" 
                                 Visible="False" />
                             <asp:ImageButton ID="ImageButtonLocationCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" 
                                 onclick="ImageButtonLocationCancel_Click" ValidationGroup="Location" 
                                 Visible="False" />
                         </td>
                     </tr>
                     <tr>
                         <td class="style2">
                             <asp:Label ID="LabelAddress" runat="server" CssClass="FormLabel" Text="&#1570;&#1583;&#1585;&#1587;:"></asp:Label>
                         </td>
                         <td>
                             <asp:Label ID="LabelAddressData" runat="server" CssClass="FormStaticData"></asp:Label>
                             <asp:ImageButton ID="ImageButtonAddressEdit" runat="server" Height="16px" 
                                 ImageUrl="~/images/icons/edit16.png" onclick="ImageButtonAddressEdit_Click" 
                                 Width="16px" />
                             <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="TextBoxR2L" 
                                 TabIndex="6" Visible="False" Width="255px"></asp:TextBox>
                             <asp:ImageButton ID="ImageButtonAddressChange" runat="server" 
                                 ImageUrl="~/images/icons/submit22.png" onclick="ImageButtonAddressChange_Click" 
                                 Visible="False" />
                             <asp:ImageButton ID="ImageButtonAddressCancel" runat="server" 
                                 ImageUrl="~/images/icons/cancel24.png" onclick="ImageButton27_Click" 
                                 Visible="False" />
                         </td>
                     </tr>
                 </table>
             </asp:Panel>
         </div>
   </div>

    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <Triggers>
    <asp:AsyncPostBackTrigger  ControlID="LinkButtonContact" EventName="click"/>
    
    </Triggers>
    <ContentTemplate>
     <div style=" direction:rtl;">
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>