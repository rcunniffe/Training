using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Visor.ShoppingCart.Core.Enum;

namespace Visor.ShoppingCart.Core.DTO
{
    public class OrderDTO
    {
        public int OrderID { get; set; }
        public int PersonID { get; set; }
        public OrderState OrderStateLabel { get; set; }
        public List<OrderLineDTO> OrderLines { get; set; }
    }
}
