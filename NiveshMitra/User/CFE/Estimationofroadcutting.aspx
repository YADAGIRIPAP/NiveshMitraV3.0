<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Estimationofroadcutting.aspx.cs" Inherits="NiveshMitra.User.CFE.Estimationofroadcutting" %>

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
                    <li class="breadcrumb-item active" aria-current="page">PWD Grant of road cutting permission</li>
                </ol>
            </nav>
            <div class="page-wrapper cfequestionnaire">
                <div class="container-fluid mt-3">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="card-title"><b>PWD Grant of road cutting permission</b></h4>
                            <span class="text-danger">*All Fields Are Mandatory</span>
                        </div>

                        <div class="card-body">
                            <asp:HiddenField ID="hdnPreRegUNITID" runat="server" />
                            <asp:HiddenField ID="hdnPreRegUID" runat="server" />
                            <asp:HiddenField ID="hdnUserID" runat="server" />

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
                                <!-- Building Height and Floor Height -->

                                <div class="col-md-12">
                                    <div class="bg-primary text-white p-2 rounded mb-3">
                                        <strong class="text-dark">Applicant Details:</strong>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Name Of Applicant <span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtnameofapplicane" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Mobileno<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtmono" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>


                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">EmailId<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtemailid" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>

                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Address<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>


                                <!-- 1.Raw material (Pls. Include complete material including their chemical names) -->
                                <%--<div class="col-md-12 mb-2">
    <label class="fw-bold">1.Raw material (Pls. Include complete material including their chemical names)</label>
</div>--%>

                                <%-- <div class="col-md-12">
                                    <div class="bg-primary text-white p-2 rounded mb-3">
                                        <strong class="text-dark">1.Raw material (Pls. Include complete material including their chemical names):</strong>
                                    </div>
                                </div>--%>


                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">State<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:DropDownList ID="ddlstate" runat="server" CssClass="form-control form-control-sm">
                                            <asp:ListItem Text="--Select--" Value="0" />

                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="bg-primary text-white p-2 rounded mb-3">
                                        <strong class="text-dark">Utility Details:</strong>
                                    </div>
                                </div>

                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">
                                        Is the Utility to be taken along and/or across the road<span class="text-danger">*</span>
                                    </label>
                                    <div class="col-sm-6">
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkAlong" runat="server" CssClass="form-check-input" />
                                            <label class="form-check-label" for="chkAlong">Along the road</label>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chkAcross" runat="server" CssClass="form-check-input" />
                                            <label class="form-check-label" for="chkAcross">Across the road</label>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">District<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:DropDownList ID="ddldistrict" runat="server" CssClass="form-control form-control-sm">
                                            <asp:ListItem Text="--Select--" Value="0" />

                                        </asp:DropDownList>
                                    </div>
                                </div>


                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Division<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:DropDownList ID="ddldivision" runat="server" CssClass="form-control form-control-sm">
                                            <asp:ListItem Text="--Select--" Value="0" />

                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <!-- Means of Escape Section -->
                                <%--<div class="col-md-12 mb-2">
 <label class="fw-bold">3) Means of Escape</label>
 </div>--%>

                                <%-- <div class="col-md-12">
                                    <div class="bg-primary text-white p-2 rounded mb-3">
                                        <strong class="text-dark">3) Means of Escape:</strong>
                                    </div>
                                </div>--%>

                                <!-- Stair Cases Information -->
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Road Name<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtroadname" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>

                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">
                                        Utility to be taken on which side?<span class="text-danger">*</span>
                                    </label>
                                    <div class="col-sm-6">
                                        <div class="form-check">
                                            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-check-input" />
                                            <label class="form-check-label" for="chkAlong">Left Hand Side</label>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="CheckBox2" runat="server" CssClass="form-check-input" />
                                            <label class="form-check-label" for="chkAcross">Right Hand Side </label>
                                        </div>
                                    </div>
                                </div>



                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Distance Of Utility from Centreline of the nearest carriageway (meter)<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtutilityofcarriageway" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>

                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Kilometre of the road at the crossing if the utility is crossing the road<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>



                                <!-- Setback and Ground Info -->
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Category of utility to be laid<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control form-control-sm">
                                            <asp:ListItem Text="--Select--" Value="0" />

                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Length (in Km)<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Width of road (meter in decimal value) <span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Chainages from (in Km  decimal val) <span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>
                                <div class="col-md-4 form-group row align-items-center mb-2">
                                    <label class="col-sm-6 col-form-label text-sm-end">Chainages to (in Km  decimal val)<span class="text-danger">*</span></label>
                                    <div class="col-sm-6">
                                        <<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
                                    </div>
                                </div>




                                <!-- Navigation Buttons -->
                                <%--<div class="col-md-12 d-flex justify-content-center mt-2">
 <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-rounded btn-info btn-lg mx-2" Width="150px" OnClick="btnPrevious_Click" />
 <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-rounded btn-info btn-lg mx-2" Width="150px" OnClick="btnNext_Click" />
  </div>--%>
                                <div class="col-lg-12 col-sm-12 col-xs-12 col-sm-12" style="text-align: center">
                                    <asp:Button ID="btnClearAll" runat="server" Text="Clear All" CssClass="btn btn-info" Width="150px" />
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" Width="150px" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-warning" Width="150px" Visible="false" />
                                    <button class="btn btn-warning" style="width: 150px" onclick="window.history.back();">Previous</button>
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
