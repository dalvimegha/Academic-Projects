using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Data;
using System.Text;


namespace EPARKS
{
    public partial class Login : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
           // LoginStatus l = new LoginStatus();
            Login2.FailureText = "Please enter correct username/password or Register to login";
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            
            OracleConnection oracleconnection1 = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            oracleconnection1.Open();
          
            string username = Login2.UserName;
            string password = Login2.Password;


           
            OracleDataAdapter oracledp = new OracleDataAdapter("SELECT CUSTSSNP,USERACCESS FROM REGISTRATION_DETAILS WHERE USERNAME = '" + username + "' AND PASSWORD = '" + password + "'",oracleconnection1);
            DataTable dt = new DataTable();
            oracledp.Fill(dt);
           
            if (dt.Rows.Count == 0)
            {
               
                Login2.FailureText = "Please enter correct username/password or Register to login";
               
            }
            else
            {
                EPARKS.Global.custssn = dt.Rows[0]["CUSTSSNP"].ToString();
                Global.access = Convert.ToInt32(dt.Rows[0]["USERACCESS"].ToString());
                oracleconnection1.Close();
                Response.Redirect("Parkingspace.aspx");
                
               
            }
            
            
        }

        protected void btnresetpwd_Click(object sender, EventArgs e)
        {
            Panelresetpwd.Visible = true;
            Login2.Visible = false;
            btnresetpwd.Visible=false;
        }

        protected void Btnreset_Click(object sender, EventArgs e)
        {
            OracleConnection oracleconnection1 = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            oracleconnection1.Open();
            OracleDataAdapter oracledp = new OracleDataAdapter("SELECT * FROM REGISTRATION_DETAILS WHERE CUSTSSNP='"+txtboxcustssn.Text+"'", oracleconnection1);
            DataTable dt = new DataTable();
            oracledp.Fill(dt);
            string CommandText;
            OracleCommand cmd2;
            lblmessage.Visible = false;



            if (dt.Rows.Count > 0)
            {


                CommandText = "UPDATE REGISTRATION_DETAILS SET PASSWORD='" + txtboxnewpwd.Text + "' WHERE CUSTSSNP='" + txtboxcustssn.Text + "'";
                cmd2 = new OracleCommand(CommandText, oracleconnection1);
                cmd2.ExecuteNonQuery();
                oracleconnection1.Close();
                Login2.Visible = true;
            }
            else
            {
                lblmessage.Text = "User with this SSN does not exist .Please register";
                lblmessage.Visible = true;
            }

        }

      
    }
}