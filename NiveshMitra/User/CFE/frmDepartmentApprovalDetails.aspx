<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="frmDepartmentApprovalDetails.aspx.cs" Inherits="NiveshMitra.User.CFE.frmDepartmentApprovalDetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function handleKeyUp(input) {
            if (input.value.trim() === "") {
                input.style.border = "2px solid red";
            } else {
                input.style.border = "1px solid #767575b5";
            }
        }
        function validateDropdown(dropdown) {

            if (dropdown.value === "0") {
                dropdown.style.border = "2px solid red";
                dropdown.focus();
            } else {
                dropdown.style.border = "1px solid #767575b5";
            }
        }
        function validateRadioButtonList(radioGroupContainer) {
            // Find all radio buttons inside the container
            const radioButtons = radioGroupContainer.querySelectorAll('input[type="radio"]');

            // Check if any radio button is selected
            const isSelected = Array.from(radioButtons).some(radio => radio.checked);

            if (!isSelected) {
                // If none are selected, apply red border
                radioGroupContainer.style.border = "2px solid red";
                radioGroupContainer.querySelector('input[type="radio"]').focus(); // Set focus to the first radio button
            } else {
                // Reset the border if an option is selected
                var id = radioGroupContainer.id;
                document.getElementById(id).style.border = "1px solid #767575b5";
                return false;
            }
        }
    </script>
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="divText" runat="server">
            <asp:HiddenField ID="hdnUserID" runat="server" />
            <asp:HiddenField ID="hdnQuesid" runat="server" />
            <div class="row">
                <div class="col-md-12 ">
                    <div id="success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show" align="Center">
                        <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span></button>
                    </div>
                </div>
                <div class="col-md-12 ">
                    <div id="Failure" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show" align="Center">
                        <strong>Warning!</strong>
                        <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                </div>
            </div>


            <div class="row" style="margin-top: 10px">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <h5>DEPARTMENTS</h5>
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <h6 style="color: red">The following are the Approvals required for Establishment of your Unit. Please select the Approvals for which you intend to apply for.</h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <div class="table table-responsive">
                        <div class="table-bordered">
                            <asp:GridView ID="grdApprovals" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                CssClass="GRD table-hover" ForeColor="#333333" Width="100%" ShowFooter="true" OnRowDataBound="grdApprovals_RowDataBound">
                                <FooterStyle BackColor="#013161" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle CssClass="GRDITEM" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle CssClass="GRDHEADER" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />

                                <Columns>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="S No">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1%>
                                            <asp:HiddenField ID="HdfQueid" runat="server" />
                                            <asp:HiddenField ID="HdfApprovalid" runat="server" />
                                            <asp:HiddenField ID="HdfDeptid" runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ApprovalName" HeaderText="Approval Required" ItemStyle-HorizontalAlign="Center">
                                        <ItemStyle Width="350px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TMD_DeptName" HeaderText="Department">
                                        <ItemStyle Width="180px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CFEQA_APPROVALFEE" FooterStyle-HorizontalAlign="Right" HeaderText="Fee (Rs.)">
                                        <FooterStyle CssClass="GRDITEM2" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle CssClass="GRDITEM2" Width="150px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Whether Approval Already Obtained">
                                        <ItemStyle Width="250px" />
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rblAlrdyObtained" runat="server" SelectedValue='<%# Eval("CFEQA_ISOFFLINE") %>' AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAlrdyObtained_SelectedIndexChanged">
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="N">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:HiddenField ID="HdfAmount" runat="server" />
                                            <itemstyle horizontalalign="Center" width="240px" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="140px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apply for Approval">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChkApproval" runat="server" AutoPostBack="True" OnCheckedChanged="ChkApproval_CheckedChanged" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="140px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmounts" runat="server" Text="Label"></asp:Label>
                                            <itemstyle horizontalalign="Center" width="140px" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="140px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approval ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApprID" runat="server" Text='<%# Eval("CFEQA_APPROVALID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText=" Dept ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDeptID" runat="server" Text='<%# Eval("CFEQA_DEPTID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="text-align: center; margin-top: 10px">
                    <input type="button" class="btn btn-info" value="Previous" style="width: 100px" onclick="location.href='CFEQuestionnaire.aspx'" />
                    <%-- <input type="button" class="btn btn-success" value="Save" style="width:100px"/>--%>
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" class="btn btn-rounded btn-success btn-lg" Width="150px" />
                    <input type="button" class="btn btn-warning" onclick="location.href='CFEIndustryDetails.aspx'" value="Next" style="width: 100px" />
                    <%--<asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" />--%>
                </div>
            </div>

            <%--changes--%>
            <div class="row" runat="server" visible="false" id="divOffline">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h4><b>Upload Approval Documents which are already obtained:</b></h4>
                            <br />
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="div2">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label"></label>
                                        <div class="col-lg-2 d-flex">
                                        </div>
                                        <div class="col-lg-4 d-flex">
                                            <label class="col-lg-5 col-form-label">Reference No </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=1--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divPCB">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Pre Establishment Approval from Pollution Control Board </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt1PCB" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup1PCB" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld1PCB" Text="Upload" OnClick="btnUpld1PCB_Click" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:HyperLink ID="hpl1PCB" ToolTip=" " runat="server" Target="_blank" onmouseover="return false;" onmouseout="window.status=''; return true;"></asp:HyperLink>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=2--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divHazPCB">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Authorization under the Hazardous and Other Waste (Management and Transboundary Movement) Rules 2016 </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt2HazPCB" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup2HazPCB" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld2HazPCB" Text="Upload" OnClick="btnUpld2HazPCB_Click" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl2HazPCB" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=3--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divSrvcCon">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Service Connection Certificate </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt3SrvcCon" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup3SrvcCon" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld3SrvcCon" OnClick="btnUpld3SrvcCon_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl3SrvcCon" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=4--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divEleCon">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Obtaining Electricity Connection </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt4EleCon" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup4EleCon" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld4EleCon" OnClick="btnUpld4EleCon_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl4EleCon" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=5--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divFctryPlan">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Factory Plan Approval  </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt5FctryPlan" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup5FctryPlan" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld5FctryPlan" OnClick="btnUpld5FctryPlan_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl5FctryPlan" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=6--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divDGsetNOC">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">NOC DG Set </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt6DGsetNOC" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup6DGsetNOC" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld6DGsetNOC" OnClick="btnUpld6DGsetNOC_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl6DGsetNOC" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=7--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divFireSfty">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Provisional Fire Safety Certificate </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt7FireSfty" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup7FireSfty" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld7FireSfty" OnClick="btnUpld7FireSfty_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl7FireSfty" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=8--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divRSDSLic">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Licence to store RS, DS </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt8RSDSLic" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup8RSDSLic" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld8RSDSLic" OnClick="btnUpld8RSDSLic_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl8RSDSLic" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=9--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divExplsvNOC">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">NOC required for setting up of Explosives Manufacturing, Storage, Sale, Transport </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt9ExplsvNOC" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup9ExplsvNOC" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld9ExplsvNOC" OnClick="btnUpld9ExplsvNOC_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl9ExplsvNOC" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=10--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divPtrlNOC">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">NOC Required for Setting Up of Petroleum, Diesel & Naphtha Manufacturing, Storage, Sale, Transport</label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt10PtrlNOC" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup10PtrlNOC" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld10PtrlNOC" OnClick="btnUpld10PtrlNOC_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl10PtrlNOC" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=11--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divRdCtng">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Road Cutting Permission Letter </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt11RdCtng" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup11RdCtng" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld11RdCtng" OnClick="btnUpld11RdCtng_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl11RdCtng" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=12--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divNonEncmb">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Non Encumbrance Certificate</label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt12NonEncmb" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup12NonEncmb" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld12NonEncmb" OnClick="btnUpld12NonEncmb_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl12NonEncmb" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=13--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divProfTax">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Certificate of Registration of Professional Tax under the Meghalaya Professions Trades Callings and Employment Taxation Rules </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt13ProfTax" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup13ProfTax" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld13ProfTax" OnClick="btnUpld13ProfTax_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl13ProfTax" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=14--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divElcInsp">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Electrical Drawing Approval from Electrical Inspectorate </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt14ElcInsp" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup14ElcInsp" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld14ElcInsp" OnClick="btnUpld14ElcInsp_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl14ElcInsp" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=15--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divForstDist">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Letter for distance from Forest </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt15ForstDist" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup15ForstDist" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld15ForstDist" OnClick="btnUpld15ForstDist_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl15ForstDist" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=16--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divNonForstLand">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Non-Forest Land Certificate </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt16NonForstLand" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup16NonForstLand" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld16NonForstLand" OnClick="btnUpld16NonForstLand_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl16NonForstLand" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=17--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divIrrgNOC">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">FTL NOC for Change of Land use (Irrigation) </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt17IrrgNOC" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup17IrrgNOC" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld17IrrgNOC" OnClick="btnUpld17IrrgNOC_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl17IrrgNOC" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=18--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divRevNOC">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">FTL NOC for Change of Land use (Revenue) </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt18RevNOC" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup18RevNOC" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld18RevNOC" OnClick="btnUpld18RevNOC_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl18RevNOC" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=19--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divGrndWtrNOC">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">NoC for Ground Water Abstraction for Commercial Connection </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt19GrndWtrNOC" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup19GrndWtrNOC" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld19GrndWtrNOC" OnClick="btnUpld19GrndWtrNOC_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl19GrndWtrNOC" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=20--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divNoWtrSplyCertfct">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Certificate for non-availability of water supply from water supply agency</label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt20NoWtrSply" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup20NoWtrSply" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld20NoWtrSply" OnClick="btnUpld20NoWtrSply_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl20NoWtrSply" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=21--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divPrmsntoDrawWtr">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Permission to Draw Water from River/Public Tanks</label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt21ToDrawWtr" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup21ToDrawWtr" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld21ToDrawWtr" OnClick="btnUpld21ToDrawWtr_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl21ToDrawWtr" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=22--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divMunicipalWatr">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Water Connection for the Municipal Area </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt22MunicipalWatr" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup22MunicipalWatr" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld22MunicipalWatr" OnClick="btnUpld22MunicipalWatr_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl22MunicipalWatr" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=23--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divUrbanWatr">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Grant of Water Connection to Non Municipal urban areas </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt23UrbanWatr" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup23UrbanWatr" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld23UrbanWatr" OnClick="btnUpld23UrbanWatr_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl23UrbanWatr" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=25--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divLbrAct1970">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Registration of Establishments/Principal Employer Employing Contract Labour Act 1970</label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt25LbrAct1970" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup25LbrAct1970" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld25LbrAct1970" OnClick="btnUpld25LbrAct1970_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl25LbrAct1970" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=26--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divLbrAct1979">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Registration of establishment under the Interstate Migrant Workmen Act 1979 </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt26LbrAct1979" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup26LbrAct1979" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld26LbrAct1979" OnClick="btnUpld26LbrAct1979_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl26LbrAct1979" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=27--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divLbrAct1996">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Registration of Establishments employing Building Workers under the Building and Other Construction Work Act 1996 </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt27LbrAct1996" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup27LbrAct1996" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld27LbrAct1996" OnClick="btnUpld27LbrAct1996_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl27LbrAct1996" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=28--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divContrLbrAct">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">License under Contract Labour Act (Contractor) </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt28ContrLbrAct" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup28ContrLbrAct" Width="300px" Font-Italic="true" Height="45px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld28ContrLbrAct" OnClick="btnUpld28ContrLbrAct_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl28ContrLbrAct" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%-- Approvalid=29--%>
                            <div class="col-md-12 d-flex" runat="server" visible="false" id="divContrLbrAct1979">
                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label">Registration under Inter State Migrant Workman Act 1979 (For Contractor) </label>
                                        <div class="col-lg-1 d-flex">
                                            :
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:TextBox ID="txt29ContrLbrAct1979" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2 d-flex">
                                            <asp:FileUpload runat="server" ID="fup29ContrLbrAct1979" Width="300px" Font-Italic="true" Height="45px" />

                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:Button runat="server" ID="btnUpld29ContrLbrAct1979" OnClick="btnUpld29ContrLbrAct1979_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                        </div>
                                        <div class="col-lg-1 d-flex">
                                            <asp:HyperLink ID="hpl29ContrLbrAct1979" runat="server" Target="_blank"></asp:HyperLink>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-12 d-flex" runat="server" visible="true" id="div1">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"></label>
                                            <div class="col-lg-1 d-flex">
                                            </div>
                                            <div class="col-lg-3 d-flex">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- Approvalid=30--%>
                                <div class="col-md-12 d-flex" runat="server" visible="false" id="divConstrPermit">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label">Construction Permit Approval </label>
                                            <div class="col-lg-1 d-flex">
                                                :
                                            </div>
                                            <div class="col-lg-2 d-flex">
                                                <asp:TextBox ID="txt30ConstrPermit" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-2 d-flex">
                                                <asp:FileUpload runat="server" ID="fup30ConstrPermit" Width="300px" Font-Italic="true" Height="45px" />
                                            </div>
                                            <div class="col-lg-1 d-flex">
                                                <asp:Button runat="server" ID="btnUpld30ConstrPermit" OnClick="btnUpld30ConstrPermit_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                            </div>
                                            <div class="col-lg-1 d-flex">
                                                <asp:HyperLink ID="hpl30ConstrPermit" runat="server" Target="_blank"></asp:HyperLink>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%-- Approvalid=31--%>
                                <div class="col-md-12 d-flex" runat="server" visible="false" id="divBldngPlan">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label">Industrial Building Plan Approval </label>
                                            <div class="col-lg-1 d-flex">
                                                :
                                            </div>
                                            <div class="col-lg-2 d-flex">
                                                <asp:TextBox ID="txt31BldngPlan" runat="server" class="form-control" MaxLength="50" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-2 d-flex">
                                                <asp:FileUpload runat="server" ID="fup31BldngPlan" Width="300px" Font-Italic="true" Height="45px" />
                                            </div>
                                            <div class="col-lg-1 d-flex">
                                                <asp:Button runat="server" ID="btnUpld31BldngPlan" OnClick="btnUpld31BldngPlan_Click" Text="Upload" class="btn btn-info btn-lg" Height="40px" Width="150px" />
                                            </div>
                                            <div class="col-lg-1 d-flex">
                                                <asp:HyperLink ID="hpl31BldngPlan" runat="server" Target="_blank"></asp:HyperLink>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 text-right">
                <asp:Button ID="btnNext2" runat="server" Text="Next" OnClick="btnNext2_Click" class="btn btn-rounded btn-info btn-lg" Width="150px" Visible="false" />

            </div>



            <%--changes end--%>

            <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="update">
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>


            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
