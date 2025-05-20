<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NiveshMitra.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet" />
    <style>
        body.login-page {
            background: url(../assets/imgs/rege.png);
            background-size: cover;
            background-position: top;
        }

        .login-box, .register-box {
            width: 600px;
        }

        .logo_sec img {
            min-height: 70px !important;
            height: 56px;
            width: 55% !important;
        }

        .login-page, .register-page {
            -ms-flex-align: center;
            align-items: center;
            background-color: #e9ecef;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            height: 100vh;
            -ms-flex-pack: center;
            justify-content: center;
        }

        .login-box .card, .register-box .card {
            margin-bottom: 0;
        }

        .card-primary.card-outline {
            border-top: 3px solid #007bff;
        }

        .card {
            box-shadow: 0 0 1px rgba(0, 0, 0, .125), 0 1px 3px rgba(0, 0, 0, .2);
            margin-bottom: 1rem;
        }

        .mt-4, .my-4 {
            margin-top: 1.5rem !important;
        }

        .card {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0, 0, 0, .125);
            border-radius: .25rem;
        }

        .card-header {
            background-color: transparent;
            border-bottom: 1px solid rgba(0, 0, 0, .125);
            padding: .75rem 1.25rem;
            position: relative;
            border-top-left-radius: .25rem;
            border-top-right-radius: .25rem;
        }

        .text-center {
            text-align: center !important;
        }

        .card-body {
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            min-height: 1px;
            padding: 1.25rem;
        }

        .login-box-msg, .register-box-msg {
            margin: 0;
            padding: 0 20px 20px;
            text-align: center;
        }

        .mb-3, .my-3 {
            margin-bottom: 1rem !important;
        }

        .logo_sec img {
            /* min-height: 70px; */
            height: 86px;
        }

        .captcha-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        canvas {
            background: #f0f0f0;
            border-radius: 5px;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #0078d7;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

            button[type="submit"]:hover {
                background: #005fa3;
            }

        button[type="button"] {
            background: transparent;
            border: none;
            font-size: 18px;
            cursor: pointer;
        }

        .error-msg {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }

        select.contact__input1, .contact__input input {
            font-family: var(--rr-ff-body);
            font-weight: var(--rr-fw-medium);
            padding: 7px 20px;
            font-style: normal;
            font-size: 15px;
            line-height: 20px;
            color: rgba(8, 5, 33, 0.5);
            width: 100%;
            border-radius: 8px;
        }

        .form-control {
            display: block;
            width: 100%;
            height: calc(2.25rem + 2px);
            padding: .375rem .75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            box-shadow: inset 0 0 0 transparent;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        button {
            margin: 0px 16px;
        }

        input#captchaInput {
            padding: 20px 20px !important;
            font-style: normal;
            font-size: 15px;
            line-height: 20px;
            color: rgba(8, 5, 33, 0.5);
            width: 100%;
            border-radius: 8px;
        }

        .btn-info {
            color: #fff;
            background-color: #17a2b8;
            border-color: #17a2b8;
            box-shadow: none;
        }

        .btn-block {
            display: block;
            width: 100%;
        }

        .btn {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            padding: .375rem .75rem;
            border-radius: .25rem;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        a {
            color: #17a2b8;
        }

        .contact__form-wrapper {
            margin-top: 0px;
        }

        .contact__input {
            margin-bottom: 12px;
        }
    </style>
</head>
<body class="login-page">
    <form id="form1" runat="server">
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary mt-4">
                <div class="card-header text-center">
                    <div class="logo_sec">
                        <img src="assets/imgs/logo1.png" alt="logo.png" class="">
                    </div>
                </div>
                <div class="card-body">
                    <p class="login-box-msg">Entrepreneur Registration.</p>
                    <div class="row" align="Center">
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
                        <div class="contact__title-wrapper">

                            <div class="contact__form-wrapper">
                                <div class="col-sm-12">
                                    <div class="contact__input">
                                        <%--<input type="text"  />--%>
                                        <asp:TextBox ID="txtEnterPrice" runat="server" placeholder="Company/Enterprise Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="contact__input">
                                            <%--    <input type="text" placeholder="Please Enter Pan Number" />--%>
                                            <asp:TextBox ID="txtPan" runat="server" placeholder="Please Enter Pan Number"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="contact__input">
                                            <%-- <input type="number" placeholder="Please Enter First Name" />--%>
                                            <asp:TextBox ID="txtFirstName" runat="server" placeholder="Please Enter First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 p-0-5-20">
                                        <div class="contact__input">
                                            <%--  <input type="tel" placeholder="Please Enter Last Name" />--%>
                                            <asp:TextBox ID="txtLastName" runat="server" placeholder="Please Enter Last Name"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="contact__input">
                                            <%--                                            <input type="number" placeholder="Please Enter Email" />--%>
                                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Please Enter Email"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-sm-6 p-0-5-20">
                                        <div class="contact__input">
                                            <%-- <input type="tel" placeholder="Please Enter Mobile No" />--%>
                                            <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Please Enter Mobile No"></asp:TextBox>
                                        </div>
                                    </div>
                                  <%--  <div class="col-sm-6 p-0-5-20">
                                        <div class="contact__input">
                                            <asp:TextBox ID="txtPswd" runat="server" placeholder="Please Enter Password" Visible="false"></asp:TextBox>
                                        </div>
                                    </div>--%>
                                    <div class="col-md-12 d-flex">
                                        <div class="col-md-12">
                                            <div class="captcha-container">
                                                <%--   <img src="assets/imgs/captch.jpg" alt="CAPTCHA" class="captcha-image" style="width: 20%; border-radius: 5px; margin-right: 14px;">
                                                <button type="button" onclick="generateCaptcha()">↻</button>
                                                <input type="text" id="captchaInput" class="form-control w-50" placeholder="Enter CAPTCHA">--%>

                                                <asp:Image ID="imgCaptcha" runat="server" class="captcha-image" Style="width: 35%; border-radius: 5px; margin-right: 14px;" Height="35px" />
                                                <asp:ImageButton ID="btnRefresh" runat="server" AlternateText="Refresh" OnClick="btnRefresh_Click" ImageUrl="assets/imgs/Refresh.jpg" Height="35px" Width="40px" />
                                                <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control w-50" Placeholder="Enter CAPTCHA" Height="35px" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <%--  <button type="submit" class="rr-btn mt-35" style="width: 95%;">Submit now</button>--%>
                                        <asp:Button runat="server" class="rr-btn mt-35" Style="width: 95%;" OnClick="btnSubmit_Click" Text="Submit" ID="btnSubmit"></asp:Button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>




                    <div class="row">

                        <!-- /.col -->

                        <!-- /.col -->
                    </div>



                    <!-- /.social-auth-links -->
                    <div class="wrapper_footer">

                        <p class="mb-0 mt-4  text-center fnt_sb_14">
                            <a href="Login.aspx" class="text-center">If you have already Register?
           
                                <span class="text_highlighted">Login</span> </a>
                        </p>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </form>
</body>
</html>
