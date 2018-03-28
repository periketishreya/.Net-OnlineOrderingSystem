﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class accounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButton_CheckedChanged(object sender, System.EventArgs e)
    {
        Response.Redirect("new_account.aspx");
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        List<User1> allUsersList = Application["AllUsersList"] as List<User1>;
        User1[] array = allUsersList.ToArray();
        int valid_account=0;

        for (int i = 0; i < allUsersList.Count; i++)
        {
            if ((emailTxt.Text.Trim() == array[i].EmailAddress) && (Int32.Parse(TextBox1.Text.Trim()) == array[i].AccessCode))
            {
                
                    valid_account = 1;
                    Session["currentUser"] = (object) allUsersList[i];
                    break;

            }
        
        }

        if ( valid_account == 1)
            Response.Redirect("existing_account.aspx");
        else
        {
            string script = "<script type=\"text/javascript\">alert('Wrong Credentials!! Please Enter Correct Credentials'); window.location.replace('accounts.aspx'); </script>";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        }

    }
}