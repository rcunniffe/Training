using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Visor.ShoppingCart.Core.DTO;
using System.Transactions;
using Visor.ShoppingCart.Core.Enum;

namespace Visor.ShoppingCart.DAL
{
    public class OrderDAL
    {
        const int orderstatecodeParamSize = 50;

        private String __connectionString;        
        
        public void Save(OrderDTO order)
        {
            using (TransactionScope scope = new TransactionScope())
            using (SqlConnection conn = new SqlConnection(__connectionString))
            {
                conn.Open();
                SqlCommand cmdOrder = new SqlCommand("usp_addorder", conn);
                cmdOrder.CommandType = CommandType.StoredProcedure;
                cmdOrder.Parameters.Add(new SqlParameter("@personID", SqlDbType.Int)).Value = order.PersonID;
                cmdOrder.Parameters.Add(new SqlParameter("@orderstatecode", SqlDbType.VarChar, orderstatecodeParamSize, "code")).Value = OrderState.Processed.ToString();
                order.OrderID = Convert.ToInt32(cmdOrder.ExecuteScalar());
  
                SqlCommand cmdOrderLine = new SqlCommand("usp_addorderline", conn);
                for (int i = 0; i < order.OrderLines.Count; i++)
                {
                    cmdOrderLine.CommandType = CommandType.StoredProcedure;
                    cmdOrderLine.Parameters.Clear();
                    cmdOrderLine.Parameters.Add(new SqlParameter("@orderID", SqlDbType.Int)).Value = order.OrderID;                    
                    cmdOrderLine.Parameters.Add(new SqlParameter("@productID", SqlDbType.Int)).Value = order.OrderLines[i].Product.ProductID;
                    cmdOrderLine.Parameters.Add(new SqlParameter("@quantity", SqlDbType.Int)).Value = order.OrderLines[i].Quantity;
                    order.OrderLines[i].OrderLineID = Convert.ToInt32(cmdOrderLine.ExecuteScalar());
                }                    
                scope.Complete();
            }
        }

        public List<OrderDTO> Load()
        {
            using (TransactionScope scope = new TransactionScope())
            using (SqlConnection conn = new SqlConnection(__connectionString))
            {
                conn.Open();             
                SqlCommand getOrderCmd = new SqlCommand("usp_getorder", conn);
                getOrderCmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader QueryReader = getOrderCmd.ExecuteReader();
                List<OrderDTO> orderDTOList = new List<OrderDTO>();                

                while (QueryReader.Read())
                {
                    OrderDTO orderDTO = new OrderDTO();

                    orderDTO.PersonID = Convert.ToInt32((QueryReader.GetValue(0)));
                    orderDTO.OrderID =  Convert.ToInt32((QueryReader.GetValue(1)));
                    orderDTO.orderstate_name = QueryReader.GetValue(2).ToString();
                    
                    orderDTO.OrderLines = new List<OrderLineDTO>();                    
                    
                    int orderlineID = Convert.ToInt32((QueryReader.GetValue(3)));
                    int productID = Convert.ToInt32((QueryReader.GetValue(4)));
                    int quantity = Convert.ToInt32((QueryReader.GetValue(5)));
                    //orderDTO.OrderLines.Add(new OrderLineDTO { OrderLineID = orderlineID, Quantity = quantity, orderDTO.OrderLines.Add(new ProductDTO { ProductID = productID}) };                    
                    orderDTO.OrderLines.Add(new OrderLineDTO { OrderLineID = orderlineID, Quantity = quantity, Product = (new ProductDTO { ProductID = productID }) });
                    orderDTOList.Add(orderDTO);
                }

                return orderDTOList;
            }
        }

        /// <summary>
        /// Persons the DAL.
        /// </summary>
        /// <param name="connectionString">The connection string.</param>
        public OrderDAL(String connectionString)
        {
            __connectionString = connectionString;
        }
    }
}
