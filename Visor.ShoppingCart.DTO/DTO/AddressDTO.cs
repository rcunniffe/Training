using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Visor.ShoppingCart.Core.DTO
{
    public class AddressDTO
    {
        public int AddressID { get; set;}
        public String Address1 { get; set; }
        public String Address2 { get; set; }
        public String Address3 { get; set; }
        public String Country { get; set; }
        public String City { get; set; }
        public String Postcode { get; set; }
    }
}
