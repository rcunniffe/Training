using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Visor.ShoppingCart.Core.DTO
{
    public class PersonDTO
    {
        public int PersonID { get; set; }
        public String Firstname { get; set; }
        public String Surname { get; set; }
        public AddressDTO Address { get; set; }
    }
}
