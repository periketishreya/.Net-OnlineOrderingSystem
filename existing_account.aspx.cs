using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
﻿


public partial class existing_account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        User1 user1 = (User1)Session["currentUser"];
        IntroLabel.Text = "Welcome" + "      " + user1.FullName;
    }
    protected void RadioButton_CheckedChanged(object sender, System.EventArgs e)
    {

    }

    protected void SubmitRequestButton_Click(object sender, EventArgs e)
    {

        User1 user1 = (User1)Session["currentUser"];
        DeliveryDetail request = new DeliveryDetail();

        request.PickupAddress = TextBox1.Text.Trim();
        request.ReceipientAddress = TextBox2.Text.Trim();
        request.ReceipientPhone = TextBox3.Text.Trim();
        request.Description = TextBox4.Text.Trim();
        request.Datetime = DateTime.Now;


        user1.deliveryDetailsList.Add(request);

        String cs = System.Configuration.ConfigurationManager.ConnectionStrings["wad"].ConnectionString;


        SqlConnection conn = new SqlConnection(cs);

        try
        {

            String insert = "INSERT INTO VijayB_WADsp16_delivery_request" +
                            "(access_code,request_date,pickup_address,recipient_address, recipient_phone_number,descr)" +
                            " VALUES (@p1, @p2, @p3,@p4, @p5,@p6)";
            SqlCommand comm = new SqlCommand(insert, conn);
            comm.Parameters.AddWithValue("@p1", user1.AccessCode);
            comm.Parameters.AddWithValue("@p2", request.Datetime);
            comm.Parameters.AddWithValue("@p3", request.PickupAddress);
            comm.Parameters.AddWithValue("@p4", request.ReceipientAddress);
            comm.Parameters.AddWithValue("@p5", request.ReceipientPhone);
            comm.Parameters.AddWithValue("@p6", request.Description);
            conn.Open();

            comm.ExecuteNonQuery();

        }
        finally
        {
            conn.Close();
        }
        try{

         String msgTo = user1.EmailAddress;
                String msgSubject = "V&V Delievry Services New Request Confirmation";
                String msgBody = "Valued Customer   " + user1.FullName 
                    +",<br/><br/> You have requested a new Delivery. Details Shown Below." 
                    +"<br/> pickupAddress: " + request.PickupAddress
                    +"<br/> Recipient Address: " + request.ReceipientAddress
                    +"<br/> Description:" + request.Description
                    +" <br/><br /> Please note that any Modificataions made after 2 hours of submission of the original request will not be accepted."
                    +"<br/><br/><br/>Sincerly<br/>V&V Delievrey Services  team ";
                MailMessage mailObj = new MailMessage();
                mailObj.Body = msgBody;
                mailObj.From = new MailAddress("manideep@gmail.com ", "V&V DElivery Services Customer Care");
                mailObj.To.Add(new MailAddress(msgTo));
                mailObj.Subject = msgSubject;
                mailObj.IsBodyHtml = true;

                SmtpClient SMTPServer = new System.Net.Mail.SmtpClient();
                SMTPServer.Host = "smtp.gmail.com";
                SMTPServer.Port = 587;
                SMTPServer.Credentials = new NetworkCredential("manideepd28@gmail.com", "m@ni28091993");
                SMTPServer.EnableSsl = true;


                SMTPServer.Send(mailObj);

            }
            finally
            { }
            
          
            string script = "<script type=\"text/javascript\">alert('Confirmation sent to the Email.pleae check!!'); window.location.replace('existing_account.aspx'); </script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
         


    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("accounts.aspx");
    }



    protected void RadioButton_CheckedChanged2(object sender, EventArgs e)
    {
        Response.Redirect("Orders.aspx");
    }
}