using NiveshMitra.Common;
using NiveshMitra.DAL.CommonDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.BAL.CommonBAL
{
    public class MasterBAL
    {
        public MasterDAL objMasterDAL { get; } = new MasterDAL();
        public List<MasterConstType> GetConstitutionType()
        {
            return objMasterDAL.GetConstitutionType();
        }
        public List<MasterIndustryType> GetIndustryTypeMaster()
        { return objMasterDAL.GetIndustryTypeMaster(); }
        public List<MasterSector> GetSectors()
        {
            return objMasterDAL.GetSectors();
        }
        public List<MasterLineOfActivity> GetLineOfActivity(string Sector)
        {
            return objMasterDAL.GetLineOfActivity(Sector);
        }
        public string GetPCBCategory(string LineofActivityID)
        {
            return objMasterDAL.GetPCBCategory(LineofActivityID);
        }
        public List<MasterPowerReq> GetPowerKW()
        {
            return objMasterDAL.GetPowerKW();
        }
        public List<MasterElecRegulations> GetElectricRegulations()
        { return objMasterDAL.GetElectricRegulations(); }
        public List<MasterVoltages> GetVoltages()
        { return objMasterDAL.GetVoltageMaster(); }
        public List<MasterPowerPlants> GetPowerPlantsMaster()
        { return objMasterDAL.GetPowerPlantsMaster(); }
        public List<MasterWATERMUNICIPAL> GetMunicipalareaMaster()
        { return objMasterDAL.GetMunicipalareaMaster(); }

        public List<MasterDistrcits> GetDistrcits()
        {
            return objMasterDAL.GetDistrcits();
        }
        public List<MasterTehsil> GetTehsil(string DistrictId)
        {
            return objMasterDAL.GetTehsil(DistrictId);
        }
        public List<MasterBlockPanchayat> GetBlockPanchayat(string TehsilCode)
        {
            return objMasterDAL.GetBlockPanchayat(TehsilCode);
        }
        public List<MasterGramPanchayat> GetGramPanchayat(string BlockPanchayatCode)
        {
            return objMasterDAL.GetGramPanchayat(BlockPanchayatCode);
        }

        //public List<MasterVillages> GetVillages(string GramPanchayatCode)
        //{
        //    return objMasterDAL.GetVillages(GramPanchayatCode);
        //}
        public List<MasterVillages> GetVillages(string TehsilCode)
        {
            return objMasterDAL.GetVillages(TehsilCode);
        }
    }
}
