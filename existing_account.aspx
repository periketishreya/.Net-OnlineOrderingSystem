<%@ Page Language="C#" AutoEventWireup="true" CodeFile="existing_account.aspx.cs" Inherits="existing_account" %>

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

             <asp:Label ID="IntroLabel" runat="server" Text ="Welcome" ForeColor="steelBlue" style="font:bold 20px arial,verdana;"></asp:Label>
            
                <asp:HyperLink ID="forgotPwd" 
                  NavigateUrl="accounts.aspx"
                  Text="Log out"
                  runat="server" ForeColor="steelblue"
                  style="float:right; margin-right:50px" /> 
            
            <br /> <br />

             <asp:RadioButton 
                ID="RadioButton1" 
                runat="server" 
                Text="New Delivery Request" 
                GroupName="login" 
                AutoPostBack="true" 
                OnCheckedChanged="RadioButton_CheckedChanged"
                Font-Bold="true"
                checked="true"
                Font-Names="verdana italic"
                ForeColor="steelblue"
                />
            <asp:RadioButton 
                ID="RadioButton2" 
                runat="server" 
                Text="View My Account Details"
                GroupName="login" 
                AutoPostBack="true" 
                OnCheckedChanged="RadioButton_CheckedChanged2"
                Font-Bold="true"
                Font-Names="Verdana italic"
                ForeColor="steelblue"
                />
        <fieldset style="border: thin solid #C0C0C0; height: 263px; width: 609px; margin-left: 2px; margin-top:10px;" >
            <legend style="color:steelblue">New Delivery Details</legend>
            <p style="color:purple">Please Enter the delivery details below </p>
            
       

            <asp:Label ID="Label1" runat="server" ForeColor="steelBlue" Text="Pickup Address* "  style=" float:left"></asp:Label>
            <asp:TextBox ID="TextBox1" runat ="server" width="400" style="margin-top:2px; margin-left:61px" ></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" ForeColor="steelBlue" Text="Recepient Address* " style=" float:left"></asp:Label>
            <asp:TextBox ID="TextBox2" runat ="server" width="400" style=" margin-top:2px; margin-left:41px; " ></asp:TextBox><br />

            <asp:Label ID="Label3" runat="server" ForeColor="steelBlue" Text="Recepient Phone* "  style=" margin-top:2px; float:left"></asp:Label>
            <asp:TextBox ID="TextBox3" runat ="server" width="200" style="margin-top:2px; margin-left:54px" ></asp:TextBox><br />

            <asp:Label ID="Label4" runat="server" ForeColor="steelBlue" Text="Provide Description <br/>( List Items to Deliver)* "  style=" margin-top:2px; float:left"></asp:Label>
            <asp:TextBox ID="TextBox4" Textmode="multiline" runat ="server" width="400" style="margin-top:2px; margin-right:34px; float:right" ></asp:TextBox><br />


            <asp:Button ID="submitrequestBtn" runat="server" Text="Submit Request" onclick="SubmitRequestButton_Click" style="background-color:#808080;margin-left:170px; margin-top:10px;" />
            <br />

            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                 ControlToValidate="TextBox1"
                 ForeColor="Red"
                 Display="Dynamic"> * Pickup Address is required
            </asp:RequiredFieldValidator>
           
            
            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                 ControlToValidate="TextBox2"
                 ForeColor="Red"
                 Display="Dynamic"> * Recepient Address is required
            </asp:RequiredFieldValidator>
            
            <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                 ControlToValidate="TextBox3"
                 ForeColor="Red"
                 Display="Dynamic"> * Recepient phone is required
            </asp:RequiredFieldValidator>

             <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" 
                 ValidationExpression="^\d{3}-\d{3}-\d{4}$" 
                 ControlToValidate="TextBox3" 
                 ForeColor="Red"
                 Display="Dynamic"> * Enter a Valid phone number<br />
                 </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                 ControlToValidate="TextBox4"
                 ForeColor="Red"
                 Display="Dynamic"> * List Items to Deliver Field is required
            </asp:RequiredFieldValidator>






        </fieldset>

        </div>

    </div>
    </form>
</body>
</html>
