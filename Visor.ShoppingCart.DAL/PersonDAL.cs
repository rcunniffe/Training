using System;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;
using Visor.ShoppingCart.Core.DTO;
using Visor.ShoppingCart.Core.Enum;
using System.Collections.Generic;

namespace Visor.ShoppingCart.DAL
{
    public class PersonDAL
    {
        const int firstnameParamSize = 50;
        const int surnameParamSize = 50;
        const int address1ParamSize = 50;
        const int address2ParamSize = 50;
        const int address3ParamSize = 50;
        const int countryParamSize = 50;
        const int cityParamSize = 50;
        const int postcodeParamSize = 50;

        private String __connectionString;

        /// <summary>
        /// Saves the specified person.
        /// </summary>
        /// <param name="person">The person.</param>
        /// <returns></returns>
        public void Save(PersonDTO person)
        {
            using (TransactionScope scope = new TransactionScope())
            using (SqlConnection conn = new SqlConnection(__connectionString))
            {                
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_addperson", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@firstname", SqlDbType.VarChar, firstnameParamSize, "firstname")).Value = person.Firstname;
                cmd.Parameters.Add(new SqlParameter("@surname", SqlDbType.VarChar, surnameParamSize, "surname")).Value = person.Surname;
                cmd.Parameters.Add(new SqlParameter("@address1", SqlDbType.VarChar, address1ParamSize, "address1")).Value = person.Address.Address1;
                cmd.Parameters.Add(new SqlParameter("@address2", SqlDbType.VarChar, address2ParamSize, "address2")).Value = person.Address.Address2;
                cmd.Parameters.Add(new SqlParameter("@address3", SqlDbType.VarChar, address3ParamSize, "address3")).Value = person.Address.Address3;
                cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.VarChar, countryParamSize, "country")).Value = person.Address.Country;
                cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.VarChar, cityParamSize, "city")).Value = person.Address.City;
                cmd.Parameters.Add(new SqlParameter("@postcode", SqlDbType.VarChar, postcodeParamSize, "postcode")).Value = person.Address.Postcode;
                person.PersonID = Convert.ToInt32(cmd.ExecuteScalar());
                scope.Complete();
            }

        }

        /// <summary>
        /// Persons the DAL.
        /// </summary>
        /// <param name="connectionString">The connection string.</param>
        public PersonDAL(String connectionString)
        {
            __connectionString = connectionString;
        }

        public List<PersonDTO> Load()
        {
            int PERSONFIRSTNAME_IDX = 0;
            int PERSONSURNAME_IDX = 1;
            int PERSONADDRESSID_IDX = 2;
            int PERSONADDRESS1_IDX = 3;
            int PERSONADDRESS2_IDX = 4;
            int PERSONADDRESS3_IDX = 5;
            int PERSONCITY_IDX = 6;
            int PERSONCOUNTRY_IDX = 7;
            int PERSONPOSTCODE_IDX = 8 ; 

            using (TransactionScope scope = new TransactionScope())
            using (SqlConnection conn = new SqlConnection(__connectionString))
            {
                conn.Open();
                SqlCommand getOrderCmd = new SqlCommand("usp_getperson", conn);
                getOrderCmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader QueryReader = getOrderCmd.ExecuteReader();
                List<PersonDTO> personDTOList = new List<PersonDTO>();

                while (QueryReader.Read())
                {
                    PersonDTO personDTO = new PersonDTO();
                    personDTO.Firstname = QueryReader.GetValue(PERSONFIRSTNAME_IDX).ToString();
                    personDTO.Surname = QueryReader.GetValue(PERSONSURNAME_IDX).ToString();
                    
                    personDTO.Address = new AddressDTO();
                    personDTO.Address.AddressID = Convert.ToInt32((QueryReader.GetValue(PERSONADDRESSID_IDX)));
                    personDTO.Address.Address1 = QueryReader.GetValue(PERSONADDRESS1_IDX).ToString();
                    personDTO.Address.Address2 = QueryReader.GetValue(PERSONADDRESS2_IDX).ToString();
                    personDTO.Address.Address3 = QueryReader.GetValue(PERSONADDRESS3_IDX).ToString();
                    personDTO.Address.City = QueryReader.GetValue(PERSONCITY_IDX).ToString();
                    personDTO.Address.Country = QueryReader.GetValue(PERSONCOUNTRY_IDX).ToString();
                    personDTO.Address.Postcode = QueryReader.GetValue(PERSONPOSTCODE_IDX).ToString();

                    personDTOList.Add(personDTO);
                }

                return personDTOList;
            }
        }
    }
}
