<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CFEFire.aspx.cs" Inherits="NiveshMitra.User.CFE.CFEFire" %>

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
         <li class="breadcrumb-item active" aria-current="page">CFEFire</li>
     </ol>
 </nav>
            <div class="page-wrapper cfequestionnaire">
                <div class="container-fluid mt-3">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="card-title"><b>Combined Application Form - For Pre Establishment</b></h4>
                            <span class="text-danger">*All Fields Are Mandatory</span>
                        </div>

                        <div class="card-body">
                            <asp:HiddenField ID="hdnPreRegUNITID" runat="server" />
                            <asp:HiddenField ID="hdnPreRegUID" runat="server" />
                            <asp:HiddenField ID="hdnUserID" runat="server" Value="1004" />

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
      <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Height Of Building (in mtrs) <span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>
      <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Height Of Each Floor (in mtrs) (min 2.9 mtrs)<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>


     <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Plot Covered Area (in Square mtrs)<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
    </div>
</div>

     <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Plot Area (in Square mtrs)<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
    </div>
</div>


 <!-- 1.Raw material (Pls. Include complete material including their chemical names) -->
<%--<div class="col-md-12 mb-2">
    <label class="fw-bold">1.Raw material (Pls. Include complete material including their chemical names)</label>
</div>--%>

<div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
            <strong class="text-dark">1.Raw material (Pls. Include complete material including their chemical names):</strong>
        </div>
    </div>


     <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Raw Material Name<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
    </div>
</div>     
    <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Capacity<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
    </div>
</div>      

     <!-- 1.Raw material (Pls. Include complete material including their chemical names) -->
<%--<div class="col-md-12 mb-2">
    <label class="fw-bold">2) Finished Product</label>
</div>--%>
<div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
            <strong class="text-dark">2) Finished Product:</strong>
        </div>
    </div>

     <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Finished Product Name<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
    </div>
</div>   

       <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Finished Product capacity<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
    </div>
</div>   


  <!-- Means of Escape Section -->
 <%--<div class="col-md-12 mb-2">
 <label class="fw-bold">3) Means of Escape</label>
 </div>--%>

<div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
            <strong class="text-dark">3) Means of Escape:</strong>
        </div>
    </div>

  <!-- Stair Cases Information -->
      <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Stair Cases<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div> <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">No Of Stair Cases<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>
       <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Width Of Stair Cases<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>

  <div class="mt-3 text-center col-md-12">
  <asp:Button ID="Button2" runat="server" Text="Add" CssClass="btn btn-lg text-white" Style="background-color: #b8860b; width: 150px; border-radius: 5px;" />
    </div>

   <!-- Table -->
   <div class="col-md-12 " >
   <table class="table table-bordered table-sm" style="margin: 30px;">
    <thead class="table-light">
    <tr>
    <th>Stair Cases</th>
    <th>No Of Stair Cases</th>
    <th>Width Of Stair Cases</th>
    </tr>
    </thead>
    <tbody>
    <tr><td>Ground</td><td>1.2</td><td>Main Entry</td></tr>
    <tr><td>First</td><td>1.1</td><td>Emergency Exit</td></tr>
    <tr><td>Second</td><td>1.0</td><td>Back Side</td></tr>
    </tbody>
    </table>
    </div>

                                <%--<div class="col-md-12 mb-2">
    <label class="fw-bold">4) Open Spaces all Arround The building (in mtrs)</label>
</div>--%> 
         <div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
            <strong class="text-dark">4) Open Spaces all Arround The building (in mtrs):</strong>
        </div>
    </div>

       <!-- Setback and Ground Info -->
     <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">East (min 6 mtrs)<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="txteast" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>
       <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">West (min 6 mtrs)<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>
     <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">North (min 6 mtrs) <span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>
       <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">South (min 6 mtrs) <span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control form-control-sm" AutoComplete="off" />
     </div>
 </div>
     <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Lavel Of the Ground<span class="text-danger">*</span></label>
     <div class="col-sm-6">
         <asp:DropDownList ID="ddlLandFromPark" runat="server" CssClass="form-control form-control-sm">
    <asp:ListItem Text="--Select--" Value="0" />
    <asp:ListItem Text="Level" Value="1" />
    <asp:ListItem Text="Non Level" Value="2" />
</asp:DropDownList>
     </div>
 </div>
      <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Fire Detection System<span class="text-danger">*</span></label>
     <div class="col-sm-6">
     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control form-control-sm">
    <asp:ListItem Text="--Select--" Value="0" />
    <asp:ListItem Text="Heat" Value="1" />
    <asp:ListItem Text="Smoke" Value="2" />
    <asp:ListItem Text="Gas" Value="3" />
</asp:DropDownList>
     </div>
 </div>
                                
      <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Fire Alarm  System<span class="text-danger">*</span></label>
     <div class="col-sm-6">
      <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control form-control-sm">
    <asp:ListItem Text="--Select--" Value="0" />
    <asp:ListItem Text="Automatic" Value="1" />
    <asp:ListItem Text="Manual" Value="2" />
    <asp:ListItem Text="Break Glass Type" Value="3" />
</asp:DropDownList>
     </div>
 </div>
      <div class="col-md-4 form-group row align-items-center mb-2">
     <label class="col-sm-6 col-form-label text-sm-end">Front Side Direction<span class="text-danger">*</span></label>
     <div class="col-sm-6">
    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control form-control-sm">
    <asp:ListItem Text="--Select--" Value="0" />
    <asp:ListItem Text="East" Value="1" />
    <asp:ListItem Text="West" Value="2" />
    <asp:ListItem Text="North" Value="3" />
    <asp:ListItem Text="South" Value="4" />
</asp:DropDownList>
     </div>
 </div>


     <!-- Fire Fighting System Header -->
<%--<div class="col-12 mt-4 mb-2">
    <label class="fw-bold">5) Fire Fighting System:</label>
</div>--%> 
      <div class="col-md-12">
    <div class="bg-primary text-white p-2 rounded mb-3">
        <strong class="text-dark">5) Fire Fighting System:</strong>
    </div>
</div>

<!-- Row 1 -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Sprinkler<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnSprinklerYes" runat="server" GroupName="Sprinkler" Text="Yes" />
        <asp:RadioButton ID="rbtnSprinklerNo" runat="server" GroupName="Sprinkler" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Hose Reel<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnHoseReelYes" runat="server" GroupName="HoseReel" Text="Yes" />
        <asp:RadioButton ID="rbtnHoseReelNo" runat="server" GroupName="HoseReel" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Fire Extinguishers<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnExtinguishersYes" runat="server" GroupName="Extinguishers" Text="Yes" />
        <asp:RadioButton ID="rbtnExtinguishersNo" runat="server" GroupName="Extinguishers" Text="No" />
    </div>
</div>

<!-- Row 2 -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Wet Riser<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnWetRiserYes" runat="server" GroupName="WetRiser" Text="Yes" />
        <asp:RadioButton ID="rbtnWetRiserNo" runat="server" GroupName="WetRiser" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Down Corner<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnDownCornerYes" runat="server" GroupName="DownCorner" Text="Yes" />
        <asp:RadioButton ID="rbtnDownCornerNo" runat="server" GroupName="DownCorner" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Yard Hydrant<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnYardHydrantYes" runat="server" GroupName="YardHydrant" Text="Yes" />
        <asp:RadioButton ID="rbtnYardHydrantNo" runat="server" GroupName="YardHydrant" Text="No" />
    </div>
</div>

<!-- Row 3 -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Manual Fire Alarm<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnManualAlarmYes" runat="server" GroupName="ManualAlarm" Text="Yes" />
        <asp:RadioButton ID="rbtnManualAlarmNo" runat="server" GroupName="ManualAlarm" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Auto Detection System<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnAutoDetectYes" runat="server" GroupName="AutoDetect" Text="Yes" />
        <asp:RadioButton ID="rbtnAutoDetectNo" runat="server" GroupName="AutoDetect" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Underground Sump<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnUGSumpYes" runat="server" GroupName="UGSump" Text="Yes" />
        <asp:RadioButton ID="rbtnUGSumpNo" runat="server" GroupName="UGSump" Text="No" />
    </div>
</div>

<!-- Row 4 -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Terrace Tank<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnTerraceTankYes" runat="server" GroupName="TerraceTank" Text="Yes" />
        <asp:RadioButton ID="rbtnTerraceTankNo" runat="server" GroupName="TerraceTank" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Terrace Pumps<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnTerracePumpYes" runat="server" GroupName="TerracePump" Text="Yes" />
        <asp:RadioButton ID="rbtnTerracePumpNo" runat="server" GroupName="TerracePump" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Electrical Pumps<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnElectricalPumpYes" runat="server" GroupName="ElectricalPump" Text="Yes" />
        <asp:RadioButton ID="rbtnElectricalPumpNo" runat="server" GroupName="ElectricalPump" Text="No" />
    </div>
</div>

<!-- Row 5 -->
<div class="col-md-4 form-group row align-items-center mb-3">
    <label class="col-sm-6 col-form-label text-sm-end">Diesel Pumps<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnDieselPumpYes" runat="server" GroupName="DieselPump" Text="Yes" />
        <asp:RadioButton ID="rbtnDieselPumpNo" runat="server" GroupName="DieselPump" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-3">
    <label class="col-sm-6 col-form-label text-sm-end">Jockey Pumps<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnJockeyPumpYes" runat="server" GroupName="JockeyPump" Text="Yes" />
        <asp:RadioButton ID="rbtnJockeyPumpNo" runat="server" GroupName="JockeyPump" Text="No" />
    </div>
</div>


  <!-- Other Protection Measures Header -->
<%--<div class="col-12 mt-4 mb-2">
    <label class="fw-bold">6) Other Protection Measures:</label>
</div>--%>

     <div class="col-md-12">
    <div class="bg-primary text-white p-2 rounded mb-3">
        <strong class="text-dark">6) Other Protection Measures:</strong>
    </div>
</div>

<!-- Row 1 -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Transformer Safety<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnTransformerYes" runat="server" GroupName="Transformer" Text="Yes" />
        <asp:RadioButton ID="rbtnTransformerNo" runat="server" GroupName="Transformer" Text="No" />
    </div>
</div>
<!-- Fire Lifts Provided as DropDownList -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Fire Lifts Provided<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:DropDownList ID="ddlFireLifts" runat="server" CssClass="form-control form-control-sm">
            <asp:ListItem Text="--Select--" Value="0" />
            <asp:ListItem Text="1" Value="1" />
            <asp:ListItem Text="2" Value="2" />
        </asp:DropDownList>
    </div>
</div>

<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Hydraulic Platform Accessible<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnHydraulicYes" runat="server" GroupName="Hydraulic" Text="Yes" />
        <asp:RadioButton ID="rbtnHydraulicNo" runat="server" GroupName="Hydraulic" Text="No" />
    </div>
</div>

<!-- Row 2 -->
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">AC Safety Provided<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnACYes" runat="server" GroupName="ACSafety" Text="Yes" />
        <asp:RadioButton ID="rbtnACNo" runat="server" GroupName="ACSafety" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Lightning Protection<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnLightningYes" runat="server" GroupName="Lightning" Text="Yes" />
        <asp:RadioButton ID="rbtnLightningNo" runat="server" GroupName="Lightning" Text="No" />
    </div>
</div>
<div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Control Room<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:RadioButton ID="rbtnControlRoomYes" runat="server" GroupName="ControlRoom" Text="Yes" />
        <asp:RadioButton ID="rbtnControlRoomNo" runat="server" GroupName="ControlRoom" Text="No" />
    </div>
</div>


<!-- Section E:Fire Fighting Drawings/Plans -->
 
    <div class="col-md-12">
        <div class="bg-primary text-white p-2 rounded mb-3">
          <strong class="text-dark">7) Fire Fighting Drawings/Plans:</strong>
        </div>
    </div>

    <!-- 1. Site Plan -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Site Plan<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:FileUpload ID="fuSitePlan" runat="server" CssClass="form-control form-control-sm mb-1" />
            
        </div>
    </div>

    <!-- 2. Cellar Floor Plan -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Cellar Floor Plan<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:FileUpload ID="fuCellarFloorPlan" runat="server" CssClass="form-control form-control-sm mb-1" />
            
        </div>
    </div>

    <!-- 3. Stilt/Ground Floor Plan -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Stilt/Ground Floor Plan<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:FileUpload ID="fuStiltGroundFloor" runat="server" CssClass="form-control form-control-sm mb-1" />
             
        </div>
    </div>

    <!-- 4. Floor Wise Plan -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Floor Wise Plan<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:FileUpload ID="fuFloorWisePlan" runat="server" CssClass="form-control form-control-sm mb-1" />
            
        </div>
    </div>

    <!-- 5. Terrace Plan -->
    <div class="col-md-4 form-group row align-items-center mb-2">
        <label class="col-sm-6 col-form-label text-sm-end">Terrace Plan<span class="text-danger">*</span></label>
        <div class="col-sm-6">
            <asp:FileUpload ID="fuTerracePlan" runat="server" CssClass="form-control form-control-sm mb-1" />
            
        </div>
    </div>

    <!-- 6. Section -->
    <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Section<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control form-control-sm mb-1" />
        
    </div>
</div>
        <!-- 7. Elevation -->
    <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">Section<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control form-control-sm mb-1" />
        
    </div>
</div>

 <!-- 7.If Any Other Plans/Supporting
Documents -->
    <div class="col-md-4 form-group row align-items-center mb-2">
    <label class="col-sm-6 col-form-label text-sm-end">If Any Other Plans/Supporting
Documents<span class="text-danger">*</span></label>
    <div class="col-sm-6">
        <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control form-control-sm mb-1" />
        
    </div>
</div>


<!-- Navigation Buttons -->
<%--<div class="col-md-12 d-flex justify-content-center mt-2">
 <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-rounded btn-info btn-lg mx-2" Width="150px" OnClick="btnPrevious_Click" />
 <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-rounded btn-info btn-lg mx-2" Width="150px" OnClick="btnNext_Click" />
  </div>--%>
                                <div class="col-md-12 d-flex justify-content-center mt-3">
    <asp:Button ID="btnClearAll" runat="server" Text="Clear All" CssClass="btn btn-warning mx-2" Width="150px" />
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success mx-2" Width="150px" OnClick="btnSave_Click" />
    <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-info mx-2" Width="150px" OnClick="btnPrevious_Click" />
    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-info mx-2" Width="150px" OnClick="btnNext_Click" />
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