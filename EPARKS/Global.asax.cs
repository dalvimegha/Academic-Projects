using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace EPARKS
{
    public class Global : System.Web.HttpApplication
    {
        public static String pcustssn;
        public static int billid = 0;
        public static String parkidval;
        public static int access;
        public static String custssn
        {
            get
            {
                return pcustssn ;
            }

            set
            {
                pcustssn = value;
            }
        }
        public int Billid
        {
            get
            {
                return billid;
            }
            set
            {
                billid = value;
            }
        }

        public String parkid
        {
            get
            {
                return parkidval;
            }
            set
            {
                parkidval = value;
            }
        }
        public int accessuser
        {
            get
            {
                return access;
            }
            set
            {
                access = value;
            }
        }

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
           

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

    }
}
