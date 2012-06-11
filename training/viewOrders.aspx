<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewOrders.aspx.cs" Inherits="training_rc.viewOrders" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="orderTableTitle">List of the current orders</h1>       
    <asp:Label ID="OrderLineHeader" Class="orderLineHeader" Visible="false" runat="server" Text="Label"></asp:Label>
    <asp:ScriptManager ID="OrderScriptManager" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>    
    <asp:UpdatePanel ID="ViewOrdersUpdatePanel" runat="server">
    <ContentTemplate>   
    <asp:GridView ID="ViewOrders" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="Vertical" 
            onrowcommand="PopulateOrderline_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="orderID" meta:resourcekey="BoundFieldOrderID" />
            <asp:BoundField DataField="FirstName" SortExpression="FirstName" meta:resourcekey="BoundFieldFirstName" />
            <asp:BoundField DataField="Surname"  SortExpression="Surname" meta:resourcekey="BoundFieldSurname" />
            <asp:BoundField DataField="Address1"  SortExpression="Address1" meta:resourcekey="BoundFieldAddress1" />  
            <asp:BoundField DataField="Address2"  SortExpression="Address2" meta:resourcekey="BoundFieldAddress2" />  
            <asp:BoundField DataField="Address3"  SortExpression="Address3" meta:resourcekey="BoundFieldAddress3" /> 
            <asp:BoundField DataField="Postcode"  SortExpression="Postcode" meta:resourcekey="BoundFieldPostCode" /> 
            <asp:BoundField DataField="City"  SortExpression="City" meta:resourcekey="BoundFieldCity" /> 
            <asp:BoundField DataField="Country" SortExpression="Country" meta:resourcekey="BoundFieldCountry" />   
            <asp:BoundField DataField="OrderStateLabel" SortExpression="name" meta:resourcekey="BoundFieldOrderState" />            
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
            
        <asp:GridView ID="OrderLineGrid" runat="server" AllowPaging="True" 
        AllowSorting="True" PagerSettings-Visible="true" 
        EnableViewState="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" DataKeyNames="OrderLineID">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>                
                <asp:BoundField DataField="OrderID"  meta:resourcekey="BoundFieldName" />
                <asp:TemplateField HeaderText="ProductID">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"Product.Name")%>
                    </ItemTemplate>
                </asp:TemplateField>    
                <asp:BoundField DataField="Quantity"  meta:resourcekey="BoundFieldQuantity" />
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"Product.Price")%>
                    </ItemTemplate>
                </asp:TemplateField>                  
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
