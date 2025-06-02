<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintApplicationForm.aspx.cs" Inherits="NiveshMitra.User.CFE.PrintApplicationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <style>
            .div3 {
                /*-webkit-column-count: 3;
    -moz-column-count: 3; 
    column-count: 3; */
                -webkit-column-gap: 40px; /* Chrome, Safari, Opera */
                -moz-column-gap: 40px; /* Firefox */
                column-gap: 40px;
            }

            .w3-code {
                border-left: 5px solid #73AD21 !important;
                font-size: 17px;
                padding: 5px;
                font-weight: bold;
                color: #082ea2;
            }

            .w4-code {
                border-left: 5px solid #73AD21 !important;
                font-size: 14px;
                padding: 5px;
                font-weight: bold;
                color: #082ea2;
            }

            ol.u {
                list-style-type: none;
                ;
                font-size: 13px;
                padding: 10px 10px 10px 10px;
            }

            ol.v {
                list-style-type: inherit;
                font-size: 17px;
                font-weight: bold;
                padding: 10px 10px 10px 10px;
            }

            .table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                border: 2px solid ActiveCaptionText;
                padding: 8px;
            }





            .GRD {
                width: 200px;
                height: auto;
                border-color: #013161;
                border-style: solid;
                border-width: 1px;
                padding: 10px;
                text-transform: capitalize;
            }

            * {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-align: center;
            }

            .GRDHEADER {
                border: 1px solid #ffffff;
                color: #0E2A46;
                vertical-align: middle;
                text-align: center;
                height: 25px;
                width: 50px;
                padding: 10px;
                font-size: 12px;
                font-weight: bold;
                text-transform: capitalize;
                font-family: Verdana;
                BACKGROUND-IMAGE: url('../../Resource/Styles/images/bg_blue_grd.gif');
            }

            .GRDITEM {
                /*background-color: WHITE;*/
                color: black;
                font-size: 12px;
                font-weight: normal;
                font-family: Verdana;
                padding: 10px;
                /*text-decoration:none;*/
                /*border-color:#013161;*/
                /*border-style:solid;*/
                text-transform: uppercase;
                /*border-width:1px;*/
                /*height:23px;*/
                /*text-indent:5px;*/
                /*BACKGROUND-IMAGE: url(../images/grid_bg_.gif);*/
            }

            a {
                color: #337ab7;
                text-decoration: none;
            }

            a {
                background-color: transparent;
            }

            .style2 {
                color: #FF0000;
            }
        </style>
    </title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <asp:HiddenField ID="hdnUserID" runat="server" />
                    <asp:HiddenField ID="hdnQuesid" runat="server" />
                </div>
            </div>
            <div class="row">
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
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive" style="text-align: center">
                                        <table align="center" style="border: 1px solid #000000; font-family: Verdana; font-size: 12px; text-align: center; width: 800px;">
                                            <tbody>
                                                <tr>
                                                    <td align="center" style="padding: 0px; margin: 0px; text-align: center">
                                                        <img src="../../assets/imgs/logo1.png" width="250px" height="60px">
                                                    </td>
                                                </tr>
                                                <tr style="padding: 0px; margin: 0px; border: 1px solid #000000; font-family: Verdana; font-size: 18px;">
                                                    <td align="center" style="text-align: center; font-family: Verdana; font-weight: bold; font-size: 18px; border: 1px solid #000000;">NIVESH MITRA COMMON APPLICATION FORM</td>
                                                </tr>

                                                <tr style="padding: 0px; margin: 0px; border: 1px solid #000000;">
                                                    <td align="center" style="text-align: center; font-weight: bold; font-size: 16px; border: 1px solid #000000;">Questionnaire Form</td>
                                                </tr>
                                                <tr>
                                                    <td align="center">

                                                        <table bgcolor="White" width="900" border="2px" cellpadding="22" style="font-family: Verdana; font-size: 14px;">
                                                            <tbody>
                                                                <tr>
                                                                    <td>Name of Unit</td>
                                                                    <td>
                                                                        <span id="txtTreesToBeFelled0">sri parameshwari rice industry</span>
                                                                    </td>
                                                                </tr>
                                                                <tr style="background-color: #6699FF">

                                                                    <td>
                                                                        <span>Sector of Enterprise</span></td>
                                                                    <td>
                                                                        <span id="LblSectionofExterprise">Manufacturing</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>

                                                                    <td>Total Extent of Land</td>
                                                                    <td>
                                                                        <span></span>
                                                                        <span id="txtExtant">14062.370 (in Sq mtrs)</span>
                                                                    </td>
                                                                </tr>

                                                                <tr>

                                                                    <td colspan="2" style="background-color: #CCFFFF"><b>Project Cost Details :</b></td>

                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <div>

                                                                            <table cellspacing="0" cellpadding="4" rules="all" border="1" id="GvProjectdtls" style="width: 100%; height: 62px; font-weight: normal; font-size: 14px; font-family: Verdana; color: #333333; border-width: 1px; border-style: Solid; border-color: Black; border-collapse: collapse;">
                                                                                <tbody>
                                                                                    <tr style="color: Black; font-weight: bold;">
                                                                                        <th align="center" scope="col" style="background-color: LightGrey; border-bottom: 2px solid #666666;">S No</th>
                                                                                        <th scope="col" style="background-color: LightGrey; border-bottom: 2px solid #666666;">Nature of Assets</th>
                                                                                        <th scope="col" style="background-color: LightGrey; border-bottom: 2px solid #666666;">New Enterprise</th>
                                                                                    </tr>
                                                                                    <tr align="center">
                                                                                        <td align="center" style="width: 15px; text-align: center;">1                                               
                                                                                            <input type="hidden" name="GvProjectdtls$ctl02$HdfQueid" id="GvProjectdtls_ctl02_HdfQueid">
                                                                                            <input type="hidden" name="GvProjectdtls$ctl02$HdfApprovalid" id="GvProjectdtls_ctl02_HdfApprovalid">
                                                                                        </td>
                                                                                        <td style="width: 280px; text-align: center;">Value of Land (in Rs. Lakhs)</td>
                                                                                        <td style="text-align: center;">1,000</td>
                                                                                    </tr>
                                                                                    <tr align="center" style="background-color: White;">
                                                                                        <td align="center" style="width: 15px; text-align: center;">2                                               
                                                                                            <input type="hidden" name="GvProjectdtls$ctl03$HdfQueid" id="GvProjectdtls_ctl03_HdfQueid">
                                                                                            <input type="hidden" name="GvProjectdtls$ctl03$HdfApprovalid" id="GvProjectdtls_ctl03_HdfApprovalid">
                                                                                        </td>
                                                                                        <td style="width: 280px; text-align: center;">Value of Building(in Rs. Lakhs)</td>
                                                                                        <td style="text-align: center;">0</td>
                                                                                    </tr>
                                                                                    <tr align="center">
                                                                                        <td align="center" style="width: 15px; text-align: center;">3                                               
                                                                                            <input type="hidden" name="GvProjectdtls$ctl04$HdfQueid" id="GvProjectdtls_ctl04_HdfQueid">
                                                                                            <input type="hidden" name="GvProjectdtls$ctl04$HdfApprovalid" id="GvProjectdtls_ctl04_HdfApprovalid">
                                                                                        </td>
                                                                                        <td style="width: 280px; text-align: center;">Value of Plant &amp; Machinery(in Rs. Lakhs)</td>
                                                                                        <td style="text-align: center;">0</td>
                                                                                    </tr>
                                                                                    <tr align="center" style="background-color: White; font-weight: bold;">
                                                                                        <td align="center" style="width: 15px; text-align: center;">4                                               
                                                                                            <input type="hidden" name="GvProjectdtls$ctl05$HdfQueid" id="GvProjectdtls_ctl05_HdfQueid">
                                                                                            <input type="hidden" name="GvProjectdtls$ctl05$HdfApprovalid" id="GvProjectdtls_ctl05_HdfApprovalid">
                                                                                        </td>
                                                                                        <td style="width: 280px; text-align: center;">Total Project Cost (in Rs. Lakhs)</td>
                                                                                        <td style="text-align: center;">1,000</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </td>
                                                                </tr>


                                                                <tr>

                                                                    <td>Your enterprise is</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtEnterprisesName" style="color: Black; font-weight: bold;">Small Enterprise</span>
                                                                        </span></td>
                                                                </tr>

                                                                <!--///-->

                                                                <tr>

                                                                    <td>Line of Activity*</td>
                                                                    <td>
                                                                        <span id="txtActivity">Manufactures of Copper Rods &amp; Bare and Copper Wires</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>

                                                                    <td>Pollution Category of Enterprise</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtPolutionCategory" style="font-weight: bold;">Orange</span>
                                                                        </span></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Proposed Employment</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtProposedEmployement">70 Persons</span>
                                                                        </span></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Power requirement</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtPowerRequierement">Greater than or equals to 1501 HP and less than or equals to 10000 HP</span>
                                                                        </span></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Location of the unit</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtLocationofUnit" style="color: Black; font-weight: bold;">IALA (TSIIC)</span>
                                                                        </span></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Application Type</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtApplicationType"></span>
                                                                        </span></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Water required from</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtWaterRequiredFrom">New Bore well, Rivers/Canals</span>
                                                                        </span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Water Required per day </td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtWaterRequiredPerDay">1500.00 (in KLD)</span>
                                                                        </span>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Do you store Rectified Spirit/Kerosene/Naptha</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtSpirit">Yes</span>
                                                                        </span>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Constitution of the unit</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtConsitutionOfUnit">Partnership</span>
                                                                        </span></td>
                                                                </tr>


                                                                <tr>
                                                                    <td>Generator Requirement </td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtGeneratorRequirement">Yes</span>
                                                                        </span>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Height of the Building</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtHightOfBulding">17.00 (In Meters)</span>
                                                                        </span></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Built up Area(Including Parking Cellars)                            </td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtBuiltUpArea">3530.00 (In Square Meters)</span>
                                                                        </span></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Area Type </td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtAreaType">Rural</span>
                                                                        </span>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Is there any need to Fell trees in Proposed Site</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtFellTrees">Yes</span>
                                                                        </span>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Number of trees to be felled</td>
                                                                    <td>
                                                                        <span>
                                                                            <span id="txtTreesToBeFelled">44</span>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td align="center" style="text-align: center">
                                                        <div>
                                                            <div class="table table-responsive">
                                                                <div class="table-bordered">
                                                                    <asp:GridView ID="grdApprovals" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                        CssClass="GRD table-hover" ForeColor="#333333" Width="100%" ShowFooter="true" OnRowDataBound="grdApprovals_RowDataBound">
                                                                        <FooterStyle BackColor="#013161" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                        <RowStyle CssClass="GRDITEM" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <HeaderStyle CssClass="GRDHEADER" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />

                                                                        <Columns>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="S No">
                                                                                <ItemTemplate>
                                                                                    <%# Container.DataItemIndex + 1%>
                                                                                    <asp:HiddenField ID="HdfQueid" runat="server" />
                                                                                    <asp:HiddenField ID="HdfApprovalid" runat="server" />
                                                                                    <asp:HiddenField ID="HdfDeptid" runat="server" />
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                                <ItemStyle Width="50px" />
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="ApprovalName" HeaderText="Approval Required" ItemStyle-HorizontalAlign="Center">
                                                                                <ItemStyle Width="350px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="TMD_DeptName" HeaderText="Department">
                                                                                <ItemStyle Width="180px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="CFEQA_APPROVALFEE" FooterStyle-HorizontalAlign="Right" HeaderText="Fee (Rs.)">
                                                                                <FooterStyle CssClass="GRDITEM2" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                <HeaderStyle HorizontalAlign="Right" />
                                                                                <ItemStyle CssClass="GRDITEM2" Width="150px" HorizontalAlign="Center" />
                                                                            </asp:BoundField>
                                                                            <asp:TemplateField HeaderText="Whether Approval Already Obtained" Visible="false">
                                                                                <ItemStyle Width="250px" />
                                                                                <ItemTemplate>
                                                                                    <asp:RadioButtonList ID="rblAlrdyObtained" runat="server" SelectedValue='<%# Eval("CFEQA_ISOFFLINE") %>' AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAlrdyObtained_SelectedIndexChanged">
                                                                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                                                        <asp:ListItem Selected="True" Value="N">No</asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                    <asp:HiddenField ID="HdfAmount" runat="server" />
                                                                                    <itemstyle horizontalalign="Center" width="240px" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="140px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Apply for Approval" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="ChkApproval" runat="server" AutoPostBack="True" OnCheckedChanged="ChkApproval_CheckedChanged" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="140px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAmounts" runat="server" Text="Label"></asp:Label>
                                                                                    <itemstyle horizontalalign="Center" width="140px" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" Width="140px" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Approval ID" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblApprID" runat="server" Text='<%# Eval("CFEQA_APPROVALID") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText=" Dept ID" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDeptID" runat="server" Text='<%# Eval("CFEQA_DEPTID") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>






                                                            <%--<table cellspacing="0" cellpadding="4" rules="all" border="1" id="grdDetails" style="width: 100%; height: 62px; font-weight: normal; font-size: 14px; font-family: Verdana; color: #333333; border-width: 1px; border-style: Solid; border-color: Black; border-collapse: collapse;">
                                                                <tbody>
                                                                    <tr style="color: Black; font-weight: bold;">
                                                                        <th align="center" scope="col">S No</th>
                                                                        <th scope="col">Approval Required </th>
                                                                        <th scope="col">Department</th>
                                                                        <th scope="col">Fees (Rs.)</th>
                                                                    </tr>
                                                                    <tr align="left" valign="middle">
                                                                        <td style="width: 50px;">1
                                   
                                                                            <input type="hidden" name="grdDetails$ctl02$HdfQueid" id="grdDetails_ctl02_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl02$HdfApprovalid" id="grdDetails_ctl02_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Consent For Establishment from Pollutuion Control Board </td>
                                                                        <td style="width: 180px;">Pollution Control Board</td>
                                                                        <td style="width: 150px;">0</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle" style="background-color: White;">
                                                                        <td style="width: 50px;">2                                   
                                                                            <input type="hidden" name="grdDetails$ctl03$HdfQueid" id="grdDetails_ctl03_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl03$HdfApprovalid" id="grdDetails_ctl03_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Factory plan approval from Director of Factories</td>
                                                                        <td style="width: 180px;">Factories</td>
                                                                        <td style="width: 150px;">10000</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle">
                                                                        <td style="width: 50px;">3                                   
                                                                            <input type="hidden" name="grdDetails$ctl04$HdfQueid" id="grdDetails_ctl04_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl04$HdfApprovalid" id="grdDetails_ctl04_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Industrial Building Plan Approval from IALA/TGIIC</td>
                                                                        <td style="width: 180px;">TGIIC</td>
                                                                        <td style="width: 150px;">10000</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle" style="background-color: White;">
                                                                        <td style="width: 50px;">4
                                   
                                                                            <input type="hidden" name="grdDetails$ctl05$HdfQueid" id="grdDetails_ctl05_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl05$HdfApprovalid" id="grdDetails_ctl05_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Industry Department User Charges</td>
                                                                        <td style="width: 180px;">Industries</td>
                                                                        <td style="width: 150px;">10000</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle">
                                                                        <td style="width: 50px;">5
                                   
                                                                            <input type="hidden" name="grdDetails$ctl06$HdfQueid" id="grdDetails_ctl06_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl06$HdfApprovalid" id="grdDetails_ctl06_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">NOC from Forest Department</td>
                                                                        <td style="width: 180px;">FOREST</td>
                                                                        <td style="width: 150px;">22000</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle" style="background-color: White;">
                                                                        <td style="width: 50px;">6
                                   
                                                                            <input type="hidden" name="grdDetails$ctl07$HdfQueid" id="grdDetails_ctl07_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl07$HdfApprovalid" id="grdDetails_ctl07_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">NOC required for Manufacture,store,sale, transport of Naphtha, Petroleum, Diesel and Kerosene</td>
                                                                        <td style="width: 180px;">Collector-Adilabad</td>
                                                                        <td style="width: 150px;">0</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle">
                                                                        <td style="width: 50px;">7
                                   
                                                                            <input type="hidden" name="grdDetails$ctl08$HdfQueid" id="grdDetails_ctl08_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl08$HdfApprovalid" id="grdDetails_ctl08_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">NOC required for setting up of explosives manufacturing, storage, sale, transport of Explosives</td>
                                                                        <td style="width: 180px;">Collector-Adilabad</td>
                                                                        <td style="width: 150px;">0</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle" style="background-color: White;">
                                                                        <td style="width: 50px;">8
                                   
                                                                            <input type="hidden" name="grdDetails$ctl09$HdfQueid" id="grdDetails_ctl09_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl09$HdfApprovalid" id="grdDetails_ctl09_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Permission from Ground Water Department to dig bore well </td>
                                                                        <td style="width: 180px;">Ground Water</td>
                                                                        <td style="width: 150px;">18500</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle">
                                                                        <td style="width: 50px;">9
                                   
                                                                            <input type="hidden" name="grdDetails$ctl10$HdfQueid" id="grdDetails_ctl10_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl10$HdfApprovalid" id="grdDetails_ctl10_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Permission from Irrigation Department </td>
                                                                        <td style="width: 180px;">Irrigation</td>
                                                                        <td style="width: 150px;">10000</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle" style="background-color: White;">
                                                                        <td style="width: 50px;">10
                                   
                                                                            <input type="hidden" name="grdDetails$ctl11$HdfQueid" id="grdDetails_ctl11_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl11$HdfApprovalid" id="grdDetails_ctl11_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Provisional NOC from Fire Services Department</td>
                                                                        <td style="width: 180px;">Fire</td>
                                                                        <td style="width: 150px;">35300</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle">
                                                                        <td style="width: 50px;">11
                                   
                                                                            <input type="hidden" name="grdDetails$ctl12$HdfQueid" id="grdDetails_ctl12_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl12$HdfApprovalid" id="grdDetails_ctl12_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Registration Under Contract Labour(Regulation and Abolition) Act, 1970 </td>
                                                                        <td style="width: 180px;">Labour Department</td>
                                                                        <td style="width: 150px;">500</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle" style="background-color: White;">
                                                                        <td style="width: 50px;">12
                                   
                                                                            <input type="hidden" name="grdDetails$ctl13$HdfQueid" id="grdDetails_ctl13_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl13$HdfApprovalid" id="grdDetails_ctl13_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Service Connection Certificate from TSNPDCL</td>
                                                                        <td style="width: 180px;">TSNPDCL</td>
                                                                        <td style="width: 150px;">0</td>
                                                                    </tr>
                                                                    <tr align="left" valign="middle">
                                                                        <td style="width: 50px;">13
                                   
                                                                            <input type="hidden" name="grdDetails$ctl14$HdfQueid" id="grdDetails_ctl14_HdfQueid">
                                                                            <input type="hidden" name="grdDetails$ctl14$HdfApprovalid" id="grdDetails_ctl14_HdfApprovalid">
                                                                        </td>
                                                                        <td style="width: 450px;">Telangana Harithanidhi Fund(Registration Under Contract Labour(Regulation and Abolition) Act, 1970 )</td>
                                                                        <td style="width: 180px;">Labour Department</td>
                                                                        <td style="width: 150px;">1000</td>
                                                                    </tr>
                                                                    <tr style="color: Black; font-weight: bold;">
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>
                                                                        <td>Total Fee</td>
                                                                        <td>117300.00</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>--%>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td align="center" class="style2" style="text-align: center">Note: For 
        any other clearances from Government of India, applicant shall apply directly to 
        the concerned department.</td>
                                                </tr>

                                                <tr>
                                                    <td align="center" class="style2" style="text-align: center"><a href="Home.aspx" target="_self" style="color: blue">HOME</a></td>
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
        </div>
    </form>
</body>
</html>
