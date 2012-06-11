using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Visor.ShoppingCart.DAL;
using Visor.ShoppingCart.Core.DTO;


namespace training_rc
{
    public partial class PlaceOrders : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsCallback && !Page.IsPostBack)
                populateProductListRepeater();
        }           
        /// <summary>
        /// Creating a product class to store the values of each product selected by user
        /// </summary>
        private class product
        {
            public int productID { get; set; }
            public int quantityValue { get; set; }
        }

        private void populateProductListRepeater()
        {
            try
            {
                ProductDAL productDAL = new ProductDAL(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);
                ProductListRepeater.DataSource = productDAL.Load();
                ProductListRepeater.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Inserts the person and order.
        /// </summary>
        /// <returns></returns>
        private bool InsertPersonAndOrder()
        {
            using (TransactionScope scope = new TransactionScope())
            {
                PersonDAL personDAL = new PersonDAL(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);
                PersonDTO personDTO = new PersonDTO();
                personDTO.Firstname = Server.HtmlEncode(FirstName.Text);
                personDTO.Surname = Server.HtmlEncode(Surname.Text);
                personDTO.Address = new AddressDTO();
                personDTO.Address.Address1 = Server.HtmlEncode(Address1.Text);
                personDTO.Address.Address2 = Server.HtmlEncode(Address2.Text);
                personDTO.Address.Address3 = Server.HtmlEncode(Address3.Text);
                personDTO.Address.City = Server.HtmlEncode(City.Text);
                personDTO.Address.Country = Server.HtmlEncode(Country.Text);
                personDTO.Address.Postcode = Server.HtmlEncode(PostCode.Text);
                try
                {
                    personDAL.Save(personDTO);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                try
                {
                    OrderDAL orderDAL = new OrderDAL(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);
                    OrderDTO orderDTO = new OrderDTO();
                    orderDTO.PersonID = personDTO.PersonID;
                    orderDTO.OrderLines = GetValues();
                    orderDAL.Save(orderDTO);
                }
                catch (Exception ex)
                {
                    throw ex; //new System.ArgumentException("An error occured when saving an order");
                }
                scope.Complete();
            }
            return true;
        }
        /// <summary>
        /// Validates the Form on placeOrders.aspx
        /// </summary>
        /// <returns></returns>
        protected bool isValid()
        {
            return (!(string.IsNullOrWhiteSpace(FirstName.Text)) && !(string.IsNullOrWhiteSpace(Surname.Text)) && !(string.IsNullOrWhiteSpace(Address1.Text)) && !(string.IsNullOrWhiteSpace(PostCode.Text)) && !(string.IsNullOrWhiteSpace(City.Text)) && !(string.IsNullOrWhiteSpace(Country.Text)));
        }
        /// <summary>
        /// Creating a list of object type product. Adding to the list each time a quantity has been given for a product
        /// </summary>
        /// <returns></returns>
        private List<OrderLineDTO> GetValues()
        {
            var ProductList = new List<OrderLineDTO>();
            for (int i = 0; i < ProductListRepeater.Items.Count; i++)
            {
                if (!(String.IsNullOrEmpty(((TextBox)ProductListRepeater.Controls[i + 1].FindControl("QuantityValue")).Text)))
                {
                    int quantityValue = Convert.ToInt32(((TextBox)ProductListRepeater.Controls[i + 1].FindControl("QuantityValue")).Text);
                    int productID = Convert.ToInt32(((Label)ProductListRepeater.Controls[i + 1].FindControl("productID")).Text);
                    ProductList.Add(new OrderLineDTO { Product = (new ProductDTO { ProductID = productID }), Quantity = quantityValue });
                }
            }
            return ProductList;
        }
        /// <summary>
        /// Determines whether [is valid product].
        /// </summary>
        /// <returns>
        ///   <c>true</c> if [is valid product]; otherwise, <c>false</c>.
        /// </returns>
        protected bool isValidProduct()
        {
            bool IsProductValid = false;
            for (int i = 0; i < ProductListRepeater.Items.Count; i++)
            {
                if (!(String.IsNullOrEmpty(((TextBox)ProductListRepeater.Controls[i + 1].FindControl("QuantityValue")).Text)))
                {
                    IsProductValid = true;
                }
            }
            return IsProductValid;
        }

        /// <summary>
        /// Handles the Click event of the sunmitbtn control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        public void sunmitbtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.isValid() && this.isValidProduct())
                {
                    bool insertpersonandorderflag = this.InsertPersonAndOrder();
                    this.ServerSideFormValidationMessage.Visible = true;
                    this.ServerSideFormValidationMessage.Text = (insertpersonandorderflag ? "thank you, the system has received your order" : "an error occured when saving an order");
                }
                else
                {

                    ServerSideFormValidationMessage.Visible = true;
                    this.ValidationSummaryForCustomerForm.ShowSummary = true;
                }
            }
            catch (Exception ex)
            {
                ServerSideFormValidationMessage.Visible = true;
                ServerSideFormValidationMessage.Text = ex.Message;
            }

        }
    }
}