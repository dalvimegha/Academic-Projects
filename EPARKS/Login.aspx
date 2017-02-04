<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEparks.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EPARKS.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:Panel ID="loginpanel" runat="server">
    
    <asp:UpdatePanel ID="updatepanelforlogin" runat="server">
    <ContentTemplate>
    <asp:Login ID="Login2" runat="server" 
    FailureText="" Height="160px" onauthenticate="Login1_Authenticate" 
    Width="475px" FailureAction="Refresh"  
       >

</asp:Login>
<asp:Button ID="btnresetpwd" runat="server" Text="Reset Password" 
            onclick="btnresetpwd_Click" />
<asp:Panel ID="Panelresetpwd" runat="server" Visible="False">
    <br />
    <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="lblcstssn" runat="server" Text="SSN"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtboxcustssn" runat="server" Height="16px" Width="169px"></asp:TextBox>
    <br />
    <br />
   <asp:Label ID="lbloldpwd" runat="server" Text="New Password"></asp:Label>
     
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtboxoldpwd" runat="server" Width="165px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblnewpwd" runat="server" Text="Confirm Password"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtboxnewpwd" runat="server" Height="20px" Width="165px"></asp:TextBox>
    <br />
    <asp:Button ID="Btnreset" runat="server" onclick="Btnreset_Click" 
        Text="RESET" />
    <br />
     
</asp:Panel>
       
</ContentTemplate>

</asp:UpdatePanel>

</asp:Panel>

</asp:Content>

