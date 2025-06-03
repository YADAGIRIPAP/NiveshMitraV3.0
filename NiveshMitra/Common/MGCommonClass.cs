using NiveshMitra.BAL.CFEBAL;
using NiveshMitra.BAL.CommonBAL;
using NiveshMitra.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;

namespace NiveshMitra.Common
{
    public class MGCommonClass
    {
        public static string GetCurrentPageName()
        {
            try
            {
                string sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
                System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
                string sRet = oInfo.Name;
                return sRet;
            }
            catch (Exception exp)
            {
                throw exp;
            }
        }
        public static void LogerrorDB(Exception ex, string path, string CreatedBy)
        {
            MGCommonDAL objCommonBLL = new MGCommonDAL();
            try
            {
                string Result = objCommonBLL.LogerrorDB(ex, path, CreatedBy);
            }
            catch (Exception ee)
            {
                LogError(ee);
                LogError(ex);
            }
        }
        public static void LogError(Exception ex)
        {
            string filename = "ErrorLog_" + DateTime.Now.ToString("dd") + DateTime.Now.ToString("MM") + DateTime.Now.ToString("yyyy");

            string message = string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            message += string.Format("Message: {0}", ex.Message);
            message += Environment.NewLine;
            message += string.Format("StackTrace: {0}", ex.StackTrace);
            message += Environment.NewLine;
            message += string.Format("Source: {0}", ex.Source);
            message += Environment.NewLine;
            message += string.Format("TargetSite: {0}", ex.TargetSite.ToString());
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            string path = ConfigurationManager.AppSettings["ErrorLogpath"];
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path);
            }
            path = path + filename + ".txt";
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(message);
                writer.Close();
            }
        }
        public static void LogData(string strData)
        {
            string filename = "LogData_" + DateTime.Now.ToString("dd") + DateTime.Now.ToString("MM") + DateTime.Now.ToString("yyyy");

            string message = string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            message += string.Format("Message: {0}", strData);

            message += Environment.NewLine;
            message += "-----------------------------------------------------------";
            message += Environment.NewLine;
            string path = System.Web.HttpContext.Current.Server.MapPath("~/ErrorLog/" + filename + ".txt");
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(message);
                writer.Close();
            }
        }
        public static DataTable GetAppliedorNot(string userid, string unitid, string ceqid)
        {
            //string UnitID, ErrorMsg = "", ErrorMsg1 = "", ErrorMsg2 = "";
            //int index; Decimal TotalFee = 0;
            CFEBAL objcfebal = new CFEBAL();
            //MasterBAL mstrBAL = new MasterBAL();

            try
            {
                DataSet ds = new DataSet();

                ds = objcfebal.GetAppliedApprovalIDs(userid, unitid, ceqid, "0", "0");

                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                //Session["PageDt"] = dt;

                return dt;
                //string nextPageUrl = "";
                //nextPageUrl = MGCommonClass.GetPageUrl(dt, "Next", "26", "");
                //if (ds.Tables[0].Rows.Count > 0)
                //{
                //    Response.Redirect("~/User/CFE/CFEfire.aspx?Next=" + "N");
                //}
                //else
                //{
                //    if (Request.QueryString.Count > 0)
                //    {
                //        if (Convert.ToString(Request.QueryString[0]) == "N")
                //            Response.Redirect("~/User/CFE/CFEfire.aspx?Next=" + "N");
                //        else if (Convert.ToString(Request.QueryString[0]) == "P")
                //            Response.Redirect("~/User/CFE/lineofActivity.aspx?Previous=" + "P");
                //    }
                //}
            }
            catch (Exception ex)
            {
                //Failure.Visible = true;
                //lblmsg0.Text = ex.Message;
                //MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
                return null;
            }
        }
        public static string GetPageUrl(DataTable dt, string actionType, string currentDeptId, string currentApprovalId)
        {
            string deptId = "";
            string approvalId = "";
            string url = "";
            int getFirstNext = 0;
            //string _cdept = "";
            //string _capprovalid = "";

            int i = 1;
            foreach (DataRow row in dt.Rows)
            {

                if (getFirstNext == 1)
                {
                    string _dept = row["CFEDA_DEPTID"].ToString();
                    string _approval = row["CFEDA_APPROVALID"].ToString();

                    url = getUrl(_dept, _approval);

                    if (_dept != "26" && _approval != "54")
                    {
                        if (!string.IsNullOrEmpty(url))
                        {
                            getFirstNext = 0;
                            break;
                        }
                    }
                }


                if (currentDeptId == "26" && actionType == "Next")
                {
                    string _dept = row["CFEDA_DEPTID"].ToString();
                    string _approval = row["CFEDA_APPROVALID"].ToString();

                    url = getUrl(_dept, _approval);
                    break;
                }
                else
                {
                    if (currentDeptId == row["CFEDA_DEPTID"].ToString() && currentApprovalId == row["CFEDA_APPROVALID"].ToString())
                    {
                        if (actionType == "Next")
                        {
                            if (i < dt.Rows.Count)  //page is not last
                            {
                                getFirstNext = 1;
                                //_cdept = currentDeptId;
                                //_capprovalid = currentApprovalId;
                            }
                            else
                            {
                                getFirstNext = 0;
                            }
                        }
                    }
                }
                i++;
            }

            return url;



        }

        public static string GetPreviousPageUrl(DataTable dt, string currentDeptId, string currentApprovalId)
        {
            string url = "";
            string powerDeptId = "26";
            string powerApprovalId = "54";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string deptId = dt.Rows[i]["CFEDA_DEPTID"].ToString();
                string approvalId = dt.Rows[i]["CFEDA_APPROVALID"].ToString();

                if (deptId == currentDeptId && approvalId == currentApprovalId)
                {
                    //If this is the first page in the DataTable → Return Power
                    if (i == 0)
                    {
                        url = getUrl(powerDeptId, powerApprovalId);
                    }
                    else
                    {
                        // Else return actual previous page
                        string prevDept = dt.Rows[i - 1]["CFEDA_DEPTID"].ToString();
                        string prevApproval = dt.Rows[i - 1]["CFEDA_APPROVALID"].ToString();
                        url = getUrl(prevDept, prevApproval);
                    }

                    break;
                }
            }

            return url;
        }

        public static string getUrl(string deptId, string approvalId)
        {

            if (deptId == "3" && approvalId == "55") return "CFElabourAct1996";
            else if (deptId == "3" && approvalId == "5") return "CFElabourAct1948";
            else if (deptId == "25" && approvalId == "53") return "CFEfire";
            else if (deptId == "26" && approvalId == "54") return "CFEPowerDetails";
            else if (deptId == "19" && approvalId == "42") return "CFEWaterDetails";
            else if (deptId == "8" && approvalId == "11") return "CFEForestDetails";
            else return "";

        }




    }
}