<%@ Page Title="Place Order" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="PlaceOrders.aspx.cs" Inherits="training_rc.PlaceOrders" culture="auto" meta:resourcekey="PlaceOrdersRessource" uiculture="auto" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent"> 
 <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script language="javascript" type='text/javascript'>


    function ClearAllControls(form) {      
        form.reset(); return false;
    }

    function CheckQuantity(sender, args) {
        args.IsValid = false;

        for (var i = 0; i < $('.qty').length; i++) {                      
            if ($('.qty')[i].value != '') {                
                args.IsValid = true;
            }
            else if (($('.qty')[i].value == null) && ($('.qty')[i].value == ''))
            {
                               
            }
        }        
    }
</script>   
    <div style=" width: 500px; padding-left:350px; height:100%; ">
        <form action="" id="customerForm">        
            <h1>
                Please Enter Your Details
            </h1>
            <div style="padding-bottom:50px;">   
                    <div>                                
                        <p>
                        <asp:Label ID="LFirstName" runat="server" meta:resourcekey="FirstName" class="orange"></asp:Label><span class="red">*</span>
                        </p>
                        <asp:TextBox  ID="FirstName" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="FirstNameResource1"></asp:TextBox>                        
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorFname" runat="server" ErrorMessage="RequiredFieldValidatorFnameResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="FirstName" meta:resourcekey="RequiredFieldValidatorFnameResource1"></asp:RequiredFieldValidator>
                     </div>
                     <div> 
                        <p><asp:Label ID="LSurname" runat="server" class="orange" meta:resourcekey="LSurnameResource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="Surname" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="SurnameResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorSname" runat="server" ErrorMessage="RequiredFieldValidatorSnameResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Surname" meta:resourcekey="RequiredFieldValidatorSnameResource1"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <p><asp:Label ID="LAddress1" runat="server" class="orange" meta:resourcekey="LAddress1Resource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="Address1" runat="server"  size="30" class="inputBoxStyle" meta:resourcekey="Address1Resource2"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorAddress" runat="server" ErrorMessage="RequiredFieldValidatorAddressResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Address1" meta:resourcekey="RequiredFieldValidatorAddressResource1"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <p><asp:Label ID="LAddress2" runat="server" class="orange" meta:resourcekey="LAddress2Resource1"></asp:Label></p>
                        <asp:TextBox ID="Address2"  runat="server"  size="30" class="inputBoxStyle" meta:resourcekey="Address2Resource2"></asp:TextBox>                        
                    </div>
                    <div>
                        <p><asp:Label ID="LAddress3" runat="server" class="orange" meta:resourcekey="LAddress3Resource1"></asp:Label></p>
                        <asp:TextBox ID="Address3" runat="server" class="inputBoxStyle" meta:resourcekey="Address3Resource2"></asp:TextBox>                        
                    </div>
                    <div>
                        <p><asp:Label ID="LPostCode" runat="server" class="orange" meta:resourcekey="LPostCodeResource1"></asp:Label><span class="red">*</span></p>               
                        <asp:TextBox ID="PostCode" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="PostCodeResource2"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorPostCode" runat="server" ErrorMessage="RequiredFieldValidatorPostCodeResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="PostCode" meta:resourcekey="RequiredFieldValidatorPostCodeResource1"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <p><asp:Label ID="LCity" runat="server" class="orange" meta:resourcekey="LCityResource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="City" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="CityResource2"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorCity" runat="server" ErrorMessage="RequiredFieldValidatorCityResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="City" meta:resourcekey="RequiredFieldValidatorCityResource1"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <p><asp:Label ID="LCountry" runat="server" class="orange" meta:resourcekey="LCountryResource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="Country" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="CountryResource2"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorCountry" runat="server" ErrorMessage="RequiredFieldValidatorCountryResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Country" meta:resourcekey="RequiredFieldValidatorCountryResource1"/>
                    </div>
            </div>
            <div style="">
            <h1>
                Please Choose your products
            </h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:trainingConnectionString %>" 
                SelectCommand="SELECT Name, ProductDescription, Price FROM [Products]"></asp:SqlDataSource>        
        <asp:Repeater ID="ProductListRepeater" runat="server" DataSourceID="SqlDataSource1" >
         <HeaderTemplate>
          <table style=" width:300px;">            
        </HeaderTemplate>
         <ItemTemplate>
          <tr>
            <td class="Name">
              <asp:Label runat="server" ID="ProductName" Text='<%# Eval("Name") %>' />            
            </td>                 
            </tr>
            <tr>
            <td class="Price">
             For <span style=" color:#0069B3"> &#8364; <asp:Label runat="server" ID="Label4" Text='<%# Eval("Price") %>' /></span>
            </td>
            </tr>
            <tr>
            <td>
              <asp:Label runat="server" ID="ProductDescription" Text='<%# Eval("ProductDescription") %>' />
            </td>            
          </tr>
          <tr>
            <td class="Quantity">
                 <asp:Label ID="ProductQuantity" runat="server" meta:resourcekey="Quantity"></asp:Label>
                 <asp:TextBox ID="QuantityValue" runat="server" size="30" class="inputBoxStyle qty "></asp:TextBox>
                 <asp:CustomValidator CssClass="red" ID="checkProductValidator" runat="server" ControlToValidate="qty" ValidateEmptyText="true" ErrorMessage="enter quantity" ClientValidationFunction="CheckQuantity" />
                 <asp:RegularExpressionValidator CssClass="red" ValidationExpression="[0-9]" ControlToValidate="qty" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please use a number ranging from 1-9"></asp:RegularExpressionValidator>                 
            </td>
          </tr>
        </ItemTemplate>
        <FooterTemplate>
          </table>
        </FooterTemplate>
        </asp:Repeater>         
        </div>
        <div>
            <p>
                <asp:Button ID="Submit" runat="server" OnClick="sunmitbtn_Click" class="button" meta:resourcekey="SubmitResource1"/>
                <asp:Button ID="Reset" runat="server" UseSubmitBehavior="False" OnClientClick="ClearAllControls(this.form);" class="button" meta:resourcekey="ResetResource1" />                                                                                                           
                <asp:Button ID="Button2" runat="server" UseSubmitBehavior="False" OnClick="CopyTo_Clicked" class="button" Text="test push to array" />                                        
            </p> 
        </div>     
        </form>         
    </div>          
</asp:Content>