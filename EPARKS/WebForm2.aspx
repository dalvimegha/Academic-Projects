<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="EPARKS.WebForm2" MasterPageFile ="~/MasterEparks.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server" >
    <div >
        <asp:Menu ID="Menu1" runat="server" 
            Orientation="Horizontal">
            <Items>
                <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/About.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Registration" Value="Registration" NavigateUrl="~/Registration.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Profile" Value="Parking" NavigateUrl="~/Parkingspace.aspx"></asp:MenuItem>
                <asp:MenuItem Text="About us" Value="About us"></asp:MenuItem>
                <asp:MenuItem Text="Contact us" Value="Contact us"></asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>
    </asp:Content>

<asp:Content ID ="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="SSN" DataSourceID="Eparksdb" Visible="False">
        <Columns>
            <asp:BoundField DataField="FIRSTNAME" HeaderText="FIRSTNAME" 
                SortExpression="FIRSTNAME" />
            <asp:BoundField DataField="LASTNAME" HeaderText="LASTNAME" 
                SortExpression="LASTNAME" />
            <asp:BoundField DataField="SSN" HeaderText="SSN" ReadOnly="True" 
                SortExpression="SSN" />
            <asp:BoundField DataField="PH" HeaderText="PH" SortExpression="PH" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" 
                SortExpression="ADDRESS" />
            <asp:BoundField DataField="STATE" HeaderText="STATE" SortExpression="STATE" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Eparksdb" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT * FROM &quot;CUSTOMER_INFO&quot;"></asp:SqlDataSource>
    </asp:Content>

