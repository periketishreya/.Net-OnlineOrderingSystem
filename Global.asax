<%@ Application Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        Application["AllUsersList"] = new List<User1>();
        List<User1> allUsersList = Application["AllUsersList"] as List<User1>;



        String cs = System.Configuration.ConfigurationManager.ConnectionStrings["wad"].ConnectionString;


        SqlConnection conn = new SqlConnection(cs);

        try
        {

            String read = "Select * from VijayB_WADsp16_user";
            SqlCommand comm = new SqlCommand(read, conn);
            conn.Open();

            SqlDataReader sqlReader = comm.ExecuteReader();

            while(sqlReader.Read())
            {
                User1 aUser = new User1();
                aUser.AccessCode = (int)sqlReader["access_code"];
                aUser.FullName = (string)sqlReader["full_name"];
                aUser.Company = (string)sqlReader["company"];
                aUser.MailingAddress = (string)sqlReader["mailing_address"];
                aUser.PhoneNumber = (string)sqlReader["phone_number"];
                aUser.EmailAddress = (string)sqlReader["email_address"];

                SqlConnection conn2 = new SqlConnection(cs);
                String read2 = "select * from VijayB_WADsp16_delivery_request where access_code = " + aUser.AccessCode;
                SqlCommand comm2 = new SqlCommand(read2, conn2);
                conn2.Open();
                SqlDataReader r2 = comm2.ExecuteReader();

                while(r2.Read())
                {
                    DeliveryDetail req = new DeliveryDetail();
                    req.AccessCode = (int)r2["access_code"];
                    req.Datetime = (DateTime)r2["request_date"];
                    req.PickupAddress = (string)r2["pickup_address"];
                    req.ReceipientAddress = (string)r2["recipient_address"];
                    req.ReceipientPhone = (string)r2["recipient_phone_number"];
                    //req.Description = (string)r2["decsr"];

                    aUser.deliveryDetailsList.Add(req);
                }
                allUsersList.Add(aUser);
                conn2.Close();

            }

        }
        finally
        {
            conn.Close();
        }
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
