using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.Common
{
    public class LoginConstants
    {
        public static string GetDeptUserPwdInfo = "sp_ValidUser_Password";
        public static string ValidateUser = "USP_VALIDATE_INVESTERUSERS";
        public static string ValidateMasterUser = "USP_VALIDATE_MASTERUSERS";

    }
    public class UserInfo
    {
        public string Userid { get; set; }
        public string Fullname { get; set; }
        public string PANno { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string MobileNo { get; set; }
        public string EntityName { get; set; }
        public string RoleId { get; set; }

    }
    public class DeptUserInfo
    {
        public string UserID { get; set; }
        public string UserName { get; set; }
        public string UserStatus { get; set; }
        public string Roleid { get; set; }
        public string Deptid { get; set; }
        public string DistrictId { get; set; }

    }
}
