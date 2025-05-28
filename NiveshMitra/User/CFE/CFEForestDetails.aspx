<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CFEForestDetails.aspx.cs" Inherits="NiveshMitra.User.CFE.CFEForestDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <script type="text/javascript">
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
    </script>--%>


    <script src="../../assets/js/vendor/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;

            $('#btnAdd').bind('click', function () {
                debugger;
                if ($('#ContentPlaceHolder1_txtSpecies').val() == "") {
                    $('#ContentPlaceHolder1_txtSpecies').focus();
                    return false;
                }
                if ($('#ContentPlaceHolder1_txtEstimatedLength').val() == "") {
                    $('#ContentPlaceHolder1_txtEstimatedLength').focus();
                    return false;
                }
                if ($('#ContentPlaceHolder1_txtVolumeofTimber').val() == "") {
                    $('#ContentPlaceHolder1_txtVolumeofTimber').focus();
                    return false;
                }
                if ($('#ContentPlaceHolder1_txtGirth').val() == "") {
                    $('#ContentPlaceHolder1_txtGirth').focus();
                    return false;
                }
                if ($('#ContentPlaceHolder1_txtEstimatedFirewood').val() == "") {
                    $('#ContentPlaceHolder1_txtEstimatedFirewood').focus();
                    return false;
                }
                if ($('#ContentPlaceHolder1_txtNoofPoles').val() == "") {
                    $('#ContentPlaceHolder1_txtNoofPoles').focus();
                    return false;
                }

                $('#tblData').append('<tr><td>' + $('#ContentPlaceHolder1_txtSpecies').val() + '</td><td>' + $('#ContentPlaceHolder1_txtEstimatedLength').val() + '</td><td>' + $('#ContentPlaceHolder1_txtVolumeofTimber').val() + '</td><td>' + $('#ContentPlaceHolder1_txtGirth').val() + '</td><td>' + $('#ContentPlaceHolder1_txtEstimatedFirewood').val() + '</td><td>' + $('#ContentPlaceHolder1_txtNoofPoles').val() + '</td><td><button class="btn btn-danger delete-btn" >Delete</button></td></tr>');

            });


            $('#tblData').on('click', '.delete-btn', function () {
                // Remove the closest <tr> (table row)
                $(this).closest('tr').remove();
            });
        });
    </script>



    <script src="../../assets/admin/js/form-validation.js" type="text/javascript"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="../Dashboard/Dashboarddrill.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="CFEUserDashboard.aspx">Pre Establishment</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Forest Details</li>
                </ol>
            </nav>
            <div class="page-wrapper tabs cfequestionnaire">

                <div class="content container-fluid">
                    <section class="comp-section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title"><b>Forest Details</b></h4>
                                        <p style="position: absolute; right: 10px; top: 6px; color: red;">
                                            *All Fields Are	Mandatory
                                        </p>
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
                                        <div class="panel">
                                            <div class="panel-heading" style="font-weight: bold">
                                                A) Forest
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">1. Species*</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtSpecies" runat="server" class="form-control" onkeypress="return Names()" TabIndex="1"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">2. Girth (in Meters)*</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtGirth" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="5" TabIndex="2" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">3. Estimated Length of Timber (in Meters)*</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtEstimatedLength" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="5" TabIndex="3" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 10px">

                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">
                                                            4. Estimated
                                                            <br />
                                                            Firewood/Rootwood/Faggol *</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtEstimatedFirewood" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="5" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">
                                                            5. Estimated
                                                            <br />
                                                            Volume of Timber (in Meter) *</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtVolumeofTimber" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="5" TabIndex="5" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">
                                                            6. No. of Poles *</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtNoofPoles" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="5" TabIndex="6" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                    </div>

                                                </div>

                                                <div class="row" style="margin-top: 10px">
                                                    <div class="col-lg-8 col-md-8 col-xs-12 col-sm-12"></div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <input type="button" class="btn btn-info" value="Add" id="btnAdd" tabindex="7" />
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <input type="button" class="btn btn-danger" value="Cancel" id="btnCancel" tabindex="8"/>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 10px">
                                                    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                                        <div class="table table-responsive" style="width: 100%">
                                                            <table class="table table-responsive" id="tblData">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Species</th>
                                                                        <th>Timber Length</th>
                                                                        <th>Timber Volume</th>
                                                                        <th>Timber Girth</th>
                                                                        <th>Estimated Firewood</th>
                                                                        <th>Pole</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                                <tfoot>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel" style="margin-top: 20px">
                                            <div class="panel-heading" style="font-weight: bold">
                                                B) Boundry Description
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">1. North*</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtNorth" runat="server" class="form-control" onkeypress="return Names()" TabIndex="9"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">2. East*</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtEast" runat="server" class="form-control" onkeypress="return Names()" TabIndex="10"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">3. West*</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtWest" runat="server" class="form-control" onkeypress="return Names()" TabIndex="11"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 20px">
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <label class="col-form-label" style="font-size: small">4. South*</label>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                        <asp:TextBox ID="txtSouth" runat="server" class="form-control" onkeypress="return Names()" TabIndex="12"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 20px">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                                                        <input type="text" class="btn btn-info" value="ClearAll" style="width: 100px" TabIndex="16" />
                                                        <input type="text" class="btn btn-success" value="Save" style="width: 100px" TabIndex="13" />
                                                                                                                                                                       <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-info mx-2" Width="150px" OnClick="btnPrevious_Click"   />
                                                        <%--<input type="text" class="btn btn-danger" value="Next" style="width: 100px" TabIndex="14" />--%>
                                                                                                               <asp:Button 
ID="btnNext" 
runat="server" 
Text="Next" 
CssClass="btn btn-danger" 
Width="150px" OnClick="btnNext_Click"   
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

            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

