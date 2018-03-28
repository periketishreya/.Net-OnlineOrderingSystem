using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitRequest_click(object sender, EventArgs e)
    {

        String msgTo = TextBox1.Text.Trim();
        String msgSubject = "We have received your message!";
        String msgBody = "Valued Customer,<br/>Thank you for contacting us. our customer service representatives will contacting you with in Theme next 24 hours.<br />Thank you <br/>V&V services Customer Service team ";

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

        try
        {
            SMTPServer.Send(mailObj);
        }
        catch(Exception ex)
        {
            Console.Write(ex.StackTrace);
        }

        finally
        { }
      

        string script = "<script type=\"text/javascript\">alert('Originial Email Has been sent. This is just a dialog box'); window.location.replace('ContactUs.aspx'); </script>";
        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        
        


    }
}