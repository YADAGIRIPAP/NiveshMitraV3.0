using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using NiveshMitra.Common;

namespace NiveshMitra.DAL.CommonDAL
{
    public class LoginDAL
    {
        string connstr = ConfigurationManager.ConnectionStrings["NIVESHMITHRA"].ToString();
        public DataSet GetDeptUserPwdInfo(string EmailId, string Type)
        {
            DataSet ds = new DataSet();
            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            connection.Open();
            transaction = connection.BeginTransaction();

            try
            {
                SqlDataAdapter da;
                da = new SqlDataAdapter(LoginConstants.GetDeptUserPwdInfo, connection);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.CommandText = LoginConstants.GetDeptUserPwdInfo;

                da.SelectCommand.Transaction = transaction;
                da.SelectCommand.Connection = connection;

                da.SelectCommand.Parameters.AddWithValue("@EMAILID", EmailId);
                da.SelectCommand.Parameters.AddWithValue("@TYPE", Type);
                da.Fill(ds);
                transaction.Commit();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }
        public UserInfo GetUserInfo(string UserName, string Password, string IPAdrs)
        {
            SqlDataReader objSqlDataReader = null;
            var ObjUserInf = new UserInfo();

            try
            {

                SqlParameter[] param = new SqlParameter[] {
                new SqlParameter("@emailid",UserName),
                new SqlParameter("@PWD",Password),
                new SqlParameter("@IPADDRESS",IPAdrs)
                };
                objSqlDataReader = SqlHelper.ExecuteReader(connstr, LoginConstants.ValidateUser, param);

                if (objSqlDataReader != null && objSqlDataReader.HasRows)
                {
                    //SELECT InvesterId, EntityName, Fullname, emailid FROM Insvester_Login WHERE emailid = @emailid AND pwd = @PWD

                    while (objSqlDataReader.Read())
                    {
                        ObjUserInf.Userid = objSqlDataReader["InvesterId"] == null ? "" : Convert.ToString(objSqlDataReader["InvesterId"]);
                        ObjUserInf.Fullname = objSqlDataReader["Fullname"] == null ? "" : Convert.ToString(objSqlDataReader["Fullname"]);
                        ObjUserInf.Email = objSqlDataReader["emailid"] == null ? "" : Convert.ToString(objSqlDataReader["emailid"]);
                        ObjUserInf.EntityName = objSqlDataReader["EntityName"] == null ? "" : Convert.ToString(objSqlDataReader["EntityName"]);
                        ObjUserInf.PANno = objSqlDataReader["PanNo"] == null ? "" : Convert.ToString(objSqlDataReader["PanNo"]);
                        ObjUserInf.RoleId = objSqlDataReader["ROLEID"] == null ? "" : Convert.ToString(objSqlDataReader["ROLEID"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (objSqlDataReader != null && !objSqlDataReader.IsClosed)
                {
                    objSqlDataReader.Close();
                }
            }
            return ObjUserInf;
        }
        public DeptUserInfo GetDeptUserInfo(string UserName, string Password, string IPAdrs)
        {
            SqlDataReader objSqlDataReader = null;
            var ObjDeptUserInfo = new DeptUserInfo();

            try
            {

                SqlParameter[] param = new SqlParameter[] {
                new SqlParameter("@UserName",UserName),
                new SqlParameter("@PWD",Password),
                new SqlParameter("@IPADDRESS",IPAdrs)
                };
                objSqlDataReader = SqlHelper.ExecuteReader(connstr, LoginConstants.ValidateMasterUser, param);

                if (objSqlDataReader != null && objSqlDataReader.HasRows)
                {
                    //SELECT InvesterId, EntityName, Fullname, emailid FROM Insvester_Login WHERE emailid = @emailid AND pwd = @PWD

                    while (objSqlDataReader.Read())
                    {
                        ObjDeptUserInfo.UserID = objSqlDataReader["USERID"] == null ? "" : Convert.ToString(objSqlDataReader["USERID"]);
                        ObjDeptUserInfo.UserName = objSqlDataReader["USERNAME"] == null ? "" : Convert.ToString(objSqlDataReader["USERNAME"]);
                        ObjDeptUserInfo.UserStatus = objSqlDataReader["USERSTATUS"] == null ? "" : Convert.ToString(objSqlDataReader["USERSTATUS"]);
                        ObjDeptUserInfo.Roleid = objSqlDataReader["Roleid"] == null ? "" : Convert.ToString(objSqlDataReader["Roleid"]);
                        ObjDeptUserInfo.Deptid = objSqlDataReader["Deptid"] == null ? "" : Convert.ToString(objSqlDataReader["Deptid"]);
                        //ObjDeptUserInfo.EntityName = objSqlDataReader["EntityName"] == null ? "" : Convert.ToString(objSqlDataReader["EntityName"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (objSqlDataReader != null && !objSqlDataReader.IsClosed)
                {
                    objSqlDataReader.Close();
                }
            }
            return ObjDeptUserInfo;
        }
    }
}
