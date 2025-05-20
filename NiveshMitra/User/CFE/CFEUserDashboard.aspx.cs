using NiveshMitra.BAL.CFEBAL;
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
    public partial class CFEUserDashboard : System.Web.UI.Page
    {
        CFEBAL objcfebal = new CFEBAL();
        string UnitID;
        int TotApplied, TotApproved, TotRejected, TotQueryRaised, TotUnderProcess;
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

                    Page.MaintainScrollPositionOnPostBack = true;
                    Failure.Visible = false;
                    success.Visible = false;
                    if (!IsPostBack)
                    {
                        BindApproved();
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
            catch (Exception ex)
            {
                Failure.Visible = true;
                lblmsg0.Text = ex.Message;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }
        public void BindApproved()
        {
            try
            {
                DataSet dsApproved = new DataSet();
                if (Request.QueryString.Count > 0)
                {
                    UnitID = Request.QueryString[0];
                }
                else UnitID = "%";
                if (UnitID == "%")
                    lblHdng.Text = " Status of Application for All Units";
                else lblHdng.Text = "";

                dsApproved = objcfebal.GetCFEapplications(hdnUserID.Value, UnitID);
                if (dsApproved.Tables.Count > 0)
                {
                    if (dsApproved.Tables[0].Rows.Count > 0)
                    {
                        gvPreRegApproved.DataSource = dsApproved.Tables[0];
                        gvPreRegApproved.DataBind();

                    }
                    else
                    {
                        string newurl = "~/User/CFE/CFEQuestionnaire.aspx";
                        Response.Redirect(newurl);
                    }
                }
                else
                {
                    string newurl = "~/User/CFE/CFEQuestionnaire.aspx";
                    Response.Redirect(newurl);
                }
            }
            catch (Exception ex)
            {
                Failure.Visible = true;
                lblmsg0.Text = ex.Message;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        protected void gvPreRegApproved_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    int gvrcnt = gvPreRegApproved.Rows.Count;
                    Button btnApply;
                    Button btnApprvlsReq;
                    Button btnApplstatus;
                    Label lblCFEQuesnrID = (Label)e.Row.FindControl("lblCFEQID");
                    Label lblunitId = (Label)e.Row.FindControl("lblUNITID");
                    Label APPLSTATUS = (Label)e.Row.FindControl("lblCFEAPPLSTATUS");
                    Label lblLandReuired = (Label)e.Row.FindControl("lblLandReuired");
                    HyperLink hplAppld = (HyperLink)e.Row.FindControl("hplApplied");
                    HyperLink hplApprvd = (HyperLink)e.Row.FindControl("hplApproved");
                    HyperLink hplUndrPrc = (HyperLink)e.Row.FindControl("hplundrProcess");
                    HyperLink hplRejctd = (HyperLink)e.Row.FindControl("hplRejected");
                    HyperLink hplQryRaised = (HyperLink)e.Row.FindControl("hplQueryRaised");
                    if (hplAppld.Text != "0")
                        hplAppld.NavigateUrl = "~/User/Dashboard/Dashboardstatus.aspx?UnitID=" + lblunitId.Text + "&Type=Applied";
                    if (hplApprvd.Text != "0")
                        hplApprvd.NavigateUrl = "~/User/Dashboard/Dashboardstatus.aspx?UnitID=" + lblunitId.Text + "&Type=Approved";
                    if (hplUndrPrc.Text != "0")
                        hplUndrPrc.NavigateUrl = "~/User/Dashboard/Dashboardstatus.aspx?UnitID=" + lblunitId.Text + "&Type=ApprovalPending";
                    if (hplRejctd.Text != "0")
                        hplRejctd.NavigateUrl = "~/User/Dashboard/Dashboardstatus.aspx?UnitID=" + lblunitId.Text + "&Type=Rejected";
                    if (hplQryRaised.Text != "0")
                        hplQryRaised.NavigateUrl = "~/User/CFE/CFEQueryDashBoard.aspx?UnitID=" + lblunitId.Text + "&Type=QueryRaised";

                    int TotalAppl = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "APPLIEDCOUNT"));
                    TotApplied = TotApplied + TotalAppl;

                    int TotalAppr = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "APPROVEDDCOUNT"));
                    TotApproved = TotApproved + TotalAppr;

                    int TotalUndrPrcs = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "UNDERPROCESSCOUNT"));
                    TotUnderProcess = TotUnderProcess + TotalUndrPrcs;

                    int TotalRej = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "REJECTEDDCOUNT"));
                    TotRejected = TotRejected + TotalRej;

                    int TotalQuery = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "QUERYCOUNT"));
                    TotQueryRaised = TotQueryRaised + TotalQuery;
                    string Applstatus = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "CFEAPPLSTATUS"));

                    if (Applstatus == "" || Applstatus == null || Applstatus == "2")
                    {
                        btnApply = (Button)e.Row.FindControl("btnApplyCFE");
                        btnApprvlsReq = (Button)e.Row.FindControl("btnCombndAppl");
                        btnApplstatus = (Button)e.Row.FindControl("btnApplStatus");
                        if (lblLandReuired.Text == "Own")
                        {
                            btnApply.Enabled = true;
                            btnApprvlsReq.Enabled = false; //btnApprvlsReq.BackColor = System.Drawing.Color.LightGray; // btnApprvlsReq.ForeColor = System.Drawing.Color.Red;
                            btnApplstatus.Enabled = false; //btnApplstatus.BackColor = System.Drawing.Color.LightGray; //btnApplstatus.ForeColor = System.Drawing.Color.Red;
                            btnApplstatus.Style.Add("border", "none");
                            btnApplstatus.Style.Add("color", "black");
                        }
                        else
                        {
                            btnApply.Enabled = false;
                            btnApprvlsReq.Enabled = false; //btnApprvlsReq.BackColor = System.Drawing.Color.LightGray; // btnApprvlsReq.ForeColor = System.Drawing.Color.Red;
                            btnApplstatus.Enabled = false;

                            btnApply.Style.Add("border", "none");
                            btnApply.Style.Add("color", "black");

                            btnApprvlsReq.Style.Add("border", "none");
                            btnApprvlsReq.Style.Add("color", "black");

                            btnApplstatus.Style.Add("border", "none");
                            btnApplstatus.Style.Add("color", "black");
                        }
                        Label lblCFEAppliDate = (Label)e.Row.FindControl("lblCFEAppliDate");
                        string communityValue = DataBinder.Eval(e.Row.DataItem, "CFEAPPLSTATUS")?.ToString();
                        if (lblCFEAppliDate.Text != "")
                        { gvPreRegApproved.Columns[7].Visible = false; }
                    }
                    else
                    {
                        btnApply = (Button)e.Row.FindControl("btnApplyCFE");
                        btnApply.Enabled = false;
                        btnApply.BackColor = System.Drawing.Color.LightGray;// btnApply.ForeColor = System.Drawing.Color.Red;
                        btnApply.Style.Add("border", "none");
                        btnApply.Style.Add("color", "black");

                        Label lblCFEAppliDate = (Label)e.Row.FindControl("lblCFEAppliDate");
                        string communityValue = DataBinder.Eval(e.Row.DataItem, "CFEAPPLSTATUS")?.ToString();
                        if (lblCFEAppliDate.Text != "")
                        { gvPreRegApproved.Columns[7].Visible = true; }
                    }

                    string CFEUIDstatus = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "CFEUIDNO"));

                    if (CFEUIDstatus == "" || CFEUIDstatus == null)
                    {
                        Label lblcfeuidno = (Label)e.Row.FindControl("lblcfeuidno");
                        if (lblcfeuidno.Text != "")
                        { gvPreRegApproved.Columns[3].Visible = false; }
                    }
                    else
                    {
                        Label lblcfeuidno = (Label)e.Row.FindControl("lblcfeuidno");
                        if (lblcfeuidno.Text != "")
                        { gvPreRegApproved.Columns[3].Visible = true; }
                    }
                }
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[6].Text = "Total";
                    e.Row.Cells[7].Text = TotApplied.ToString();
                    e.Row.Cells[8].Text = TotApproved.ToString();
                    e.Row.Cells[9].Text = TotUnderProcess.ToString();
                    e.Row.Cells[10].Text = TotRejected.ToString();
                    e.Row.Cells[11].Text = TotQueryRaised.ToString();
                }
            }
            catch (Exception ex)
            {
                Failure.Visible = true;
                lblmsg0.Text = ex.Message;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        protected void lbtnBack_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString.Count > 0)
                    UnitID = Request.QueryString[0];
                else
                    UnitID = "%";
                Response.Redirect("~/User/Dashboard/DashboardDrill.aspx?UnitID=" + UnitID);

            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
                //throw ex;
            }
        }

        protected void gvPreRegApproved_RowCreated(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    GridView HeaderGrid = (GridView)sender;
                    GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                    TableHeaderCell HeaderCell = new TableHeaderCell();
                    HeaderCell.ColumnSpan = 5;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                    HeaderCell.Text = "";
                    HeaderCell.BorderColor = System.Drawing.Color.White;
                    HeaderCell.Font.Bold = true;
                    HeaderGridRow.Cells.Add(HeaderCell);


                    HeaderCell = new TableHeaderCell();
                    HeaderCell.ColumnSpan = 5;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.Font.Bold = true;
                    HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                    HeaderCell.Text = "Pre Establishment Approvals";
                    HeaderCell.BorderColor = System.Drawing.Color.White;
                    HeaderGridRow.Cells.Add(HeaderCell);

                    HeaderCell = new TableHeaderCell();
                    HeaderCell.ColumnSpan = 3;
                    HeaderCell.RowSpan = 1;
                    HeaderCell.Font.Bold = true;
                    HeaderCell.HorizontalAlign = HorizontalAlign.Center;
                    HeaderCell.Text = "";
                    HeaderCell.BorderColor = System.Drawing.Color.White;
                    HeaderGridRow.Cells.Add(HeaderCell);

                    gvPreRegApproved.Controls[0].Controls.AddAt(0, HeaderGridRow);
                }
            }
            catch (Exception ex)
            {
                Failure.Visible = true;
                lblmsg0.Text = ex.Message;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }

        }
        protected void btnApplyCFE_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label lblunitId = (Label)row.FindControl("lblUNITID");
                Label lblcfeqid = (Label)row.FindControl("lblCFEQID");
                Session["CFEUNITID"] = lblunitId.Text;
                Session["CFEQID"] = lblcfeqid.Text;
                string newurl = "CFEQuestionnaire.aspx";
                Response.Redirect(newurl);
            }
            catch (Exception ex)
            {
                Failure.Visible = true;
                lblmsg0.Text = ex.Message;
                MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblunitId = (Label)row.FindControl("lblUNITID");
                Label lblcfeqid = (Label)row.FindControl("lblCFEQID");
                Session["CFEUNITID"] = lblunitId.Text;
                Session["CFEQID"] = lblcfeqid.Text;
                string newurl = "CFEQuestionnaire.aspx";
                Response.Redirect(newurl);
            }
            catch (Exception ex)
            { }
        }

        protected void btnCombndAppl_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblunitId = (Label)row.FindControl("lblUNITID");
                Label lblcfeqid = (Label)row.FindControl("lblCFEQID");
                Session["CFEUNITID"] = lblunitId.Text;
                Session["CFEQID"] = lblcfeqid.Text;
                string newurl = "CFEApplDetails.aspx";
                Response.Redirect(newurl);
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnApplStatus_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblunitId = (Label)row.FindControl("lblUNITID");
                Label lblcfeqid = (Label)row.FindControl("lblCFEQID");
                Session["CFEUNITID"] = lblunitId.Text;
                Session["CFEQID"] = lblcfeqid.Text;
                string newurl = "CFEUserApplStatus.aspx";
                Response.Redirect(newurl);
            }
            catch (Exception ex)
            {

            }
        }
    }
}