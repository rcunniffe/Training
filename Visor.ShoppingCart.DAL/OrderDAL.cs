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
            int PERSONID_IDX = 0;
            int ORDERID_IDX = 1;
            int ORDERSTATE_IDX = 2;
            int ORDERLINEID_IDX = 3;
            int PRODUCTID_IDX = 4;
            int QUANTITY_IDX = 5;           
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
                    orderDTO.PersonID = (QueryReader.GetInt32(PERSONID_IDX));
                    orderDTO.OrderID = (QueryReader.GetInt32(ORDERID_IDX));
                    OrderState orderStateParsed;
                    if (!Enum.TryParse<OrderState>(QueryReader.GetString(ORDERSTATE_IDX), out orderStateParsed))
                        throw new InvalidCastException();
                    orderDTO.OrderStateLabel = orderStateParsed;                    
                    orderDTO.OrderLines = new List<OrderLineDTO>();
                    int orderlineID = (QueryReader.GetInt32(ORDERLINEID_IDX));
                    int productID = (QueryReader.GetInt32(PRODUCTID_IDX));
                    int quantity = (QueryReader.GetInt32(QUANTITY_IDX));                    
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
