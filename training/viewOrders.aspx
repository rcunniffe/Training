<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewOrders.aspx.cs" Inherits="training_rc.viewOrders" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script runat="server">
  </script>
    <asp:GridView ID="ViewOrders" runat="server" AutoGenerateColumns="False" DataSourceID="OrdersList" CellPadding="4" ForeColor="#333333" GridLines="None" onrowcommand="PopulateOrderline_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="orderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="orderID" meta:resourcekey="BoundFieldOrderID" />
            <asp:BoundField DataField="firstname" SortExpression="firstname" meta:resourcekey="BoundFieldFirstName" />
            <asp:BoundField DataField="surname"  SortExpression="surname" meta:resourcekey="BoundFieldSurname" />
            <asp:BoundField DataField="address1"  SortExpression="address1" meta:resourcekey="BoundFieldAddress1" />  
            <asp:BoundField DataField="address2"  SortExpression="address2" meta:resourcekey="BoundFieldAddress2" />  
            <asp:BoundField DataField="address3"  SortExpression="address3" meta:resourcekey="BoundFieldAddress3" /> 
            <asp:BoundField DataField="code"  SortExpression="code" meta:resourcekey="BoundFieldAddressType" /> 
            <asp:BoundField DataField="city"  SortExpression="city" meta:resourcekey="BoundFieldCity" /> 
            <asp:BoundField DataField="country" SortExpression="country" meta:resourcekey="BoundFieldCountry" />   
            <asp:BoundField DataField="name" SortExpression="name" meta:resourcekey="BoundFieldOrderState" />            
            <asp:buttonfield buttontype="Link" commandname="getOrderID" text="View Order"/>       
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
    SelectCommand="
    Select person.personID, [order].orderID, person.firstname, person.surname, [address].address1, [address].address2, [address].address3, addresstype.code, city.city, country.country, [orderstate].name
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
    ON [order].orderstateID = [orderstate].orderstateID">
</asp:SqlDataSource>

<asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>       
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:GridView ID="GridView3"
        runat="server"
        AllowPaging="True"
            AllowSorting="True"
            AutoGenerateColumns="False"
            PagerSettings-Visible="true" 
            EnableViewState="False" 
            CellPadding="4" 
            ForeColor="#333333" 
            GridLines="None" >            
            <Columns>
                <asp:BoundField DataField="orderlineID" InsertVisible="False" ReadOnly="True" SortExpression="orderlineID" meta:resourcekey="BoundFieldOrderLineID" />
                <asp:BoundField DataField="orderID" SortExpression="Order ID" meta:resourcekey="BoundFieldOrderID" />
                <asp:BoundField DataField="name"  SortExpression="firstname" meta:resourcekey="BoundFieldFirstName" />
                <asp:BoundField DataField="description"  SortExpression="description" meta:resourcekey="BoundFieldDescription" />  
                <asp:BoundField DataField="quantity"  SortExpression="quantity" meta:resourcekey="BoundFieldQuantity" />                         
            </Columns>
        </asp:GridView>   
            <asp:Button ID="Button2" OnClick="Button2_Click" runat="server" Text="Button" />       
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
    </div>
<asp:GridView ID="OrderLine"
                 runat="server"
                 AllowPaging="True" 
                 AllowSorting="True"
                 AutoGenerateColumns="False"                 
                 PagerSettings-Visible="true" EnableViewState="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            <asp:BoundField DataField="orderlineID" InsertVisible="False" ReadOnly="True" SortExpression="orderlineID" meta:resourcekey="BoundFieldOrderLineID" />
            <asp:BoundField DataField="orderID" SortExpression="Order ID" meta:resourcekey="BoundFieldOrderID" />
            <asp:BoundField DataField="name"  SortExpression="firstname" meta:resourcekey="BoundFieldFirstName" />
            <asp:BoundField DataField="description"  SortExpression="description" meta:resourcekey="BoundFieldDescription" />  
            <asp:BoundField DataField="quantity"  SortExpression="quantity" meta:resourcekey="BoundFieldQuantity" />                         
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
</asp:Content>
