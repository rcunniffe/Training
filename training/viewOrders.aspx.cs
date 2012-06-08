using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Resources;
using System.Transactions;
using Visor.ShoppingCart.DAL;
using Visor.ShoppingCart.Core.DTO;
using System.Collections;

namespace training_rc
{
    public partial class viewOrders : System.Web.UI.Page
    {
        void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsCallback && !Page.IsPostBack)
                {
                    OrderDAL orderDAL = new OrderDAL(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);
                    PersonDAL personDAL = new PersonDAL(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);
                    ViewOrders.DataSource = LoadOrders(orderDAL, personDAL);
                    ViewOrders.DataBind();
                    OrderDetailsTitle.Text = "Order Details";
                    OrderDetailsTitle.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private IEnumerable LoadOrders(OrderDAL orderDAL, PersonDAL personDAL)
        {
            return (from orderdto in orderDAL.Load().ToList()
                    join persondto in personDAL.Load().ToList() on orderdto.PersonID equals persondto.PersonID
                    select new {OrderID = orderdto.OrderID, 
                                FirstName = persondto.Firstname,
                                Surname = persondto.Surname,
                                Address1 = persondto.Address.Address1,
                                Address2 = persondto.Address.Address2,
                                Address3 = persondto.Address.Address3,
                                City = persondto.Address.City,
                                Country = persondto.Address.Country,
                                PostCode = persondto.Address.Postcode,
                                OrderStateLabel = orderdto.OrderStateLabel
                    });
        }
        /// <summary>
        /// Populates the order line grid.
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        /// <param name="orderID">The order ID.</param>
        public void populateOrderLineGrid(object sender, EventArgs e, int orderID)
        {
            OrderLineDAL orderLineDAL = new OrderLineDAL(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString);
            OrderLineGrid.AutoGenerateColumns = false;            
            OrderLineGrid.DataSource = orderLineDAL.Load(orderID).ToList();
            OrderLineGrid.DataBind();
            OrderDetailsTitle.Text = "Order Details";
            OrderDetailsTitle.Visible = true;
           
        }       
        /// <summary>
        /// Handles the RowCommand event of the PopulateOrderline control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.Web.UI.WebControls.GridViewCommandEventArgs"/> instance containing the event data.</param>
        protected void PopulateOrderline_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "getOrderID")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = ViewOrders.Rows[index];                 
                int orderID = Convert.ToInt32(Server.HtmlDecode(row.Cells[0].Text));
                populateOrderLineGrid(sender, e, orderID);
            }
        }        
    }
}