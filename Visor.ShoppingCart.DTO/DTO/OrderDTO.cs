using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Visor.ShoppingCart.Core.DTO
{
    public class OrderDTO
    {
        public int OrderID { get; set; }
        public int PersonID { get; set; }
        public string orderstate_name { get; set; }
        public List<OrderLineDTO> OrderLines { get; set; }
    }
}
