<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="LocationOfUnit.aspx.cs" Inherits="NiveshMitra.User.CFE.LocationOfUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../assets/js/vendor/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;

            $('input[type=radio][name=AffectedRoad]').change(function () {
                if (this.checked) {
                    // alert("You selected: " + this.value);
                    if (this.value == "Yes") {
                        //alert("Yes");
                        $('#div1').show();
                        $('#div2').show();
                      
                    } else {
                        //alert("No");
                        $('#div1').hide();
                        $('#div2').hide();
                       
                    }
                }
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
                <li class="breadcrumb-item active" aria-current="page">Location Of Unit</li>
            </ol>
        </nav>
        <div class="page-wrapper tabs cfequestionnaire">

            <div class="content container-fluid">
                <section class="comp-section">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"><b>Entreprise Location Details</b></h4>
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

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                            <div class="panel">
                                                <div class="panel-heading">
                                                    <h6 style="font-weight: bold">Location of Unit</h6>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">1. Survey No/Plot Number(s)*</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="txtSuryvey" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">2.  District*</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="ddlDistrict" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">3.   Mandal*</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">4.  Village/Town*</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">5.  Name of Grampanchayat*</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">6.   PinCode*</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="txtPincode" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">7.  Tel No(Landline)(If available)</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">8.  Total Extent of Site Area as Per Documents(in Sq. mts)</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">9. Type of Building</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">11. Land Use as per Master Plan* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="ddlLandUse" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>

                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">12. Proposed Area for Development(in Sq. mts)* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">13. Total Built up Area(in Sq.mts)*</label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox5" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">14. Height of the Building(In mtrs)*  </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox6" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>

                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">15. Existing Width of Approach Road(in feet)* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox7" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">16. Type of Approach Road* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList4" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">17. Land Location falls under* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList5" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>

                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">18. Building Approval* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList6" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">19. Please Enter Industry/Product/Activity </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList7" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">20. Category of Industry </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList8" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>

                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">21. Location Name of IE/IDA/SEZ </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:TextBox ID="TextBox18" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">22. Affected in Road Widening* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <input type="radio" name="AffectedRoad" class="radio radio-inline" value="Yes" />Yes
                                                             <input type="radio" name="AffectedRoad" class="radio radio-inline" value="NO" checked="checked" />No
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px;">
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="display:none" id="div1">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">22 a. Extend of affected area in sq.mts </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="display:none" id="div2">
                                                            <asp:TextBox ID="TextBox33" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">23. Is land part of* </label>

                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                            <asp:DropDownList ID="DropDownList9" runat="server" class="form-control" onchange="validateDropdown(this)">
                                                                <asp:ListItem Text="Lucknow" Value="Manufacturing" style="padding-right: 10px"></asp:ListItem>
                                                                <asp:ListItem Text="Kanpur" Value="Service"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-top:10px">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="panel" style="border: solid 1px; padding: 5px">
                                                                <div class="panel-body" style="padding: 20px">
                                                                    <div class="row">
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">1. Architect License No.* </label>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <asp:TextBox ID="TextBox8" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">2. Architect Name* </label>

                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <asp:TextBox ID="TextBox9" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">3.	Architect Mobile No.* </label>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <asp:TextBox ID="TextBox10" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="panel" style="border: solid 1px; padding: 5px">
                                                                <div class="panel-body" style="padding: 20px">
                                                                    <div class="row">
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">1. Structural Engineer Name.* </label>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <asp:TextBox ID="TextBox11" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">2 Structural Mobile No </label>

                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <asp:TextBox ID="TextBox12" runat="server" class="form-control" onkeypress="return Names()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">3. Structural License No. </label>
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <asp:TextBox ID="TextBox13" runat="server" class="form-control" onkeypress="return NumberOnly()" MaxLength="50" TabIndex="4" onkeyup="handleKeyUp(this)"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="panel" style="border: solid 1px; padding: 5px">
                                                                <div class="panel-body" style="padding: 20px">
                                                                    <div class="row">
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">1. Architectural dwg. in Pre-DCR</label>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                                                            <input type="file" class="form-control" />
                                                                        </div>
                                                                        <div class="col-lg-2 col-md-2 col-xs-12 col-sm-12">
                                                                            <label class="col-form-label" style="font-weight: bold; font-size: 14px">2 Common Affidavit Common Affidavit Form </label>

                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12">
                                                                            <input type="file" class="form-control" />
                                                                        </div>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="margin-top: 10px">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: center">
                                                            <input type="button" class="btn btn-warning" value="Clear All" style="width: 100px" />
                                                            <input type="button" class="btn btn-success" value="Save" style="width: 100px" />
                                                            <input type="button" class="btn btn-danger" value="Previous" style="width: 100px" />
                                                            <input type="button" class="btn btn-danger" value="Next" style="width: 100px" />
                                                        </div>
                                                    </div>
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
