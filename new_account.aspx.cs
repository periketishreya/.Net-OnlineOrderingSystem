﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;

public partial class new_account : System.Web.UI.Page
{
    int emailIdExists = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        int randNum = RandomNumber(100000, 999999);
        TextBox4.Text = Convert.ToString(randNum);       
    }
    protected void RadioButton_CheckedChanged(object sender, System.EventArgs e)
    {
        Response.Redirect("accounts.aspx");
    }
    private int RandomNumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max);
    }
    protected void createAccountButton_click(object sender, EventArgs e)
    {
        List<User1> allUsersList = Application["AllUsersList"] as List<User1>;
        User1[] array = allUsersList.ToArray();

        for (int i = 0; i < allUsersList.Count; i++)
        {
            if (TextBox3.Text.Trim() == array[i].EmailAddress)
            {
                emailIdExists = 1;
                Session["currentUser"] = (object )allUsersList[i]; 
                break;
            }

        }

        if (emailIdExists == 0)
        {
            User1 user1 = new User1();
            user1.AccessCode = Int32.Parse(TextBox5.Text);
            user1.FullName = fnametxt.Text.Trim();
            user1.Company = companytxt.Text.Trim();
            user1.EmailAddress = TextBox3.Text.Trim();
            user1.MailingAddress = TextBox1.Text.Trim();
            user1.PhoneNumber = TextBox2.Text.Trim();
            allUsersList.Add(user1);
            Session["currentUser"] = user1;

            String cs = System.Configuration.ConfigurationManager.ConnectionStrings["wad"].ConnectionString;


           SqlConnection conn = new SqlConnection(cs);
           
           try
           {
               
               String insert = "INSERT INTO VijayB_WADsp16_user" +
                               "(access_code,full_name,company,mailing_address, phone_number,email_address)" +
                               " VALUES (@p1, @p2, @p3,@p4, @p5,@p6)";
               SqlCommand comm = new SqlCommand(insert, conn);
               comm.Parameters.AddWithValue("@p1", user1.AccessCode);
               comm.Parameters.AddWithValue("@p2", user1.FullName);
               comm.Parameters.AddWithValue("@p3", user1.Company);
               comm.Parameters.AddWithValue("@p4", user1.MailingAddress);
               comm.Parameters.AddWithValue("@p5", user1.PhoneNumber);
               comm.Parameters.AddWithValue("@p6", user1.EmailAddress);
               conn.Open();

               comm.ExecuteNonQuery();

           }
            finally
           {
               conn.Close();
           }

            try
            {

                String msgTo = TextBox3.Text.Trim();
                String msgSubject = "V&V services Delivery Services Registration Confirmation";
                String msgBody = "Valued Customer   " + user1.FullName + ",<br/><br/>Thank you for registring with V&V Delievery Services!!." 
                    +"Youu can start using your account to request us to deliver your goods" 
                    +" .<br/><br />Looking Forward to do business with you." +"<br/> Thankyou again for keeping trust on us. <br/><br/><br/>V&V Delievrey Services Security team ";
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
            
          
            string script = "<script type=\"text/javascript\">alert('Thank you for registering with us. You can now log in.An Email regarding the same has been sent.'); window.location.replace('existing_account.aspx'); </script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
          

        }
        else
        {
            string script = "<script type=\"text/javascript\">alert('Your email address already exists in our database. Please login.');window.location.replace('accounts.aspx'); </script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
       
    }
    protected void NoThanksButton_click(object sender, EventArgs e)
    {
        Response.Redirect("accounts.aspx");
    }

}