using NiveshMitra.Common;
using NiveshMitra.DAL.CommonDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.BAL.CommonBAL
{
    public class LoginBAL
    {
        public LoginDAL objLoginDAL { get; } = new LoginDAL();
        public DataSet GetDeptUserPwdInfo(string UserName, string Type)
        {
            return objLoginDAL.GetDeptUserPwdInfo(UserName, Type);
        }
        public UserInfo GetUserInfo(string UserName, string Password, string IPAdrs)
        {
            return objLoginDAL.GetUserInfo(UserName, Password, IPAdrs);
        }
        public DeptUserInfo GetDeptUserInfo(string UserName, string Password, string IPAdrs)
        {
            return objLoginDAL.GetDeptUserInfo(UserName, Password, IPAdrs);
        }
    }
}
