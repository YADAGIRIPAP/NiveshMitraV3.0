using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NiveshMitra.BAL;
using NiveshMitra.BAL.CFEBAL;
using NiveshMitra.BAL.CommonBAL;
using System.Data;
using NiveshMitra.Common;

namespace NiveshMitra.User.CFE
{
    public partial class CFElabourAct1996 : System.Web.UI.Page
    {
        string UnitID, ErrorMsg = "", ErrorMsg1 = "", ErrorMsg2 = "";
        int index; Decimal TotalFee = 0;

       

        CFEBAL objcfebal = new CFEBAL();

        protected void gvContractors_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

       

        MasterBAL mstrBAL = new MasterBAL();

        

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["UserInfo"] != null)
                {
                    var ObjUserInfo = new UserInfo();
                    if (Session["UserInfo"] != null && Session["UserInfo"].ToString() != "")
                    {
                        ObjUserInfo = (UserInfo)Session["UserInfo"];
                    }
                    if (hdnUserID.Value == "")
                    {
                        hdnUserID.Value = ObjUserInfo.Userid;
                    }
                    if (Convert.ToString(Session["CFEUNITID"]) != "")
                    { UnitID = Convert.ToString(Session["CFEUNITID"]); }
                    else
                    {
                        //string newurl = "~/User/CFE/CFEUserDashboard.aspx";
                        //Response.Redirect(newurl);
                    }
                    Page.MaintainScrollPositionOnPostBack = true;
                    if (!IsPostBack)
                    {
                        BindContractorGrid();
                    }
                }


            }
            catch (Exception ex)
            {
                Failure.Visible = true;
                lblmsg.Text = ex.Message;
                //MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }
        private void BindContractorGrid()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SlNo");
            dt.Columns.Add("Contractor");
            dt.Columns.Add("Address");
            dt.Columns.Add("Mobile");
            dt.Columns.Add("WorkNature");
            dt.Columns.Add("MaxWorkers");
            dt.Columns.Add("StartDate");
            dt.Columns.Add("EndDate");
            dt.Columns.Add("Manufacturing");

            // 🔽 Sample Data Rows
            dt.Rows.Add("1", "ABC Contractors", "123 Market Street, Lucknow", "9876543210", "Plumbing", "10", "2024-06-01", "2024-12-31", "Fitting, Welding");
            dt.Rows.Add("2", "XYZ Builders", "456 Industrial Road, Kanpur", "8765432109", "Carpentry", "15", "2024-07-15", "2025-01-30", "Woodwork, Joinery");

            gvContractors.DataSource = dt;
            gvContractors.DataBind();
        }

         

        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = MGCommonClass.GetAppliedorNot(hdnUserID.Value, Convert.ToString(Session["CFEUNITID"]), Convert.ToString(Session["CFEQID"]));
                Session["PageDt"] = dt;
                string nextPageUrl = "";


                nextPageUrl = MGCommonClass.GetPageUrl(dt, "Next", "3", "55");
                if (!string.IsNullOrEmpty(nextPageUrl))
                    Response.Redirect("~/User/CFE/" + nextPageUrl + ".aspx");
                else
                    lblmsg0.Text = "No Dept. found.";
                    Failure.Visible = true;
            }


            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                Failure.Visible = true;
                if (ex.Message != "Thread was being aborted.")
                {
                    MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
                }
            }
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = MGCommonClass.GetAppliedorNot(hdnUserID.Value, Session["CFEUNITID"].ToString(), Session["CFEQID"].ToString());
                Session["PageDt"] = dt;

                // Current page DeptId and ApprovalId
                string currentDeptId = "3";       // Power page DeptId
                string currentApprovalId = "55";   // Power page ApprovalId

                string prevPageUrl = MGCommonClass.GetPreviousPageUrl(dt, currentDeptId, currentApprovalId);

                if (!string.IsNullOrEmpty(prevPageUrl))
                    Response.Redirect("~/User/CFE/" + prevPageUrl + ".aspx");
                else
                    lblmsg0.Text = "No previous Dept. found.";
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                Failure.Visible = true;
                if (ex.Message != "Thread was being aborted.")
                    MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }




    }


}
