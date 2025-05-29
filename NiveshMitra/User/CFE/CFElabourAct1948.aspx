<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CFElabourAct1948.aspx.cs" Inherits="NiveshMitra.User.CFE.CFElabourAct1948" %>

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
                    <li class="breadcrumb-item active" aria-current="page">Labour-Proposed Building Plan under the Factories Act 1948</li>
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
    <!-- Connected Load in HP -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Connected Load in HP<span class="text-danger">*</span></label>
        <div class="col-sm-6">
             <asp:TextBox ID="txtconnectedhp" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

    <!-- Contracted Maximum Demand in KVA -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Contracted Maximum Demand in KVA<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtmaxdmdkva" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

     

    <!-- Type of Factory -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Type of Factory<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:DropDownList ID="ddlCategoryofEtb" runat="server" CssClass="form-control form-control-sm">
    <asp:ListItem Text="--Select--" Value="0" />
    <asp:ListItem Text="Textile" Value="1" />
    <asp:ListItem Text="Chemical" Value="2" />
    <asp:ListItem Text="Pharmaceutical" Value="3" />
    <asp:ListItem Text="Food Processing" Value="4" />
    <asp:ListItem Text="Automobile" Value="5" />
    <asp:ListItem Text="Plastic and Rubber" Value="6" />
    <asp:ListItem Text="Electronics" Value="7" />
    <asp:ListItem Text="Steel / Metal Works" Value="8" />
    <asp:ListItem Text="Garment / Apparel" Value="9" />
    <asp:ListItem Text="Others" Value="Others" />
</asp:DropDownList>

        </div>
    </div>

    <!-- No. Of Workers -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">No. Of Workers<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:TextBox ID="txtnoofworkers" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
        </div>
    </div>

     <div class="col-md-12">
    <div class="bg-primary p-2 rounded mb-3">
        <strong class="text-dark">Power Details :</strong>
    </div>
</div>
                         
    <div class="col-md-4 form-group row align-items-center mb-2">
       <label class="col-sm-6 col-form-label text-sm-end">Status<span class="text-danger">*</span></label>
       <div class="col-sm-6">
           <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control form-control-sm">
    <asp:ListItem Text="--Select--" Value="0" />
     
</asp:DropDownList>
       </div>
   </div>

 <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Maximum amount of Power(in HP) Proposed to be used<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="txtmaxamt" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>
                            
       <div class="col-md-12">
    <div class="bg-primary p-2 rounded mb-3">
        <strong class="text-dark">Chemicals / Chemical Quantity :</strong>
    </div>
</div>

      

     <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Chemicals<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="txtchemicals" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>

     <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Chemical Quantity<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="txtchemicalqty" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>

                                <div class="col-md-12">
    <div class="bg-primary p-2 rounded mb-3">
        <strong class="text-dark">Plan Approval Details:</strong>
    </div>
</div>

     <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">1-Site Plan (3)<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control form-control-sm mb-1" />
         
    </div>
</div>

       <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">2- Detailed Plan (4)<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control form-control-sm mb-1" />
         
    </div>
</div>

    <div class="col-md-12">
    <div class="bg-primary p-2 rounded mb-3">
        <strong class="text-dark">Required Documents:</strong>
    </div>
</div>

  <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Proof of Ownership of factory building premises<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:FileUpload ID="proofofownershipfileupload" runat="server" CssClass="form-control form-control-sm mb-1" />
         
    </div>
</div>
   
    <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Process Flow Diagram<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:FileUpload ID="processfileupload" runat="server" CssClass="form-control form-control-sm mb-1" />
         
    </div>
</div>

   


    <!-- Buttons -->
     <div class="col-lg-12 col-sm-12 col-xs-12 col-sm-12" style="text-align:center">
    <asp:Button ID="btnClearAll" runat="server" Text="Clear All" CssClass="btn btn-info" Width="150px" />
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" Width="150px" />
    <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-warning" Width="150px" />
    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-danger" Width="150px" />
</div>
</div>

                    </div> <!-- card-body -->
                </div> <!-- card -->
            </div> <!-- content -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>