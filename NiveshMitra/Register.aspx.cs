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

namespace NiveshMitra
{
    public partial class Register : System.Web.UI.Page
    {
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
                    UserRegDetails Userregdtls = new UserRegDetails();
                    Userregdtls.Fullname = txtFirstName.Text.Trim();
                    Userregdtls.Lastname = txtLastName.Text.Trim(); ;
                    Userregdtls.CompanyName = txtEnterPrice.Text.Trim();
                    Userregdtls.PANno = txtPan.Text.Trim();
                    Userregdtls.Email = txtEmail.Text.Trim();
                    //Userregdtls.Password = PasswordDescription(txtPswd.Text);
                   // Userregdtls.Password = txtPswd.Text.Trim();
                    Userregdtls.MobileNo = txtMobileNo.Text.Trim();
                    Userregdtls.State = "STATE";
                    Userregdtls.DateofBirth = "1988-04-10";
                    Userregdtls.IPAddress = GetIPAddress();
                   // valid = useregBAL.InsertUserRegDetails(Userregdtls);
                    if (Convert.ToInt32(valid) != 0)
                    {
                        string loginlink = "https://invest.meghalaya.gov.in/Login.aspx";
                        //string EmailText = "Dear " + txtName.Text.Trim() + "," +
                        //"</b><br/><br/> Welcome to Invest Meghalaya Portal. Thank you for registering."
                        //+ "</b><br/><br/> Please Login with Registered E-mail by using the link  <a href='" + "https://invest.meghalaya.gov.in/Login.aspx" + "' target='_blank' > Invest Meghalaya Authority - Login Link </a>"
                        //       + " </b><br/><br/> Best Regards"
                        //        + "</b><br/> Invest Meghalaya Authority";
                        SMSandMail smsMail = new SMSandMail();

                     //   smsMail.SendEmailSingle(txtEmail.Text.Trim(), "sangem_madhuri@cms.co.in,chinni_sowjanya@cms.co.in", "Welcome to Our Web Portal", EmailText, "", "User Registration",
                       //          "", "", valid);


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
    }
}