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
    public partial class CFEPowerDetails : System.Web.UI.Page
    {
        string UnitID, ErrorMsg = "", ErrorMsg1 = "", ErrorMsg2 = "";
        int index; Decimal TotalFee = 0;
        CFEBAL objcfebal = new CFEBAL();
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
                        //GetAppliedorNot();
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


        //protected void GetAppliedorNot()
        //{
        //    try
        //    {
        //        DataSet ds = new DataSet();
        //        //ds = objcfebal.GetAppliedApprovalIDs(hdnUserID.Value, Convert.ToString(Session["CFEUNITID"]), Convert.ToString(Session["CFEQID"]), "25", "53");
        //        ds = objcfebal.GetAppliedApprovalIDs(hdnUserID.Value, Convert.ToString(Session["CFEUNITID"]), Convert.ToString(Session["CFEQID"]), "0", "0");

        //        DataTable dt = new DataTable();
        //        dt = ds.Tables[0];
        //        Session["PageDt"] = dt;


        //        string nextPageUrl = "";


        //        nextPageUrl=MGCommonClass.GetPageUrl(dt, "Next", "26", "");







        //        if (ds.Tables[0].Rows.Count > 0)
        //        {
        //            Response.Redirect("~/User/CFE/CFEfire.aspx?Next=" + "N");
        //        }
        //        else
        //        {
        //            if (Request.QueryString.Count > 0)
        //            {
        //                if (Convert.ToString(Request.QueryString[0]) == "N")
        //                    Response.Redirect("~/User/CFE/CFEfire.aspx?Next=" + "N");
        //                else if (Convert.ToString(Request.QueryString[0]) == "P")
        //                    Response.Redirect("~/User/CFE/lineofActivity.aspx?Previous=" + "P");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Failure.Visible = true;
        //        lblmsg0.Text = ex.Message;
        //        MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
        //    }
        //}
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/User/CFE/lineofActivity.aspx?Previous=" + "P");
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                Failure.Visible = true;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = MGCommonClass.GetAppliedorNot(hdnUserID.Value, Convert.ToString(Session["CFEUNITID"]), Convert.ToString(Session["CFEQID"]));
                Session["PageDt"] = dt;
                string nextPageUrl = "";


                nextPageUrl = MGCommonClass.GetPageUrl(dt, "Next", "26", "");
                if (!string.IsNullOrEmpty(nextPageUrl))
                    Response.Redirect("~/User/CFE/" + nextPageUrl + ".aspx");
                else
                    lblmsg0.Text = "No Dept. found.";
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


        protected void btnSave_Click(object sender, EventArgs e)
        {

        }


    }


}
