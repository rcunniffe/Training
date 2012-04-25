<%@ Page Title="Place Order" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="PlaceOrders.aspx.cs" Inherits="training_rc.PlaceOrders" culture="auto" meta:resourcekey="ResourcePageForPlaceOrders" uiculture="auto" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent"> 
<script language="javascript" type='text/javascript'>

    function ClearAllControls(form) {
        form.reset(); return false;
    }
</script>   
    <div style=" width: 900px; padding-left:350px">
        <form action="" id="customerForm">
            <h1>
                Please fill in Customer Details
            </h1>                                   
                        <p>
                        <asp:Label ID="LFirstName" runat="server" meta:resourcekey="FirstName" class="orange"></asp:Label><span class="red">*</span>
                        </p>
                        <asp:TextBox ID="FirstName" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="FirstNameResource1"></asp:TextBox>                        
                        <asp:RequiredFieldValidator id="RequiredFieldValidatorFname" runat="server" ErrorMessage="RequiredFieldValidatorFnameResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="FirstName" meta:resourcekey="RequiredFieldValidatorFnameResource1"></asp:RequiredFieldValidator>                                
                        
                        <p><asp:Label ID="LSurname" runat="server" class="orange" meta:resourcekey="LSurnameResource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="Surname" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="SurnameResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator id="RequiredFieldValidatorSname" runat="server" ErrorMessage="RequiredFieldValidatorSnameResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Surname" meta:resourcekey="RequiredFieldValidatorSnameResource1"></asp:RequiredFieldValidator>
                
                        <p><asp:Label ID="LAddress1" runat="server" class="orange" meta:resourcekey="LAddress1Resource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="Address1" runat="server"  size="30" class="inputBoxStyle" meta:resourcekey="Address1Resource2"></asp:TextBox>
                        <asp:RequiredFieldValidator id="RequiredFieldValidatorAddress" runat="server" ErrorMessage="RequiredFieldValidatorAddressResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Address1" meta:resourcekey="RequiredFieldValidatorAddressResource1"></asp:RequiredFieldValidator>
                
                        <p><asp:Label ID="LAddress2" runat="server" class="orange" meta:resourcekey="LAddress2Resource1"></asp:Label></p>
                        <asp:TextBox ID="Address2" runat="server"  size="30" class="inputBoxStyle" meta:resourcekey="Address2Resource2"></asp:TextBox>                        
                
                        <p><asp:Label ID="LAddress3" runat="server" class="orange" meta:resourcekey="LAddress3Resource1"></asp:Label></p>
                        <asp:TextBox ID="Address3" runat="server" class="inputBoxStyle" meta:resourcekey="Address3Resource2"></asp:TextBox>                        
                
                        <p><asp:Label ID="LPostCode" runat="server" class="orange" meta:resourcekey="LPostCodeResource1"></asp:Label><span class="red">*</span></p>               
                        <asp:TextBox ID="PostCode" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="PostCodeResource2"></asp:TextBox>
                        <asp:RequiredFieldValidator id="RequiredFieldValidatorPostCode" runat="server" ErrorMessage="RequiredFieldValidatorPostCodeResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="PostCode" meta:resourcekey="RequiredFieldValidatorPostCodeResource1"></asp:RequiredFieldValidator>

                        <p><asp:Label ID="LCity" runat="server" class="orange" meta:resourcekey="LCityResource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="City" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="CityResource2"></asp:TextBox>
                        <asp:RequiredFieldValidator id="RequiredFieldValidatorCity" runat="server" ErrorMessage="RequiredFieldValidatorCityResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="City" meta:resourcekey="RequiredFieldValidatorCityResource1"></asp:RequiredFieldValidator>
                
                        <p><asp:Label ID="LCountry" runat="server" class="orange" meta:resourcekey="LCountryResource1"></asp:Label><span class="red">*</span></p>
                        <asp:TextBox ID="Country" runat="server" size="30" class="inputBoxStyle" meta:resourcekey="CountryResource2"></asp:TextBox>
                        <asp:RequiredFieldValidator id="RequiredFieldValidatorCountry" runat="server" ErrorMessage="RequiredFieldValidatorCountryResource1.ErrorMessage" SetFocusOnError="True" CssClass="red" ControlToValidate="Country" meta:resourcekey="RequiredFieldValidatorCountryResource1"></asp:RequiredFieldValidator>                                                                                                
                    <p>
                        <asp:Button ID="Submit" runat="server" OnClick="sunmitbtn_Click" class="button" meta:resourcekey="SubmitResource1"/>
                        <asp:Button ID="Reset" runat="server" UseSubmitBehavior="False" OnClientClick="ClearAllControls(this.form);" class="button" meta:resourcekey="ResetResource1" />
                    </p>                   
        </form>         
    </div>          
</asp:Content>