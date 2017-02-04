using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Data;
using System.Drawing;
using System.Text;
using System.Text.RegularExpressions;
namespace EPARKS
{
    public partial class Parkingspace : System.Web.UI.Page
    {
       private int parkid = 0;
       static List<string> parkstarttime = new List<string>();
       static SortedList<int,int> parkidlistwithkey = new SortedList<int,int>();
       static List<string> parkendtime = new List<string>();
       static List<int> parkidlist = new List<int>();
       static List<string> parklotnum = new List<string>();
       static DataTable Gdt = new DataTable();
       static DataTable dt = new DataTable();
       static DataTable dt_delete = new DataTable();
       static String labelvalue;
       static DataTable dt_admin = new DataTable();
       static List<String> vehiclenum = new List<string>();
       static int insertflag = 0;
       static int checkflag = 0;
       static List<string> stattimelist = new List<string>();
       static List<string> endtimelist = new List<string>();
       static List<string> vehicletyplist = new List<string>();
       static DataTable dt_ssnlist = new DataTable();
       static DataTable dt_zipcodelist = new DataTable();
   

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.access == 2)
            {
                IntialPanelforadmin.Visible = true;
                table1.Visible = false;
                pnlfordeleteadmin.Visible = false;
                
            }
            else
            {
                IntialPanelforadmin.Visible = false;
                Pnlforadmin.Visible = false;
                Pnlforadminupdate.Visible = false;
                pnlfordeleteadmin.Visible = false;
                GridView1.Visible = false;
                Label4.Visible = false;
                Pnladmintosearchuserdetails.Visible = false;
                pnlforusersearchdisplay.Visible = true;

                
                
            }

        }


        protected void SearchButton1_Click(object sender, EventArgs e)
        {
            try
            {
            //if(RegularExpressionValidatorzipcode.IsValid)
            //{
           
                   OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
                    Gdt.Clear();
                    // Label4.Visible = true;
                    List<string> drpstarttime = new List<string>();
                    List<string> drpendtime = new List<string>();
                    pnlforusersearchdisplay.Visible = true;
                    GridView1.Visible = true;
                    Button2.Visible = true;
                    Button3.Visible = true;
                    TableCell1.Visible = true;
                    tablecell2.Visible = false;
                    this.GridView1.Columns[1].Visible = false;
                    this.GridView1.Columns[2].Visible = false;
                    this.GridView1.Columns[3].Visible = false;
                    Meassagelabel.Visible = false;
                    String Parkarea = areatext.Text;
                    String Parkzipcode = zipcodetext.Text;
                    DataTable dt1 = new DataTable();
                    string date = System.DateTime.Now.Date.ToString();

                    if (String.IsNullOrEmpty(Parkarea) && String.IsNullOrEmpty(Parkzipcode))
                    {
                        Label4.Text = "Please enter Parkarea/Parkzipcode to search for parking space ";
                        Label4.Visible = true;
                        GridView1.Visible = false;
                    }
                    else
                    {
                        if (String.IsNullOrEmpty(Parkarea) || String.IsNullOrEmpty(Parkzipcode))
                        {
                            OracleDataAdapter Odataadapter = new OracleDataAdapter("SELECT * FROM PARKING_DETAILS WHERE (PARKAREA = " + "'" + Parkarea + "'" + " OR PARKZIPCODE = '" + Parkzipcode + "') AND PARKFLAG=0 ", conn);
                            Odataadapter.Fill(Gdt);
                            DataView view = new DataView(Gdt);
                            dt1 = view.ToTable("dt", false, "PARKAREA", "PARKZIPCODE", "PARKLOTNO");
                        }
                        else if (!String.IsNullOrEmpty(Parkarea) && !String.IsNullOrEmpty(Parkzipcode))
                        {
                            OracleDataAdapter Odataadapter = new OracleDataAdapter("SELECT * FROM PARKING_DETAILS WHERE (PARKAREA LIKE  '%" + Parkarea + "%'" + " AND PARKZIPCODE ='" + Parkzipcode + "') AND PARKFLAG=0", conn);
                            Odataadapter.Fill(Gdt);
                            DataView view = new DataView(Gdt);
                            dt1 = view.ToTable("dt", false, "PARKAREA", "PARKZIPCODE", "PARKLOTNO");
                        }
                    }

                    if (dt1.Rows.Count == 0)
                    {
                        Label4.Text = "No parking space avaliable.Please try Entering the zipcode of nearest area";
                        Label4.Visible = true;
                        GridView1.Visible = false;
                    }

                    else
                    {
                        GridView1.DataSource = dt1;
                        GridView1.DataBind();

                    }

                    conn.Close();

                }
            
            //}
               
            
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            
        }



        protected void RegisterButton2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                // Access the CheckBox
                CheckBox cb = (CheckBox)row.Cells[0].FindControl("CheckBox1");
                //TextBox tc = (TextBox)row.FindControl("parkstarttime");
                //TextBox tc2 = (TextBox)row.FindControl("parkendtime");
                DropDownList tc = (DropDownList)row.FindControl("parkstarttime");
               // DropDownList tc2 = (DropDownList)row.FindControl("parkendtime");
                TextBox tc3 = (TextBox)row.FindControl("vehicleid");
                TextBox tc4 = (TextBox)row.FindControl("vehicletyp");
                tc.Visible = true;
                tc.Enabled = false;
               // tc2.Enabled = false;
                tc3.Enabled = false;
                tc4.Enabled = false;
                if (cb != null && cb.Checked)
                {
                   
                    tc.Enabled = true;
                  //  tc2.Enabled = true;
                    tc3.Enabled = true;
                    tc4.Enabled = true;
                    this.GridView1.Columns[1].Visible = true;
                    this.GridView1.Columns[2].Visible = true;
                    this.GridView1.Columns[3].Visible = true;
                   // this.GridView1.Columns[4].Visible = true;
                   
                }

            }
           
            GridView1.Visible = true;
            
           
        }



        protected void BookButton3_Click(object sender, EventArgs e)
        {
            OracleConnection conn1 = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            OracleCommand cmd;

            String starttime;
            double enditme;
            int i = 0;

            int flag = 0;
            string check;

            conn1.Open();
            OracleDataAdapter Odataadapter = new OracleDataAdapter("SELECT * FROM PARKS WHERE PARKDATE>= trunc(current_date)", conn1);
            DataTable parksdt = new DataTable();
            Odataadapter.Fill(parksdt);

            Meassagelabel.Visible = false;
            string commandtext;


            //search for vehicle details in vehicle_details table for the value given by user
            OracleDataAdapter Odp = new OracleDataAdapter("SELECT VEHICLE_DETAILS.*,OWNS_VEHICLE.CSUTSSN FROM VEHICLE_DETAILS LEFT OUTER JOIN OWNS_VEHICLE ON OWNS_VEHICLE.VEHICLENUM=VEHICLE_DETAILS.VEHICLENUM WHERE OWNS_VEHICLE.CSUTSSN='" + Global.custssn + "'", conn1);
            DataTable vehiclenumcheck = new DataTable();
            Odp.Fill(vehiclenumcheck);



            foreach (GridViewRow row in GridView1.Rows)
            {
                // Access the CheckBox

                CheckBox cb = (CheckBox)row.Cells[0].FindControl("CheckBox1");
                //TextBox tc = (TextBox)row.FindControl("parkstarttime");
                //TextBox tc2 = (TextBox)row.FindControl("parkendtime");
                DropDownList tc = (DropDownList)row.FindControl("parkstarttime");
                //DropDownList tc2 = (DropDownList)row.FindControl("parkendtime");
                TextBox vehicleid = (TextBox)row.FindControl("vehicleid");
                TextBox vehicletype = (TextBox)row.FindControl("vehicletyp");
                int parkidcheck = Convert.ToInt32(Gdt.Rows[row.RowIndex]["PARKID"].ToString());

                if (cb != null && cb.Checked)
                {

                    parkstarttime.Add(tc.Text);

                    starttime = tc.SelectedValue;
                    enditme = (Convert.ToDouble(tc.SelectedValue) + 2.0);
                    parkendtime.Add(enditme.ToString());
                    if (string.IsNullOrEmpty(vehicleid.Text) || string.IsNullOrEmpty(vehicletype.Text))
                    {
                        lblmessgae123.Text = "Please enter vehicle number/vehicletype values";
                        lblmessgae123.Visible = true;
                        
                    }
                    else
                    {
                        if (parksdt.Rows.Count > 0)
                        {
                            for (int m = 0; m < parksdt.Rows.Count; m++)
                            {
                                if (parkidcheck == (Convert.ToInt32(parksdt.Rows[m]["PARKID"].ToString())) && (starttime == parksdt.Rows[m]["PARKSTARTIME"].ToString() || Convert.ToString(enditme) == parksdt.Rows[m]["PARKENDTIME"].ToString()))
                                {
                                    check = Gdt.Rows[row.RowIndex]["PARKLOTNO"].ToString();
                                    flag = 1;
                                    Meassagelabel.Text += string.Format("The time you have entered is already booked for " + check + " lot. Please enter a different time slot for :{0} <br/> ", check);
                                    Meassagelabel.Visible = true;
                                    GridView1.Visible = true;
                                    cb.Checked = false;
                                }

                            }

                        }


                        if (flag == 0)
                        {
                            for (int l = 0; l < vehiclenumcheck.Rows.Count; l++)
                            {

                                if (vehiclenumcheck.Rows[l]["VEHICLENUM"].ToString() == vehicleid.Text)
                                {
                                    checkflag = 1;
                                }

                            }


                            if (checkflag == 0)
                            {
                                commandtext = "INSERT INTO VEHICLE_DETAILS VALUES('" + vehicleid.Text + "','" + vehicletype.Text + "')";
                                cmd = new OracleCommand(commandtext, conn1);
                                cmd.ExecuteNonQuery();
                                cmd.Dispose();


                                //insert data into owns_vehicle table
                                commandtext = "INSERT INTO OWNS_VEHICLE VALUES ('" + Global.custssn + "','" + vehicleid.Text + "')";
                                cmd = new OracleCommand(commandtext, conn1);
                                cmd.ExecuteNonQuery();
                                cmd.Dispose();
                                insertflag = 1;
                            }
                            if (insertflag == 1 || checkflag == 1)
                            {

                                parkidlist.Add(Convert.ToInt32(Gdt.Rows[row.RowIndex]["PARKID"].ToString()));
                                parklotnum.Add(Gdt.Rows[row.RowIndex]["PARKLOTNO"].ToString());
                                stattimelist.Add(starttime);
                                endtimelist.Add(enditme.ToString());
                                vehiclenum.Add(vehicleid.Text);
                                vehicletyplist.Add(vehicletype.Text);
                                parkid = parkidlist[i];
                                i++;
                                TableCell1.Visible = false;
                                tablecell2.Visible = true;
                            }
                        }
                    }


                }


                
            }
            conn1.Close();
        }

        protected void PayButton4_Click(object sender, EventArgs e)
        {
            try
            {

               
                OracleConnection conn1 = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
                OracleCommand cmd;
                conn1.Open();
                string commandtext = null;
                string CommandText = null;
                if (insertflag == 1 || checkflag == 1)
                {
                    for (int p = 0; p < parkidlist.Count; p++)
                    {

                        CommandText = "INSERT INTO PARKS VALUES('" + Global.custssn + "','" + parkidlist[p] + "','" + stattimelist[p] + "','" + endtimelist[p] + "',sysdate,'" + vehiclenum[p] + "')";
                        cmd = new OracleCommand(CommandText, conn1);
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        
                    }

                }
                    

                    //insert into billing_details table for billing details
                    commandtext = "INSERT INTO BILLING_DETAILS VALUES('','1','" + TextBox3.Text + "',' " + TextBox4.Text + "','" + Global.custssn + "')";
                    cmd = new OracleCommand(commandtext, conn1);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    #region commentedcode
                    ////search for vehicle details in vehicle_details table for the value given by user
                    //OracleDataAdapter Odp = new OracleDataAdapter("SELECT VEHICLE_DETAILS.*,OWNS_VEHICLE.CSUTSSN FROM VEHICLE_DETAILS LEFT OUTER JOIN OWNS_VEHICLE ON OWNS_VEHICLE.VEHICLENUM=VEHICLE_DETAILS.VEHICLENUM WHERE OWNS_VEHICLE.CSUTSSN='" + Global.custssn + "'", conn1);
                    //DataTable vehiclenumcheck = new DataTable();
                    //Odp.Fill(vehiclenumcheck);

                    //for (int i = 0; i < vehiclenum.Count; i++)
                    //{
                    //    foreach(DataRow row in vehiclenumcheck.Rows)
                    //    {
                    //        if (vehiclenum[i] == vehiclenumcheck.Rows[i]["VEHICLENUM"].ToString())
                    //        {
                    //            checkvalue = 1;
                    //        }
                    //    }
                    //}



                    //insert into vehicle_details table only if the vehicle details doesnt not exist in DB 
                    //if (vehiclenumcheck.Rows.Count == 0 || checkvalue == 0)
                    //{
                    //    commandtext = "INSERT INTO VEHICLE_DETAILS VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "')";
                    //    cmd = new OracleCommand(commandtext, conn1);
                    //    cmd.ExecuteNonQuery();
                    //    cmd.Dispose();


                    //    //insert data into owns_vehicle table
                    //    commandtext = "INSERT INTO OWNS_VEHICLE VALUES ('" + Global.custssn + "','" + TextBox1.Text + "')";
                    //    cmd = new OracleCommand(commandtext, conn1);
                    //    cmd.ExecuteNonQuery();
                    //    cmd.Dispose();
                    //}
                    #endregion

                    //search for data in parks table for a particular parkid whose value has reached 12 
                    //upate PARKING_DETAILS table only for such parkid
                    OracleDataAdapter Odataadapter = new OracleDataAdapter("SELECT PARKS.PARKID ,COUNT(PARKS.PARKID) AS COUNT FROM ( PARKS INNER JOIN PARKING_DETAILS ON PARKS.PARKID = PARKING_DETAILS.PARKID) WHERE PARKS.PARKDATE>= TRUNC(CURRENT_DATE) GROUP BY PARKS.PARKID HAVING COUNT(PARKS.PARKID)=12", conn1);
                    DataTable parkflagdt = new DataTable();
                    Odataadapter.Fill(parkflagdt);

                    if (parkflagdt.Rows.Count > 0)
                    {
                        for (int m = 0; m < parkflagdt.Rows.Count; m++)
                        {

                            commandtext = "UPDATE PARKING_DETAILS SET PARKFLAG = '1' WHERE PARKID = '" + parkflagdt.Rows[m]["PARKID"] + "' AND PARKDAY>= TRUNC(CURRENT_DATE)";
                            cmd = new OracleCommand(commandtext, conn1);
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }

                    }



                    tablecell2.Visible = false;
                    table1.Visible = false;
                    Meassagelabel.Text = "You have succesfully registered for the parking space ";
                    Meassagelabel.Visible = true;
                    conn1.Close();



                }
            

            catch (Exception ex)
            {
                Response.Write("Errror in the paying.Please check with card details" + ex.Message);
            }

    }
        protected void btnbacktousersearchuser_click(object sender, EventArgs e)
        {
            SearchButton1_Click(sender, e);
        }

        protected void Addbutton_Click(object sender, EventArgs e)
        {
            try
            {
                
                OracleConnection conn1 = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
                    OracleCommand cmd;
                    string commandtext;
                DataTable admindt = new DataTable();
                    conn1.Open();
                int c1=0;
                int c2=0;
                foreach (char c in txtparkzipcode.Text)
                {
                    c1++;
                }
                foreach(char c in txtoarklotnum.Text)
                {
                    c2++;
                }
                    OracleDataAdapter Odataadapter = new OracleDataAdapter("SELECT COUNT(*) FROM PARKING_DETAILS WHERE PARKAREA = '" + txtparkarea.Text + "' AND PARKZIPCODE = '" + txtparkzipcode.Text + "' AND PARKLOTNO='" + txtoarklotnum.Text + "'" , conn1);
                    Odataadapter.Fill(admindt);

                    if (Convert.ToInt32(admindt.Rows[0]["COUNT(*)"].ToString() )> 0)
                    {
                        lblmessagepanel1admin.Text = "Parking space details already exists in the database";
                        lblmessagepanel1admin.Visible = true;
                        

                    }
                    else
                    {
                        if (string.IsNullOrEmpty(txtparkarea.Text) || string.IsNullOrEmpty(txtparkzipcode.Text) || string.IsNullOrEmpty(txtparkarea.Text))
                        {
                            lblmessagepanel1admin.Text="No values can be empty";
                        }
                        else   if (c1 > 5 || c1 < 5) 
                        {
                            lblmessagepanel1admin.Text="zipcode has to be 5 digits long";
                        }
                        else  if (c2 > 6 || c2 < 2)
                                {
                                    lblmessagepanel1admin.Text = "Please enter Parkinglot number of maximum six charcaters long and greter den 1 character long";
                                }
                            
                        else
                        {
                        commandtext = "INSERT INTO PARKING_DETAILS VALUES('','" + txtparkarea.Text + "','" + txtparkzipcode.Text + "','" + txtoarklotnum.Text + "','" + drpdownparkflag.SelectedValue + "','','',sysdate)";
                        cmd = new OracleCommand(commandtext, conn1);
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        lblmessagepanel1admin.Text = "One New Parking Space has been added";
                        lblmessagepanel1admin.Visible = true;
                        conn1.Close();
                        Pnlforadmin.Visible = false;
                        }
                    }
                }
            
            catch (Exception ex)
            {
                Response.Write("sqlexception please check with addbuttonclick property" + ex.Message);

            }

        }

        protected void btninsertadmin_Click(object sender, EventArgs e)
        {
            Pnlforadmin.Visible = true;
            Pnlforadminupdate.Visible = false;
            Pnladmintosearchuserdetails.Visible = false;
            pnlfordeleteadmin.Visible = false;
        }

        protected void btnupdateadmin_Click(object sender, EventArgs e)
        {
            try
            {
                Pnlforadminupdate.Visible = true;
                Pnlforadmin.Visible = false;
                Pnladmintosearchuserdetails.Visible = false;
                pnlfordeleteadmin.Visible = false;
                dt.Clear();
                OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
                conn.Open();
                OracleDataAdapter Odataadapter = new OracleDataAdapter("SELECT * FROM PARKING_DETAILS", conn);
                Pnlforadmin.Visible = false;
                Odataadapter.Fill(dt);
                Gridviewadminfroupdate.DataSource =dt;
                Gridviewadminfroupdate.DataBind();
                conn.Close();
               
            }
            catch (Exception ex)
            {
                Response.Write("Error in btnupdateadmin_click" + ex.Message);
            }

        }



        protected void UpdateClick(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
                OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
                OracleCommand cmd;
                lblmsgforupdateadmin.Visible = false;
               
                conn.Open();
                DataTable checkdt = new DataTable();
                TextBox tc = (TextBox)row.Cells[0].FindControl("TextBox1");
                TextBox tc1 = (TextBox)row.FindControl("TextBox2");
                TextBox tc2 = (TextBox)row.FindControl("TextBox3");
                
                Gridviewadminfroupdate.EditIndex = -1;
                OracleDataAdapter oadp = new OracleDataAdapter("SELECT count(*) FROM PARKING_DETAILS,PARKS  where PARKING_DETAILS.PARKID= '" + dt.Rows[row.RowIndex]["PARKID"].ToString() + "' AND PARKING_DETAILS.PARKID = PARKS.PARKID AND PARKS.PARKDATE>= TRUNC(CURRENT_DATE)", conn);
                oadp.Fill(checkdt);
                if (Convert.ToInt32(checkdt.Rows[0]["count(*)"].ToString()) > 0)
                {
                    lblmsgforupdateadmin.Text = " Details for this ParkID for current day cannot be upated as some user have registered for this Parking space ";
                    lblmsgforupdateadmin.Visible = true;
                    Gridviewadminfroupdate.DataSource=dt;
                    Gridviewadminfroupdate.DataBind();
                }
                else
                {
                    dt.Rows[row.RowIndex]["PArkarea"] = tc.Text;
                    dt.Rows[row.RowIndex]["PARKZIPCODE"] = tc1.Text;
                    dt.Rows[row.RowIndex]["PARKLOTNO"] = tc2.Text;

                    String commandtext = "UPDATE PARKING_DETAILS SET PARKAREA = '" + tc.Text + "',PARKZIPCODE='" + tc1.Text + "',PARKLOTNO='" + tc2.Text + "' WHERE PARKID = '" + dt.Rows[row.RowIndex]["PARKID"].ToString() + "'";
                    cmd = new OracleCommand(commandtext, conn);
                    cmd.ExecuteNonQuery();
                    Gridviewadminfroupdate.DataSource = dt;
                    Gridviewadminfroupdate.DataBind();
                    cmd.Dispose();
                    
                }
                conn.Close();
            }
            catch (Exception ex)
            {

            }

        }

        protected void CancelClick(object sender, EventArgs e)
        {
            Gridviewadminfroupdate.EditIndex = -1;
            Gridviewadminfroupdate.DataSource = dt;
            Gridviewadminfroupdate.DataBind();
        }

        protected void On_Rowediting(object sender, GridViewEditEventArgs e)
        {
            Gridviewadminfroupdate.EditIndex = e.NewEditIndex;
            Gridviewadminfroupdate.DataSource = dt;
            Gridviewadminfroupdate.DataBind(); 
        }

        protected void btndeleteadmin_Click(object sender, EventArgs e)
        {
            Pnlforadminupdate.Visible = false;
            Pnlforadmin.Visible = false;
            Pnladmintosearchuserdetails.Visible = false;
            pnlfordeleteadmin.Visible = true;
           // lbldeletadminfinal.Visible = false;
            lbldeleteadminmessage.Visible = false;
            dt_delete.Clear();
            OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            conn.Open();
            OracleDataAdapter oadp = new OracleDataAdapter("SELECT PARKING_DETAILS.PARKID,PARKING_DETAILS.PARKAREA,PARKING_DETAILS.PARKLOTNO FROM PARKING_DETAILS WHERE PARKING_DETAILS.PARKID NOT IN (SELECT PARKS.PARKID FROM PARKS WHERE PARKING_DETAILS.PARKID=PARKS.PARKID AND PARKS.PARKDATE >=TRUNC(CURRENT_DATE))", conn);
            oadp.Fill(dt_delete);
            if (dt_delete.Rows.Count == 0)
            {
                lbldeleteadminmessage.Text = "All the parking lots are used and cannot be deleted";
                lbldeleteadminmessage.Visible = true;
                lbldeletadminfinal.Visible = false;

            }
            else
            {
                Gridviewforadmindeletedisplay.DataSource = dt_delete;
                Gridviewforadmindeletedisplay.DataBind();
                lbldeletadminfinal.Visible = true;
            }
           
            conn.Close();



        }

        protected void lbldeletadminfinal_Click(object sender, EventArgs e)
        {
            OracleCommand command;
            string Commandtxt;
            OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            conn.Open();
            DataTable dtnewwww = new DataTable();
            foreach (GridViewRow row in Gridviewforadmindeletedisplay.Rows)
            {
                // Access the CheckBox

                CheckBox cb = (CheckBox)row.Cells[0].FindControl("CheckBoxfroadmindelete");
                if (cb != null && cb.Checked)
                {
                    OracleDataAdapter oadp = new OracleDataAdapter("SELECT * FROM PARKS WHERE PARKS.PARKID='"+dt_delete.Rows[row.RowIndex]["PARKID"].ToString()+ "'AND NOT PARKS.PARKDATE >=TRUNC(CURRENT_DATE)", conn);
                    oadp.Fill(dtnewwww);
                    if (dtnewwww.Rows.Count > 0)
                    {
                        Commandtxt = "DELETE FROM PARKS WHERE PARKID='" + dt_delete.Rows[row.RowIndex]["PARKID"].ToString() + "' AND NOT PARKS.PARKDATE >=TRUNC(CURRENT_DATE)";
                        command = new OracleCommand(Commandtxt, conn);
                        command.ExecuteNonQuery();
                        // dt_delete.Rows[row.RowIndex].Delete();
                        command.Dispose();
                    }
                    else
                    {
                        Commandtxt = "DELETE FROM PARKING_DETAILS WHERE PARKID='" + dt_delete.Rows[row.RowIndex]["PARKID"].ToString() + "'";
                        command = new OracleCommand(Commandtxt, conn);
                        command.ExecuteNonQuery();
                        dt_delete.Rows[row.RowIndex].Delete();
                    }
                    

                }
            }
            Gridviewforadmindeletedisplay.DataSource = dt_delete;
            Gridviewforadmindeletedisplay.DataBind();
            

        }

        protected void btnsearchdetailadmin_Click(object sender, EventArgs e)
        {
            Pnladmintosearchuserdetails.Visible = true;
            Pnlforadminupdate.Visible = false;
            pnlfordeleteadmin.Visible = false;
            Pnlforadmin.Visible = false;
            lblfroadminsearchusermessage.Visible = false;
            DataTable dt_ssnlist = new DataTable();
            DataTable dt_zipcodelist = new DataTable();
            OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            conn.Open();
            dt_admin.Clear();

            if (String.IsNullOrEmpty(txtboxssn.Text) && string.IsNullOrEmpty(txtboxvehiclenum.Text))
            {
                lblfroadminsearchusermessage.Text = "Please enter Customerssn/vehiclenum to search for details ";
                lblfroadminsearchusermessage.Visible = true;
            }
            else if (String.IsNullOrEmpty(txtboxssn.Text) || string.IsNullOrEmpty(txtboxvehiclenum.Text))
            {
                OracleDataAdapter oadp = new OracleDataAdapter("SELECT PARKING_DETAILS.PARKLOTNO,PARKS.PARKSTARTIME,PARKS.PARKENDTIME,PARKS.VEHICLENUM,PARKING_DETAILS.PARKAREA,PARKING_DETAILS.PARKZIPCODE FROM PARKS LEFT OUTER JOIN PARKING_DETAILS ON PARKS.PARKID=PARKING_DETAILS.PARKID WHERE PARKS.PARKDATE >=TRUNC(CURRENT_DATE) AND PARKS.CUSTSSN='" + txtboxssn.Text + "' OR PARKS.VEHICLENUM='" + txtboxvehiclenum.Text + "'", conn);
                oadp.Fill(dt_admin);
            }
            else if (!String.IsNullOrEmpty(txtboxssn.Text) && !string.IsNullOrEmpty(txtboxvehiclenum.Text))
            {
                OracleDataAdapter oadp = new OracleDataAdapter("SELECT PARKING_DETAILS.PARKLOTNO,PARKS.PARKSTARTIME,PARKS.PARKENDTIME,PARKS.VEHICLENUM,PARKING_DETAILS.PARKAREA,PARKING_DETAILS.PARKZIPCODE FROM PARKS LEFT OUTER JOIN PARKING_DETAILS ON PARKS.PARKID=PARKING_DETAILS.PARKID WHERE PARKS.PARKDATE >=TRUNC(CURRENT_DATE) AND PARKS.CUSTSSN='" + txtboxssn.Text + "' AND PARKS.VEHICLENUM='" + txtboxvehiclenum.Text + "'", conn);
                oadp.Fill(dt_admin);
                
            }

            if (dt_admin.Rows.Count == 0)
            {
                lblfroadminsearchusermessage.Text = "No parking space is regsitered by this user";
                lblfroadminsearchusermessage.Visible = true;
            }
            else
            {
                grdviewcustomerdetailsdisplay.DataSource = dt_admin;
                grdviewcustomerdetailsdisplay.DataBind();
                lbldeletadminfinal.Visible = true;
            }
            conn.Close();
        }

        protected void btnadminsearch_Click(object sender, EventArgs e)
        {
            Pnlforadmin.Visible=false;
            Pnladmintosearchuserdetails.Visible = true;
            lblmessagepanel1admin.Visible = false;
            //Drpdownssnadmin.Visible = true;
            //Drpdownvehicleidadmin.Visible = true;
            //dt_ssnlist.Clear();
            //dt_zipcodelist.Clear();
           

            //OracleConnection conn = new OracleConnection("Data Source =XE; User ID = system; Password= Wright2015");
            //conn.Open();
            //OracleDataAdapter odpcustssn = new OracleDataAdapter("SELECT UNIQUE CUSTSSNP FROM REGISTRATION_DETAILS", conn);
            //odpcustssn.Fill(dt_ssnlist);
            //Drpdownssnadmin.DataTextField = "CUSTSSNP";
            //Drpdownssnadmin.DataValueField = "CUSTSSNP";

            //Drpdownssnadmin.DataBind();

            //OracleDataAdapter odpzipcode = new OracleDataAdapter("SELECT UNIQUE VEHICLENUM FROM VEHICLE_DETAILS", conn);
            //odpzipcode.Fill(dt_zipcodelist);
            //Drpdownvehicleidadmin.DataSource = dt_zipcodelist;
           
            //Drpdownvehicleidadmin.DataTextField = "VEHICLENUM";
            //Drpdownvehicleidadmin.DataValueField = "VEHICLENUM";
            //Drpdownvehicleidadmin.DataBind();
           
        }

       

        protected void grdviewcustomerdetailsdisplay_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdviewcustomerdetailsdisplay.PageIndex = e.NewPageIndex;
            grdviewcustomerdetailsdisplay.DataSource = dt_admin;
            grdviewcustomerdetailsdisplay.DataBind();
        }

       
    
    }
}