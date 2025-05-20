<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NiveshMitra.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="assets/css/main.css" />
    <style>
        button[type="submit"] {
    width: 100%;
    padding: 10px;
    background: #0078d7 !important;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}
        a.rr-btn.mt-35 {
    background:#0078d7 !important;
    width: 100%;
    color: #fff;
    border-radius: 6px;
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
                body.login-page {
    background: url(../assets/imgs/loginbg.png);
    background-size: cover;
    background-position: top;
}
                .login-box, .register-box {
    width: 360px;
}
                .login-page, .register-page {
    -ms-flex-align: center;
    align-items: center;
    background-color: #e9ecef;
    display: -ms-flexbox;
    display: flex
;
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
    display: flex
;
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
.contact__input {
    margin-bottom: 12px;
}
                </style>
    <script type="text/javascript">       

        function Generate() {
            var pass;
            var passObj = $("#<%= txtPswrd.ClientID%>").val();
            if (passObj != "") {
                var x = (Math.random() * 1973);
                $("input[id*='asp_hidden']").val(x);
                asp_hiddenVal = $("input[id*='asp_hidden']").val();
                pass = MD5(passObj + asp_hiddenVal);
                $("#<%= txtPswrd.ClientID%>").val(pass);
                return true;
            }
            else {
                return false;
            }
        }
        function ResetBorderColor() {
            var txtUsername = document.getElementById('<%= txtUsername.ClientID %>');

            if (txtUsername.value.trim() != '') {
                txtUsername.style.borderColor = '1px solid #767575b5';
            }

        }
        function BorderColor() {
            var txtPswrd = document.getElementById('<%= txtPswrd.ClientID %>');

            if (txtPswrd.value.trim() != '') {
                txtPswrd.style.borderColor = '1px solid #767575b5';
            }
        }
        function BorderCaptchaColor() {
            var txtcaptcha = document.getElementById('<%= txtcaptcha.ClientID %>');

            if (txtcaptcha.value.trim() != '') {
                txtcaptcha.style.borderColor = '1px solid #767575b5';
            }
        }

    </script>
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
                <div class="form-group">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div id="success" runat="server" visible="false" class="alert alert-success m-0" align="Center">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>Success!</strong>
                                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                </div>
                                <div id="Failure" runat="server" visible="false" class="alert alert-danger m-0" align="Center">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>Warning!</strong>
                                    <asp:Label ID="lblmsg0" runat="server"></asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="card-body">
                    <p class="login-box-msg">Welcome! Access Your Dashboard.</p>


                    <%--   <div class="input-group mb-3">
                        <select class="contact__input1">
                            <option selected disabled>Choose your User</option>
                            <option value="1">Entrepreneur</option>
                            <option value="2">Admin</option>
                        </select>                      

                    </div>--%>

                    <div class="input-group mb-3">
                        <asp:DropDownList ID="ddlUserType" runat="server" CssClass="contact__input1">
                            <asp:ListItem Text="Choose User" Value="" Disabled="true" />
                            <asp:ListItem Text="Entrepreneur" Value="1" Selected="true" />
                            <asp:ListItem Text="Admin" Value="2" />
                        </asp:DropDownList>

                    </div>


                    <div class="input-group">
                        <div class="contact__input">
                            <%-- <input type="text" placeholder="Login ID (PAN No)" />--%>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="contact__input1" placeholder="Login ID (PAN No)" TabIndex="1"></asp:TextBox>
                        </div>

                    </div>
                    <div class="input-group">
                        <div class="contact__input">
                            <%--<input type="password" placeholder="Your Password" />--%>
                            <asp:TextBox ID="txtPswrd" runat="server" CssClass="contact__input1" placeholder="Your Password" onblur="return Generate();" TabIndex="1" TextMode="Password"></asp:TextBox>

                        </div>
                    </div>
                    <div class="captcha-container">

                        <%--<img src="assets/imgs/captch.jpg" alt="CAPTCHA" class="captcha-image" style="width: 55%; border-radius: 5px; margin-right: 14px;">
                        <button type="button" onclick="generateCaptcha()">↻</button>
                        <input type="text" id="captchaInput" class="form-control w-50" placeholder="Enter CAPTCHA" />--%>
                          <asp:TextBox ID="txtcaptcha" Height="40px" runat="server" CssClass="contact__input1" Width="170px" Placeholder="Enter CAPTCHA" />
                        <asp:Image ID="imgCaptcha" runat="server" class="captcha-image" Style="width: 55%; border-radius: 5px; margin-right: 14px;" />
                        <asp:ImageButton ID="btnRefresh" runat="server"  OnClick="btnRefresh_Click" ImageUrl="assets/imgs/Refresh.jpg" Height="35px" Width="40px" />
                      

                    </div>
                    <%-- ImageUrl="~/GenerateCaptcha.aspx"--%>


                    <div class="row">

                        <!-- /.col -->
                        <%-- <div class="col-12">
                            <a href="Quesstionniare_cfe.html" class="rr-btn mt-35">Login</a>
                            <%--  <asp:Button runat="server" ID="btnLogint" Text="Login" class="rr-btn mt-35" />--%>
                        <%--</div>--%>
                         <div class="col-4"></div>
                        <div class="col-4">
                            <%--<asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="rr-btn mt-35" />--%>
                            <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Login" class="rr-btn mt-35" />
                        </div>
                         <div class="col-4"></div>
                        <!-- /.col -->
                    </div>



                    <!-- /.social-auth-links -->
                    <div class="wrapper_footer">
                        <asp:HiddenField runat="server" ID="asp_hidden" />
                        <p class="mb-0 mt-4  text-center fnt_sb_14">
                            <a href="Register.aspx" class="text-center">Don’t have an account?
           
                                <span class="text_highlighted">Register</span> </a>
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
