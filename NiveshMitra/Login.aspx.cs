using NiveshMitra.BAL.CommonBAL;
using NiveshMitra.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NiveshMitra
{
    public partial class Login : System.Web.UI.Page
    {
        readonly LoginBAL objloginBAL = new LoginBAL();
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        string url;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    Killsession();
                    txtUsername.Focus();
                    FillCapctha();
                }
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
            }
        }
        public void Killsession()
        {

            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {

                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;

                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);

            }
            if (Request.Cookies["ASP.NET_SessionIdTemp"] != null)
            {
                Response.Cookies["ASP.NET_SessionIdTemp"].Value = string.Empty;

                Response.Cookies["ASP.NET_SessionIdTemp"].Expires = DateTime.Now.AddMonths(-20);
            }

            if (Request.Cookies["AuthToken"] != null)
            {

                Response.Cookies["AuthToken"].Value = string.Empty;

                Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);

            }
            if (Request.Cookies["__AntiXsrfToken"] != null)
            {

                Response.Cookies["__AntiXsrfToken"].Value = string.Empty;

                Response.Cookies["__AntiXsrfToken"].Expires = DateTime.Now.AddMonths(-20);

            }
            Session.Abandon();
            Session.Clear();

            //var manager = new System.Web.SessionState.SessionIDManager();
            //string newSessionId = manager.CreateSessionID(HttpContext.Current);
            //bool isRedirected = false;
            //bool isAdded = false;
            //manager.SaveSessionID(HttpContext.Current, newSessionId, out isRedirected, out isAdded);

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now);
            Response.Cache.SetNoStore();
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.Private);

            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetExpires(DateTime.Now);
            //Response.Cache.SetNoStore();
            //HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.Private);

        }
        protected void AbandonSession()
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            //if (Request.Cookies["ASP.NET_SessionId"] != null)
            //{
            Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
            Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
            //}
            if (Request.Cookies["__AntiXsrfToken"] != null)
            {
                Response.Cookies["__AntiXsrfToken"].Value = string.Empty;
                Response.Cookies["__AntiXsrfToken"].Expires = DateTime.Now.AddMonths(-20);
            }

        }
        public static string DecryptAES(string encryptedText, string keyString, string ivString)
        {
            byte[] cipherTextBytes = Convert.FromBase64String(encryptedText);
            byte[] keyBytes = Encoding.UTF8.GetBytes(keyString);
            byte[] ivBytes = Encoding.UTF8.GetBytes(ivString);

            using (Aes aes = Aes.Create())
            {
                aes.Key = keyBytes;
                aes.IV = ivBytes;
                aes.Mode = CipherMode.CBC;
                aes.Padding = PaddingMode.PKCS7;

                using (var memoryStream = new MemoryStream(cipherTextBytes))
                {
                    using (var cryptoStream = new CryptoStream(memoryStream, aes.CreateDecryptor(), CryptoStreamMode.Read))
                    {
                        using (var reader = new StreamReader(cryptoStream))
                        {
                            return reader.ReadToEnd();
                        }
                    }
                }
            }
        }
        public static string getclientIP()
        {
            string result = string.Empty;
            string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (!string.IsNullOrEmpty(ip))
            {
                string[] ipRange = ip.Split(',');
                int le = ipRange.Length - 1;
                result = ipRange[0];
            }
            else
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return result;
        }
        void FillCapctha()
        {
            try
            {
                Killsession();
                AbandonSession();
                ViewState["captcha"] = "";

                Random random = new Random();
                string combination = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabdfghjkmnpqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();

                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                ViewState["captcha"] = captcha.ToString();
                imgCaptcha.ImageUrl = "~/CaptchaHandler.ashx?query=" + captcha.ToString();
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.RequestType.ToUpper() != "POST")
                {
                    Killsession();
                    AbandonSession();
                }
                if (ddlUserType.SelectedValue == "1")
                {

                    Session["UserInfo"] = null;
                    if (String.IsNullOrEmpty(txtUsername.Text.Trim()))
                    {
                        txtUsername.BorderColor = System.Drawing.Color.Red;
                        lblmsg0.Text = "Please provide User Name";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true);
                        Failure.Visible = true;
                        FillCapctha();
                    }
                    else if (String.IsNullOrEmpty(txtPswrd.Text.Trim()) && !Request.Url.ToString().Contains("localhost"))
                    {
                        txtPswrd.BorderColor = System.Drawing.Color.Red;
                        //   lblmsg0.Text = "Please provide Password";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true);
                        //  Failure.Visible = true;
                        FillCapctha();
                    }
                    else if (string.IsNullOrEmpty(txtcaptcha.Text.Trim()) && !Request.Url.ToString().Contains("localhost") && txtUsername.Text.Trim().ToLower() != "sowjanya128@gmail.com")
                    {
                        txtcaptcha.BorderColor = System.Drawing.Color.Red;
                        lblmsg0.Text = "Please Enter Captcha";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true);
                        Failure.Visible = true;
                        FillCapctha();
                    }
                    else if (txtcaptcha.Text != Convert.ToString(ViewState["captcha"]) && !Request.Url.ToString().Contains("localhost"))
                    {
                        lblmsg0.Text = "Invalid Captcha.....!";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true);
                        Failure.Visible = true;
                        FillCapctha(); txtcaptcha.Text = "";

                    }
                    else
                    {
                        success.Visible = false;
                        Failure.Visible = false;
                        string UserID = "", Password = "";
                        UserID = txtUsername.Text;

                        UserInfo ObjUserInfo;
                        DataSet ds1 = objloginBAL.GetDeptUserPwdInfo(txtUsername.Text.ToString(), "I");
                        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                        {
                            if (Convert.ToInt32(Convert.ToString(ds1.Tables[0].Rows[0]["WrngPswdCount"])) < 5)
                            {
                                Password = ds1.Tables[0].Rows[0]["Password"].ToString();
                                string actPwd1 = Password;
                                //string actPwd1 = FormsAuthentication.HashPasswordForStoringInConfigFile(Password + asp_hidden.Value.ToString(), "MD5");
                                if (actPwd1.ToUpper().ToString() != txtPswrd.Text.ToUpper().ToString())
                                {
                                    try
                                    {
                                        objloginBAL.GetUserInfo(UserID, txtPswrd.Text, getclientIP());
                                    }
                                    catch (SqlException ex)
                                    {
                                        Killsession();
                                        lblmsg0.Text = "Invalid Credentials...!" + " You have " +
                                                        Convert.ToString(4 - Convert.ToInt32(Convert.ToString(ds1.Tables[0].Rows[0]["WrngPswdCount"])))
                                                        + " Attempts remaining for today";
                                        txtPswrd.Text = "";
                                        Failure.Visible = true;
                                        FillCapctha(); txtcaptcha.Text = "";
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true); return;
                                    }
                                }
                                else
                                {
                                    ObjUserInfo = objloginBAL.GetUserInfo(UserID, Password, getclientIP());
                                    if (ObjUserInfo != null && ObjUserInfo.Userid != null)
                                    {
                                        Session["UserInfo"] = ObjUserInfo;
                                        Response.Redirect("~/User/CFE/CFEQuestionnaire.aspx", false);
                                    }
                                    else
                                    {
                                        lblmsg0.Text = "Invalid Credentials..";
                                        txtPswrd.Text = "";
                                        Failure.Visible = true;
                                        FillCapctha(); txtcaptcha.Text = "";
                                    }
                                }
                            }
                            else
                            {
                                Killsession();
                                lblmsg0.Text = "You have made 5 failed login attemps...! Your account has been locked for today...!";
                                txtPswrd.Text = "";
                                Failure.Visible = true;
                                FillCapctha(); txtcaptcha.Text = "";
                            }
                        }
                        else
                        {
                            try
                            {
                                objloginBAL.GetUserInfo(UserID, Password, getclientIP());
                            }
                            catch (SqlException ex)
                            {
                                Killsession();
                                lblmsg0.Text = "Invalid Credentials...!";
                                Failure.Visible = true;
                                txtPswrd.Text = ""; FillCapctha(); txtcaptcha.Text = "";
                            }
                        }
                    }
                    //if (Request.QueryString.Count > 0)
                    //{
                    //    string status = Request.QueryString["status"];
                    //    if (!string.IsNullOrEmpty(status))
                    //    {
                    //        url = "~/User/CFO/CFOQuestionnaire.aspx?status=" + status;
                    //        Response.Redirect(url);

                    //    }
                    //}
                }
                else
                {
                    string DPassword = string.Empty;

                    if (Request.RequestType.ToUpper() != "POST")
                    {
                        Killsession();
                    }

                    Session["DeptInfo"] = null;
                    if (String.IsNullOrEmpty(txtUsername.Text) || String.IsNullOrEmpty(txtPswrd.Text))
                    {
                        lblmsg0.Text = "Please provide User Name and Password";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true);
                        Failure.Visible = true;
                        FillCapctha();
                    }
                    else if (string.IsNullOrEmpty(txtcaptcha.Text.Trim()) && !Request.Url.ToString().Contains("localhost"))
                    {
                        lblmsg0.Text = "Please Enter Captcha";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true);
                        Failure.Visible = true;
                        FillCapctha();
                    }
                    else if (txtcaptcha.Text != Convert.ToString(ViewState["captcha"]) && !Request.Url.ToString().Contains("localhost"))
                    {
                        lblmsg0.Text = "Invalid Captcha.....!";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true);
                        Failure.Visible = true; txtcaptcha.Text = "";
                        FillCapctha();
                    }
                    else
                    {
                        success.Visible = false;
                        Failure.Visible = false;
                        string UserID = "", Password = "";
                        UserID = txtUsername.Text;
                        Password = txtPswrd.Text;

                        DataSet ds1 = objloginBAL.GetDeptUserPwdInfo(txtUsername.Text.ToString(), "D");
                        if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                        {
                            if (Convert.ToInt32(Convert.ToString(ds1.Tables[0].Rows[0]["WrngPswdCount"])) < 5)
                            {
                                DPassword = ds1.Tables[0].Rows[0]["Password"].ToString();
                                string actPwd1 = FormsAuthentication.HashPasswordForStoringInConfigFile(DPassword + asp_hidden.Value.ToString(), "MD5");
                                if (actPwd1.ToUpper().ToString() != txtPswrd.Text.ToUpper().ToString())
                                {
                                    try
                                    {
                                        lblmsg0.Text = "Invalid Credentials...!";
                                        Failure.Visible = true;
                                        //objloginBAL.GetDeptUserInfo(UserID, Password, getclientIP());
                                    }
                                    catch (SqlException ex)
                                    {
                                        Killsession();
                                        lblmsg0.Text = "Invalid Credentials...!" + " You have " +
                                                        Convert.ToString(4 - Convert.ToInt32(Convert.ToString(ds1.Tables[0].Rows[0]["WrngPswdCount"])))
                                                        + " Attempts remaining for today";
                                        txtPswrd.Text = "";
                                        Failure.Visible = true;
                                        FillCapctha(); txtcaptcha.Text = "";
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AnotherFunction();", true); return;
                                    }
                                }
                                else
                                {
                                    DeptUserInfo ObjUserInfo;
                                    ObjUserInfo = objloginBAL.GetDeptUserInfo(UserID, DPassword, getclientIP());//,Dept
                                    if (ObjUserInfo != null && ObjUserInfo.UserID != null)
                                    {
                                        Session["DeptUserInfo"] = ObjUserInfo;
                                        Response.Redirect("~/Dept/Dashboard/DeptDashBoard.aspx", false);
                                    }
                                    else
                                    {
                                        Killsession();
                                        lblmsg0.Text = "Invalid Credentials...!";
                                        txtPswrd.Text = "";
                                        Failure.Visible = true;
                                        FillCapctha(); txtcaptcha.Text = "";
                                    }
                                }
                            }
                            else
                            {
                                Killsession();
                                lblmsg0.Text = "You have made 5 failed login attemps...! Your account has been locked for today...!";
                                txtPswrd.Text = "";
                                Failure.Visible = true;
                                FillCapctha(); txtcaptcha.Text = "";
                            }
                        }
                        else
                        {
                            try
                            {
                                objloginBAL.GetDeptUserInfo(UserID, Password, getclientIP());
                            }
                            catch (SqlException ex)
                            {
                                Killsession();
                                lblmsg0.Text = "Invalid Credentials...!";
                                Failure.Visible = true;
                                txtPswrd.Text = ""; FillCapctha(); txtcaptcha.Text = "";
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                string errorMsg = ex.Message;
                lblmsg0.Text = "Invalid Credentials..";
                Failure.Visible = true;
                FillCapctha(); txtcaptcha.Text = ""; txtPswrd.Text = "";
            }
            catch (Exception ex)
            {
                lblmsg0.Text = ex.Message;
                Failure.Visible = true;
               // MGCommonClass.LogerrorDB(ex, HttpContext.Current.Request.Url.AbsoluteUri, hdnUserID.Value);
            }
        }
    }
}