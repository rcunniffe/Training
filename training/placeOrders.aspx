<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="placeOrders.aspx.cs" Inherits="training_rc.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>
        Please fill in Customer Details
    </h1>          
        <ul>
            <li>
                <asp:Label ID="LFirstName" runat="server" Text="First Name"></asp:Label>
                <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="LSurname" runat="server" Text="Surname"></asp:Label>
                <asp:TextBox ID="Surname" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="LAddress1" runat="server" Text="Address 1"></asp:Label>
                <asp:TextBox ID="Address1" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="LAddress2" runat="server" Text="Address 2"></asp:Label>
                <asp:TextBox ID="Address2" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="LAddress3" runat="server" Text="Address 3"></asp:Label>
                <asp:TextBox ID="Address3" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="LPostCode" runat="server" Text="PostCode"></asp:Label>               
                <asp:TextBox ID="PostCode" runat="server"></asp:TextBox>

            </li>
            <li>
                <asp:Label ID="LCity" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="City" runat="server"></asp:TextBox>
            </li>
            <li>
                <asp:Label ID="LCountry" runat="server" Text="Country"></asp:Label>
                <asp:TextBox ID="Country" runat="server"></asp:TextBox>
            </li>
            <asp:Button ID="Submit" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="sunmitbtn_Click" />
            <asp:Button ID="Reset" runat="server" Text="Reset" />
        </ul>          
</asp:Content>
