using NiveshMitra.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace NiveshMitra.DAL.CommonDAL
{
    public class MasterDAL
    {
        string connstr = ConfigurationManager.ConnectionStrings["NIVESHMITHRA"].ToString();

        public List<MasterConstType> GetConstitutionType()
        {
            List<MasterConstType> lstConstMstr = new List<MasterConstType>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetConstitutionType);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var ConstType = new MasterConstType()
                        {
                            ConstId = Convert.ToString(drOptions["CONST_ID"]),
                            ConstName = Convert.ToString(drOptions["CONST_TYPE"])
                        };
                        lstConstMstr.Add(ConstType);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstConstMstr;
        }
        public List<MasterElecRegulations> GetElectricRegulations()
        {
            List<MasterElecRegulations> lstElecReg = new List<MasterElecRegulations>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetElectricRegulations);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var ElecReg = new MasterElecRegulations()
                        {
                            ElRegID = Convert.ToString(drOptions["CEA_RID"]),
                            ElRegNumber = Convert.ToString(drOptions["CEA_RNUMBER"])
                        };
                        lstElecReg.Add(ElecReg);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstElecReg;
        }

        public List<MasterVoltages> GetVoltageMaster()
        {
            List<MasterVoltages> lstvoltg = new List<MasterVoltages>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetVoltageMaster);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var Volts = new MasterVoltages()
                        {
                            VoltageID = Convert.ToString(drOptions["VOLTAGEID"]),
                            VoltageValue = Convert.ToString(drOptions["VOLTAGERANGE"])
                        };
                        lstvoltg.Add(Volts);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstvoltg;
        }
        public List<MasterPowerPlants> GetPowerPlantsMaster()
        {
            List<MasterPowerPlants> lstplants = new List<MasterPowerPlants>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetPowerPlantsMaster);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var powrplants = new MasterPowerPlants()
                        {
                            PowerPlantID = Convert.ToString(drOptions["POWERPLANTID"]),
                            PowerPlantName = Convert.ToString(drOptions["POWERPLANTNAME"])
                        };
                        lstplants.Add(powrplants);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstplants;
        }
        public List<MasterWATERMUNICIPAL> GetMunicipalareaMaster()
        {
            List<MasterWATERMUNICIPAL> lstMunicipal = new List<MasterWATERMUNICIPAL>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetMunicipalWaterAreaMaster);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var MunicipalArea = new MasterWATERMUNICIPAL()
                        {
                            CONNECTION_TYPE_ID = Convert.ToString(drOptions["CONNECTION_TYPE_ID"]),
                            CONNECTION_TYPE_NAME = Convert.ToString(drOptions["CONNECTION_TYPE_NAME"])
                        };
                        lstMunicipal.Add(MunicipalArea);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstMunicipal;
        }

        public List<MasterIndustryType> GetIndustryTypeMaster()
        {
            List<MasterIndustryType> lstplants = new List<MasterIndustryType>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetIndustryTypeMaster);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var Industry = new MasterIndustryType()
                        {
                            IndustryTypeID = Convert.ToString(drOptions["INDUSTRYTYPEID"]),
                            IndustryType = Convert.ToString(drOptions["INDUSTRYTYPE"])
                        };
                        lstplants.Add(Industry);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstplants;
        }
        public List<MasterPowerReq> GetPowerKW()
        {
            List<MasterPowerReq> lstPower = new List<MasterPowerReq>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetPowerRequiredRange);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var Power = new MasterPowerReq()
                        {
                            PowerReqID = Convert.ToString(drOptions["POWER_ID"]),
                            PowerReqRange = Convert.ToString(drOptions["POWER_KW"])
                        };
                        lstPower.Add(Power);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstPower;
        }
        public List<MasterLineOfActivity> GetLineOfActivity(string Sector)
        {
            List<MasterLineOfActivity> lstActivityMstr = new List<MasterLineOfActivity>();
            SqlDataReader drOptions = null;
            try
            {
                if (Sector == "")
                    Sector = null;
                SqlParameter[] param = new SqlParameter[]
               {
                    new SqlParameter("@Sector",Sector)
               };
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetLineOfActivitymaster, param);
                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var LineOfActivities = new MasterLineOfActivity()
                        {
                            LOAId = Convert.ToString(drOptions["intLineofActivityid"]),
                            LOAName = Convert.ToString(drOptions["LineofActivity_Name"])
                        };
                        lstActivityMstr.Add(LineOfActivities);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lstActivityMstr;
        }
        public string GetPCBCategory(string LineofActivityID)
        {
            string PCBCategory = "";
            DataSet ds = new DataSet();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@LineofactivityID",Convert.ToInt32(LineofActivityID))
                };
                ds = SqlHelper.ExecuteDataset(connstr, MasterConstants.GetPCBCategory, param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
            PCBCategory = Convert.ToString(ds.Tables[0].Rows[0]["PCBcategory"]);

            return PCBCategory;

        }
        public List<MasterSector> GetSectors()
        {
            List<MasterSector> lstSectorMstr = new List<MasterSector>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetSectormaster);
                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var sectors = new MasterSector()
                        {
                            SectorId = Convert.ToString(drOptions["SECTORID"]),
                            SectorName = Convert.ToString(drOptions["SECTORNAME"])
                        };
                        lstSectorMstr.Add(sectors);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lstSectorMstr;
        }
        public List<MasterDistrcits> GetDistrcits()
        {
            List<MasterDistrcits> lstDistrictMstr = new List<MasterDistrcits>();
            SqlDataReader drOptions = null;
            try
            {
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetDistrcitsmaster);

                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var District = new MasterDistrcits()
                        {
                            DistrictId = Convert.ToString(drOptions["DistrictCode"]),
                            DistrictName = Convert.ToString(drOptions["DistrictName"])
                        };
                        lstDistrictMstr.Add(District);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstDistrictMstr;
        }
        public List<MasterTehsil> GetTehsil(string DistrictId)
        {
            List<MasterTehsil> lstMandalMstr = new List<MasterTehsil>();
            SqlDataReader drOptions = null;
            try
            {

                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@DISTRICT",Convert.ToInt32(DistrictId))
                };
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetTehsil, param);
                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var Mandal = new MasterTehsil()
                        {
                            TehsilCode = Convert.ToString(drOptions["TehsilCode"]),
                            Tehsilname = Convert.ToString(drOptions["Tehsilname"])
                        };
                        lstMandalMstr.Add(Mandal);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstMandalMstr;
        }
        public List<MasterBlockPanchayat> GetBlockPanchayat(string TehsilCode)
        {
            List<MasterBlockPanchayat> lstMandalMstr = new List<MasterBlockPanchayat>();
            SqlDataReader drOptions = null;
            try
            {

                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@Tehsil",Convert.ToInt32(TehsilCode))
                };
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetGetBlockPanchayat, param);
                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var BLOCK = new MasterBlockPanchayat()
                        {
                            BlockPanchayatCode = Convert.ToString(drOptions["BlockPanchayatCode"]),
                            BlockPanchayatName = Convert.ToString(drOptions["BlockPanchayatName"])
                        };
                        lstMandalMstr.Add(BLOCK);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstMandalMstr;
        }
        public List<MasterGramPanchayat> GetGramPanchayat(string BlockPanchayatCode)
        {
            List<MasterGramPanchayat> lstMandalMstr = new List<MasterGramPanchayat>();
            SqlDataReader drOptions = null;
            try
            {

                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@BlockPanchayat",Convert.ToInt32(BlockPanchayatCode))
                };
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetGetGramPanchayat, param);
                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var BLOCK = new MasterGramPanchayat()
                        {
                            GramPanchayatCode = Convert.ToString(drOptions["GramPanchayatCode"]),
                            GramPanchayatName = Convert.ToString(drOptions["GramPanchayatName"])
                        };
                        lstMandalMstr.Add(BLOCK);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstMandalMstr;
        }
        public List<MasterVillages> GetVillages(string MandalId)
        {
            List<MasterVillages> lstVillagesMstr = new List<MasterVillages>();
            SqlDataReader drOptions = null;
            try
            {

                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@GramPanchayat",Convert.ToInt32(MandalId))
                };
                //drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetVillagesmaster, param);
                drOptions = SqlHelper.ExecuteReader(connstr, MasterConstants.GetVillagesmaster1, param);
                if (drOptions != null && drOptions.HasRows)
                {
                    while (drOptions.Read())
                    {
                        var Village = new MasterVillages()
                        {
                            VillageId = Convert.ToString(drOptions["villagecode"]),
                            VillageName = Convert.ToString(drOptions["villagename"])
                        };
                        lstVillagesMstr.Add(Village);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (drOptions != null)
                {
                    drOptions.Close();
                }
            }
            return lstVillagesMstr;
        }
    }
}
