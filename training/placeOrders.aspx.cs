using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Reflection;
using System.Resources;


namespace training_rc
{
    public partial class PlaceOrders : System.Web.UI.Page
    {

        /// <summary>
        /// Handles the Click event of the sunmitbtn control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        public void sunmitbtn_Click(object sender, EventArgs e)
        {
            GetValues();
                try
                {
                    if ((isValid()) && (isValidProduct()))
                    {
                        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString))
                        {
                            conn.Open();
                            String query = @"
                            INSERT INTO person (firstname,surname)
                            VALUES(@firstname,@surname) 
                            declare @personID as int 
                            SET @personID = SCOPE_IDENTITY() 

                            INSERT INTO addresstype(code,[description]) 
                            VALUES ('p','primary address') 
                            declare @addresstypeID as int 
                            SET @addresstypeID = SCOPE_IDENTITY() 
                            
                            INSERT INTO country(country) 
                            VALUES (@country) 
                            declare @countryID as int 
                            SET @countryID = SCOPE_IDENTITY() 

                            INSERT INTO city(city,countryID) 
                            VALUES (@city,@countryID) 
                            declare @cityID as int 
                            SET @cityID = SCOPE_IDENTITY() 

                            INSERT INTO [address](address1,address2,address3, cityID) 
                            VALUES (@address1,@address2,@address3, @cityID) 
                            declare @addressID as int 
                            SET @addressID = SCOPE_IDENTITY() 
                            
                            INSERT INTO postcode(postcode) 
                            VALUES ('D4') 
                            declare @postcodeID as int 
                            SET @postcodeID = SCOPE_IDENTITY() 
    
                            INSERT INTO personaddress(personID,addressID,addresstypeID) 
                            VALUES (@personID,@addressID,@addresstypeID) 
                            declare @personaddressID as int 
                            SET @personaddressID = SCOPE_IDENTITY() 

                            INSERT INTO [order](personID) 
                            VALUES (@personID)                            
                            declare @orderID as int 
                            SET @orderID = SCOPE_IDENTITY()

                            select @orderID";
                            
                            SqlCommand cmd = new SqlCommand(query, conn);                            
                            cmd.Parameters.Add(new SqlParameter("@firstname", SqlDbType.VarChar, 50, "firstname")).Value = FirstName.Text;
                            cmd.Parameters.Add(new SqlParameter("@surname", SqlDbType.VarChar, 50, "surname")).Value = Surname.Text;
                            cmd.Parameters.Add(new SqlParameter("@address1", SqlDbType.VarChar, 50, "address1")).Value = Address1.Text;
                            cmd.Parameters.Add(new SqlParameter("@address2", SqlDbType.VarChar, 50, "address2")).Value = Address2.Text;
                            cmd.Parameters.Add(new SqlParameter("@address3", SqlDbType.VarChar, 50, "address3")).Value = Address3.Text;
                            cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.VarChar, 50, "country")).Value = Country.Text;
                            cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.VarChar, 50, "city")).Value = City.Text;
                            cmd.Parameters.Add(new SqlParameter("@postcode", SqlDbType.VarChar, 50, "postcode")).Value = PostCode.Text;
                            int orderID = cmd.ExecuteScalar();                                                 

                            var ProductList = GetValues();                           
                            for (int i = 0; i < ProductList.Count; i++)
                            {
                                String productInsert = @"
                                INSERT INTO [orderline] (productID,orderID,quantity)
                                VALUES(@productID,@orderID,@quantity)";                              

                                SqlCommand insertproducts = new SqlCommand(productInsert, conn);

                                insertproducts.Parameters.Add(new SqlParameter("@productID", SqlDbType.VarChar, 50, "productID")).Value = ProductList[i].productID;
                                insertproducts.Parameters.Add(new SqlParameter("@orderID", SqlDbType.VarChar, 50, "orderID")).Value = orderID;
                                insertproducts.Parameters.Add(new SqlParameter("@quantity", SqlDbType.VarChar, 50, "QuantityValue")).Value = ProductList[i].QuantityValue;
                                //Console.WriteLine(ProductList[i].description);
                                //Console.WriteLine(ProductList[i].name);
                                insertproducts.ExecuteNonQuery();
                            }                           

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
        /// Creating a product class to store the values of each product selected by user
        /// </summary>
        private class product
        {            
            public int productID { get; set; }
            public int quantityValue { get; set; }
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