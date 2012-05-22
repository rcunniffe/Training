<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewOrders.aspx.cs" Inherits="training_rc.viewOrders" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="orderTableTitle">List of the current orders</h1>
        <asp:SqlDataSource ID="OrdersList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:trainingConnectionString %>" 
        SelectCommand="
        Select person.personID AS Customer_ID, [order].orderID, person.firstname, person.surname, [address].address1, [address].address2, [address].address3, [postcode].postcode, city.city, country.country, [orderstate].name
        from [address]
        INNER JOIN [personaddress] ON [address].addressID = personaddress.addressID
        Join person ON personaddress.personaddressID = person.personID
        Join [order] ON [order].personID = person.personID
        Join addresstype ON addresstype.addresstypeID = personaddress.addresstypeID
        Join city ON city.cityID = [address].cityID
        Join country ON city.countryID = country.countryID
        Join [orderstate] ON [order].orderstateID = [orderstate].orderstateID
        Join [postcode] ON [postcode].postcodeID = [address].postcodeID">
    </asp:SqlDataSource>
    <asp:Label ID="OrderLineHeader" Class="orderLineHeader" Visible="false" runat="server" Text="Label"></asp:Label>
    <asp:ScriptManager ID="OrderScriptManager" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>    
    <asp:UpdatePanel ID="ViewOrdersUpdatePanel" runat="server">
    <ContentTemplate>   
    <asp:GridView ID="ViewOrders" runat="server" AutoGenerateColumns="False" 
            DataSourceID="OrdersList" CellPadding="4" ForeColor="#333333" GridLines="Vertical" 
            onrowcommand="PopulateOrderline_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="orderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="orderID" meta:resourcekey="BoundFieldOrderID" />
            <asp:BoundField DataField="firstname" SortExpression="firstname" meta:resourcekey="BoundFieldFirstName" />
            <asp:BoundField DataField="surname"  SortExpression="surname" meta:resourcekey="BoundFieldSurname" />
            <asp:BoundField DataField="address1"  SortExpression="address1" meta:resourcekey="BoundFieldAddress1" />  
            <asp:BoundField DataField="address2"  SortExpression="address2" meta:resourcekey="BoundFieldAddress2" />  
            <asp:BoundField DataField="address3"  SortExpression="address3" meta:resourcekey="BoundFieldAddress3" /> 
            <asp:BoundField DataField="postcode"  SortExpression="postcode" meta:resourcekey="BoundFieldPostCode" /> 
            <asp:BoundField DataField="city"  SortExpression="city" meta:resourcekey="BoundFieldCity" /> 
            <asp:BoundField DataField="country" SortExpression="country" meta:resourcekey="BoundFieldCountry" />   
            <asp:BoundField DataField="name" SortExpression="name" meta:resourcekey="BoundFieldOrderState" />            
            <asp:buttonfield buttontype="Link" commandname="getOrderID" text="View Order"/>       
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
     </asp:GridView>
        <asp:Label ID="OrderDetailsTitle" CssClass="OrderDetailsTitle" runat="server" Text="Label" Visible="false">Order Details</asp:Label>
            <asp:GridView ID="OrderLine" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" PagerSettings-Visible="true" 
            EnableViewState="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>            
                    <asp:BoundField DataField="orderID" SortExpression="orderID" meta:resourcekey="BoundFieldOrderID" />
                    <asp:BoundField DataField="name"  SortExpression="firstname" meta:resourcekey="BoundFieldName" />             
                    <asp:BoundField DataField="quantity"  SortExpression="quantity" meta:resourcekey="BoundFieldQuantity" />                                  
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView> 
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
