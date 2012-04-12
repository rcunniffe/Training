using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace training_rc
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void sunmitbtn_Click(object sender, EventArgs e)
        {
            SqlConnection sc = null;
            SqlCommand command = null;
            sc = new SqlConnection(@"Data Source=VIS-RC2\DBI;Initial Catalog=training;Integrated Security=True");               
            sc.Open();
            string query1 = String.Format(@"INSERT INTO Customers(Firstname,Surname,Address1,Address2,Address3,Postcode,City,Country) VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", FirstName.Text, Surname.Text, Address1.Text, Address2.Text, Address3.Text, PostCode.Text, City.Text, Country.Text);
            command = new SqlCommand(query1, sc);
            command.ExecuteNonQuery();
            command.Dispose();
            sc.Close();
            Server.Transfer("~/Default.aspx");
        }
    }
}