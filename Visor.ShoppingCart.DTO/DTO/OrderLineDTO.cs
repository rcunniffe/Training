using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Visor.ShoppingCart.Core.DTO
{
    public class OrderLineDTO
    {
        public int OrderLineID { get; set;}
        public int OrderID { get; set; }
        public ProductDTO Product { get; set; }
        public int Quantity { get; set; }
    }
}
