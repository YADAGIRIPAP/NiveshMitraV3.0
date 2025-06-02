using NiveshMitra.BAL.CommonBAL;
using NiveshMitra.Common;
using NiveshMitra.DAL.CFEDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.BAL.CFEBAL
{
    public class CFEBAL
    {
        public CFEQuestionnaireDet objCFEQ { get; } = new CFEQuestionnaireDet();
        public CFEDAL objCFEDAL { get; } = new CFEDAL();
        public DataSet GetCFEapplications(string USERID, string UnitID)
        {
            return objCFEDAL.GetCFEapplications(USERID, UnitID);
        }
        public string InsertQuestionnaireCFE(CFEQuestionnaireDet objCFEQsnaire)
        {
            return objCFEDAL.InsertQuestionnaireCFE(objCFEQsnaire);
        }
        public string InsertCFEQuestionnaireApprovals(CFEQuestionnaireDet objCFEQsnaire)
        {
            return objCFEDAL.InsertCFEQuestionnaireApprovals(objCFEQsnaire);
        }
        public string DeleteDepartmentApprovals(CFEQuestionnaireDet objCFEQsnaire)
        {
            return objCFEDAL.DeleteDepartmentApprovals(objCFEQsnaire);
        }
        public string GETANNUALTURNOVER(string PMAMOUNT, string ANNUALTURNOVER)
        {
            return objCFEDAL.GETANNUALTURNOVER(PMAMOUNT, ANNUALTURNOVER);
        }
        public string CFEENTERPRISETYPE(string ANNUALTURNOVER)
        {
            return objCFEDAL.CFEENTERPRISETYPE(ANNUALTURNOVER);
        }
        public DataSet RetrieveQuestionnaireDetails(string userid, string UnitID)
        { return objCFEDAL.RetrieveQuestionnaireDetails(userid, UnitID); }

        public DataSet GetApprovalsReqFromTable(CFEQuestionnaireDet objCFEQsnaire)
        {
            return objCFEDAL.GetApprovalsReqFromTable(objCFEQsnaire);
        }

        public string InsertCFEDepartmentApprovals(CFEQuestionnaireDet objCFEQsnaire)
        {
            return objCFEDAL.InsertCFEDepartmentApprovals(objCFEQsnaire);
        }
        public DataSet GetAppliedApprovalIDs(string userid, string UNITID, string QusestionnaireID, string DeptID, string ApprovalID)
        { return objCFEDAL.GetAppliedApprovalIDs(userid, UNITID, QusestionnaireID, DeptID, ApprovalID); }
        public DataTable GetApprovalsReqWithFee(CFEQuestionnaireDet objCFEQ)
        { return objCFEDAL.GetApprovalsReqWithFee(objCFEQ); }

        public string InsertCFEAttachments(CFEAttachments objAttach)
        {
            return objCFEDAL.InsertCFEAttachments(objAttach);
        }
        public DataSet GetCFEAlreadyObtainedApprovals(string userid, string UnitID)
        { return objCFEDAL.GetCFEAlreadyObtainedApprovals(userid, UnitID); }
    }
}
