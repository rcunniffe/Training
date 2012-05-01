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
    public partial class repeaterTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);            
            string sSQL = "SELECT * FROM [Products]";
            SqlCommand cmd = new SqlCommand(sSQL, conn);
            conn.Open();  
            SqlDataReader dtrCat = cmd.ExecuteReader();
            RepeaterTest.DataSource = dtrCat;
            RepeaterTest.DataBind();  

        }

        public void Clicked(Object Sender, EventArgs e)
        {
            Response.Write(@"<script language='javascript'>alert('The following errors have occurred');</script>");
            Response.Write("This text goes to the Visual Studio output window.");

            RepeaterTest.FindControl("MainContent_Repeater1_qty_0");
            RepeaterTest.FindControl("Label1");
            RepeaterTest.FindControl("Label4");
 

            //foreach (RepeaterItem item in RepeaterTest.Items)
            //{
                //Literal lit = (Literal)item.FindControl("Label1");
            //}
            foreach (RepeaterItem item in RepeaterTest.Items)
            {
                //Response.Write(item.ID);
                //Response.Write(item.Controls);
                Response.Write(RepeaterTest.Controls[1].FindControl("Label1"));
            }           
   
        }
    }     
}