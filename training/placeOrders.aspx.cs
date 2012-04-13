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
    public partial class placeOrders : System.Web.UI.Page
    {
        public void sunmitbtn_Click(object sender, EventArgs e)
        {
            SqlConnection sc = null;
            SqlCommand command = null;            
            sc = new SqlConnection(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);
            sc.Open();
            string query1 = String.Format(@"INSERT INTO Customers(Firstname,Surname,Address1,Address2,Address3,Postcode,City,Country) VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", FirstName.Text, Surname.Text, Address1.Text, Address2.Text, Address3.Text, PostCode.Text, City.Text, Country.Text);
            command = new SqlCommand(query1, sc);
            command.ExecuteNonQuery();
            command.Dispose();
            sc.Close();
            Server.Transfer("~/Default.aspx");
        }

        public void submitTest(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=VIS-RC2\DBI;Initial Catalog=training;Integrated Security=True");
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
            cmd.Dispose();
            conn.Close();
            Response.Write("window.alert('your entry was submited')");
            Response.Write("<script language='javascript'>alert('thank you \n" + FirstName.Text + " . your entry was submited');</script>");                 
            ViewState.Clear();
            Response.Redirect(Request.Url.AbsoluteUri.ToString());
            cmd = null;
        }
        public void resetbtn_Click(object sender, EventArgs e)
        {
            ViewState.Clear();
            Response.Redirect(Request.Url.AbsoluteUri.ToString());           
        }
    }
}