using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Web.DataAccess;
using System.Data;
using System.Text;

namespace EPARKS
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                OracleConnection oracleconnection1 = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
                oracleconnection1.Open();
                OracleCommand cmd1;
                OracleCommand cmd2;
                string firstname = TextBox1.Text;
                string lastname = TextBox2.Text;
                string phonenum = TextBox3.Text;
                string emailid = TextBox4.Text;
                string address = TextBox5.Text;
                string ssn = TextBox6.Text;
                string state = DropDownList1.SelectedItem.Value;
                string username = TextBox7.Text;
                string password = TextBox8.Text;
                DataTable dt_ssncheck = new DataTable();
                DataTable dt_username = new DataTable();

                OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
                conn.Open();
                OracleDataAdapter odpcustssn = new OracleDataAdapter("SELECT * FROM REGISTRATION_DETAILS WHERE CUSTSSNP='"+TextBox6.Text+"'" , conn);
                odpcustssn.Fill(dt_ssncheck);

                OracleDataAdapter odpusernamepwd = new OracleDataAdapter("SELECT * FROM REGISTRATION_DETAILS WHERE USERNAME='" + TextBox7.Text + "'", conn);
                odpusernamepwd.Fill(dt_username);

                if (dt_ssncheck.Rows.Count > 0)
                {
                    Label8.Text = "User already exists try to login";
                    Label8.Visible = true;
                }
                else if (dt_username.Rows.Count > 0)
                {
                    Label8.Text = "Username already used try some other username";
                    Label8.Visible = true;
                }
                else
                {

                    string CommandText = "INSERT INTO CUSTOMER_INFO VALUES(" + "'" + firstname + "'" + "," + "'" + lastname + "'" + "," + "'" + ssn + "'" + "," + "'" + phonenum + "'" + "," + "'" + address + "'" + "," + "'" + state + "'" + "," + "'" + emailid + "'" + ")";
                    cmd1 = new OracleCommand(CommandText, oracleconnection1);
                    cmd1.ExecuteNonQuery();

                    CommandText = "INSERT INTO REGISTRATION_DETAILS VALUES(" + "'" + username + "'" + "," + "'" + password + "'" + "," + "'" + ssn + "','1')";
                    cmd2 = new OracleCommand(CommandText, oracleconnection1);
                    cmd2.ExecuteNonQuery();
                    oracleconnection1.Close();

                    Registrationpanel.Visible = true;
                    Label8.Text = "you are successfully registered .Please login from home page";
                    Label8.Visible = true;
                    Registrationpanel2.Visible = false;
                    Response.Redirect("Login.aspx");

                }
            }
            catch (Exception ex)
            {
                Response.Write("Exception occured in " +ex);
            }
        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}