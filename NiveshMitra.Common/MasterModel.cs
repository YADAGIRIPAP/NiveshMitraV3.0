using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.Common
{
    public class MasterConstants
    {
        public static string GetConstitutionType = "USP_GETCONSTITUTIONTYPEMASTER";
        public static string GetElectricRegulations = "USP_GETELECTRICREGULATIONSMASTER";
        public static string GetVoltageMaster = "USP_GETVOLTAGEMASTER";
        public static string GetPowerPlantsMaster = "USP_GETPOWERPLANTSMASTER";
        public static string GetMunicipalWaterAreaMaster = "USP_GETWATERCONMUNICIPALAREA";
        public static string GetIndustryTypeMaster = "USP_GETINDUSTRYTYPEMASTER";
        public static string GetPowerRequiredRange = "USP_GETPOWERRANGEMASTER";
        public static string GetLineOfActivitymaster = "USP_GET_LineofActivity";
        public static string GetPCBCategory = "USP_GET_PCBCategory";
        public static string GetSectormaster = "USP_GET_Sector";
        public static string GetDistrcitsmaster = "USP_GET_DISTRICT";

        public static string GetTehsil = "USP_GET_TEHSIL";
        public static string GetGetBlockPanchayat = "USP_GET_BLOCKPANCHAYAT";
        public static string GetGetGramPanchayat = "USP_GET_GRAMPANCHAYAT";
        public static string GetVillagesmaster = "USP_GET_VILLAGE";

    }
    public class MasterConstType
    {
        public string ConstId { get; set; }
        public string ConstName { get; set; }

    }
    public class MasterIndustryType
    {
        public string IndustryTypeID { get; set; }
        public string IndustryType { get; set; }

    }
    public class MasterSector
    {
        public string SectorId { get; set; }
        public string SectorName { get; set; }

    }
    public class MasterLineOfActivity
    {
        public string LOAId { get; set; }
        public string LOAName { get; set; }

    }
    public class MasterPowerReq
    {
        public string PowerReqID { get; set; }
        public string PowerReqRange { get; set; }

    }
    public class MasterElecRegulations
    {
        public string ElRegID { get; set; }
        public string ElRegNumber { get; set; }

    }
    public class MasterVoltages
    {
        public string VoltageID { get; set; }
        public string VoltageValue { get; set; }

    }
    public class MasterPowerPlants
    {
        public string PowerPlantID { get; set; }
        public string PowerPlantName { get; set; }

    }
    public class MasterWATERMUNICIPAL
    {
        public string CONNECTION_TYPE_ID { get; set; }
        public string CONNECTION_TYPE_NAME { get; set; }

    }
    public class MasterDistrcits
    {
        public string DistrictId { get; set; }
        public string DistrictName { get; set; }

    }

    public class MasterTehsil
    {
        public string TehsilCode { get; set; }
        public string Tehsilname { get; set; }

    }

    public class MasterBlockPanchayat
    {
        public string BlockPanchayatCode { get; set; }
        public string BlockPanchayatName { get; set; }

    }
    public class MasterGramPanchayat
    {
        public string GramPanchayatCode { get; set; }
        public string GramPanchayatName { get; set; }

    }
    public class MasterVillages
    {
        public string VillageId { get; set; }
        public string VillageName { get; set; }

    }
}
