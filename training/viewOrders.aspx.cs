﻿using System;
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

namespace training_rc
{
    public partial class viewOrders : System.Web.UI.Page
    {
        /// <summary>
        /// Populates the order line grid.
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        /// <param name="orderID">The order ID.</param>
        public void populateOrderLineGrid(object sender, EventArgs e, int orderID)
        {
            using (TransactionScope scope = new TransactionScope())
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["trainingConnectionString"].ConnectionString))
            {                
                DataSet ds = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(); 
                SqlCommand getOrderLineCmd = new SqlCommand("usp_getorderline", conn);
                getOrderLineCmd.CommandType = CommandType.StoredProcedure;
                getOrderLineCmd.Parameters.Add("@orderID", SqlDbType.Int);
                getOrderLineCmd.Parameters["@orderID"].Value = orderID;                            
                adapter.SelectCommand = getOrderLineCmd;
                adapter.Fill(ds);               
                if (ds.Tables.Count > 0)
                {
                    OrderLine.DataSource = ds;
                    OrderLine.DataBind();
                    OrderDetailsTitle.Text = "Order Details";
                    OrderDetailsTitle.Visible = true;
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('cant connect to database');</script>");
                }
            }     
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