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
    <div class="fieldset" style="height:100%; width:890px; text-align:center;">        
        <div class="" style=" margin-bottom:20px; margin-top:20px; font-size:1.6em;">
            <asp:Label CssClass="ServerSideFormValidationMessage" ID="ServerSideFormValidationMessage" Visible="false" style="" runat="server" Text="There was an error with the data you submitted, please try again later"></asp:Label>        
        </div>
        <form action="" id="customerForm">  
        <asp:ValidationSummary CssClass="red" ID="ValidationSummaryForCustomerForm" runat="server" />      
            <h1>
            Please Enter Your Details
            </h1>
            <div style="padding-bottom:50px;">   
            <p style=" float:right;">
                &nbsp;
                    <div class="form-item webform-component webform-component-textfield">                                
                        <p>
                        <asp:Label ID="LFirstName" runat="server" meta:resourcekey="FirstName" class="orange"></asp:Label><span class="red">*</span>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorFname" runat="server" ErrorMessage="RequiredFieldValidatorFnameResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="FirstName" meta:resourcekey="RequiredFieldValidatorFnameResource1"></asp:RequiredFieldValidator>
                        </p>
                        <asp:TextBox ViewStateMode=Disabled  ID="FirstName" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="FirstNameResource1"></asp:TextBox>                        
                        
                     </div>
                     <div class="form-item webform-component webform-component-textfield"> 
                        <p><asp:Label ID="LSurname" runat="server" class="orange" meta:resourcekey="LSurnameResource1"></asp:Label><span class="red">*</span>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorSname" runat="server" ErrorMessage="RequiredFieldValidatorSnameResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Surname" meta:resourcekey="RequiredFieldValidatorSnameResource1"></asp:RequiredFieldValidator></p>
                        <asp:TextBox ID="Surname" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="SurnameResource1"></asp:TextBox>
                        
                    </div>
                    <div class="form-item webform-component webform-component-textfield">
                        <p><asp:Label ID="LAddress1" runat="server" class="orange" meta:resourcekey="LAddress1Resource1"></asp:Label><span class="red">*</span>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorAddress" runat="server" ErrorMessage="RequiredFieldValidatorAddressResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Address1" meta:resourcekey="RequiredFieldValidatorAddressResource1"></asp:RequiredFieldValidator></p>
                        <asp:TextBox ID="Address1" runat="server"  size="30" class="inputBoxStyle" meta:resourcekey="Address1Resource2"></asp:TextBox>
                        
                    </div>
                    <div class="form-item webform-component webform-component-textfield">
                        <p><asp:Label ID="LAddress2" runat="server" class="orange" meta:resourcekey="LAddress2Resource1"></asp:Label></p>
                        <asp:TextBox ID="Address2"  runat="server"  size="30" class="inputBoxStyle" meta:resourcekey="Address2Resource2"></asp:TextBox>                        
                    </div>
                    <div class="form-item webform-component webform-component-textfield">
                        <p><asp:Label ID="LAddress3" runat="server" class="orange" meta:resourcekey="LAddress3Resource1"></asp:Label></p>
                        <asp:TextBox ID="Address3" runat="server" class="inputBoxStyle" meta:resourcekey="Address3Resource2"></asp:TextBox>                        
                    </div>
                    <div class="form-item webform-component webform-component-textfield">
                        <p><asp:Label ID="LPostCode" runat="server" class="orange" meta:resourcekey="LPostCodeResource1"></asp:Label><span class="red">*</span>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorPostCode" runat="server" ErrorMessage="RequiredFieldValidatorPostCodeResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="PostCode" meta:resourcekey="RequiredFieldValidatorPostCodeResource1"></asp:RequiredFieldValidator></p>               
                        <asp:TextBox ID="PostCode" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="PostCodeResource2"></asp:TextBox>
                        
                    </div>
                    <div class="form-item webform-component webform-component-textfield">
                        <p><asp:Label ID="LCity" runat="server" class="orange" meta:resourcekey="LCityResource1"></asp:Label><span class="red">*</span>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorCity" runat="server" ErrorMessage="RequiredFieldValidatorCityResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="City" meta:resourcekey="RequiredFieldValidatorCityResource1"></asp:RequiredFieldValidator></p>
                        <asp:TextBox ID="City" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="CityResource2"></asp:TextBox>
                        
                    </div>
                    <div class="form-item webform-component webform-component-textfield">
                        <p><asp:Label ID="LCountry" runat="server" class="orange" meta:resourcekey="LCountryResource1"></asp:Label><span class="red">*</span>
                        <asp:RequiredFieldValidator Display="Dynamic" id="RequiredFieldValidatorCountry" runat="server" ErrorMessage="RequiredFieldValidatorCountryResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Country" meta:resourcekey="RequiredFieldValidatorCountryResource1"/></p>
                        <asp:TextBox ID="Country" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="CountryResource2"></asp:TextBox>
                        
                    </div>
            </div>
            <div>
            <h1>
                Please Choose your products
            </h1>
        <asp:SqlDataSource ID="ProductListingDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:trainingConnectionString %>" 
                
                    SelectCommand="SELECT  [productID], [name], [description], [price] FROM [product]"></asp:SqlDataSource>        
        <asp:Repeater ID="ProductListRepeater" runat="server" DataSourceID="ProductListingDataSource" >
         <HeaderTemplate>
          <div style="">            
        </HeaderTemplate>
         <ItemTemplate>
           <div class="prod">
                
                  <asp:Label CssClass="Name" runat="server" ID="name" Text='<%# Eval("name") %>' /><br />                                           
                  <span style="font-size:24px; padding-left:60px; padding-top:60px;">For <span style=" font-size:24px; color:#0069B3"> &#8364; <asp:Label CssClass="Price" runat="server" ID="Label4" Text='<%# Eval("price") %>' /></span><br /></span>
                  <asp:Label CssClass="description" runat="server" ID="description" Text='<%# Eval("description") %>' /><br />
                  <asp:Label Visible="false" runat="server" ID="productID" Text='<%# Eval("productID") %>' />                                    
                  <asp:Label ID="quantity" runat="server" meta:resourcekey="Quantity"></asp:Label>  
                  <asp:TextBox CssClass="Quantity" ID="QuantityValue" runat="server" size="30" class="inputBoxStyle qty "></asp:TextBox><br />                                   
                  <asp:RegularExpressionValidator CssClass="red" ValidationExpression="[\d+ 0-9]" ControlToValidate="QuantityValue" ID="RegularExpressionValidatorQuantity" runat="server" meta:resourcekey="RegularExpressionValidatorQuantityResource1"></asp:RegularExpressionValidator>                
            </div>
        </ItemTemplate>
        <FooterTemplate>
          </div>
        </FooterTemplate>
        </asp:Repeater>         
        </div>
        <div style=" width:860px;">
            <p style=" float:right;">                
                <asp:Button ID="Reset" runat="server" UseSubmitBehavior="False" OnClientClick="ClearAllControls(this.form);" class="button" meta:resourcekey="ResetResource1" />                                
                <asp:Button ID="Submit" runat="server" OnClick="sunmitbtn_Click" class="button" meta:resourcekey="SubmitResource1"/>
            </p> 
        </div>                            
        </form>         
    </div>          
</asp:Content>