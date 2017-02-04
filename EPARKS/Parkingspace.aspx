<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEparks.Master" AutoEventWireup="true" CodeBehind="Parkingspace.aspx.cs" Inherits="EPARKS.Parkingspace" %>
<asp:Content ID="content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
               
              
              
               <div>
               <asp:Table runat="server" Width="1301px" >
               <asp:TableRow>
               <asp:TableCell>
                     <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" 
                         >
                         <Items>
                             
<%--<asp:MenuItem NavigateUrl="~/Login.aspx" Text="Home" Value="Home">
                             </asp:MenuItem>--%>
                             
<%--<asp:MenuItem NavigateUrl="~/Registration.aspx" Text="Registration" 
                                 Value="Registratio"></asp:MenuItem>--%>
                             
<asp:MenuItem NavigateUrl="~/Parkingspace.aspx" Text="ParkingSearch" Value="Parking">
                             </asp:MenuItem>
                             
<asp:MenuItem Text="About us" Value="About us" NavigateUrl="~/About.aspx"></asp:MenuItem>
                             
<asp:MenuItem Text="Contact us" Value="Contact us" NavigateUrl="~/ContactUs.aspx"></asp:MenuItem>
                         
</Items>
  <StaticMenuItemStyle HorizontalPadding="30px" />                   
</asp:Menu>
                     
</asp:TableCell>
                     <asp:TableCell HorizontalAlign="Right">
                    
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:LinkButton runat="server" Text="Logout" ID="LinkButton1" 
         PostBackUrl="~/HomePage.aspx"  OnClientClick ="~/HomePage.aspx"></asp:LinkButton>
</asp:TableCell> </asp:TableRow>
        </asp:Table></div>
       
                </asp:Content>
               
              
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    
    <asp:UpdatePanel ID="updatepanelforparkingcontent2" runat="server">
    <ContentTemplate>
    <br />
    <br />
    <asp:Panel ID="IntialPanelforadmin" runat="server" Visible="true">

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btninsertadmin" runat="server" CssClass="dynamic" 
            onclick="btninsertadmin_Click" Text=" INSERT PARKING DETAILS" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnupdateadmin" runat="server" onclick="btnupdateadmin_Click" 
            Text="UPDATE PARKING DETAILS" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btndeleteadmin" runat="server" Text="DELETE PARKING DETAILS" 
            onclick="btndeleteadmin_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnadminsearch" runat="server" onclick="btnadminsearch_Click" 
            Text="SEARCH CUSTOMER DETAILS" />
        <br />
        <br />
        <asp:Label ID="lblmessagepanel1admin" runat="server" Text="messagebutton" 
            Visible="False"></asp:Label>
        <br />

    </asp:Panel>
    <asp:Panel ID="Pnlforadminupdate" runat="server" Visible="true">

        <asp:GridView ID="Gridviewadminfroupdate" runat="server" CellPadding="4" AutoGenerateColumns="False"
             ForeColor="#333333" GridLines="None" OnRowEditing="On_Rowediting"
            >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                            CommandName="Update" Text="Update" CausesValidation="True" OnClick="UpdateClick"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" OnClick="CancelClick"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PArkarea" SortExpression="PARKAREA">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"  
                            Text='<%# Bind("PARKAREA") %>' ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PARKAREA") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PARKZIPCODE" SortExpression="PARKZIPCODE">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PARKZIPCODE") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("PARKZIPCODE") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PARKLOTNO" SortExpression="PARKLOTNO">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PARKLOTNO") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PARKLOTNO") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblmsgforupdateadmin" runat="server" ForeColor="#FF3300" 
            Text="label" Visible="False"></asp:Label>
        <br />
        &nbsp;

    </asp:Panel>
        <asp:Panel ID="Pnlforadmin" runat="server" Visible="False">

            <table class="style1">
                <tr>
                    <td>
                        <br />
                        <br />
                        <asp:Label ID="lblmeassageadmin" runat="server" 
                            Text="Please Enter the details to make new Entry into Parking Table"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="LABEL_PARKAREA" runat="server" Text="PARK AREA"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtparkarea" runat="server" 
                           ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqdieldvalidadminarea" runat="server" 
                            ControlToValidate="txtparkarea" ErrorMessage="Cannot be empty" ForeColor="Red" 
                            ValidationGroup="vg" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Label ID="lblparkzipcode" runat="server" Text="PARKZIPCODE"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtparkzipcode" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqdieldvalidadmin" runat="server" 
                            ControlToValidate="txtparkzipcode" ErrorMessage="Cannot be empty" 
                            ForeColor="Red" ValidationGroup="vg" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="txtparkzipcode" 
                            ErrorMessage="Please Enter in 5 digit format" ForeColor="Red" 
                            ValidationExpression="\d{5}(-\d{4})?" ValidationGroup="vg"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                        <asp:Label ID="lblparklotnum" runat="server" Text="PARK LOT NUMBER"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtoarklotnum" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqfieldvaladminlotno" runat="server" 
                            ControlToValidate="txtoarklotnum" ErrorMessage="Cannot be empty" 
                            ForeColor="Red" ValidationGroup="vg" Display="Dynamic"></asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="txtparkzipcode" 
                            ErrorMessage="Please enter in a alphabet followed by digits" ForeColor="Red" 
                            ValidationExpression="\[a-z]{0,2}(-\d{0,4})?" ValidationGroup="vg"></asp:RegularExpressionValidator>--%>
                        <br />
                        <br />
                        <asp:Label ID="lblparkflag" runat="server" Text="PARK FLAG VALUE"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="drpdownparkflag" runat="server">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        j&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="buttonadd" runat="server" Text="Add" Width="63px" 
                            onclick="Addbutton_Click" ValidationGroup="vg"  />
                        <br />
                        <br />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

        </asp:Panel>
    
    <asp:Panel ID="pnlfordeleteadmin" runat="server">
        <asp:Label ID="lbldeleteadminmessage" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:GridView ID="Gridviewforadmindeletedisplay" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBoxfroadmindelete" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxfroadmindelete" runat="server"  
                             />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="lbldeletadminfinal" runat="server"
            onclick="lbldeletadminfinal_Click" Text="DELETE" Visible="False" />
        <br />

    </asp:Panel>
    
       <asp:Panel ID="Pnladmintosearchuserdetails" runat="server" Visible="False">
       
           <asp:Label ID="lbluserssnadmin" runat="server" Text="Enter User SSN"></asp:Label>
           &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtboxssn" runat="server"></asp:TextBox><%--<asp:DropDownList 
               ID="Drpdownssnadmin" runat="server" 
               AppendDataBoundItems="True">
           </asp:DropDownList>--%>
           &nbsp;&nbsp;
           <asp:Label ID="lbluservehicladmin" runat="server" Text="Enter User VEHICLE NUM"></asp:Label>
           &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtboxvehiclenum" runat="server"></asp:TextBox><%--<asp:DropDownList ID="Drpdownvehicleidadmin" runat="server" AppendDataBoundItems="True">
           </asp:DropDownList>--%>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Button ID="btnsearchdetailadmin" runat="server" 
               onclick="btnsearchdetailadmin_Click" Text="Search" />
           <br />
           <br />
           <asp:GridView ID="grdviewcustomerdetailsdisplay" runat="server" 
               AllowPaging="True" CellPadding="4" 
               ForeColor="#333333" GridLines="None" 
               onpageindexchanging="grdviewcustomerdetailsdisplay_PageIndexChanging" 
               >
               <AlternatingRowStyle BackColor="White" />
               <EditRowStyle BackColor="#2461BF" />
               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#EFF3FB" />
               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#F5F7FB" />
               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
               <SortedDescendingCellStyle BackColor="#E9EBEF" />
               <SortedDescendingHeaderStyle BackColor="#4870BE" />
           </asp:GridView>
           <br />
           <asp:Label ID="lblfroadminsearchusermessage" runat="server" Text="Label" Visible="false"></asp:Label>
       </asp:Panel> 
    
   <asp:Panel ID="pnlforusersearchdisplay" runat="server">
   
    
    <asp:Label ID="Meassagelabel" runat="server" Visible="False" ForeColor="Red"></asp:Label>
        <br />
    
    <asp:Label ID="lblmessgae123" runat="server" Visible="False" ForeColor="Red"></asp:Label>
        <br />
    
    
        
    
    
    
    <asp:Table runat ="server" ID="table1"><asp:TableRow><asp:TableCell ID="TableCell1"><asp:Label ID="Label1" runat="server" 
    Text="Please enter the details below to search for parking space" 
        ForeColor="#3333FF"></asp:Label>
   
                    
    <br />
<br />
<asp:Label ID="Label2" runat="server" Text="Zipcode"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="zipcodetext" runat="server"
    ></asp:TextBox>
       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>--%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label3" runat="server" Text="Area"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="areatext" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button1" runat="server" onclick="SearchButton1_Click" Text="Search" 
        ForeColor="Black" ValidationGroup="validationgrp" CausesValidation="True" />
<br />
<br />
<br />
<asp:Label ID="Label4" runat="server" Text="Available Parking Space" 
        ForeColor="Blue"></asp:Label>
<br />
<br />
<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Visible="false" >
    <AlternatingRowStyle BackColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" 
                    />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField Visible="False" HeaderText="PARKSTARTTIME">
            <ItemTemplate>
                <asp:DropDownList ID="parkstarttime" runat="server">
                <asp:ListItem Selected="True">00.00</asp:ListItem>
                <asp:ListItem>02.00</asp:ListItem>
                <asp:ListItem>04.00</asp:ListItem>
                <asp:ListItem>06.00</asp:ListItem>
                <asp:ListItem>08.00</asp:ListItem>
                <asp:ListItem>10.00</asp:ListItem>
                <asp:ListItem>12.00</asp:ListItem>
                <asp:ListItem>14.00</asp:ListItem>
                <asp:ListItem>16.00</asp:ListItem>
                <asp:ListItem>18.00</asp:ListItem>
                <asp:ListItem>20.00</asp:ListItem>
                <asp:ListItem>22.00</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField Visible="False" HeaderText="VEHICLENUM">
            <ItemTemplate>
                <asp:TextBox ID="vehicleid" runat="server">
                </asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField Visible="False" HeaderText="VEHICLETYPE">
            <ItemTemplate>
                <asp:TextBox ID="vehicletyp" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    <br />
    <asp:Button ID="Button2" runat="server" onclick="RegisterButton2_Click" 
        Text="Register" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" onclick="BookButton3_Click" Text="Book" Visible="False" />
<br />
&nbsp;
</asp:TableCell>
<asp:TableCell ID="tablecell2"  Visible="false"  HorizontalAlign ="Center">

   <%-- <asp:Label ID="Label5" runat="server" Text="VehicleNum"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />--%>
   <%-- <asp:Label ID="Label6" runat="server" Text="Vehicletype"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <br />--%>
    <asp:Label ID="Label7" runat="server" Text="CardNum"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
     ErrorMessage="Card No cannot be empty" ControlToValidate="TextBox3" ValidationGroup="vg1" ></asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
    ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox3" ValidationExpression="^[0-9]/d{16}$" ValidationGroup="vg1"></asp:RegularExpressionValidator>
    --%>
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Text="CVV"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorcvvno" runat="server"
     ErrorMessage="CVV No cannot be empty" ControlToValidate="TextBox4" ValidationGroup="vg1" ></asp:RequiredFieldValidator>
   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidatorcvvno" runat="server" 
    ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox4" ValidationExpression="^[0-9]/d{3}$" ValidationGroup="vg1"></asp:RegularExpressionValidator>
   --%> <br />
    <br />
    <asp:Button ID="Button4" runat="server" onclick="PayButton4_Click" Text="Pay" ValidationGroup="vg1" />
    <asp:Button ID="btnbacktousersearchuser" runat="server" Text="Back" OnClick="btnbacktousersearchuser_click" />
    </asp:TableCell></asp:TableRow></asp:Table>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
         #Menu1 ul li ul
        {
            display :none;
        }
        #Menu1 ul li
        {
            position: relative;
            float:left;
            list-style:none;
        }
    </style>
</asp:Content>

