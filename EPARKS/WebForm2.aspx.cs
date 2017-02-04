using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using Oracle.DataAccess.Client;

namespace EPARKS
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;

            //OracleConnection oracleconnection1 = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            //OracleCommand cmd = new OracleCommand();
            ////OracleDataReader reader;
            //oracleconnection1.Open();
            //OracleDataAdapter old = new OracleDataAdapter("SELECT * FROM CUSTOMER_INFO", oracleconnection1);
            //DataTable dt = new DataTable();
            //old.Fill(dt);


            //GridView1.DataSource= dt;
            //GridView1.DataBind();
           

           // oracleconnection1.Close();



       
        }
    }
}