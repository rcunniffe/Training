using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Visor.ShoppingCart.Core.DTO
{
    public class OrderDTO
    {
        public int OrderID;
        public int PersonID;
        public List<OrderLineDTO> OrderLines;
    }
}
