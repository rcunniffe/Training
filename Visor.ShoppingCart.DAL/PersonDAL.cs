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
        const int FIRSTNAMEPARAMSIZE = 50;
        const int SURNAMEPARAMSIZE = 50;
        const int ADDRESS1PARAMSIZE = 50;
        const int ADDRESS2PARAMSIZE = 50;
        const int ADDRESS3PARAMSIZE = 50;
        const int COUNTRYPARAMSIZE = 50;
        const int CITYPARAMSIZE = 50;
        const int POSTCODEPARAMSIZE = 50;

        private String __connectionString;

        /// <summary>
        /// Saves the specified person.
        /// </summary>
        /// <param name="person">The person.</param>
        public void Save(PersonDTO person)
        {           
            using (SqlConnection conn = new SqlConnection(__connectionString))
            {                
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_addperson", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@firstname", SqlDbType.VarChar, FIRSTNAMEPARAMSIZE, "firstname")).Value = person.Firstname;
                cmd.Parameters.Add(new SqlParameter("@surname", SqlDbType.VarChar, SURNAMEPARAMSIZE, "surname")).Value = person.Surname;
                cmd.Parameters.Add(new SqlParameter("@address1", SqlDbType.VarChar, ADDRESS1PARAMSIZE, "address1")).Value = person.Address.Address1;
                cmd.Parameters.Add(new SqlParameter("@address2", SqlDbType.VarChar, ADDRESS2PARAMSIZE, "address2")).Value = person.Address.Address2;
                cmd.Parameters.Add(new SqlParameter("@address3", SqlDbType.VarChar, ADDRESS3PARAMSIZE, "address3")).Value = person.Address.Address3;
                cmd.Parameters.Add(new SqlParameter("@country", SqlDbType.VarChar, COUNTRYPARAMSIZE, "country")).Value = person.Address.Country;
                cmd.Parameters.Add(new SqlParameter("@city", SqlDbType.VarChar, CITYPARAMSIZE, "city")).Value = person.Address.City;
                cmd.Parameters.Add(new SqlParameter("@postcode", SqlDbType.VarChar, POSTCODEPARAMSIZE, "postcode")).Value = person.Address.Postcode;
                person.PersonID = Convert.ToInt32(cmd.ExecuteScalar());                
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

        /// <summary>
        /// Loads this instance.
        /// </summary>
        /// <returns></returns>
        public List<PersonDTO> Load()
        {
            int PERSON_PERSONID_IDX = 0;
            int PERSONFIRSTNAME_IDX = 1;
            int PERSONSURNAME_IDX = 2;
            int PERSONADDRESSID_IDX = 3;
            int PERSONADDRESS1_IDX = 4;
            int PERSONADDRESS2_IDX = 5;
            int PERSONADDRESS3_IDX = 6;
            int PERSONCITY_IDX = 7;
            int PERSONCOUNTRY_IDX = 8;
            int PERSONPOSTCODE_IDX = 9; 

            using (SqlConnection conn = new SqlConnection(__connectionString))
            {
                conn.Open();
                SqlCommand getOrderCmd = new SqlCommand("usp_getperson", conn);
                getOrderCmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader queryReader = getOrderCmd.ExecuteReader();
                List<PersonDTO> personDTOList = new List<PersonDTO>();

                while (queryReader.Read())
                {
                    PersonDTO personDTO = new PersonDTO();
                    personDTO.PersonID = queryReader.GetInt32(PERSON_PERSONID_IDX);
                    personDTO.Firstname = queryReader.GetString(PERSONFIRSTNAME_IDX).ToString();
                    personDTO.Surname = queryReader.GetString(PERSONSURNAME_IDX).ToString();                    
                    personDTO.Address = new AddressDTO();
                    personDTO.Address.AddressID = (queryReader.GetInt32(PERSONADDRESSID_IDX));
                    personDTO.Address.Address1 = queryReader.GetString(PERSONADDRESS1_IDX).ToString();
                    personDTO.Address.Address2 = queryReader.GetString(PERSONADDRESS2_IDX).ToString();
                    personDTO.Address.Address3 = queryReader.GetString(PERSONADDRESS3_IDX).ToString();
                    personDTO.Address.City = queryReader.GetString(PERSONCITY_IDX).ToString();
                    personDTO.Address.Country = queryReader.GetString(PERSONCOUNTRY_IDX).ToString();
                    personDTO.Address.Postcode = queryReader.GetString(PERSONPOSTCODE_IDX).ToString();
                    personDTOList.Add(personDTO);
                }
                return personDTOList;
            }
        }
    }
}
