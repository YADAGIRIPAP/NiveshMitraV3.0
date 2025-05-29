<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CFEIndustryDetails.aspx.cs" Inherits="NiveshMitra.User.CFE.CFEIndustryDetails" %>

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
            const requiredFields = [
            { id: '<%= txtIndustrialName.ClientID %>', name: 'Name of Industrial Undertaking' },
            { id: '<%= ddlLandFromPark.ClientID %>', name: 'Is land Purchased from Park', type: 'dropdown' },
            { id: '<%= txtLandExtent.ClientID %>', name: 'Total Extent of Land' },
            { id: '<%= txtBuildUpArea.ClientID %>', name: 'Build up Area' },
            { id: '<%= ddlActivityLine.ClientID %>', name: 'Line of Activity', type: 'dropdown' },
            { id: '<%= ddlEnterpriseType.ClientID %>', name: 'Type of Enterprise', type: 'dropdown' },
            { id: '<%= txtPromoterName.ClientID %>', name: 'Name of Promoter' },
            { id: '<%= txtParentName.ClientID %>', name: 'S/o.D/o.W/o' },
            { id: '<%= ddlDistrict.ClientID %>', name: 'District', type: 'dropdown' },
            { id: '<%= ddlTehsil.ClientID %>', name: 'Tehsil', type: 'dropdown' },
            { id: '<%= ddlVillageTown.ClientID %>', name: 'Village/Town', type: 'dropdown' },
            { id: '<%= txtStreet.ClientID %>', name: 'Full Address' },
            { id: '<%= txtPincode.ClientID %>', name: 'Pincode' },
            { id: '<%= txtMobileNo.ClientID %>', name: 'Mobile No' },
            { id: '<%= txtalternativemono.ClientID %>', name: 'Alternative Mobile No' },
            { id: '<%= txtEmail.ClientID %>', name: 'Email' },
            { id: '<%= ddlOrganizationType.ClientID %>', name: 'Type of Organization', type: 'dropdown' },
            { id: '<%= ddlProposalFor.ClientID %>', name: 'Proposal For', type: 'dropdown' },
            { id: '<%= ddlSocialStatus.ClientID %>', name: 'Social Status', type: 'dropdown' },
            { id: '<%= ddlDifferentlyAbled.ClientID %>', name: 'Differently Abled', type: 'dropdown' },
            { id: '<%= ddlWomenEntrepreneur.ClientID %>', name: 'Women Entrepreneur', type: 'dropdown' },
            { id: '<%= ddlMinority.ClientID %>', name: 'Minority', type: 'dropdown' },
            { id: '<%= txtlandvalueinlak.ClientID %>', name: 'Land Value (in Lakhs)' },
            { id: '<%= txtBuildingValueinLakhs.ClientID %>', name: 'Building Value (in Lakhs)' },
            { id: '<%= txtPlantandMachineryValueinLakhs.ClientID %>', name: 'Plant and Machinery Value (in Lakhs)' },
            { id: '<%= txtTotalValueinLakhs.ClientID %>', name: 'Total Value (in Lakhs) ' },
            { id: '<%= txtAnuualTurnOverExpected.ClientID %>', name: 'Anuual Turn Over Expected ' },
            { id: '<%= txtdirectmale.ClientID %>', name: 'Direct - Male ' },
            { id: '<%= txtdirectfemale.ClientID %>', name: 'Direct - FeMale ' },
            { id: '<%= txtTotalEmployment.ClientID %>', name: 'Total Employment ' },
            { id: '<%= txtIndirectmale.ClientID %>', name: 'In-direct - Male ' },
            { id: '<%= txtIndirectfemale.ClientID %>', name: 'In-direct - FeMale ' },
            { id: '<%= ddlcategoryofregistration.ClientID %>', name: 'Category of Registration ', type:'dropdown' },
            { id: '<%= txtRegistrationno.ClientID %>', name: 'Registration No ' },
            { id: '<%= txtRegistrationdate.ClientID %>', name: 'Registration Date (dd-MM-yyyy) ' },
            { id: '<%= ddltypeoffactories.ClientID %>', name: 'Type of Factories ', type:'dropdown' },
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
        }

        function allowOnlyNumeric(e) {
            const key = e.key;
            const input = e.target;
            const errorSpan = document.getElementById('pincodeError');

            // Allow only digits (0–9), Backspace, Tab, Arrow keys
            const isValidKey = /^\d$/.test(key) || key === "Backspace" || key === "Tab" || ["ArrowLeft", "ArrowRight", "Delete"].includes(key);

            // If not valid key, show error
            if (!isValidKey) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Only numbers are allowed.";
                return;
            }

            // If max length is 6, prevent further typing
            if (input.value.length >= 6 && /^\d$/.test(key)) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Only 6 digits are allowed.";
                return;
            }

            // Hide error if key is valid
            errorSpan.style.display = "none";
        }

        function validatePincodeOnPaste(e) {
            const pasted = e.clipboardData.getData('text');
            const errorSpan = document.getElementById('pincodeError');

            if (!/^\d{1,6}$/.test(pasted)) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Only numbers (max 6 digits) allowed.";
            } else {
                errorSpan.style.display = "none";
            }
        }

        function hideErrorOnInput(e) {
            const errorSpan = document.getElementById('pincodeError');
            if (/^\d{0,6}$/.test(e.target.value)) {
                errorSpan.style.display = "none";
            }
        }

        function allowOnly10DigitMobile(e) {
            const key = e.key;
            const input = e.target;
            const errorSpan = document.getElementById('mobileError');

            // Allow only digits and navigation keys
            const isValidKey = /^\d$/.test(key) || key === "Backspace" || key === "Tab" || ["ArrowLeft", "ArrowRight", "Delete"].includes(key);

            if (!isValidKey) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Only numbers are allowed.";
                return;
            }

            if (input.value.length >= 10 && /^\d$/.test(key)) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Mobile number must be 10 digits only.";
                return;
            }

            errorSpan.style.display = "none";
        }

        function validateMobileOnPaste(e) {
            const pasted = e.clipboardData.getData('text');
            const errorSpan = document.getElementById('mobileError');

            if (!/^\d{1,10}$/.test(pasted)) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Only 10 digit numeric values are allowed.";
            } else {
                errorSpan.style.display = "none";
            }
        }

        function hideMobileError(e) {
            const errorSpan = document.getElementById('mobileError');
            if (/^\d{0,10}$/.test(e.target.value)) {
                errorSpan.style.display = "none";
            }
        }


        function allowOnly10DigitAlternativeMobile(e) {
            const key = e.key;
            const input = e.target;
            const errorSpan = document.getElementById('ALternativemobileError');

            // Allow only digits and navigation keys
            const isValidKey = /^\d$/.test(key) || key === "Backspace" || key === "Tab" || ["ArrowLeft", "ArrowRight", "Delete"].includes(key);

            if (!isValidKey) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Only numbers are allowed.";
                return;
            }

            if (input.value.length >= 10 && /^\d$/.test(key)) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Alternative Mobile number must be 10 digits only.";
                return;
            }

            errorSpan.style.display = "none";
        }

        function validateAlternativeMobileOnPaste(e) {
            const pasted = e.clipboardData.getData('text');
            const errorSpan = document.getElementById('ALternativemobileError');

            if (!/^\d{1,10}$/.test(pasted)) {
                e.preventDefault();
                errorSpan.style.display = "inline";
                errorSpan.textContent = "Only 10 digit numeric values are allowed.";
            } else {
                errorSpan.style.display = "none";
            }
        }

        function hideAlternativeMobileError(e) {
            const errorSpan = document.getElementById('ALternativemobileError');
            if (/^\d{0,10}$/.test(e.target.value)) {
                errorSpan.style.display = "none";
            }
        }

        function validateEmail(input) {
            const email = input.value.trim();
            const errorSpan = document.getElementById('EmailError');

            // Strict regex: Only allow specific known TLDs
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|in|org|net|gov|edu|co\.in)$/i;

            if (email === "") {
                input.style.border = "2px solid red";
                errorSpan.innerText = "Email is required.";
                errorSpan.style.display = "block";
            } else if (!emailRegex.test(email)) {
                input.style.border = "2px solid red";
                errorSpan.innerText = "Please enter a valid email address.";
                errorSpan.style.display = "block";
            } else {
                input.style.border = "1px solid #ced4da";
                errorSpan.style.display = "none";
            }
        }






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
                    <li class="breadcrumb-item active" aria-current="page">Entrepreneur Details</li>
                </ol>
            </nav>

            <!-- Page Form Start -->
            <div class="content container-fluid mt-3">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title"><b>ENTERPRISE DETAILS Details</b></h4>
                        <p class="text-danger" style="position: absolute; right: 10px; top: 6px;">*All Fields Are Mandatory</p>
                    </div>
                    <div class="card-body">
                        <!-- Hidden Fields -->
                        <asp:HiddenField ID="hdnPreRegUNITID" runat="server" />
                        <asp:HiddenField ID="hdnPreRegUID" runat="server" />
                        <asp:HiddenField ID="hdnUserID" runat="server" Value="1004" />
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
    <!-- Name of Industrial Undertaking -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Name of Industrial Undertaking <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtIndustrialName" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Is land Purchased from Park -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Is land Purchased from Park <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlLandFromPark" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="--Select--" Value="" />
                <asp:ListItem Text="Yes" Value="Yes" />
                <asp:ListItem Text="No" Value="No" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Total Extent of Land -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Total Extent of Land <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtLandExtent" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Build up Area -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Build up Area <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtBuildUpArea" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Line of Activity -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Line of Activity <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlActivityLine" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Type of Enterprise -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Type of Enterprise <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlEnterpriseType" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Name of Promoter -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Name of Promoter <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtPromoterName" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- S/o.D/o.W/o -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">S/o.D/o.W/o <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtParentName" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- State -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">State</label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control form-control-sm" AutoPostBack="false" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                <asp:ListItem Text="Select State" Value="0" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- District -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">District <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" TabIndex="1" onchange="validateDropdown(this)" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                <asp:ListItem Text="Select District" Value="0" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Tehsil -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Tehsil <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlTehsil" runat="server" CssClass="form-control form-control-sm" AutoPostBack="True" OnSelectedIndexChanged="ddlTehsil_SelectedIndexChanged">
                <asp:ListItem Text="--Select--" Value="0" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Village/Town -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Village/Town <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlVillageTown" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="--Select--" Value="0" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Full Address -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Full Address <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Pincode -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Pincode <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control form-control-sm" MaxLength="6" AutoComplete="off"
                onkeypress="allowOnlyNumeric(event)" onpaste="validatePincodeOnPaste(event)" oninput="hideErrorOnInput(event)" />
            <span id="pincodeError" class="text-danger small d-block" style="display:none;"></span>
        </div>
    </div>

    <!-- Mobile No -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Mobile No <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off"
                onkeypress="allowOnly10DigitMobile(event)" onpaste="validateMobileOnPaste(event)" oninput="hideMobileError(event)" />
            <span id="mobileError" class="text-danger small d-block" style="display:none;"></span>
        </div>
    </div>

 <!-- Alternative Mobile No -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Alternative Mobile No <span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:TextBox ID="txtalternativemono" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off"
            onkeypress="allowOnly10DigitAlternativeMobile(event)" onpaste="validateAlternativeMobileOnPaste(event)" oninput="hideAlternativeMobileError(event)" />
        <span id="ALternativemobileError" class="text-danger small d-block" style="display:none;"></span>
    </div>
</div>

  <!-- Email -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label for="txtEmail" class="col-sm-6 col-form-label text-sm-end">
        Email <span class="text-danger">*</span>
    </label>
    <div class="col-sm-6">
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm" AutoComplete="off"
            onblur="validateEmail(this)" />
        <span id="EmailError" class="text-danger small d-block" style="display: none;"> </span>
    </div>
</div>



    <!-- Type of Organization -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Type of Organization <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlOrganizationType" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Proposal For -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Proposal For <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlProposalFor" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>

    <!-- Social Status -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Social Status <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlSocialStatus" runat="server" CssClass="form-control form-control-sm" />
        </div>
    </div>
  <!-- Differently Abled -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Differently Abled <span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:DropDownList ID="ddlDifferentlyAbled" runat="server" CssClass="form-control form-control-sm" />
    </div>
</div>
   

    <!-- Women Entrepreneur -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Women Entrepreneur <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlWomenEntrepreneur" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="--Select--" Value="" />
                <asp:ListItem Text="Yes" Value="Yes" />
                <asp:ListItem Text="No" Value="No" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Minority -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Minority <span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlMinority" runat="server" CssClass="form-control form-control-sm">
                <asp:ListItem Text="--Select--" Value="" />
                <asp:ListItem Text="Yes" Value="Yes" />
                <asp:ListItem Text="No" Value="No" />
            </asp:DropDownList>
        </div>
    </div>

   <!-- Land Value (in Lakhs) -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Land Value (in Lakhs) <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtlandvalueinlak" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off"
     />
    </div>
</div>

   <!-- Building Value (in Lakhs)-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Building Value (in Lakhs) <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtBuildingValueinLakhs" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off"
     />
    </div>
</div>

 <!-- Plant and Machinery Value (in Lakhs)-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Plant and Machinery Value (in Lakhs) <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtPlantandMachineryValueinLakhs" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off"
     />
    </div>
</div>

   <!-- Total Value (in Lakhs)-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Total Value (in Lakhs) <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtTotalValueinLakhs" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
     />
    </div>
</div>
  <!-- Anuual Turn Over Expected-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Anuual Turn Over Expected <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtAnuualTurnOverExpected" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
     />
    </div>
</div>
  <!-- Direct - Male-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Direct - Male <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtdirectmale" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
     />
    </div>
</div>

  <!-- Direct - Female-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Direct - Female <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtdirectfemale" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
     />
    </div>
</div>

 <!-- Total Employment-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Total Employment <span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtTotalEmployment" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
     />
    </div>
</div>
  <!-- In-direct - Male-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">In-direct - Male<span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtIndirectmale" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
     />
    </div>
</div>

  <!-- In-direct - Male-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">In-direct - FeMale<span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:TextBox ID="txtIndirectfemale" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
     />
    </div>
</div>

   <!-- Category of Registration-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Category of Registration<span class="text-danger">*</span></label>
    <div class="col-sm-6">
       <asp:DropDownList ID="ddlcategoryofregistration" runat="server" CssClass="form-control form-control-sm">
    <asp:ListItem Text="--Select--" Value="" />
    </asp:DropDownList>
    </div>
</div>

  <!-- Registration No-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Registration No<span class="text-danger">*</span></label>
    <div class="col-sm-6">
         <asp:TextBox ID="txtRegistrationno" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
/>
    </div>
</div>

  <!-- Registration Date (dd-MM-yyyy)-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Registration Date (dd-MM-yyyy)<span class="text-danger">*</span></label>
    <div class="col-sm-6">
         <asp:TextBox ID="txtRegistrationdate" runat="server" CssClass="form-control form-control-sm" MaxLength="10" AutoComplete="off" 
/>
    </div>
</div>
  <!-- Type of Factories-->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Type of Factories<span class="text-danger">*</span></label>
    <div class="col-sm-6">
               <asp:DropDownList ID="ddltypeoffactories" runat="server" CssClass="form-control form-control-sm">
<asp:ListItem Text="--Select--" Value="" />
</asp:DropDownList>
    </div>
</div>

    <!-- Buttons -->
  <%--    <div class="col-md-12 d-flex justify-content-center mt-2" id="padding">
    <div class="text-center mb-2">
        <asp:Button 
            ID="btnPrevious" 
            runat="server" 
            Text="Previous" 
            CssClass="btn btn-rounded btn-info btn-lg mx-2" 
            Width="150px" OnClick="btnPrevious_Click" />

       <asp:Button 
    ID="btnNext" 
    runat="server" 
    Text="Next" 
    CssClass="btn btn-rounded btn-info btn-lg mx-2" 
    Width="150px" 
    OnClick="btnNext_Click" />
<!-- OnClientClick="return validateFormFields();" -->

    </div>
</div>--%>

      <div class="col-md-12 d-flex justify-content-center mt-3">
    <asp:Button ID="btnClearAll" runat="server" Text="Clear All" CssClass="btn btn-warning mx-2" Width="150px" />
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success mx-2" Width="150px" />
    <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-info mx-2" Width="150px" />
    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-info mx-2" Width="150px" OnClick="btnNext_Click" />
</div>

</div>

                    </div> <!-- card-body -->
                </div> <!-- card -->
            </div> <!-- content -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>