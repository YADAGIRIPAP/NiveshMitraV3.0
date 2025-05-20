<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CFEUserDashboard.aspx.cs" Inherits="NiveshMitra.User.CFE.CFEUserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Pre Establishment</li>
        </ol>
    </nav>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="card">
                <div class="card-body">
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
                    <asp:HiddenField ID="hdnUserID" runat="server" />
                    <div class="col-md-12 d-flex">
                        <div class="col-md-11">
                            <h4 style="margin-left: -10px;">Pre-Establishment Approvals :
                                <asp:Label runat="server" ID="lblHdng"></asp:Label></h4>
                        </div>

                        <div class="col-md-1">
                            <asp:LinkButton ID="lbtnBack" runat="server" Text="Back" OnClick="lbtnBack_Click" CssClass="btn btn-sm btn-dark"><i class="fi fi-br-angle-double-small-left" style="position: absolute;margin-left: 32px;margin-top: 3px;"></i> Back&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                        </div>
                    </div>
                    <%--<div class="justify-content-between justify-content-around">
                        <h4 class="card-title mb-0 mt-2">
                           </h4>
                    </div>--%>

                    <div class="table-responsive CFEUSERDASHBOARD">

                        <asp:GridView ID="gvPreRegApproved" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true"
                            BorderStyle="Solid" BorderWidth="1px" CssClass="table-bordered table-hover" ForeColor="#333333"
                            GridLines="Both" Width="100%" EnableModelValidation="True" OnRowDataBound="gvPreRegApproved_RowDataBound" OnRowCreated="gvPreRegApproved_RowCreated" ShowFooter="true">
                            <RowStyle />
                            <HeaderStyle BackColor="#013161" Font-Bold="True" BorderColor="White" ForeColor="White" HorizontalAlign="Center" />
                            <FooterStyle BackColor="#013161" CssClass="no-hover" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle />
                            <Columns>
                                <asp:TemplateField HeaderText="Sl.No" ItemStyle-Width="3%">
                                    <HeaderStyle HorizontalAlign="Center" BorderColor="White" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />--%>
                                <asp:BoundField HeaderStyle-BorderColor="White" HeaderText="Registration ID" DataField="PREREGUIDNO" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" Visible="false" />
                                <asp:BoundField HeaderStyle-BorderColor="White" HeaderText="Unit Name" DataField="COMPANYNAME" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                <asp:TemplateField HeaderText="CFE UIDNO" ItemStyle-Width="12%" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblcfeuidno" Text='<%#Eval("CFEUIDNO") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderStyle-BorderColor="White" HeaderText="PAN No" DataField="COMPANYPANNO" Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                <asp:BoundField HeaderStyle-BorderColor="White" HeaderText="Communication Address" DataField="APPLICANTADDRESS" Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                <asp:BoundField HeaderStyle-BorderColor="White" HeaderText="Unit Address" DataField="UNITADDRESS" Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                                <%--                                <asp:BoundField HeaderStyle-BorderColor="White" HeaderText="Application Filed Date" Visible="false" DataField="CREATEDDATE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />--%>
                                <asp:TemplateField HeaderText="Application Filed Date" ItemStyle-Width="12%" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCFEAppliDate" Text='<%#Eval("CREATEDDATE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <%--7--%>
                                <asp:TemplateField HeaderText="Applied" HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ID="hplApplied" Text='<%#Eval("APPLIEDCOUNT")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approved" HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ID="hplApproved" Text='<%#Eval("APPROVEDDCOUNT")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Under Process" HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ID="hplundrProcess" Text='<%#Eval("UNDERPROCESSCOUNT")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rejected" HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ID="hplRejected" Text='<%#Eval("REJECTEDDCOUNT")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Query Raised" HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ID="hplQueryRaised" Text='<%#Eval("QUERYCOUNT")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apply For Pre-Establishment Approvals" HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnApplyCFE" OnClick="btnApplyCFE_Click" Text="Apply" Width="60px" CssClass="btn btn-info btn-rounded btn-sm" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View Application Details" Visible="true" HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnCombndAppl" OnClick="btnCombndAppl_Click" Width="60px" Text="View" CssClass="btn btn-info btn-rounded" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="View Application Status " HeaderStyle-BorderColor="White">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="btnApplStatus" OnClick="btnApplStatus_Click" Width="100px" Text="Status" CssClass="btn btn-info btn-rounded" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UNITID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblUNITID" Text='<%#Eval("UNITID") %>'> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CFEQID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCFEQID" Text='<%#Eval("CFEQDID") %>'> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CFEQSTATUS" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCFEAPPLSTATUS" Text='<%#Eval("CFEAPPLSTATUS") %>'> </asp:Label>
                                        <asp:Label runat="server" ID="lblLandReuired" Text='<%#Eval("LANDTYPE") %>'> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center" style="text-align: center; padding: 20px;">
                                    <b>There are no Registered Units Under MIPA, Please  <a href="../PreReg/IndustryRegistration.aspx" style="font-size: 20px; font-family: 'Bookman Old Style'">Click Here </a>to start Industry Registration.</b>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>

                    </div>
                    <asp:GridView ID="gvCFEApplied" runat="server" AutoGenerateColumns="False" BorderColor="#003399" ShowHeaderWhenEmpty="true"
                        BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CssClass="table-bordered mb-0 GRD" ForeColor="#333333"
                        GridLines="None" Width="100%" EnableModelValidation="True">
                        <RowStyle />
                        <HeaderStyle BackColor="#013161" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="LightGray" />
                        <Columns>
                            <asp:TemplateField HeaderText="Sl.No" ItemStyle-Width="3%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ItemStyle-BackColor="Wheat" ItemStyle-ForeColor="WindowText" />--%>
                            <asp:BoundField HeaderText="MIIPP Application ID" DataField="CFEQD_PREREGUIDNO" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" Visible="true" />
                            <asp:BoundField HeaderText="CFE UID No" DataField="CFEQD_CFEUIDNO" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" Visible="true" />
                            <asp:BoundField HeaderText="Unit Name" DataField="CFEQD_COMPANYNAME" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                            <asp:BoundField HeaderText="Application Status" DataField="TM_STAGENAME" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />
                            <asp:BoundField HeaderText="Application Filed Date" DataField="QUESTDATE" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="WindowText" />

                            <asp:TemplateField HeaderText="View Questionnaire" ItemStyle-Width="12%">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="btnView" OnClick="btnView_Click" Text="View" CssClass="btn btn-info" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="UNITID" ItemStyle-Width="12%" Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblUNITID" Text='<%#Eval("CFEQD_UNITID") %>'> </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CFEQID" ItemStyle-Width="12%" Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblCFEQID" Text='<%#Eval("CFEQDID") %>'> </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>

                        <EmptyDataTemplate>
                            <b>No Records Found.</b>

                        </EmptyDataTemplate>
                    </asp:GridView>

                </div>
            </div>



        </div>
    </div>
</asp:Content>

