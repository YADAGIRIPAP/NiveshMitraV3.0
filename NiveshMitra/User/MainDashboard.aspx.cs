using NiveshMitra.BAL.CommonBAL;
using NiveshMitra.Common;
using NiveshMitra.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NiveshMitra.User
{
    public partial class MainDashboard : System.Web.UI.Page
    {
        readonly LoginBAL objloginBAL = new LoginBAL();
        MasterBAL mstrBAL = new MasterBAL();
        MGCommonDAL objcommonDAL = new MGCommonDAL();
        decimal PreestablishmentTotal, PreoperationalTotal, IncentivesTotal;
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
                        hdnUserID.Value = ObjUserInfo.Userid;
                        BindData(ObjUserInfo.Userid);

                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
               // MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }
        protected void RegistrationMIIPPTotal_Click(object sender, EventArgs e)
        {
        }
        public void BindData(string userid)
        {

            try
            {
                DateTime now = DateTime.Now;
                string timestamp = now.ToString("MMM d, yyyy hh:mm:ss tt", CultureInfo.InvariantCulture);//("yyyy-MM-dd hh:mm:ss tt");
                string greeting;
                if (now.Hour < 12)
                {
                    greeting = "Good Morning !";
                }
                else if (now.Hour < 18)
                {
                    greeting = "Good Afternoon !";
                }
                else
                {
                    greeting = "Good Evening !";
                }
                if (Session["UserInfo"] != null)
                {
                    var ObjUserInfo = new UserInfo();
                    if (Session["UserInfo"] != null && Session["UserInfo"].ToString() != "")
                    {
                        ObjUserInfo = (UserInfo)Session["UserInfo"];
                        // txtPANno.Text = ObjUserInfo.PANno;
                        //unitname.InnerText = ObjUserInfo.EntityName;
                    }

                    DataSet ds = new DataSet();
                    // ds = objcommonDAL.GetMainApplicantDashBoard(userid);
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        gvUserDashboard.DataSource = ds.Tables[0];
                        gvUserDashboard.DataBind();
                        NoApplications.Visible = false;
                        Applications.Visible = true;
                        lblinterest.Visible = false;
                        divfuture.Visible = false;
                    }
                    else if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
                    {
                        NoApplications.Visible = true;
                        divfuture.Visible = true;
                        Applications.Visible = false;
                        lblinterest.Visible = false;
                        lbunitid.InnerText = ds.Tables[1].Rows[0]["UNITID"].ToString();

                        lblunitname.Text = greeting + " " + ObjUserInfo.EntityName + ",  ";
                        lbltime.InnerText = timestamp;
                        //Failure.Visible = true;
                        //hplIndReg.Visible = true;
                        //hplIndReg.ForeColor = System.Drawing.Color.Green;
                        //hplIndReg.Text = "Click here to Apply Registration under MIIPP (2024)";
                        //hplIndReg.NavigateUrl = "PreReg/IndustryRegistration.aspx";
                        //lblmsg0.Text = "There are no Applications to Show ";
                        gvUserDashboard.DataSource = null;
                        gvUserDashboard.DataBind();

                    }
                    else
                    {
                        NoApplications.Visible = true;
                        divfuture.Visible = false;
                        Applications.Visible = false;
                        lblinterest.Visible = true;
                        lblunitname.Text = greeting + " " + ObjUserInfo.EntityName + ",  ";
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
               // MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }

        protected void gvUserDashboard_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblUNITD = (Label)e.Row.FindControl("lblUnitID");

                HyperLink h1 = (HyperLink)e.Row.Cells[4].Controls[0];
                if (h1.Text != "0")
                    h1.NavigateUrl = "DashboardDrill.aspx?Unit=" + lblUNITD.Text + "&Module=%";

            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {

            }
        }

    }
}