<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="EPARKS.HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .image
        {
            position:relative;
            width:100%;
            background-repeat:repeat-x;
            
          
        }
        h2
        {
            position:absolute;
            top: 200px;
            left:50px;
            width:100%;
            
           
        }
        h2 span
        {
            color: white; 
            font   : bold 24px/45px Helvetica, Sans-Serif; 
            letter-spacing: -1px;  
            background: rgb(0, 0, 0); /* fallback color */
            background: rgba(0, 0, 0, 0.7);
            padding: 10px;
        }
        .class4
        {
         
          padding-left: 60%;
         
          list-style-type:upper-roman;
        }
        .class5
        {
            background-repeat:repeat;
        }
    </style>
</head>
<body  background="Images/ryan_parkingsavers1_met.jpg" class="class5">
    <form id="form1" runat="server">
    <div id="div1" runat="server">
      <h2><span>WELCOME TO EPARKS 
      <br />    WRIGHT SPACE TO FIND THE PARKING SPACE IN EASY GO</span></h2>
      
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        
    </div>
    <asp:Panel ID="Panel2" runat="server" CssClass="class4">
    <asp:Button ID="btnLogiohome" runat="server" OnClick="btnLogiohome_CLick" 
            Text="LOGIN" BorderColor="White" ForeColor="#0066FF" Font-Bold="True" Font-Size="Larger" />
        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" 
            Text="REGISTER" ForeColor="Blue"  Font-Bold="True" Font-Size="Larger" />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
    </asp:Panel>
     <p>
          &nbsp;</p>
     </form>
</body>
</html>
