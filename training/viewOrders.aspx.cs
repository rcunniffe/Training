using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace training_rc
{
    public partial class viewOrders : System.Web.UI.Page
    {
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
            }
        }    
    }
}