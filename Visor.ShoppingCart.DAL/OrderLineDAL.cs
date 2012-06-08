using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Visor.ShoppingCart.Core.DTO;
using System.Transactions;
using System.Data.SqlClient;
using System.Data;

namespace Visor.ShoppingCart.DAL
{
    public class OrderLineDAL
    {
        private String __connectionString;
        public List<OrderLineDTO> Load(int orderID)
        {
            int PRODUCTID_IDX = 1;
            int PRODUCTNAME_IDX = 2;
            int PRODUCTDescription_IDX = 3;
            int PRODUCTPrice_IDX = 4;            
                  
            using (SqlConnection conn = new SqlConnection(__connectionString))
            {
                conn.Open();
                SqlCommand getOrderLineCmd = new SqlCommand("usp_getorderline", conn);
                getOrderLineCmd.CommandType = CommandType.StoredProcedure;
                getOrderLineCmd.Parameters.Add("@orderID", SqlDbType.Int);
                getOrderLineCmd.Parameters["@orderID"].Value = orderID;                                    
                SqlDataReader QueryReader = getOrderLineCmd.ExecuteReader();
                List<OrderLineDTO> orderLineDTOList = new List<OrderLineDTO>();

                while (QueryReader.Read())
                {
                    OrderLineDTO orderLineDTO = new OrderLineDTO();
                    ProductDTO product = new ProductDTO();
                    product.ProductID = QueryReader.GetInt32(PRODUCTID_IDX);
                    product.Name = QueryReader.GetString(PRODUCTNAME_IDX);
                    product.Description = QueryReader.GetString(PRODUCTDescription_IDX);
                    product.Price = QueryReader.GetDecimal(PRODUCTPrice_IDX);
                    orderLineDTO.OrderID = QueryReader.GetInt32(0);
                    orderLineDTO.Product = product;
                    orderLineDTO.Quantity = Convert.ToInt32((QueryReader.GetValue(5)));
                    orderLineDTOList.Add(orderLineDTO);
                }
                return orderLineDTOList.ToList();
            }
        }

         public OrderLineDAL(String connectionString)
        {
            __connectionString = connectionString;
        }
    }
}  