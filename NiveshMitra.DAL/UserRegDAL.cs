using NiveshMitra.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.DAL
{
    public class UserRegDAL
    {
        string connstr = ConfigurationManager.ConnectionStrings["NIVESHMITHRA"].ToString();

        public string InsertUserRegDetails(UserRegDetails Userregdtls)
        {
            string valid = "";

            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            connection.Open();
            transaction = connection.BeginTransaction();
            try
            {
                SqlCommand com = new SqlCommand();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = LoginConstants.InsertUserRegDetails;

                com.Transaction = transaction;
                com.Connection = connection;
              
                com.Parameters.AddWithValue("@Fullname", Userregdtls.Fullname);
                com.Parameters.AddWithValue("", Userregdtls.Lastname);
                com.Parameters.AddWithValue("@EntityName", Userregdtls.CompanyName);
                com.Parameters.AddWithValue("@emailid", Userregdtls.Email);
                com.Parameters.AddWithValue("@mobile", Userregdtls.MobileNo);
               // com.Parameters.AddWithValue("@pwd", Userregdtls.Password);
                com.Parameters.AddWithValue("@PanNo", Userregdtls.PANno);
                com.Parameters.AddWithValue("@dob", Userregdtls.DateofBirth);
                com.Parameters.AddWithValue("@Ipaddress", Userregdtls.IPAddress);
                com.Parameters.Add("@RESULT", SqlDbType.VarChar, 100);
                com.Parameters["@RESULT"].Direction = ParameterDirection.Output;
                com.ExecuteNonQuery();

                valid = com.Parameters["@RESULT"].Value.ToString();


                //valid = Convert.ToString(com.ExecuteNonQuery());



                transaction.Commit();
                connection.Close();
            }

            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
            return valid;
        }

    }
}
