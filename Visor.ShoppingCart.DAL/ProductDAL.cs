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
        int PRODUCTDescription_IDX = 2;
        int PRODUCTPrice_IDX = 3;        
        public List<ProductDTO> Load()
        {
            using (TransactionScope scope = new TransactionScope())
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
                    productDTO.ProductID = Convert.ToInt32((QueryReader.GetValue(PRODUCTID_IDX)));
                    productDTO.Name = QueryReader.GetValue(PRODUCTNAME_IDX).ToString();
                    productDTO.Description = QueryReader.GetValue(PRODUCTDescription_IDX).ToString();
                    productDTO.Price = QueryReader.GetDecimal(PRODUCTPrice_IDX);
                    productDTOList.Add(productDTO);
                }

                return productDTOList.ToList();
            }
        }
        
        public ProductDAL(String connectionString)
        {
            __connectionString = connectionString;
        }
    }
}
