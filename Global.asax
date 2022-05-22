<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup        
        GeneralClass.Program.DatabaseConnect();
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
        Server.ClearError();
        
    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        Server.ClearError();     
        // Code that runs when an unhandled error occurs
    // Fires when an error occurs
    //Check to see whether we came 
    //from the upload form                            

        //if (System.IO.Path.GetFileName(Request.Path) == "register.aspx")
        //{
        //    //Get the error details
        //    System.Exception appException = Server.GetLastError();

        //    HttpException checkException = (HttpException)appException;
        //    //Verify the expected error              
        //    if (checkException.GetHttpCode() == 500)
        //    {
        //        if (checkException.ErrorCode == -2147467259)
        //        {
        //            //Error 400 = bad request, user 
        //            //tried to upload a file that's too large                                 
        //            Session["UploadErr"] = "true";
        //            Server.ClearError();
        //            //Go to the original target page
        //            Response.Redirect("register.aspx");
        //        }
        //    }

        //}  
    
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
