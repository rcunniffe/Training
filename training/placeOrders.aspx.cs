using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace training_rc
{
    public partial class PlaceOrders : System.Web.UI.Page
    {             
        public void sunmitbtn_Click(object sender, EventArgs e)
        {            
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString))
            {
                try
                {                
                    conn.Open();               
                    SqlCommand cmd = new SqlCommand("INSERT INTO Customers(Firstname,Surname,Address1,Address2,Address3,Postcode,City,Country) VALUES(@FirstName,@Surname,@Address1,@Address2,@Address3,@PostCode,@City,@Country)", conn);
                    cmd.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 20, "FirstName")).Value = FirstName.Text;
                    cmd.Parameters.Add(new SqlParameter("@Surname", SqlDbType.VarChar, 20, "Surname")).Value = Surname.Text;
                    cmd.Parameters.Add(new SqlParameter("@Address1", SqlDbType.VarChar, 50, "Address1")).Value = Address1.Text;
                    cmd.Parameters.Add(new SqlParameter("@Address2", SqlDbType.VarChar, 50, "Address2")).Value = Address2.Text;
                    cmd.Parameters.Add(new SqlParameter("@Address3", SqlDbType.VarChar, 50, "Address3")).Value = Address3.Text;
                    cmd.Parameters.Add(new SqlParameter("@PostCode", SqlDbType.VarChar, 50, "PostCode")).Value = PostCode.Text;
                    cmd.Parameters.Add(new SqlParameter("@City", SqlDbType.VarChar, 50, "City")).Value = City.Text;
                    cmd.Parameters.Add(new SqlParameter("@Country", SqlDbType.VarChar, 50, "Country")).Value = Country.Text;
                    cmd.ExecuteNonQuery();
                    
                    Response.Write("<script type='text/javascript'>alert('SuccessFul Entry');</script>");                                       
                }
                catch (Exception ex)
                {
                    Response.Write(String.Format("<script type='text/javascript'>alert({0});</script>", ex.ToString()));
                }
            }            
        }        
    }
}