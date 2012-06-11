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
    public class ProductDAL
    {
        private String __connectionString;
        int PRODUCTID_IDX = 0;
        int PRODUCTNAME_IDX = 1;
        int PRODUCTDESCRIPTION_IDX = 2;
        int PRODUCTPRICE_IDX = 3;        
        public List<ProductDTO> Load()
        {            
            using (SqlConnection conn = new SqlConnection(__connectionString))
            {
                conn.Open();
                SqlCommand getProductCmd = new SqlCommand("usp_getproducts", conn);
                getProductCmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader QueryReader = getProductCmd.ExecuteReader();
                List<ProductDTO> productDTOList = new List<ProductDTO>();

                while (QueryReader.Read())
                {
                    ProductDTO productDTO = new ProductDTO();
                    productDTO.ProductID = (QueryReader.GetInt32(PRODUCTID_IDX));
                    productDTO.Name = QueryReader.GetString(PRODUCTNAME_IDX).ToString();
                    productDTO.Description = QueryReader.GetString(PRODUCTDESCRIPTION_IDX);
                    productDTO.Price = QueryReader.GetDecimal(PRODUCTPRICE_IDX);
                    productDTOList.Add(productDTO);
                }
                return productDTOList.ToList(); ;
            }
        }
        
        public ProductDAL(String connectionString)
        {
            __connectionString = connectionString;
        }
    }
}
