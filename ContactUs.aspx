<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

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
            <div id="rightblock1">
                <div id ="rhead"> Please Email All Your Conerns </div>
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="steelBlue" Text="Enter your Email Address:"  style=" float:left; margin-left:30px"></asp:Label>
                <span runat="server" style="color:Red;"> *</span>
                <asp:TextBox ID="TextBox1" runat ="server" width="300" style="margin-top:2px; margin-left:21px" ></asp:TextBox><br />
                <asp:TextBox ID="TextBox4" Rows="14" Textmode="multiline" runat ="server" width="600"  style="margin-top:2px; margin-left:27px;" Text="{Type your Message here}" ></asp:TextBox><br />
                
                <asp:Button ID="submitrequestBtn" runat="server" Text="Submit Message" onclick="SubmitRequest_click" style="margin-left:250px; margin-top:10px;" />
                
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                 ControlToValidate="TextBox1"
                 ForeColor="Red"
                 Display="Dynamic"> * Email Address is required
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" 
                 ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                 ControlToValidate="TextBox1" 
                 ForeColor="Red"
                 Display="Dynamic"> * Enter a Valid Email Address <br />
                 </asp:RegularExpressionValidator>
            </div>
            
            <div id="rightblock2">
                <img src="gr1.png" />
                <img src="p2.jpg" />
            </div>
        </div>

    </div>
    </form>
</body>
</html>