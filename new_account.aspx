<%@ Page Language="C#" AutoEventWireup="true" CodeFile="new_account.aspx.cs" Inherits="new_account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Delivery Service Website</title>
    <link type="text/css" rel="stylesheet" href="style1.css" />
     <script>

        
        function fillArea1(xml) {
          
            var xmlDoc = xml.responseXML;
            var tag = xmlDoc.getElementsByTagName("info");

            
            document.getElementById("tollno").innerHTML = tag[0].getAttribute("toll-free-phone");
            document.getElementById("hou_no").innerHTML = tag[0].getAttribute("houston-phone");
            document.getElementById("contact-email").innerHTML = tag[0].getAttribute("contact-email");

        }
        function Fillout() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {

            if (xhttp.readyState == 4 && xhttp.status == 200) {
               fillArea1(xhttp);
            }
        };
    
        xhttp.open("GET", "contactinfor.xml", true);
        xhttp.send();
        }
        </script>
</head>
<body onload="Fillout()">
    <form id="form1" runat="server">
    <div id ="Layout">
        <div id ="Header">
            <img src="logo.png" />
            V&V Delivery Services
            <div id="quote">
                <span class="sub">O</span>n-time <span class="sub">P</span>erformance <span class="sub">G</span>uaranteed
            </div>
        </div>
        <div id="menu">
            <ul> 
                <li> <a href="Default.aspx"> Home </a></li>
                <li> <a href="AboutUs.aspx" target="_blank"> About Us </a></li>
                <li> <a href="service.aspx" > Services </a></li>
                <li> <a href="accounts.aspx"> Accounts </a></li>
                <li> <a href="Resources.aspx"> Resources </a></li>
                <li> <a href="ContactUs.aspx"> Contact Us </a></li>
                <li> <a href="Sarea.aspx"> Service Area</a></li>

            </ul>    
        </div>
        <div id ="leftblock">
           <div id="leftblock1">
                    <p><span class="lhead">Contact Us</span></p>
                    <p><span class="lcontent">Texans servicing Texans <br />
                    24 hours a day!</span></p>
                    <p><span class="lhead">Toll Free</span></p>
                    <a id="tollno" href="#"><span class="lcontent"></span></a>
                    <p><span class="lhead">Houston</span></p>
                    <a id="hou_no" href="#"><span class="lcontent"></span></a>
                    <p> <span class="lhead"> e-mail</span></p>
                    <a id="contact-email" href="#"><span class="lcontent"></span></a>
            </div>
            <div id="leftblock2">
                <img src="cards.png" />
            </div>
       </div>
        <div id ="rightblock" >
             <asp:RadioButton 
                ID="RadioButton1" 
                runat="server" 
                Text="I have an existing account" 
                GroupName="accountCheck" 
                AutoPostBack="true" 
                OnCheckedChanged="RadioButton_CheckedChanged"
                Font-Bold="true"
                Font-Names="verdana italic"
                ForeColor="steelblue"
                />
            <asp:RadioButton 
                ID="RadioButton2" 
                runat="server" 
                Text="I do not have an existing account"
                GroupName="accountCheck" 
                AutoPostBack="true" 
                OnCheckedChanged="RadioButton_CheckedChanged"
                Font-Bold="true"
                checked="true"
                Font-Names="Verdana italic"
                ForeColor="steelblue"
                />
        <fieldset style="border: thin solid #C0C0C0; height: 363px; width: 609px; margin-left: 2px; margin-top:10px;" >
            <legend style="color:steelblue"> Create new account</legend>
            <p style="color:purple">Apply online to open an account with us </p>
            <p style="color:steelblue;">To Complete an online application, please fill out the following information and then hit the 'Create Account' button</p>
            <asp:Label ID="fnamelbl" runat="server" ForeColor="steelBlue" Text="Full Name"  style=" float:left"></asp:Label>
            <span runat="server" style="color:Red;"> *</span>
            <asp:TextBox ID="fnametxt" runat ="server" width="300" style="margin-left:100px" ></asp:TextBox><br />

            <asp:Label ID="companylbl" runat="server" ForeColor="steelBlue" Text="Comapny " style=" float:left"></asp:Label>
            <asp:TextBox ID="companytxt" runat ="server" width="300" style=" margin-top:2px; margin-left:118px; " ></asp:TextBox><br />

            <asp:Label ID="Label1" runat="server" ForeColor="steelBlue" Text="Mailing Address "  style=" float:left"></asp:Label>
            <span runat="server" style="color:Red;"> *</span>
            <asp:TextBox ID="TextBox1" runat ="server" width="400" style="margin-top:2px; margin-left:61px" ></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" ForeColor="steelBlue" Text="PhoneNumber " style=" float:left"></asp:Label>
            <span runat="server" style="color:Red;"> *</span>
            <asp:TextBox ID="TextBox2" runat ="server" width="200" style=" margin-top:2px; margin-left:76px; " ></asp:TextBox><br />

            <asp:Label ID="Label3" runat="server" ForeColor="steelBlue" Text="Email Address "  style=" margin-top:2px; float:left"></asp:Label>
            <span runat="server"  style="color:Red;"> *</span>
            <asp:TextBox ID="TextBox3" runat ="server" width="200" style="margin-top:2px; margin-left:74px" ></asp:TextBox><br />

            <asp:Label ID="Label4" runat="server" ForeColor="steelBlue" Text="Access Code"  style=" float:left"></asp:Label>
            <asp:TextBox ID="TextBox4" runat ="server" width="100" ReadOnly="true"  style=" margin-top:2px; margin-left:97px; background-color:black; color:orange " ></asp:TextBox><br />

            <asp:Label ID="Label5" runat="server" ForeColor="steelBlue" Text="Enter Access Code "  style=" float:left"></asp:Label>
            <span runat="server"  style="color:Red;"> *</span>
            <asp:TextBox ID="TextBox5" runat ="server" width="100" style="margin-left:47px; margin-top:2px" ></asp:TextBox><br />

            <asp:Button ID="createAccountBtn" runat="server" Text="Create Account" onclick="createAccountButton_click" style="background-color:#808080;margin-left:170px; margin-top:10px;" />
            <asp:Button ID="noThanksBtn" runat="server" Text="Back to Accounts" onclick="NoThanksButton_click" style="background-color:#808080" CausesValidation="false" /> <br />

            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                 ControlToValidate="fnametxt"
                 ForeColor="Red"
                 Display="Dynamic"> * Full Name is a required Field 
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                 ControlToValidate="TextBox1"
                 ForeColor="Red"
                 Display="Dynamic"> * Mailing Address is a required Field 
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                 ControlToValidate="TextBox2"
                 ForeColor="Red"
                 Display="Dynamic"> * Phone number is a required Field 
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                 ControlToValidate="TextBox3"
                 ForeColor="Red"
                 Display="Dynamic"> * Email is a required Field 
            </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                 ControlToValidate="TextBox5"
                 ForeColor="Red"
                 Display="Dynamic"> * Enter Access Code is a required Field 
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" 
                 ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                 ControlToValidate="TextBox3" 
                 ForeColor="Red"
                 Display="Dynamic"> * Enter a Valid Email Address <br />
                 </asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" 
                 ValidationExpression="^\d{3}-\d{3}-\d{4}$" 
                 ControlToValidate="TextBox2" 
                 ForeColor="Red"
                 Display="Dynamic"> * Enter a Valid phone number<br />
                 </asp:RegularExpressionValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server"
             ControlToValidate="TextBox5" 
             ControlToCompare="TextBox4" ForeColor ="Red">
            *Access Code Doesn't Match
            </asp:CompareValidator>


        </fieldset>

        </div>

    </div>
    </form>
</body>
</html>
