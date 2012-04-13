<%@ Page Title="Place Order" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="placeOrders.aspx.cs" Inherits="training_rc.placeOrders" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">    
    <div style=" width: 900px; padding-left:350px">
        <h1>
            Please fill in Customer Details
        </h1>          
                       
                    <p><asp:Label ID="LFirstName" runat="server" Text="First Name" class="orange"></asp:Label></p>
                    <asp:TextBox ID="FirstName" runat="server" size="30" class="inputBoxStyle"></asp:TextBox>
                
                   <p><asp:Label ID="LSurname" runat="server" Text="Surname" class="orange"></asp:Label></p>
                    <asp:TextBox ID="Surname" runat="server" size="30" class="inputBoxStyle"></asp:TextBox>
                
                    <p><asp:Label ID="LAddress1" runat="server" Text="Address 1" class="orange"></asp:Label></p>
                    <asp:TextBox ID="Address1" runat="server"  size="30" class="inputBoxStyle"></asp:TextBox>
                
                    <p><asp:Label ID="LAddress2" runat="server" Text="Address 2" class="orange"></asp:Label></p>
                    <asp:TextBox ID="Address2" runat="server"  size="30" class="inputBoxStyle"></asp:TextBox>
                
                    <p><asp:Label ID="LAddress3" runat="server" Text="Address 3" class="orange"></asp:Label></p>
                    <asp:TextBox ID="Address3" runat="server" class="inputBoxStyle"></asp:TextBox>
                
                    <p><asp:Label ID="LPostCode" runat="server" Text="PostCode" class="orange"></asp:Label></p>               
                    <asp:TextBox ID="PostCode" runat="server" size="30" class="inputBoxStyle"></asp:TextBox>

                    <p><asp:Label ID="LCity" runat="server" Text="City" class="orange"></asp:Label></p>
                    <asp:TextBox ID="City" runat="server" size="30" class="inputBoxStyle"></asp:TextBox>
                
                    <p><asp:Label ID="LCountry" runat="server" Text="Country" class="orange"></asp:Label></p>
                    <asp:TextBox ID="Country" runat="server" size="30" class="inputBoxStyle"></asp:TextBox>
                
                <p>
                    <asp:Button ID="Submit" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="submitTest" class="button"/>
                    <asp:Button ID="Reset" runat="server" Text="Reset" UseSubmitBehavior="true" OnClick="resetbtn_Click" class="button" />
                </p>            
    </div>          
</asp:Content>