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
            const int ORDERLINEDTOOrderID_IDX = 0;
            const int PRODUCTID_IDX = 1;
            const int PRODUCTNAME_IDX = 2;
            const int PRODUCTDescription_IDX = 3;
            const int PRODUCTPrice_IDX = 4;
            const int ORDERLINEDTOQuantity_IDX = 5;     
                  
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
                    orderLineDTO.OrderID = QueryReader.GetInt32(ORDERLINEDTOOrderID_IDX);
                    orderLineDTO.Product = product;
                    orderLineDTO.Quantity = (QueryReader.GetInt32(ORDERLINEDTOQuantity_IDX));
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