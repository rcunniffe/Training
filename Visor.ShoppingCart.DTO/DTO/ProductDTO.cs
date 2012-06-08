﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Visor.ShoppingCart.Core.DTO
{
    public class ProductDTO
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
    }
}
