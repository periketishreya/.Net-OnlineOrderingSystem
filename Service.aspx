<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="Service" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service</title>
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
                <li> <a href="Service.aspx"> Services </a></li>
                <li> <a href="accounts.aspx"> Accounts </a></li>
                <li> <a href="Resources.aspx"> Resources </a></li>
                <li> <a href="ContactUs.aspx"> Contact Us </a></li>
                <li> <a href="sarea.aspx"> Service Area</a></li>

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
        <div id="rightblock">
        <div id ="rightblock5">
            <p class="service_head">
                SERVICES
            </p> 
            <p class="service_content">V&V Delivery Services geared to meet a variety of challenges that your same day shipping needs might present.
            We have the knowledge and experience to set up programs to specifically meet or exceed both you and your client's expectations of service, quality and on-time dependability.
            Here are a few of the specialized programs we offer:<br /> <br /></p>
            <div id="s3">
            <div id="s1">
                <ul>
                    <li>Groceries Delivery</li>
                    <li>Medical Deilveries</li>
                    <li>Legal Courier Deliveries</li>
                </ul>
            </div>
            <div id="s2">
            <img src="delivery.jpg" />
            </div>
             </div>
            

            <p class="service_content">Each type of service is unique in its specific requirements of service and commitment and each is understood 
            by our staff of trained professionals. Our commitment of 24 hour a day reliability to our clients is unsurpassed. Our performance is one you can count on immediately!
</p>
              
        </div>
</div>
    </div>
    </form>
</body>
</html>
