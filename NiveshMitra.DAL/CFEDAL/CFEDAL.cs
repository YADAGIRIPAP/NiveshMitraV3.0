using NiveshMitra.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace NiveshMitra.DAL.CFEDAL
{
    public class CFEDAL
    {
        string connstr = ConfigurationManager.ConnectionStrings["NIVESHMITHRA"].ToString();
        public DataSet GetCFEapplications(string userid, string UnitID)
        {
            DataSet ds = new DataSet();
            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            connection.Open();
            transaction = connection.BeginTransaction();
            try
            {
                SqlDataAdapter da;
                da = new SqlDataAdapter(CFEConstants.CFEapplications, connection);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.CommandText = CFEConstants.CFEapplications;

                da.SelectCommand.Transaction = transaction;
                da.SelectCommand.Connection = connection;

                da.SelectCommand.Parameters.AddWithValue("@INVESTERID", Convert.ToInt32(userid));
                da.SelectCommand.Parameters.AddWithValue("@UNITID", UnitID);

                da.Fill(ds);
                transaction.Commit();
                return ds;
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }
        public string InsertQuestionnaireCFE(CFEQuestionnaireDet objCFEQsnaire)
        {
            string Result = "";

            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;

            try
            {

                connection.Open();
                transaction = connection.BeginTransaction();

                SqlCommand com = new SqlCommand();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = CFEConstants.InsertCFEQuestionnaire;

                com.Transaction = transaction;
                com.Connection = connection;


                com.Parameters.AddWithValue("@CFEQDID", objCFEQsnaire.CFEQDID);
                //com.Parameters.AddWithValue("@CFEQD_UNITID", Convert.ToInt32(objCFEQsnaire.UNITID));
                com.Parameters.Add("@CFEQD_UNITID", SqlDbType.Int).Value = string.IsNullOrWhiteSpace(objCFEQsnaire.UNITID) ? (object)DBNull.Value : int.Parse(objCFEQsnaire.UNITID);
                com.Parameters.AddWithValue("@CFEQD_PREREGUIDNO", objCFEQsnaire.PREREGUIDNO);
                com.Parameters.AddWithValue("@CFEQD_APPLSTATUS", 2);
                com.Parameters.AddWithValue("@CFEQD_COMPANYNAME", objCFEQsnaire.CompanyName);
                com.Parameters.AddWithValue("@CFEQD_COMPANYTYPE", Convert.ToInt32(objCFEQsnaire.CompanyType));
                com.Parameters.AddWithValue("@CFEQD_PROPOSALFOR", objCFEQsnaire.ProposalFor);
                com.Parameters.AddWithValue("@CFEQD_MIDCLLAND", Convert.ToInt32(objCFEQsnaire.LandFromMIDCL));
                com.Parameters.AddWithValue("@CFEQD_PROPDISTRICTID", Convert.ToInt32(objCFEQsnaire.PropLocDitrictID));
                com.Parameters.AddWithValue("@CFEQD_PROPMANDALID", Convert.ToInt32(objCFEQsnaire.PropLocMandalID));
                com.Parameters.AddWithValue("@CFEQD_PROPVILLAGEID", Convert.ToInt32(objCFEQsnaire.PropLocVillageID));
                com.Parameters.AddWithValue("@CFEQD_TOTALEXTENTLAND", Convert.ToDecimal(objCFEQsnaire.ExtentofLand));
                com.Parameters.AddWithValue("@CFEQD_BUILTUPAREA", Convert.ToDecimal(objCFEQsnaire.BuiltUpArea));
                com.Parameters.AddWithValue("@CFEQD_SECTOR", objCFEQsnaire.SectorName);
                com.Parameters.AddWithValue("@CFEQD_LOAID", Convert.ToInt32(objCFEQsnaire.Lineofacitivityid));
                com.Parameters.AddWithValue("@CFEQD_PCBCATEGORY", objCFEQsnaire.PCBCategory);
                com.Parameters.AddWithValue("@CFEQD_INDUSTRYTYPE", objCFEQsnaire.NatureofActivity);
                com.Parameters.AddWithValue("@CFEQD_UNTLOCATION", objCFEQsnaire.UnitLocation);
                com.Parameters.AddWithValue("@CFEQD_PROPEMP", Convert.ToInt32(objCFEQsnaire.PropEmployment));
                com.Parameters.AddWithValue("@CFEQD_LANDVALUE", Convert.ToDecimal(objCFEQsnaire.LandValue));
                com.Parameters.AddWithValue("@CFEQD_BUILDINGVALUE", Convert.ToDecimal(objCFEQsnaire.BuildingValue));
                com.Parameters.AddWithValue("@CFEQD_PMCOST", Convert.ToDecimal(objCFEQsnaire.PlantnMachineryCost));
                com.Parameters.AddWithValue("@CFEQD_EXPECTEDTURNOVER", Convert.ToDecimal(objCFEQsnaire.ExpectedTurnover));
                com.Parameters.AddWithValue("@CFEQD_TOTALPROJCOST", Convert.ToDecimal(objCFEQsnaire.TotalProjCost));
                com.Parameters.AddWithValue("@CFEQD_ENTERPRISETYPE", objCFEQsnaire.EnterpriseCategory);
                com.Parameters.AddWithValue("@CFEQD_POWERREQKW", Convert.ToInt32(objCFEQsnaire.PowerReqKW));
                com.Parameters.AddWithValue("@CFEQD_GENREQ", objCFEQsnaire.GeneratorReq);
                com.Parameters.AddWithValue("@CFEQD_BUILDINGHT", objCFEQsnaire.BuildingHeight);
                com.Parameters.AddWithValue("@CFEQD_STORINGRSDS", objCFEQsnaire.StoringRSDS);
                com.Parameters.AddWithValue("@CFEQD_MANFEXPLOSIVES", objCFEQsnaire.ManfExplosives);
                com.Parameters.AddWithValue("@CFEQD_MANFPETROL", objCFEQsnaire.ManfPetroleum);
                com.Parameters.AddWithValue("@CFEQD_RDCTNGREQ", objCFEQsnaire.RdCtngPermission);
                com.Parameters.AddWithValue("@CFEQD_NONENCMCERTREQ", objCFEQsnaire.NonEncmbrnceCert);
                com.Parameters.AddWithValue("@CFEQD_COMMTAXREQ", objCFEQsnaire.CommTaxApproval);
                com.Parameters.AddWithValue("@CFEQD_USINGHTMETER", objCFEQsnaire.HTMeteruse);
                com.Parameters.AddWithValue("@CFEQD_CEIGREGULATION", objCFEQsnaire.CEARegulationID);
                com.Parameters.AddWithValue("@CFEQD_POWERPLANT", objCFEQsnaire.PowerPlantID);
                com.Parameters.AddWithValue("@CFEQD_AGGRCAPACITY", objCFEQsnaire.AggCapacity);
                com.Parameters.AddWithValue("@CFEQD_VOLTAGERATING", objCFEQsnaire.VoltageRating);
                com.Parameters.AddWithValue("@CFEQD_TREESFELLING", objCFEQsnaire.TreesFelling);
                com.Parameters.AddWithValue("@CFEQD_NOOFTREES", objCFEQsnaire.NoofTrees);
                com.Parameters.AddWithValue("@CFEQD_NONFORSTLANDCERTREQ", objCFEQsnaire.NonForstLandCert);
                com.Parameters.AddWithValue("@CFEQD_FORSTDISTLTRREQ", objCFEQsnaire.ForstDistLetr);
                com.Parameters.AddWithValue("@CFEQD_WATERBODYVICINITY", objCFEQsnaire.NearWaterBodyLocation);
                com.Parameters.AddWithValue("@CFEQD_BOREWELLEXISTS", objCFEQsnaire.ExistingBoreWell);
                com.Parameters.AddWithValue("@CFEQD_LABOURACT1970", objCFEQsnaire.LabourAct1970);
                com.Parameters.AddWithValue("@CFEQD_NOOFWORKERS1970", objCFEQsnaire.LabourAct1970_Workers);
                com.Parameters.AddWithValue("@CFEQD_LABOURACT1979", objCFEQsnaire.LabourAct1979);
                com.Parameters.AddWithValue("@CFEQD_NOOFWORKERS1979", objCFEQsnaire.LabourAct1979_Workers);
                com.Parameters.AddWithValue("@CFEQD_LABOURACT1996", objCFEQsnaire.LabourAct1996);
                com.Parameters.AddWithValue("@CFEQD_BUILDINGWORKS1996", objCFEQsnaire.LabourAct1996_10Workers);
                com.Parameters.AddWithValue("@CFEQD_NOOFWORKERS1996", objCFEQsnaire.LabourAct1996_Workers);
                com.Parameters.AddWithValue("@CFEQD_CONTRLABOURACT", objCFEQsnaire.ContractLabourAct);
                com.Parameters.AddWithValue("@CFEQD_NOOFWORKERSCONTR", objCFEQsnaire.ContractLabourAct_Workers);
                com.Parameters.AddWithValue("@CFEQD_CONTRLABOURACT1970", objCFEQsnaire.ContractLabourAct1970);
                com.Parameters.AddWithValue("@CFEQD_NOOFWORKERSCONTR1970", objCFEQsnaire.ContractLabourAct1970_Workers);
                com.Parameters.AddWithValue("@CFEQD_CREATEDBY", Convert.ToInt32(objCFEQsnaire.CreatedBy));
                com.Parameters.AddWithValue("@CFEQD_CREATEDBYIP", objCFEQsnaire.IPAddress);

                com.Parameters.AddWithValue("@CFEQD_NOCGROUNDWATER", objCFEQsnaire.GrandWaterConnection);
                com.Parameters.AddWithValue("@CFEQD_NONAVAILABILITYCERT", objCFEQsnaire.WaterSupplyAgency);
                com.Parameters.AddWithValue("@CFEQD_PERRIVERPUBLICTANKERS", objCFEQsnaire.RiverPublicTanker);
                com.Parameters.AddWithValue("@CFEQD_MUNICIPALAREAWATERCON", objCFEQsnaire.MuncipalAreawater);
                com.Parameters.AddWithValue("@CFEQD_WATERCONNONMUNICIPALURBAN", objCFEQsnaire.NonMuncipalAreaUrban);
                com.Parameters.AddWithValue("@CFEQD_WATERMUNICIPALAREA", objCFEQsnaire.MunicipalArea);
                com.Parameters.AddWithValue("@CFEQD_DRAWINGPLANAPPROVAL", objCFEQsnaire.DrawingPlan);

                com.Parameters.Add("@RESULT", SqlDbType.VarChar, 100);
                com.Parameters["@RESULT"].Direction = ParameterDirection.Output;
                com.ExecuteNonQuery();

                Result = com.Parameters["@RESULT"].Value.ToString();
                transaction.Commit();
                connection.Close();


            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
            return Result;
        }
        public string InsertCFEQuestionnaireApprovals(CFEQuestionnaireDet objCFEQsnaire)
        {
            string Result = "";

            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            //connection.Open();
            //transaction = connection.BeginTransaction();
            try
            {

                connection.Open();
                transaction = connection.BeginTransaction();

                SqlCommand com = new SqlCommand();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = CFEConstants.InsertCFEQuestionnaireApprovals;

                com.Transaction = transaction;
                com.Connection = connection;

                com.Parameters.AddWithValue("@CFEQDID", Convert.ToInt32(objCFEQsnaire.CFEQDID));
                com.Parameters.AddWithValue("@CFEQA_DEPTID", Convert.ToInt32(objCFEQsnaire.DeptID));
                com.Parameters.AddWithValue("@CFEQA_APPROVALID", Convert.ToInt32(objCFEQsnaire.ApprovalID));
                com.Parameters.AddWithValue("@CFEQA_APPROVALFEE", Convert.ToDecimal(objCFEQsnaire.ApprovalFee));
                com.Parameters.AddWithValue("@CFEQA_CREATEDBY", Convert.ToInt32(objCFEQsnaire.CreatedBy));
                com.Parameters.AddWithValue("@CFEQA_CREATEDBYIP", objCFEQsnaire.IPAddress);
                com.Parameters.AddWithValue("@CFEQA_UNITID", Convert.ToInt32(objCFEQsnaire.UNITID));


                int QAID = Convert.ToInt32(com.ExecuteScalar());
                transaction.Commit();
                connection.Close();
                Result = Convert.ToString(QAID);



            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
            return Result;
        }
        public string DeleteDepartmentApprovals(CFEQuestionnaireDet objCFEQsnaire)
        {
            string Result = "";

            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            try
            {

                connection.Open();
                transaction = connection.BeginTransaction();

                SqlCommand com = new SqlCommand();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = CFEConstants.DeleteDepartmentApprovals;

                com.Transaction = transaction;
                com.Connection = connection;

                com.Parameters.AddWithValue("@CFEQDID", Convert.ToInt32(objCFEQsnaire.CFEQDID));
                com.Parameters.AddWithValue("@CFEQA_CREATEDBY", Convert.ToInt32(objCFEQsnaire.CreatedBy));
                com.Parameters.AddWithValue("@CFEQA_UNITID", Convert.ToInt32(objCFEQsnaire.UNITID));

                int QAID = Convert.ToInt32(com.ExecuteScalar());
                transaction.Commit();
                connection.Close();
                Result = Convert.ToString(QAID);
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
            return Result;
        }
        public string GETANNUALTURNOVER(string PMAMOUNT, string ANNUALTURNOVER)
        {

            string Result = "";
            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            try
            {
                connection.Open();
                transaction = connection.BeginTransaction();

                SqlCommand com = new SqlCommand();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = CFEConstants.GETANNUALTURNOVER;

                com.Transaction = transaction;
                com.Connection = connection;



                com.Parameters.AddWithValue("@PMVALUE", Convert.ToDecimal(PMAMOUNT));
                com.Parameters.AddWithValue("@AnnualTurnoverAmount", Convert.ToDecimal(ANNUALTURNOVER));


                com.Parameters.Add("@RESULT", SqlDbType.VarChar, 100);
                com.Parameters["@RESULT"].Direction = ParameterDirection.Output;
                com.ExecuteNonQuery();

                Result = com.Parameters["@RESULT"].Value.ToString();
                transaction.Commit();
                connection.Close();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
            return Result;
        }
        public string CFEENTERPRISETYPE(string ANNUALTURNOVER)
        {

            string Result = "";
            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            try
            {
                connection.Open();
                transaction = connection.BeginTransaction();

                SqlCommand com = new SqlCommand();
                com.CommandType = CommandType.StoredProcedure;
                //com.CommandText = CFEConstants.CFEENTERPRISETYPEDET;
                com.CommandText = CFEConstants.CFEENTERPRISETYPEDET1;

                com.Transaction = transaction;
                com.Connection = connection;


                com.Parameters.AddWithValue("@AnnualTurnoverAmount", Convert.ToDecimal(ANNUALTURNOVER));


                com.Parameters.Add("@RESULT", SqlDbType.VarChar, 100);
                com.Parameters["@RESULT"].Direction = ParameterDirection.Output;
                com.ExecuteNonQuery();

                Result = com.Parameters["@RESULT"].Value.ToString();
                transaction.Commit();
                connection.Close();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
            return Result;
        }
        public DataSet RetrieveQuestionnaireDetails(string userid, string UnitID)
        {
            DataSet ds = new DataSet();
            SqlConnection connection = new SqlConnection(connstr);
            SqlTransaction transaction = null;
            connection.Open();
            transaction = connection.BeginTransaction();
            try
            {
                SqlDataAdapter da;
                da = new SqlDataAdapter(CFEConstants.RetrieveQuestionnaire, connection);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.CommandText = CFEConstants.RetrieveQuestionnaire;

                da.SelectCommand.Transaction = transaction;
                da.SelectCommand.Connection = connection;

                da.SelectCommand.Parameters.AddWithValue("@CREATEDBY", Convert.ToInt32(userid));
                //da.SelectCommand.Parameters.AddWithValue("@UNITID", Convert.ToInt32(UnitID));
                da.SelectCommand.Parameters.Add("@UNITID", SqlDbType.Int).Value =string.IsNullOrWhiteSpace(UnitID) ? (object)DBNull.Value : int.Parse(UnitID);
                da.Fill(ds);
                transaction.Commit();
                return ds;
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }

    }
}
