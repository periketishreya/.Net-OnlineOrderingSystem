<%@ Page Language="C#" AutoEventWireup="true" CodeFile="accounts.aspx.cs" Inherits="accounts" %>

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
        <div id ="rightblock">
            <asp:RadioButton 
                ID="RadioButton1" 
                runat="server" 
                Text="I have an existing account" 
                GroupName="accountCheck" 
                AutoPostBack="true" 
                OnCheckedChanged="RadioButton_CheckedChanged"
                Font-Bold="true"
                Font-Names="verdana italic"
                checked =" true"
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
                Font-Names="Verdana italic"
                ForeColor="steelblue"
                />
                <br /> 
                <fieldset style="border: thin solid #C0C0C0; height: 130px; width: 604px; margin-left: 2px; " >
                <br />
                <legend style="color:steelblue"> Existing Account</legend>

                

                <asp:Label ID="Label2" runat="server" ForeColor="steelBlue" Text="Email Address:" ></asp:Label>
                <span runat="server" style="color:Red;"> *</span>
                <asp:TextBox ID="emailTxt" runat ="server"  ></asp:TextBox>
           
                <asp:Label ID="Label1" runat="server" ForeColor="steelBlue" Text="Access Code" style="margin-left:10px;"></asp:Label>
                <span runat="server"  style="color:Red;"> *</span>
                <asp:TextBox ID="TextBox1" runat ="server" ></asp:TextBox><br />
           
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                 ControlToValidate="emailtxt"
                 ForeColor="Red"
                 Display="Dynamic"> * Email Address is a required Field <br />
                </asp:RequiredFieldValidator>

                 <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" 
                 ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                 ControlToValidate="emailTxt" 
                 ForeColor="Red"
                 Display="Dynamic"> * Enter a Valid Email Address <br />
                 </asp:RegularExpressionValidator>

                 <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                 ControlToValidate="TextBox1"
                 ForeColor="Red"
                 Display="Dynamic"> * Access Code is a required Field 
                </asp:RequiredFieldValidator>

                 <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" 
                 ValidationExpression="\d{6}" 
                 ControlToValidate="TextBox1" 
                 ForeColor="Red"
                 Display="Dynamic"> * Enter a Valid Access Code 
                 </asp:RegularExpressionValidator>
    
                <p> </p>
                <asp:HyperLink ID="forgotAcessCode" 
                  NavigateUrl="forgot.aspx"
                  Text="Forgot Access code"
                  runat="server" ForeColor="#009933" /> 
            
            <asp:Button ID="loginId" runat="server" Text="Log in" onclick="LoginButton_Click"  style="margin-left:90px;"/>



        </fieldset>

        </div>

    </div>
    </form>
</body>
</html>
