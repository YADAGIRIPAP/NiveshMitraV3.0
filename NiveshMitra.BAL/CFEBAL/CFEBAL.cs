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
    }
}
