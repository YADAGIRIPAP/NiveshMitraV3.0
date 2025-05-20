using NiveshMitra.BAL.CommonBAL;
using NiveshMitra.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static NiveshMitra.BAL.CommonBAL.LoginBAL;

namespace NiveshMitra
{
    public partial class Register : System.Web.UI.Page
    {
        UserRegBAL useregBAL = new UserRegBAL();
        MasterBAL mstrBAL = new MasterBAL();
        string Password;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                success.Visible = false;
                Failure.Visible = false;
                if (!IsPostBack)
                {
                    FillCapctha();
                    txtEmail.Text = "";
                    //txtPswd.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string Errormsg = "";
                string valid = "0";
               // Errormsg = validations();

                if (string.IsNullOrEmpty(Errormsg))
                {

                    Random random = new Random();
                    string combination = "ABCDEFGHJKLMNPQRSTUVWXYZabdfghjkmnpqrstuvwxyz123456789";
                    StringBuilder Password = new StringBuilder();
                    for (int i = 0; i < 8; i++)
                        Password.Append(combination[random.Next(combination.Length)]);

                    UserRegDetails Userregdtls = new UserRegDetails();
                    Userregdtls.Fullname = txtFirstName.Text.Trim(); 
                    Userregdtls.Lastname = txtLastName.Text.Trim();
                    Userregdtls.CompanyName = txtEnterPrice.Text.Trim();
                    Userregdtls.PANno = txtPan.Text.Trim();
                    Userregdtls.Email = txtEmail.Text.Trim();
                    //Userregdtls.Password = PasswordDescription(txtPswd.Text);
                    Userregdtls.Password = Password.ToString();
                    Userregdtls.MobileNo = txtMobileNo.Text.Trim();
                    Userregdtls.State = "STATE";
                    Userregdtls.DateofBirth = "1988-04-10";
                    Userregdtls.IPAddress = GetIPAddress();
                    valid = useregBAL.InsertUserRegDetails(Userregdtls);
                    if (Convert.ToInt32(valid) != 0)
                    {
                        //string loginlink = "https://invest.meghalaya.gov.in/Login.aspx";
                        string EmailText = "Dear " + txtFirstName.Text.Trim() + ","+ txtLastName.Text.Trim() + "," +
                        "</b><br/><br/> Welcome to Nivesh Mitra Portal. Thank you for registering."
                        + "</b><br/><br/> Please Login with Registered E-mail"
                               + " </b><br/><br/> Best Regards"
                                + "</b><br/> UP Single Window System";
                        SMSandMail smsMail = new SMSandMail();

                        smsMail.SendEmailSingle(txtEmail.Text.Trim(), "sangem_madhuri@cms.co.in,chinni_sowjanya@cms.co.in", "Welcome to Our Web Portal", EmailText, "", "User Registration",
                                 "", "", valid);


                       // btnClear_Click(sender, e);
                        lblmsg.Text = "Registered Successfully!";
                        success.Visible = true;

                    }




                }
                else
                {
                    FillCapctha();
                    txtCaptcha.Text = "";
                    string message = "alert('" + Errormsg + "')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                }
            }
            catch (SqlException ex)
            {
                FillCapctha(); txtCaptcha.Text = "";
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
            }
            catch (Exception ex)
            {
                FillCapctha(); txtCaptcha.Text = "";
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
            }


        }
        void FillCapctha()
        {
            try
            {
                ViewState["captcha"] = "";

                Random random = new Random();
                string combination = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabdfghjkmnpqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();

                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                ViewState["captcha"] = captcha.ToString();
                imgCaptcha.ImageUrl = "~/CaptchaHandler.ashx?query=" + captcha.ToString();
                imgCaptcha.Enabled = false;
            }
            catch
            {
                throw;
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();
        }
        private string GetIPAddress()
        {
            var visitorsIpAddr = string.Empty;

            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                visitorsIpAddr = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }
            else if (!string.IsNullOrEmpty(Request.UserHostAddress))
            {
                visitorsIpAddr = Request.UserHostAddress;
            }

            return visitorsIpAddr;
        }
        public string validations()
        {
            try
            {
                int slno = 1;
                string errormsg = "";
                if (string.IsNullOrEmpty(txtPan.Text) || txtPan.Text == "" || txtPan.Text == null)
                {
                    errormsg = errormsg + slno + ". Please Enter PAN number \\n";
                    slno = slno + 1;
                }
                if (string.IsNullOrEmpty(txtEnterPrice.Text.Trim()) || txtEnterPrice.Text.Trim() == "" || txtEnterPrice.Text.Trim() == null)
                {
                    errormsg = errormsg + slno + ". Please Enter Company Name as per PAN number \\n";
                    slno = slno + 1;
                }
                if (string.IsNullOrEmpty(txtFirstName.Text.Trim()) || txtFirstName.Text.Trim() == "" || txtFirstName.Text.Trim() == null)
                {
                    errormsg = errormsg + slno + ". Please Enter FirestName \\n";
                    slno = slno + 1;
                }
                if (string.IsNullOrEmpty(txtLastName.Text.Trim()) || txtLastName.Text.Trim() == "" || txtLastName.Text.Trim() == null)
                {
                    errormsg = errormsg + slno + ". Please Enter LastName \\n";
                    slno = slno + 1;
                }
                if (string.IsNullOrEmpty(txtMobileNo.Text) || txtMobileNo.Text == "" || txtMobileNo.Text == null)
                {
                    errormsg = errormsg + slno + ". Please Enter Mobile Number \\n";
                    slno = slno + 1;
                }
                if (string.IsNullOrEmpty(txtEmail.Text) || txtEmail.Text == "" || txtEmail.Text == null)
                {
                    errormsg = errormsg + slno + ". Please Enter Email \\n";
                    slno = slno + 1;
                }
                //if (string.IsNullOrEmpty(txtPswd.Text) || txtPswd.Text == "" || txtPswd.Text == null)
                //{
                //    errormsg = errormsg + slno + ". Please Enter Password \\n";
                //    slno = slno + 1;
                //}
                //if (!string.IsNullOrEmpty(txtPswd.Text) || txtPswd.Text != "")
                //{
                //    //Password = PasswordDescription(txtPswd.Text);
                //    Password = (txtPswd.Text.Trim());


                    if (Password.Trim() == txtEmail.Text.Trim())
                    {
                        errormsg = errormsg + slno + ". User Email and Password should not be same \\n";
                        slno = slno + 1;
                    }
                    if (Password.Trim().Length < 8)
                    {
                        errormsg = errormsg + slno + ". Password must have 8 characters Minimum \\n";
                        slno = slno + 1;
                    }
                    //if (!(Password.Any(char.IsLower) && Password.Any(char.IsUpper) &&
                    //           Password.Any(char.IsDigit) && ValidatePassword(Password.Trim())))
                    //{
                    //    errormsg = errormsg + slno + ". Password must have atleast one upper case letter, one lower case letter, one numer and one special character \\n";
                    //    slno = slno + 1;
                    //}
               // }

                if (string.IsNullOrEmpty(txtCaptcha.Text) || txtCaptcha.Text == "" || txtCaptcha.Text == null)
                {
                    errormsg = errormsg + slno + ". Please Enter Captcha \\n";
                    slno = slno + 1;
                }
                else if (txtCaptcha.Text.Trim() != Convert.ToString(ViewState["captcha"]))
                {
                    errormsg = errormsg + slno + ". Please Enter Correct Captcha \\n";
                    slno = slno + 1;
                }

                return errormsg;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}