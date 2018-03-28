using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;


public partial class forgot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ForgotButton_click(object sender, EventArgs e)
    {
        List<User1> allUsersList = Application["AllUsersList"] as List<User1>;
        User1[] array = allUsersList.ToArray();
        int validEmail=0;
        int i;

        


        for ( i = 0; i < allUsersList.Count; i++)
        {
            if (emailTxt.Text.Trim() == array[i].EmailAddress)
            {
                validEmail = 1;
                break;
            }

        }


        if (validEmail == 1)
        {
            try
            {

                String msgTo = emailTxt.Text.Trim();
                String msgSubject = "We have recovered your access Code!";
                String msgBody = "Valued Customer,<br/>Thank you for contacting us. YouraccesCode is " + array[i].AccessCode + " .<br />Thank you <br/>V&V Delievrey Services Security team ";
                MailMessage mailObj = new MailMessage();
                mailObj.Body = msgBody;
                mailObj.From = new MailAddress("manideep@gmail.com", "V&V DElivery Services Customer Care");
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
            
            string script = "<script type=\"text/javascript\">alert('your password has been sent  to the email Address in file.This time Original!!'); window.location.replace('accounts.aspx'); </script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);


        }
        else
        {
            string script = "<script type=\"text/javascript\">alert('Your account email cannot be verified'); </script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }
       
    }
}