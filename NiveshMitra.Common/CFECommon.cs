using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.Common
{
    public class CFEConstants
    {
        public static string InsertCFEQuestionnaire = "USP_INSCFEQUESTIONNAREDETAILS";
        public static string InsertCFEQuestionnaireApprovals = "USP_INSCFEREQUIREDAPPROVALS";
        public static string DeleteDepartmentApprovals = "USP_DELETECFEDEPARTMENTAPPROVALS";
        public static string GETANNUALTURNOVER = "USP_CHECK_ANNUALTURNOVER";
        public static string CFEENTERPRISETYPEDET = "USP_GETENTERPRISETYPEDET";
        public static string RetrieveQuestionnaire = "USP_RETRIEVECFEQUESFILLEDDATA";


    }
    public class CFEQuestionnaireDet
    {
        public string UNITID { get; set; }
        public string PREREGUIDNO { get; set; }
        public string CFEQDID { get; set; }
        public string CreatedBy { get; set; }
        public string ApprovalID { get; set; }
        public string DeptID { get; set; }
        public string ApprovalFee { get; set; }
        public string IsOffline { get; set; }
        public string IPAddress { get; set; }
        public string CompanyName { get; set; }
        public string CompanyType { get; set; }
        public string ProposalFor { get; set; }
        public string LandFromMIDCL { get; set; }
        public string PropLocDitrictID { get; set; }
        public string PropLocMandalID { get; set; }
        public string PropLocVillageID { get; set; }
        public string ExtentofLand { get; set; }
        public string Acres { get; set; }
        public string Gunthas { get; set; }
        public string Square_Meters { get; set; }
        public string BuiltUpArea { get; set; }
        public string SectorName { get; set; }
        public string Lineofacitivityid { get; set; }
        public string PCBCategory { get; set; }
        public string NatureofActivity { get; set; }
        public string UnitLocation { get; set; }

        public string PropEmployment { get; set; }
        public string ProjectCost { get; set; }
        public string LandValue { get; set; }
        public string BuildingValue { get; set; }
        public string PlantnMachineryCost { get; set; }
        public string ExpectedTurnover { get; set; }
        public string TotalProjCost { get; set; }
        public string EnterpriseCategory { get; set; }
        public string PowerReqKW { get; set; }
        public string GeneratorReq { get; set; }
        public string BuildingHeight { get; set; }
        public string StoringRSDS { get; set; }

        public string ManfExplosives { get; set; }
        public string ManfPetroleum { get; set; }
        public string RdCtngPermission { get; set; }
        public string NonEncmbrnceCert { get; set; }
        public string CommTaxApproval { get; set; }
        public string HTMeteruse { get; set; }
        public string CEARegulationID { get; set; }
        public string PowerPlantID { get; set; }
        public string AggCapacity { get; set; }
        public string VoltageRating { get; set; }
        public string TreesFelling { get; set; }
        public string NoofTrees { get; set; }
        public string NonForstLandCert { get; set; }
        public string ForstDistLetr { get; set; }

        public string NearWaterBodyLocation { get; set; }
        public string ExistingBoreWell { get; set; }

        public string LabourAct1970 { get; set; }
        public string LabourAct1970_Workers { get; set; }
        public string LabourAct1979 { get; set; }
        public string LabourAct1979_Workers { get; set; }
        public string LabourAct1996 { get; set; }
        public string LabourAct1996_10Workers { get; set; }
        public string LabourAct1996_Workers { get; set; }

        public string ContractLabourAct { get; set; }
        public string ContractLabourAct_Workers { get; set; }
        public string ContractLabourAct1970 { get; set; }
        public string ContractLabourAct1970_Workers { get; set; }
        public string GrandWaterConnection { get; set; }
        public string WaterSupplyAgency { get; set; }
        public string RiverPublicTanker { get; set; }
        public string MuncipalAreawater { get; set; }
        public string NonMuncipalAreaUrban { get; set; }
        public string Investment { get; set; }
        public string MunicipalArea { get; set; }
        public string DrawingPlan { get; set; }
    }
}
