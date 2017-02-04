<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEparks.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EPARKS.Registration" %>

                
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:UpdatePanel ID="PanelRegistration" runat="server">
 <ContentTemplate>
 <asp:Panel ID="Registrationpanel" runat="server">
<div>
<asp:Label ID="Label8" runat="server" BackColor="#CCCCCC" BorderStyle="None" 
    Text="You have been successfuly registered .Please login to search for parking space." 
    Visible="False" ForeColor="#0066FF"></asp:Label>
     <br />
<br />
</div>
</asp:Panel>
 <asp:Panel ID="Registrationpanel2" runat="server">
    <asp:Label ID="lblmessagereg" runat="server" 
        Text="Enter the details to Register for parking services" 
         BackColor="#CCCCCC" ForeColor="Blue"></asp:Label>
     <br />
    <br />

<asp:Label ID="Label1" runat="server" Text="FIRST NAME"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
         ControlToValidate="TextBox1" ErrorMessage="first name cannot be empty" 
         ForeColor="Red" ValidationGroup="vgregister"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="LAST NAME"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
         ControlToValidate="TextBox2" ErrorMessage="last name cannot be empty" 
         ForeColor="Red" ValidationGroup="vgregister"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="PHONE NUMBER"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox3" runat="server" ontextchanged="TextBox3_TextChanged"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
         ControlToValidate="TextBox3" ErrorMessage="phone number cannot be empty" 
         ForeColor="Red" ValidationGroup="vgregister"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
         ControlToValidate="TextBox3" ErrorMessage="10 digit value " ForeColor="Red" 
         ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
         ValidationGroup="vgregister"></asp:RegularExpressionValidator>
<br />
<br />
<asp:Label ID="Label7" runat="server" Text="SSN"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
         ControlToValidate="TextBox6" ErrorMessage="SSN cannot be empty" ForeColor="Red" 
         ValidationGroup="vgregister"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
         runat="server" ControlToValidate="TextBox6" ErrorMessage="ssn format" 
         ForeColor="Red" ValidationExpression="\d{3}-\d{2}-\d{4}" 
         ValidationGroup="vgregister"></asp:RegularExpressionValidator>
<br />
<br />
<asp:Label ID="Label4" runat="server" Text="EMAIL ADDRESS"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
         ControlToValidate="TextBox4" ErrorMessage="emailaddress cannot be empty" 
         ForeColor="Red" ValidationGroup="vgregister"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
         ControlToValidate="TextBox4" ErrorMessage="ssn format" ForeColor="Red" 
         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
         ValidationGroup="vgregister"></asp:RegularExpressionValidator>
<br />
<br />
<br />
<asp:Label ID="Label5" runat="server" Text="ADDRESS"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
         ControlToValidate="TextBox5" ErrorMessage="Address field cannot be empty" 
         ForeColor="Red" ValidationGroup="vgregister"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label ID="Label6" runat="server" Text="STATE"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" 
    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    <asp:ListItem>Ohio</asp:ListItem>
    <asp:ListItem>Chicago</asp:ListItem>
</asp:DropDownList>
<br />
<br />
<asp:Label ID="Label9" runat="server" Text="USERNAME"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
         ControlToValidate="TextBox7" ErrorMessage="Please enter a value" 
         ForeColor="Red" ValidationGroup="vgregister"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Label ID="Label10" runat="server" Text="PASSWORD"></asp:Label>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox8" runat="server" ontextchanged="TextBox8_TextChanged"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
         ControlToValidate="TextBox8" ErrorMessage="pasowrd field cannot be empty" 
         ForeColor="Red" ValidationGroup="vgregister"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
    Text="Register" ValidationGroup="vgregister" />
&nbsp;&nbsp;
<br />
</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>

</asp:Content>
