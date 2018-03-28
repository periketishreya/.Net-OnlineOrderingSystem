using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    public int xyz;
    protected void Page_Load(object sender, EventArgs e)
    {
        User1 user1 = (User1)Session["currentUser"];
        xyz = user1.AccessCode;
    }

    protected void RadioButton_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void RadioButton_CheckedChanged1(object sender, EventArgs e)
    {
        Response.Redirect("existing_account.aspx");
    }
}