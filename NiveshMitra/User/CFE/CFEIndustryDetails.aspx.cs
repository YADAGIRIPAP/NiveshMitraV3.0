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
    public partial class CFEIndustryDetails : System.Web.UI.Page
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
                        BindState();
                        BindDistricts();
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


        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {

       
            //try
            //{
                 
            //    if (ddlState.SelectedItem.Text != "--Select--")
            //    {
            //        BindState(ddlState, ddlState.SelectedValue);
            //    }
            //    else return;
            //}
            //catch (Exception ex)
            //{
            //    lblmsg0.Text = ex.Message;
            //    Failure.Visible = true;
                 
            //}
        }


        protected void BindState(DropDownList ddstate, string ddstateID)
        {
            //try
            //{
            //    List<MasterState> objState = mstrBAL.GetState(ddstateID);

            //    if (objState != null && objState.Count > 0)
            //    {
            //        ddlDistrict.DataSource = objState;
            //        ddlDistrict.DataValueField = "DistrictCode";
            //        ddlDistrict.DataTextField = "DistrictName";
            //        ddlDistrict.DataBind();
            //    }
            //    else
            //    {

            //        ddlDistrict.DataSource = null;
            //        ddlDistrict.DataBind();
            //    }

            //    AddSelect(ddlState);
            //}
            //catch (Exception ex)
            //{

            //    lblmsg0.Text = ex.Message;
            //    Failure.Visible = true;
            //    // MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            //}

        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlTehsil.ClearSelection();
                ddlTehsil.Items.Clear();
                AddSelect(ddlTehsil);
                //ddlVillage.ClearSelection();
                //ddlVillage.Items.Clear();
                //AddSelect(ddlVillage);
                if (ddlDistrict.SelectedItem.Text != "--Select--")
                {
                    BindTehsil(ddlTehsil, ddlDistrict.SelectedValue);
                }
                else return;
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
                Failure.Visible = true;
                // MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        public void AddSelect(DropDownList ddl)
        {
            try
            {
                System.Web.UI.WebControls.ListItem li = new System.Web.UI.WebControls.ListItem();
                li.Text = "--Select--";
                li.Value = "0";
                ddl.Items.Insert(0, li);
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                //MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

       
        protected void BindState()
        {

            try
            {

                ddlState.Items.Clear();
                ddlState.Items.Clear();
                 

                List<MasterState> objStateModel = new List<MasterState>();

                objStateModel = mstrBAL.GetState();
                if (objStateModel != null)
                {
                    ddlState.DataSource = objStateModel;
                    ddlState.DataValueField = "MS_ID";
                    ddlState.DataTextField = "MS_NAME";
                    ddlState.DataBind();
                }
                else
                {
                    ddlState.DataSource = null;
                    ddlState.DataBind();


                }
                //AddSelect(ddlState);
                 

            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                //  MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        protected void BindDistricts()
        {

            try
            {

                ddlDistrict.Items.Clear();
                //ddlTehsil.Items.Clear();
                //ddlGramPanchayat.Items.Clear();
                //ddlBlockPanchayat.Items.Clear();
                //ddlVillage.Items.Clear();

                List<MasterDistrcits> objDistrictModel = new List<MasterDistrcits>();

                objDistrictModel = mstrBAL.GetDistrcits();
                if (objDistrictModel != null)
                {
                    ddlDistrict.DataSource = objDistrictModel;
                    ddlDistrict.DataValueField = "DistrictId";
                    ddlDistrict.DataTextField = "DistrictName";
                    ddlDistrict.DataBind();
                }
                else
                {
                    ddlDistrict.DataSource = null;
                    ddlDistrict.DataBind();


                }
                AddSelect(ddlDistrict);
                //AddSelect(ddlTehsil);
                //AddSelect(ddlGramPanchayat);
                //AddSelect(ddlBlockPanchayat);
                //AddSelect(ddlVillage);

            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                //  MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

       
        protected void BindTehsil(DropDownList ddlTesil, string DistrictID)
        {
            try
            {
                List<MasterTehsil> objTehsil = mstrBAL.GetTehsil(DistrictID);

                if (objTehsil != null && objTehsil.Count > 0)
                {
                    ddlTesil.DataSource = objTehsil;
                    ddlTesil.DataValueField = "TehsilCode";
                    ddlTesil.DataTextField = "Tehsilname";
                    ddlTesil.DataBind();
                }
                else
                {

                    ddlTesil.DataSource = null;
                    ddlTesil.DataBind();
                }

                AddSelect(ddlTesil);
            }
            catch (Exception ex)
            {

                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                // MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }

        
        protected void ddlTehsil_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                if (ddlTehsil.SelectedItem.Text != "--Select--")
               {
                    BindTownVillage(ddlTehsil, ddlTehsil.SelectedValue);
               }
                else return;
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;

            }
        }

        protected void BindTownVillage(DropDownList ddtehsil, string ddtehsilId)
        {
            try
            {
                List<MasterVillages> objTownvillage = mstrBAL.GetVillages(ddtehsilId);

                if (objTownvillage != null && objTownvillage.Count > 0)
               {
                    ddlVillageTown.DataSource = objTownvillage;
                    ddlVillageTown.DataValueField = "VillageId";
                    ddlVillageTown.DataTextField = "VillageName";
                    ddlVillageTown.DataBind();
                }
               else
              {

                    ddlVillageTown.DataSource = null;
                    ddlVillageTown.DataBind();
                }

                AddSelect(ddlVillageTown);
            }
            catch (Exception ex)
            {

                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                // MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
             
        }


        protected void btnNext_Click(object sender, EventArgs e)
        {

           Response.Redirect("LocationOfUnit.aspx");
        }
    }


}
