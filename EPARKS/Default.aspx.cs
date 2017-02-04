using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Drawing;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using Oracle.DataAccess.Client;



namespace EPARKS
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("WebForm2.aspx");
            

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    
        
       












       // OleDbConnection con = new OleDbConnection("Provider=MSDAORA;Data Source =XE; User ID = system; Password= Wright2015;Unicode=True");


       // SqlConnection sqlconnection1 = new SqlConnection("Data Source =XE; User ID = system; Password= Wright2015");
        //SqlConnection sqlconnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //SqlCommand cmd = new SqlCommand();
        //SqlDataReader reader;

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //con.Open();
        //    //OleDbDataAdapter old = new OleDbDataAdapter("select * from BILLING_DETAILS", con);
        //    //DataTable dt = new DataTable();
        //    //old.Fill(dt);
        //    //DataGrid dg = new DataGrid();
        //    //dg.DataSource = dt;
        //    //con.Close();

        //    cmd.CommandText = "select * from Employee ";
        //    cmd.CommandType = CommandType.Text;
        //    cmd.Connection = sqlconnection1;

        //    sqlconnection1.Open();
        //    reader = cmd.ExecuteReader();
        //    sqlconnection1.Close();
        //}
    }
}
