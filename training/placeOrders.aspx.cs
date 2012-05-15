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


namespace training_rc
{
    public partial class PlaceOrders : System.Web.UI.Page
    {
        /// <summary>
        /// Creating a product class to store the values of each product selected by user
        /// </summary>
        private class product
        {
            public int productID { get; set; }
            public int quantityValue { get; set; }
        }

        /// <summary>
        /// Creating enum to hold the different order states
        /// </summary>
        public enum State { 
            processed,
            received,
            readytogo,
            delivering,
            delivered }
        /// <summary>
        /// Handles the Click event of the sunmitbtn control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        public void sunmitbtn_Click(object sender, EventArgs e)
        {            
                try
                {
                    if ((isValid()) && (isValidProduct()))
                    {
                        using(TransactionScope scope = new TransactionScope())
                        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString))
                        {
                            const int firstnameParamSize = 50;
                            const int surnameParamSize = 50;
                            const int address1ParamSize = 50;
                            const int address2ParamSize = 50;
                            const int address3ParamSize = 50;
                            const int countryParamSize = 50;
                            const int cityParamSize = 50;
                            const int postcodeParamSize = 50;
                            const int orderstatecodeParamSize = 50;
                            conn.Open();
                            SqlCommand cmd = new SqlCommand("usp_addperson", conn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add(new SqlParameter("@firstname", SqlDbType.VarChar, firstnameParamSize, "firstname")).Value = FirstName.Text;
                            cmd.Parameters.Add(new SqlParameter("@surname", SqlDbType.VarChar, surnameParamSize, "surname")).Value = Surname.Text;
                            cmd.Parameters.Add(new SqlParameter("@address1", SqlDbType.VarChar, address1ParamSize, "address1")).Value = Address1.Text;
                            cmd.Parameters.Add(new SqlParameter("@address2", SqlDbType.VarChar, address2ParamSize, "address2")).Value = Address2.Text;
                            cmd.Parameters.Add(new SqlParameter("@address3", SqlDbType.VarChar, address3ParamSize, "address3")).Value = Address3.Text;
                            cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.VarChar, countryParamSize, "country")).Value = Country.Text;
                            cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.VarChar, cityParamSize, "city")).Value = City.Text;
                            cmd.Parameters.Add(new SqlParameter("@postcode", SqlDbType.VarChar, postcodeParamSize, "postcode")).Value = PostCode.Text;
                            cmd.Parameters.Add(new SqlParameter("@orderstatecode", SqlDbType.VarChar, orderstatecodeParamSize, "code")).Value = State.processed.ToString();
                            
                            int orderID = Convert.ToInt32(cmd.ExecuteScalar());

                            var ProductList = GetValues();
                            for (int i = 0; i < ProductList.Count; i++)
                            {
                                SqlCommand cmdInsertProduct = new SqlCommand("usp_addorder", conn);
                                cmdInsertProduct.CommandType = CommandType.StoredProcedure;
                                cmdInsertProduct.Parameters.Add(new SqlParameter("@productID", SqlDbType.Int)).Value = ProductList[i].productID;
                                cmdInsertProduct.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int)).Value = orderID;
                                cmdInsertProduct.Parameters.Add(new SqlParameter("@quantity", SqlDbType.Int)).Value = ProductList[i].quantityValue;
                                if ((int)cmdInsertProduct.ExecuteNonQuery() != 1)
                                {
                                    throw new System.ArgumentException("An error occured when saving an order");                                    
                                }
                            }
                            scope.Complete();
                            Response.Write("<script type='text/javascript'>alert('SuccessFul Entry');</script>");                            
                        }                    
                    }
                    else { Response.Write("<script type='text/javascript'>alert('sorry the data you entered was not valid');</script>"); }
                }
                catch (Exception ex)
                {
                    Response.Write(String.Format("<script type='text/javascript'>alert({0});</script>", ex.ToString()));                    
                }              
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
        private List<product> GetValues()
        {
            var ProductList = new List<product>();               
                for (int i = 0; i < ProductListRepeater.Items.Count; i++)
                {
                    if (!(String.IsNullOrEmpty(((TextBox)ProductListRepeater.Controls[i + 1].FindControl("QuantityValue")).Text)))
                    {                  
                        int quantityValue = Convert.ToInt32(((TextBox)ProductListRepeater.Controls[i + 1].FindControl("QuantityValue")).Text);
                        int productID = Convert.ToInt32(((Label)ProductListRepeater.Controls[i + 1].FindControl("productID")).Text);
                        ProductList.Add(new product { productID = productID, quantityValue = quantityValue });
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
                if (!(String.IsNullOrEmpty(((TextBox)ProductListRepeater.Controls[i+1].FindControl("QuantityValue")).Text)))
                {
                    IsProductValid = true;
                }               
            }
            return IsProductValid;
        }
    }
}