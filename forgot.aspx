<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgot.aspx.cs" Inherits="forgot" %>

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
    
                <fieldset style="border: thin solid #C0C0C0; height: 130px; width: 604px; margin-left: 2px; " >
                <br />
                <legend style="color:steelblue"> Recover Password</legend>

              
                <asp:Label ID="Label2" runat="server" ForeColor="steelBlue" Text="Email Address:" ></asp:Label>
                <span runat="server"  style="color:Red;"> *</span>
                <asp:TextBox ID="emailTxt" runat ="server" AutoPostBack="true" ontextchanged="ForgotButton_click"></asp:TextBox>
           
               

                <asp:Button ID="Button1" runat="server" Text="Recover Password" onclick="ForgotButton_click"  style="margin-left:90px;"/>

    
                <p> </p>
                <asp:HyperLink ID="forgotAcessCode" 
                  NavigateUrl="accounts.aspx"
                  Text="Go Back to Accounts Page"
                  runat="server" ForeColor="#009933" /> 
            
      
                 
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                 ControlToValidate="emailtxt"
                 ForeColor="Red"
                 Display="Dynamic"> * Email Address is a required Field <br />
                </asp:RequiredFieldValidator>

                 <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" 
                 ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                 ControlToValidate="emailTxt" 
                 ForeColor="Red"
                 Display="Dynamic"> <br />* Enter a Valid Email Address <br />
                 </asp:RegularExpressionValidator>


        </fieldset>

        </div>

    </div>
    </form>
</body>
</html>
