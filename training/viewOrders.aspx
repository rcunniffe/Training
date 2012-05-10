<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewOrders.aspx.cs" Inherits="training_rc.viewOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="OrdersList" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="orderID" HeaderText="Order ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="orderID" />
            <asp:BoundField DataField="firstname" HeaderText="First Name" 
                SortExpression="firstname" />
            <asp:BoundField DataField="surname" HeaderText="Surname" 
                SortExpression="surname" />
             <asp:BoundField DataField="address1" HeaderText="Address Line 1" 
                SortExpression="address1" />  
             <asp:BoundField DataField="address2" HeaderText="Address Line 2" 
                SortExpression="address2" />  
             <asp:BoundField DataField="address3" HeaderText="Address Line 3" 
                SortExpression="address3" /> 
                <asp:BoundField DataField="code" HeaderText="Address Type" 
                SortExpression="code" /> 
                <asp:BoundField DataField="city" HeaderText="City" 
                SortExpression="city" /> 
                <asp:BoundField DataField="country" HeaderText="Country" 
                SortExpression="country" />   
                 <asp:BoundField DataField="orderstate" HeaderText="Order State" 
                SortExpression="orderstate" />           
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
<asp:SqlDataSource ID="OrdersList" runat="server" 
    ConnectionString="<%$ ConnectionStrings:trainingConnectionString %>" 
    SelectCommand="use training
Select person.personID, [order].orderID, person.firstname, person.surname, [address].address1, [address].address2, [address].address3, addresstype.code, city.city, country.country, [orderstate].orderstate
from [address]
INNER JOIN [personaddress]
ON [address].addressID = personaddress.addressID
Join person
ON personaddress.personaddressID = person.personID
Join [order]
ON [order].personID = person.personID
Join addresstype
ON addresstype.addresstypeID = personaddress.addresstypeID
Join city
ON city.cityID = [address].cityID
Join country
ON city.countryID = country.countryID
Join [orderstate]
ON [order].statecode = [orderstate].statecode"></asp:SqlDataSource>
</asp:Content>
