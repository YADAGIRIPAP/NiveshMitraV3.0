<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="frmDepartmentApprovalDetails.aspx.cs" Inherits="NiveshMitra.User.CFE.frmDepartmentApprovalDetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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


    <div class="row" style="margin-top:10px">
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
                            <asp:TemplateField HeaderText="Whether Approval Already Obtained"  Visible="false">
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
                            <asp:TemplateField HeaderText="Apply for Approval"  Visible="false">
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
        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="text-align:center;margin-top:10px">
            <input type="button" class="btn btn-info" value="Previous" style="width:100px" onclick="location.href='CFEQuestionnaire.aspx'" />
           <%-- <input type="button" class="btn btn-success" value="Save" style="width:100px"/>--%>
            <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" class="btn btn-rounded btn-success btn-lg" Width="150px" />
            <input type="button" class="btn btn-warning" onclick="location.href='CFEIndustryDetails.aspx'" value="Next" style="width:100px"/>
        </div>
    </div>
</asp:Content>
