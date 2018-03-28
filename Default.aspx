<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Main" %>

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
                <div id ="rhead"> The Service You Can Trust</div>
                <p><span class="rcontent"> Enjoy a 1-to-1 relationship with your own V&V Delivery service, who delivers for you each time and learns for your preferences</span><br /><br /></p>
                <p><span class="rcontent">Get yourfavorite products from store of your preference and get delivered right to your door </span><br /><br /></p>
                <p><span class ="rcontent">We offer a range of other services including Medical deliveries Legal courier deliveries etc</span><br /><br /></p>
                <p><span class="rcontent"> It's all backed by our 100% Stress-free Guarantee</span></p>
            </div>
            <div id="rightblock2">
                <img src="gr1.png" />
                <img src="p2.jpg" />
            </div>
        </div>

        <br />

      <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="Timer1" Interval="2000" runat="server" />
 
        <asp:UpdatePanel ID="up1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
            <asp:AdRotator
            id="AdRotator1"
            AdvertisementFile="ads.xml"
            Runat="server" />
            <asp:AdRotator
            id="AdRotator2"
            AdvertisementFile="ads.xml"
            Runat="server" />
            <asp:AdRotator
            id="AdRotator3"
            AdvertisementFile="ads.xml"
            Runat="server" />
        
        </ContentTemplate>
        </asp:UpdatePanel>   

    </div>

  

    </form>
</body>
</html>
