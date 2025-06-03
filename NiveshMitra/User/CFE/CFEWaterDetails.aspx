<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CFEWaterDetails.aspx.cs" Inherits="NiveshMitra.User.CFE.CFEWaterDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function handleKeyUp(input) {
            input.style.border = input.value.trim() === "" ? "2px solid red" : "1px solid #ced4da";
        }

        function validateDropdown(dropdown) {
            dropdown.style.border = dropdown.value === "0" ? "2px solid red" : "1px solid #ced4da";
        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
             <!-- Breadcrumb Navigation -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb mb-0">
         <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
         <li class="breadcrumb-item"><a href="CFEUserDashboard.aspx">Pre Establishment</a></li>
         <li class="breadcrumb-item active" aria-current="page">Water Details</li>
     </ol>
 </nav>
            <div class="page-wrapper cfequestionnaire">
                <div class="container-fluid mt-3">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="card-title"><b>Water Details</b></h4>
                            <span class="text-danger">*All Fields Are Mandatory</span>
                        </div>

                        <div class="card-body">
                            <asp:HiddenField ID="hdnPreRegUNITID" runat="server" />
                            <asp:HiddenField ID="hdnPreRegUID" runat="server" />
                            <asp:HiddenField ID="hdnUserID" runat="server"  />

                            <div class="col-md-12">
                                <div id="success" runat="server" visible="false" class="alert alert-success alert-dismissible fade show text-center">
                                    <strong>Success!</strong><asp:Label ID="lblmsg" runat="server"></asp:Label>
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div id="Failure" runat="server" visible="false" class="alert alert-danger alert-dismissible fade show text-center">
                                    <strong>Warning!</strong>
                                    <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                            </div>

                            <div class="row">
    <!-- Section Header -->
    <div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
            <strong class="text-dark">A) Water Requirement</strong>
        </div>
    </div>

    <!-- Water Supply Source -->
    <!-- Water Supply Grid Section -->
<div class="col-md-12">
    <div class=" ">  
       <label class="col-sm-6 col-form-label"><strong>1 Water Supply Details:</strong></label>

    </div>

    <table class="table table-bordered table-sm text-center align-middle">
        <thead class="table-success">
            <tr>
                <th style="width: 10%;">Sl. No.</th>
                <th style="width: 10%;">Select</th>
                <th style="width: 50%;">Water required from</th>
                <th style="width: 30%;">Water Required per day (in KLD)</th>
            </tr>
        </thead>
        <tbody>
            <!-- Row 1 -->
            <tr>
                <td>1</td>
                <td>
                    <asp:CheckBox ID="chkBorewell" runat="server" Checked="true" Enabled="false" />
                </td>
                <td class="text-start">New Bore well</td>
                <td>
                    <asp:TextBox ID="txtBorewellKLD" runat="server" CssClass="form-control form-control-sm text-end" Text="4.00" />
                </td>
            </tr>
            <!-- Row 2 -->
           <%-- <tr>
                <td>2</td>
                <td>
                    <asp:CheckBox ID="chkHMWS" runat="server" />
                </td>
                <td class="text-start">HMWS &amp; SB</td>
                <td>
                    <asp:TextBox ID="txtHMWSKLD" runat="server" CssClass="form-control form-control-sm text-end" />
                </td>
            </tr>--%>
            <!-- Row 3 -->
            <tr>
                <td>3</td>
                <td>
                    <asp:CheckBox ID="chkCanals" runat="server" Checked="true" Enabled="false" />
                </td>
                <td class="text-start">Rivers/Canals</td>
                <td>
                    <asp:TextBox ID="txtCanalsKLD" runat="server" CssClass="form-control form-control-sm text-end" Text="500.00" />
                </td>
            </tr>
        </tbody>
    </table>
</div>


    <!-- Water Required per Day -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Water Required per Day (KLD)<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtWaterRequiredPerDay" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Section Header -->
    <div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
            <strong class="text-dark">B) Water Consumption</strong>
        </div>
    </div>

    <!-- Drinking Water -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Drinking Water (KL/Day)<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtDrinkingWater" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Industrial Use -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Water for Processing/Industrial Use (KL/Day)<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtIndustrialUse" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Consumptive Use -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Water Required for Consumptive Use (KL/Day)<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtConsumptiveUse" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Non-Consumptive Use -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Water Required for Non-Consumptive Use (KL/Day)<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtNonConsumptiveUse" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Section Header -->
    <div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
            <strong class="text-dark">C) Additional Information for Irrigation (Rivers/Canals)</strong>
        </div>
    </div>

    <!-- Geo Coordinates of Proposed Intake Point -->
<div class="col-md-4 form-group row align-items-start mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Geo Coordinates of Proposed Intake Point</label>
    <div class="col-sm-6">
        <asp:TextBox ID="txtGeoIntake" runat="server" CssClass="form-control form-control-sm mb-1" />
        <a href="https://www.google.com/maps" target="_blank" class="d-block small text-primary">Click Here to get location Coordinates</a>
    </div>
</div>

<!-- Geo Coordinates of Proposed Storage Point -->
<div class="col-md-4 form-group row align-items-start mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Geo Coordinates of Proposed Storage Point/ Utilisation point</label>
    <div class="col-sm-6">
        <asp:TextBox ID="txtGeoStorage" runat="server" CssClass="form-control form-control-sm mb-1" />
        <a href="https://www.google.com/maps" target="_blank" class="d-block small text-primary">Click Here to get location Coordinates</a>
    </div>
</div>


    <!-- Min Requirement -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Minimum Water Requirement (mcf)<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtMinWaterReq" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Max Requirement -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Maximum Water Requirement (mcf)<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtMaxWaterReq" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Action Buttons -->
    <div class="col-lg-12 col-sm-12 col-xs-12 col-sm-12" style="text-align:center">
        <asp:Button ID="btnClearAll" runat="server" Text="Clear All" CssClass="btn btn-info" Width="150px" />
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" Width="150px" />
        <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-warning" Width="150px" OnClick="btnPrevious_Click" Visible="false" />
        <button class="btn btn-warning" style="width:150px" onclick="window.history.back();">Previous</button>
        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-danger" Width="150px" OnClick="btnNext_Click" />
    </div>
</div>

</div>
</div>
</div>
 <!-- Loading Spinner -->
            <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="text-center mt-3">
                        <span class="spinner-border text-primary" role="status"></span>
                        <span>Loading...</span>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>