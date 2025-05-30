<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="LineofActivity.aspx.cs" Inherits="NiveshMitra.User.CFE.LineofActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../assets/js/vendor/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        debugger;

        $('#btnAdd').bind('click', function () {
            debugger;

            if ($('#ContentPlaceHolder1_txtItem_LOM').val() == "" ) {
                $('#ContentPlaceHolder1_txtItem_LOM').focus();
                return false;
            }

            if ($('#ContentPlaceHolder1_txtQuantity_LOM').val() == "") {
                $('#ContentPlaceHolder1_txtQuantity_LOM').focus();
                return false;
            }

            if ($('#ContentPlaceHolder1_ddlQuantityPer_LOM').val() == "" || $('#ContentPlaceHolder1_ddlQuantityPer_LOM').val() == "0") {
                $('#ContentPlaceHolder1_ddlQuantityPer_LOM').focus();
                return false;
            }

            if ($('#ContentPlaceHolder1_ddlQuantityIn_LOM').val() == "" || $('#ContentPlaceHolder1_ddlQuantityIn_LOM').val() == "0") {
                $('#ContentPlaceHolder1_ddlQuantityIn_LOM').focus();
                return false;
            }

            $('#tblData').append('<tr><td>' + $('#ContentPlaceHolder1_txtItem_LOM').val() + '</td><td>' + $('#ContentPlaceHolder1_txtQuantity_LOM').val() + '</td><td>' + $('#ContentPlaceHolder1_ddlQuantityIn_LOM').val() + '</td><td>' + $('#ContentPlaceHolder1_ddlQuantityPer_LOM').val() + '</td><td>' + $('#ContentPlaceHolder1_txtEstimatedFirewood').val() + '</td><td>' + $('#ContentPlaceHolder1_txtNoofPoles').val() + '</td><td><button class="btn btn-danger delete-btn" >Delete</button></td></tr>');

        });


        $('#tblData').on('click', '.delete-btn', function () {
            // Remove the closest <tr> (table row)
            $(this).closest('tr').remove();
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <contenttemplate>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="CFEUserDashboard.aspx">Pre Establishment</a></li>
                <li class="breadcrumb-item active" aria-current="page">Line Of Activity</li>
            </ol>
        </nav>
        <div class="page-wrapper tabs cfequestionnaire">

            <div class="content container-fluid">
                <section class="comp-section">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"><b>Line of Activity</b></h4>
                                    <p class="text-danger" style="position: absolute; right: 10px; top: 6px;">*All Fields Are Mandatory</p>
                                </div>

                                <div class="card-body">

                                    <asp:HiddenField ID="hdnPreRegUNITID" runat="server" />
                                    <asp:HiddenField ID="hdnPreRegUID" runat="server" />
                                    <asp:HiddenField ID="hdnUserID" runat="server" />


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


                                    <%--Start Desinging--%>

                                    <div class="panel" style="margin-top: 20px">
                                        <%--<div class="panel-heading" style="font-weight: bold">
                                            B) Boundry Description
                                        </div>--%>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                    <label class="col-form-label" style=" text-align: right">Line of Activity<span class="text-danger">*</span></label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                                    <asp:DropDownList ID="ddlLineOfActivity" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                        <asp:ListItem Text="Manufacturing" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                        <asp:ListItem Text="Service" Value="Service"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top: 20px">
                                                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: large; ">Line of Manufacture</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-body" style="padding: 20px">
                                                            <div class="row">
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small; ">Item <span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:TextBox ID="txtItem_LOM" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small;">Quantity <span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:TextBox ID="txtQuantity_LOM" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small; ">Quantity Per<span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:DropDownList ID="ddlQuantityPer_LOM" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                        <asp:ListItem Text="Manufacturing" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                        <asp:ListItem Text="Service" Value="Service"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small;">Quantity In<span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:DropDownList ID="ddlQuantityIn_LOM" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                        <asp:ListItem Text="Manufacturing" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                        <asp:ListItem Text="Service" Value="Service"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-9 col-md-9 col-xs-12 col-sm-12"></div>
                                                                <div class="col-lg-3 col-md-3 col-xs-12 col-sm-12" style="text-align: right">
                                                                    <input type="button" class="btn btn-success" value="Add New" style="width: 100px" id="btnAdd_LOM" />
                                                                    <input type="button" class="btn btn-danger" value="Cancel" style="width: 100px" />
                                                                </div>
                                                            </div>
                                                            <div class="row" style="margin-top: 20px">
                                                                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                                    <div class="table table-responsive" id="tblData_LOM">
                                                                        <table class="table table-bordered">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>Item Name</th>
                                                                                    <th>Item Quantity</th>
                                                                                    <th>Quantity In</th>
                                                                                    <th>Quantity Per</th>
                                                                                    <th>Type of Quantity</th>
                                                                                    <th>Action</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>sdf</td>
                                                                                    <td>sdf</td>
                                                                                    <td>adf</td>
                                                                                    <td>asdf</td>
                                                                                    <td>sdf</td>
                                                                                    <td>sadf</td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-top: 20px">
                                                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: large; ">Raw Material Used in Process<span class="text-danger">*</span></label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-body" style="padding: 20px">
                                                            <div class="row">
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small;">Item <span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:TextBox ID="txtItem_RM" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small;">Quantity <span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:TextBox ID="txtQuantity_RM" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small;">Quantity Per<span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:DropDownList ID="ddlQuantity_RM" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                        <asp:ListItem Text="Manufacturing" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                        <asp:ListItem Text="Service" Value="Service"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col-lg-1 col-md-1 col-xs-12 col-sm-12">
                                                                    <label class="col-form-label" style="font-size: small;">Quantity In <span class="text-danger">*</span></label>
                                                                </div>
                                                                <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                    <asp:DropDownList ID="ddlQuantityIn_Per" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                        <asp:ListItem Text="Manufacturing" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                        <asp:ListItem Text="Service" Value="Service"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-9 col-md-9 col-xs-12 col-sm-12"></div>
                                                                <div class="col-lg-3 col-md-3 col-xs-12 col-sm-12" style="text-align: right">
                                                                    <input type="button" class="btn btn-success" value="Add New" style="width: 100px" id="btnAdd_RM" />
                                                                    <input type="button" class="btn btn-danger" value="Cancel" style="width: 100px" />
                                                                </div>
                                                            </div>
                                                            <div class="row" style="margin-top: 20px">
                                                                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                                    <div class="table table-responsive">
                                                                        <table class="table table-bordered" id="tblData_RM">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>Item Name</th>
                                                                                    <th>Item Quantity</th>
                                                                                    <th>Quantity In</th>
                                                                                    <th>Quantity Per</th>
                                                                                    <th>Type of Quantity</th>
                                                                                    <th>Action</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>sdf</td>
                                                                                    <td>sdf</td>
                                                                                    <td>adf</td>
                                                                                    <td>asdf</td>
                                                                                    <td>sdf</td>
                                                                                    <td>sadf</td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                   <div class="col-lg-12 col-sm-12 col-xs-12 col-sm-12" style="text-align:center">
                                                    <input type="button" class="btn btn-info" value="Clear All" style="width:100px" />
                                                    <input type="button" class="btn btn-success" value="Save" style="width:100px" />
                                                    <input type="button" class="btn btn-warning" value="Previous" onclick="location.href='LocationOfUnit.aspx'" style="width:100px" />
                                                   <%-- <input type="button" class="btn btn-danger" value="Next" style="width:100px" />--%>
                                                       <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-danger" Width="150px" OnClick="btnNext_Click" 
  />
                                                </div>
                                            </div>

                                        </div>
                                    </div>








                                    





                                    <%--End Designing--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>


    </contenttemplate>
</asp:Content>
