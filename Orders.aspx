<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Service Area</title>
    <link type="text/css" rel="stylesheet" href="style1.css" />
    <script>

        
        function fillArea1(xml) {
            var contactlist;
            var xmlDoc = xml.responseXML;
            var tag = xmlDoc.getElementsByTagName("info");

            contactlist = "<tr><td>" + tag[0].getAttribute("city-one") + "</td><td>" + tag[0].getAttribute("city-two") + "</td><td>" + tag[0].getAttribute("city-three") + "</td></tr>" +
                "<tr><td>" + "<a href=#>" + tag[0].getAttribute("houston-phone") + "</a></td><td>"  + "<a href=#>" + tag[0].getAttribute("austin-phone") + "</a></td><td>" + "<a href=#>" + tag[0].getAttribute("dallas-phone") + "</a></td><td>" +
                "<tr><td>" + tag[0].getAttribute("city-four") + "</td><td>" + tag[0].getAttribute("city-five") + "</td><td>" + tag[0].getAttribute("city-six") + "</td></tr>" +
                "<tr><td>" + "<a href=#>" + tag[0].getAttribute("elpaso-phone") + "</a></td><td>" + "<a href=#>" + tag[0].getAttribute("sanantonio-phone") + "</a></td><td>" + "<a href=#>" + tag[0].getAttribute("riogrande-phone") + "</a></td><td>" +
                "<tr><td>" + tag[0].getAttribute("city-seven") + "</td><td>" + tag[0].getAttribute("city-eight") + "</td><td>" + tag[0].getAttribute("city-nine") + "</td></tr>" +
                "<tr><td>" + "<a href=#>" + tag[0].getAttribute("corpus-phone") + "</a></td><td>" + "<a href=#>" + tag[0].getAttribute("easttx-phone") + "</a></td><td>" + "<a href=#>" + tag[0].getAttribute("westtx-phone") + "</a></td><td>";


            document.getElementById("contacts").innerHTML = contactlist;
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
   <div id ="rightblock" >

             <asp:Label ID="IntroLabel" runat="server" Text ="Welcome" ForeColor="steelBlue" style="font:bold 20px arial,verdana;"></asp:Label>
            
                <asp:HyperLink ID="forgotPwd" 
                  NavigateUrl="accounts.aspx"
                  Text="Log out"
                  runat="server" ForeColor="steelblue"
                  style="float:right; margin-right:50px" /> 
            
            <br /> <br />

        
            <asp:Label ID="Label1" runat="server" Text ="View My Account Details" ForeColor="steelBlue" style="font:bold 20px arial,verdana;"></asp:Label>
            <p style="color:steelblue;font-family:Verdana;font-style:italic">Order History</p>
       

            






            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="421px" Width="635px">
                <Columns>
                    <asp:BoundField DataField="request_date" HeaderText="request_date" SortExpression="request_date" />
                    <asp:BoundField DataField="pickup_address" HeaderText="pickup_address" SortExpression="pickup_address" />
                    <asp:BoundField DataField="recipient_address" HeaderText="recipient_address" SortExpression="recipient_address" />
                    <asp:BoundField DataField="recipient_phone_number" HeaderText="recipient_phone_number" SortExpression="recipient_phone_number" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:c432016sp01bodepudivConnectionString %>" SelectCommand="SELECT request_date, pickup_address, recipient_address, recipient_phone_number FROM VijayB_WADsp16_delivery_request WHERE (access_code = 534873) ORDER BY request_date"></asp:SqlDataSource>
            
            
       

            






       

        </div>

    </div>
    </form>
</body>
</html>
