using NiveshMitra.BAL.CFEBAL;
using NiveshMitra.BAL.CommonBAL;
using NiveshMitra.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NiveshMitra.User.CFE
{
    public partial class frmDepartmentApprovalDetails1 : System.Web.UI.Page
    {
        string UnitID, ErrorMsg = "", ErrorMsg1 = "", ErrorMsg2 = "";
        int index;
        CFEBAL objcfebal = new CFEBAL();
        MasterBAL mstrBAL = new MasterBAL();
        CFEQuestionnaireDet cfeqs = new CFEQuestionnaireDet();
        decimal TotalFee, TotalFeeAmount;
        decimal amounts1;
        decimal amounts22 = 0;
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
                    { 
                        UnitID = Convert.ToString(Session["CFEUNITID"]); 
                    }
                    else
                    {
                        //string newurl = "~/User/CFE/CFEUserDashboard.aspx";
                        //Response.Redirect(newurl);
                    }
                    Page.MaintainScrollPositionOnPostBack = true;
                    if (!IsPostBack)
                    {

                        BindData();
                    }
                }
            }
            catch (Exception ex)
            {
                Failure.Visible = true;
                lblmsg0.Text = ex.Message;
                //MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        protected void BindData()
        {
            try
            {
                DataSet dsApprovals = new DataSet();
                cfeqs.UNITID = UnitID;
                cfeqs.CreatedBy = hdnUserID.Value;

                dsApprovals = objcfebal.GetApprovalsReqFromTable(cfeqs);
                if (dsApprovals.Tables.Count > 0)
                {
                    if (dsApprovals.Tables[0].Rows.Count > 0)
                    {
                        grdApprovals.DataSource = dsApprovals.Tables[0];
                        grdApprovals.DataBind();
                        hdnQuesid.Value = Convert.ToString(dsApprovals.Tables[0].Rows[0]["CFEQA_CFEQDID"]);
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        protected void grdApprovals_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if ((e.Row.RowType == DataControlRowType.DataRow))
                {
                    decimal TotalFee1 = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "CFEQA_APPROVALFEE"));
                    TotalFee = TotalFee + TotalFee1;

                    HiddenField HdfAmount = (HiddenField)e.Row.FindControl("HdfAmount");
                    HiddenField HdfDeptid = (HiddenField)e.Row.FindControl("HdfDeptid");
                    HiddenField HdfQueid = (HiddenField)e.Row.FindControl("HdfQueid");
                    HiddenField HdfApprovalid = (HiddenField)e.Row.FindControl("HdfApprovalid");
                    CheckBox ChkApproval = (CheckBox)e.Row.FindControl("ChkApproval");
                    RadioButtonList rblObtained = (RadioButtonList)e.Row.FindControl("rblAlrdyObtained");
                    //rblObtained.SelectedIndexChanged += new EventHandler(rblAlrdyObtained_SelectedIndexChanged);

                    HdfAmount.Value = DataBinder.Eval(e.Row.DataItem, "CFEQA_APPROVALFEE").ToString().Trim();
                    HdfDeptid.Value = DataBinder.Eval(e.Row.DataItem, "CFEQA_DEPTID").ToString().Trim();
                    //HdfQueid.Value = DataBinder.Eval(e.Row.DataItem, "intQuessionaireid").ToString().Trim();
                    HdfApprovalid.Value = DataBinder.Eval(e.Row.DataItem, "CFEQA_APPROVALID").ToString().Trim();

                    string approvalName = DataBinder.Eval(e.Row.DataItem, "ApprovalName").ToString().Trim();

                    ChkApproval.Checked = true;
                    ChkApproval.Enabled = false;

                    Label lblAmount = (Label)e.Row.FindControl("lblAmounts");
                    lblAmount.Text = HdfAmount.Value.ToString();

                    lblAmount.Text = string.Format("{0:N0}", lblAmount.Text.ToString());
                    decimal amounts = Convert.ToDecimal(lblAmount.Text.ToString());
                    int textCheck = grdApprovals.Columns.Count;
                    if (rblObtained.SelectedValue == "Y")
                    {
                        //  rblObtained.Enabled = false;
                        ChkApproval.Checked = false; ChkApproval.Enabled = false;
                        lblAmount.Text = "0";
                        amounts = 0;
                        e.Row.Cells[6].Text = "0";
                    }
                    if (ChkApproval.Checked == true && amounts != 0)
                    {
                        e.Row.Cells[6].Text = e.Row.Cells[3].Text;
                    }


                    if (e.Row.Cells[6].Text != "" && amounts != 0)
                    {
                        decimal TotalFeeAmount1 = Convert.ToDecimal(e.Row.Cells[6].Text);
                        TotalFeeAmount = TotalFeeAmount + TotalFeeAmount1;
                        if (e.Row.Cells[6].Text != "")
                            e.Row.Cells[6].Text = Convert.ToDecimal(e.Row.Cells[6].Text).ToString("#,##0");
                    }

                    if (e.Row.RowIndex >= 0)
                    {
                        amounts1 = amounts;
                        amounts22 = amounts1 + amounts22;
                    }

                }

                if ((e.Row.RowType == DataControlRowType.Footer))
                {
                    e.Row.Cells[5].Text = "Total Fee";
                    e.Row.Cells[6].Text = amounts22.ToString("#,##0");
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }

        protected void rblAlrdyObtained_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                RadioButtonList rblobtained = (RadioButtonList)sender;
                GridViewRow row = (GridViewRow)rblobtained.NamingContainer;
                int Rowindex = row.RowIndex;
                if (Rowindex >= 0)
                {
                    RadioButtonList rdbCheck = (RadioButtonList)grdApprovals.Rows[Rowindex].FindControl("rblAlrdyObtained");
                    HiddenField hdAmountCheck = (HiddenField)grdApprovals.Rows[Rowindex].FindControl("HdfAmount");
                    CheckBox chkCheck = (CheckBox)grdApprovals.Rows[Rowindex].FindControl("ChkApproval");
                    decimal amounts3 = 0;
                    Label lblAmount = (Label)row.FindControl("lblAmounts");
                    decimal amount = Convert.ToDecimal("0.00");

                    foreach (GridViewRow row1 in grdApprovals.Rows)
                    {
                        if (((RadioButtonList)row1.FindControl("rblAlrdyObtained")).SelectedItem.Value == "N")
                        {

                            ((CheckBox)row1.FindControl("ChkApproval")).Checked = true;
                            ((CheckBox)row1.FindControl("ChkApproval")).Enabled = false;
                            //chkCheck.Enabled = true;

                            if (((CheckBox)row1.FindControl("ChkApproval")).Checked)
                            {
                                row1.Cells[6].Text = row1.Cells[3].Text;
                                amount = amount + Convert.ToDecimal(row1.Cells[6].Text);

                            }
                            else
                            {
                                row1.Cells[6].Text = Convert.ToDecimal(0).ToString("#,##0");
                            }
                        }
                        else if (((RadioButtonList)row1.FindControl("rblAlrdyObtained")).SelectedItem.Value == "Y")
                        {
                            //chkCheck.Checked = false;
                            // chkCheck.Enabled = false;
                            ((CheckBox)row1.FindControl("ChkApproval")).Checked = false;
                            ((CheckBox)row1.FindControl("ChkApproval")).Enabled = false;
                            row1.Cells[6].Text = Convert.ToDecimal(0).ToString("#,##0");
                        }
                    }
                    grdApprovals.FooterRow.Cells[6].Text = amount.ToString();
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }

        protected void ChkApproval_CheckedChanged(object sender, EventArgs e)
        {
            try
            {

                decimal amount = Convert.ToDecimal("0.00");
                CheckBox ChkApproval = (CheckBox)sender;
                GridViewRow row = (GridViewRow)ChkApproval.NamingContainer;

                foreach (GridViewRow row1 in grdApprovals.Rows)
                {
                    if (((CheckBox)row1.FindControl("ChkApproval")).Checked)
                    {
                        row1.Cells[6].Text = row1.Cells[3].Text;

                        amount = amount + Convert.ToDecimal(row1.Cells[6].Text);

                    }
                    else /*if (row1.Cells[6].Text != "")*/
                        row1.Cells[6].Text = Convert.ToDecimal(0).ToString("#,##0");

                }
                int Rowindex = row.RowIndex;
                int totalRowindex = grdApprovals.Rows.Count;

                if ((row.RowType == DataControlRowType.Footer))
                {
                    row.Cells[5].Text = "Total Fee";
                    row.Cells[6].Text = amount.ToString("#,##0");
                }

                grdApprovals.FooterRow.Cells[6].Text = Convert.ToDecimal(amount).ToString("#,##0");
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int cnt = 0;
                int selectedcount = 0;
                int selectedcount1 = 0;
                foreach (GridViewRow row in grdApprovals.Rows)
                {
                    RadioButtonList rblobtained = (RadioButtonList)row.FindControl("rblAlrdyObtained");
                    if (rblobtained.SelectedValue == "N")
                    {
                        selectedcount = selectedcount + 1;
                        if (((CheckBox)row.FindControl("ChkApproval")).Checked)
                        {
                            selectedcount1 = selectedcount1 + 1;
                        }
                    }
                    if (((CheckBox)row.FindControl("ChkApproval")).Checked)
                    {
                        cnt = cnt + 1;
                    }

                    SetGridLabelValue();
                }
                if (cnt == 0)
                {
                    Failure.Visible = true;
                    lblmsg0.Text = "Please Select Atleast one Department for Approval";
                    lblmsg0.Visible = true;
                    return;
                }
                CFEQuestionnaireDet objCFEQsnaire = new CFEQuestionnaireDet();
                int count = 0;
                foreach (GridViewRow row in grdApprovals.Rows)
                {
                    //if (((CheckBox)row.FindControl("ChkApproval")).Checked)
                    //{
                    Label ApprovalID = (Label)row.FindControl("lblApprID");
                    Label DeptID = (Label)row.FindControl("lblDeptID") as Label;
                    Label lblFEE = (Label)row.FindControl("lblAmounts") as Label;
                    RadioButtonList rbloffline = (RadioButtonList)row.FindControl("rblAlrdyObtained");

                    objCFEQsnaire.UNITID = Convert.ToString(Session["CFEUNITID"]);
                    objCFEQsnaire.CFEQDID = Convert.ToString(Session["CFEQID"]);
                    objCFEQsnaire.DeptID = DeptID.Text;
                    objCFEQsnaire.ApprovalID = ApprovalID.Text;
                    objCFEQsnaire.ApprovalFee = row.Cells[3].Text;
                    objCFEQsnaire.IsOffline = rbloffline.SelectedValue;
                    objCFEQsnaire.CreatedBy = hdnUserID.Value;
                    objCFEQsnaire.IPAddress = getclientIP();

                    string A = objcfebal.InsertCFEDepartmentApprovals(objCFEQsnaire);
                    if (A != "")
                    { count = count + 1; }
                    //}
                }
                if (grdApprovals.Rows.Count == count)
                {
                    //Getofflineapprovals();
                    success.Visible = true;
                    lblmsg.Text = "Details Submitted Successfully";
                    //string message = "alert('" + lblmsg.Text + "')";
                    string message = "alert('" + lblmsg.Text + "')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);

                    

                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }

        public void SetGridLabelValue()
        {
            try
            {
                int rowsIndex = grdApprovals.Rows.Count;

                if (rowsIndex > 0)
                {
                    for (int i = 0; i < rowsIndex; i++)
                    {
                        CheckBox chkCheck = (CheckBox)grdApprovals.Rows[i].FindControl("ChkApproval");
                        GridViewRow grdRwos = (GridViewRow)chkCheck.NamingContainer;
                        if (chkCheck.Checked == true)
                            grdRwos.Cells[6].Text = grdRwos.Cells[3].Text;
                        else
                            grdRwos.Cells[6].Text = "0";
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        public static string getclientIP()
        {
            string result = string.Empty;
            string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (!string.IsNullOrEmpty(ip))
            {
                string[] ipRange = ip.Split(',');
                int le = ipRange.Length - 1;
                result = ipRange[0];
            }
            else
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return result;
        }



    }
}