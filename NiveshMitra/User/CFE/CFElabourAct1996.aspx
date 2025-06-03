<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CFElabourAct1996.aspx.cs" Inherits="NiveshMitra.User.CFE.CFElabourAct1996" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function handleKeyUp(input) {
            input.style.border = input.value.trim() === "" ? "2px solid red" : "1px solid #767575b5";
        }

        function validateDropdown(dropdown) {
            dropdown.style.border = dropdown.value === "0" ? "2px solid red" : "1px solid #767575b5";
            if (dropdown.value === "0") dropdown.focus();
        }

        function validateRadioButtonList(radioGroupContainer) {
            const radioButtons = radioGroupContainer.querySelectorAll('input[type="radio"]');
            const isSelected = Array.from(radioButtons).some(radio => radio.checked);
            radioGroupContainer.style.border = isSelected ? "1px solid #767575b5" : "2px solid red";
            if (!isSelected) radioButtons[0].focus();
        }

         function validateFormFields() {
            debugger;
            <%--const requiredFields = [
            { id: '<%= txtConnectedLoadHP.ClientID %>', name: 'Connected Load in HP' },
            { id: '<%= txtmaxdmdkva.ClientID %>', name: 'Contracted Maximum Demand in KVA' },
            { id: '<%= ddlReqVoltagelevel.ClientID %>', name: 'Required Voltage Level', type:'dropdown' },
            { id: '<%= txtifserviceno.ClientID %>', name: 'If Yes-Service Number' },
            { id: '<%= txtperday.ClientID %>', name: 'Per Day' },
            { id: '<%= txtpermonth.ClientID %>', name: 'Per Month' },
            { id: '<%= txtExpectedmonth.ClientID %>', name: 'Expected Month and Year of Trial Production(DD/MM/YYYY)' },
            { id: '<%= txtProbableDatereq.ClientID %>', name: 'Probable Date of Requirement of Power Supply(DD/MM/YYYY)' },
            { id: '<%= txtpropertyid.ClientID %>', name: 'Property ID (Issued by Stamp and Registration Department, UP should not exceed 17 digits)' },
            { id: '<%= txttotalConnectedloadkva.ClientID %>', name: 'Total Connected Load KVA' },
            
            ];

            let missingFields = [];

            requiredFields.forEach(field => {
                const element = document.getElementById(field.id);
                if (!element) {
                    console.warn(`Element not found: ${field.id}`);
                    return;
                }

                const value = element.value.trim();
                const isEmpty = field.type === 'dropdown' ? value === "" || value === "0" : value === "";

                if (isEmpty) {
                    element.style.border = "2px solid red";
                    element.addEventListener("input", removeValidationHighlight);
                    element.addEventListener("change", removeValidationHighlight);
                    missingFields.push(field.name);
                } else {
                    element.style.border = "1px solid #767575b5";
                }
            });

            if (missingFields.length > 0) {
                alert("Please fill the following required fields:\n\n- " + missingFields.join("\n- "));
                return false;
            }

            return true;
        }

        function removeValidationHighlight(event) {
            const element = event.target;
            const value = element.value.trim();
            if (value !== "" && value !== "0") {
                element.style.border = "1px solid #767575b5";
            }
        } --%>

         


    </script>
    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <!-- Breadcrumb Navigation -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="CFEUserDashboard.aspx">Pre Establishment</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Labour-Registration Under The Building and Other Construction Workers </li>
                </ol>
            </nav>

            <!-- Page Form Start -->
            <div class="content container-fluid mt-3">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title"><b>Labour Details</b></h4>
                        <p class="text-danger" style="position: absolute; right: 10px; top: 6px;">*All Fields Are Mandatory</p>
                    </div>
                    <div class="card-body">
                        <!-- Hidden Fields -->
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

                        <!-- Form Fields -->
                      <div class="row">
    <!-- Category of Establishment -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Category of Establishment<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlCategoryofEtb" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="--Select--" Value="0" />
                <asp:ListItem Text="BIO TECH UNIT" Value="1" />
                <asp:ListItem Text="EXPORT ORIENTED UNIT" Value="2" />
                <asp:ListItem Text="EXPORT AND IMPORT BUSINESS" Value="3" />
                <asp:ListItem Text="IT UNITS" Value="4" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Postal address -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Postal address of the Establishment/Name and address of the worksite<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtpostalAddress" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Section Header -->
    <div class="col-md-12">
        <div class="bg-primary p-2 rounded mb-3">
            <strong class="text-dark">1. Full name and address of the Principal Employer (furnish father's name in the case of individuals) with Phone No:</strong>
        </div>
    </div>

    <!-- Name -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Name<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtEmpname" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Designation -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Designation<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtempDesignation" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Mobile Number -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Mobile Number<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtEmpmono" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Email -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Email<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtEmpEmail" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Full Address -->
    <div class="col-md-4 form-group row align-items-start mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Full Address<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtempfulladress" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" TextMode="MultiLine" Rows="4" Style="min-height: 100px; resize: vertical; width: 200%;" />
        </div>
    </div>

    <!-- Section Header -->
    <div class="col-md-12">
        <div class="bg-primary p-2 rounded mb-3">
            <strong class="text-dark">2. Full name and address of the Manager or person responsible for the Supervision and control of the Establishment:</strong>
        </div>
    </div>

    <!-- Name -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Name<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtSupname" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Designation -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Designation<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Mobile Number -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Mobile Number<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtsupmono" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Email -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Email<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtsupemail" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Full Address -->
    <div class="col-md-4 form-group row align-items-start mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Full Address<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtsupfulladdress" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" TextMode="MultiLine" Rows="4" Style="min-height: 100px; resize: vertical; width: 200%;" />
        </div>
    </div> 
                         
  <!-- New Row for "Nature of work" -->
<div class="col-md-8 form-group row align-items-center mb-2">
    <label class="col-sm-4 col-form-label text-sm-end">
        Nature of work / is to be carried on in the establishment<span class="text-danger">*</span>
    </label>
    <div class="col-sm-8">
       <asp:TextBox ID="txtnatureofwork" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
    </div>
</div>  

 

<div class="col-md-12">
    <div class="bg-primary p-2 rounded mb-3">
        <strong class="text-dark">Particulars of Contractors and Migrant Workmen</strong>
    </div>
</div>

<asp:GridView ID="gvContractors" runat="server" AutoGenerateColumns="False"
    CssClass="table table-bordered table-sm text-center"
    ShowHeaderWhenEmpty="True" EmptyDataText="No data available"
    OnRowDeleting="gvContractors_RowDeleting">
    <Columns>
        <asp:BoundField DataField="SlNo" HeaderText="Sl No." />
        <asp:TemplateField HeaderText="Name Of The Contractor">
            <ItemTemplate>
                <asp:TextBox ID="txtContractor" runat="server" Text='<%# Eval("Contractor") %>' CssClass="form-control form-control-sm" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Address">
            <ItemTemplate>
                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="2" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Mobile" HeaderText="Mobile No." />
        <asp:BoundField DataField="WorkNature" HeaderText="Nature Of Work" />
        <asp:BoundField DataField="MaxWorkers" HeaderText="Max No. Of Migrant Workmen" />
        <asp:BoundField DataField="StartDate" HeaderText="Estimated Start Date" />
        <asp:BoundField DataField="EndDate" HeaderText="Estimated Completion Date" />
        <asp:TemplateField HeaderText="Details Of Manufacturing Depts">
            <ItemTemplate>
                <asp:TextBox ID="txtManufacturing" runat="server" Text='<%# Eval("Manufacturing") %>' CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="2" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <asp:LinkButton ID="btnAdd" runat="server" CommandName="Add" CssClass="btn btn-success btn-sm me-1">Add</asp:LinkButton>
        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm">Delete</asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>

    </Columns>
</asp:GridView>


    <!-- Buttons -->
       <div class="col-lg-12 col-sm-12 col-xs-12 col-sm-12" style="text-align:center">
<asp:Button ID="btnClearAll" runat="server" Text="Clear All" CssClass="btn btn-info" Width="150px" />
<asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" Width="150px" />
<asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-warning" Width="150px" OnClick="btnPrevious_Click" Visible="false"/>
<button class="btn btn-warning" style="width:150px" onclick="window.history.back();">Previous</button>
<asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-danger" Width="150px" OnClick="btnNext_Click" />
</div>
</div>

                    </div> <!-- card-body -->
                </div> <!-- card -->
            </div> <!-- content -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>