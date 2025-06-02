using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.Common
{
    public class CommonConstants
    {
        public static string LogEorror = "USP_INS_ERRORLOG";

    }
    public class CFEAttachments
    {
        public string Questionnareid { get; set; }
        public string CreatedBy { get; set; }
        public string IPAddress { get; set; }
        public string UNITID { get; set; }
        public string CFEUID { get; set; }
        public string DeptID { get; set; }
        public string ApprovalID { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public string FileDescription { get; set; }
        public string FileType { get; set; }
        public string MasterID { get; set; }
        public string QueryID { get; set; }
        public string ReferenceNo { get; set; }
        public string UploadBy { get; set; }
        public string UploadByID { get; set; }

    }
}
