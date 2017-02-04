using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPARKS
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }
        protected void btnLogiohome_CLick(object sender,EventArgs e)
        {
            Response.Redirect("Login.aspx");

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("REgistration.aspx");
        }
    }
}