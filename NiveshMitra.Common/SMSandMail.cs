using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace NiveshMitra.Common
{
    public class SMSandMail
    {
        string connstr = ConfigurationManager.ConnectionStrings["NIVESHMITHRA"].ToString();
        public void SendEmailSingle(string strTo, string CCmails, string EmailSubject, string EmailText,
            string AttachmentPath, string Module, string transaction, string UnitId, string InvestorId)
        {
            // string path = "";
            string EmailSend = "";
            string FromEmailId = "";
            string Password = "";

            try
            {
                try
                {
                    FromEmailId = Convert.ToString(ConfigurationManager.AppSettings["FromMail"]);
                    Password = Convert.ToString(ConfigurationManager.AppSettings["FromMailPwd"]);

                    MailMessage message = new MailMessage(FromEmailId, strTo)
                    {
                        Subject = EmailSubject,
                        Body = EmailText
                    };
                    if ((Convert.ToString(ConfigurationManager.AppSettings["IsAttchmentsAllowed"]) == "true") && (Convert.ToString(AttachmentPath) != ""))
                    {
                        message.Attachments.Add(new Attachment(Convert.ToString(AttachmentPath)));
                    }
                    if (Convert.ToString(CCmails) != "")
                    {
                        foreach (string str4 in Convert.ToString(CCmails).Split(new char[] { ',' }))
                        {
                            message.CC.Add(new MailAddress(str4 ?? ""));
                        }
                    }
                    message.IsBodyHtml = Convert.ToString(ConfigurationManager.AppSettings["IsBodyHtml"]) == "true";
                    SmtpClient client = new SmtpClient
                    {
                        Host = Convert.ToString(ConfigurationManager.AppSettings["Host"]),
                        Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]),
                        UseDefaultCredentials = (Convert.ToString(ConfigurationManager.AppSettings["UseDefaultCredentials"]) != "true") ? false : true
                    };
                    if (!client.UseDefaultCredentials)
                    {
                        client.Credentials = new NetworkCredential(FromEmailId, Password);
                    }
                    client.EnableSsl = Convert.ToString(ConfigurationManager.AppSettings["EnableSsl"]) == "true";

                    client.Send(message);
                    EmailSend = "Y";

                    try
                    {
                        SMSANDMAILDetails(strTo, EmailText, UnitId, InvestorId, transaction, Module, "", "Email Sent Successfully", "Email");
                    }
                    catch (Exception ex)
                    {
                        string errorMsg = ex.Message;
                        Console.WriteLine(ex.Message);
                    }
                }
                catch (Exception exception1)
                {
                    EmailSend = "N";
                    Console.WriteLine(exception1.Message);
                }
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message;
                Console.WriteLine(ex.Message);
            }
        }
        public void SMSANDMAILDetails(string MobileNo, string SMSText, string UnitId, string InvestorId,
        string transaction, string Module, string Template, string msg, string Mode)
        {
            SqlConnection Scon = new SqlConnection(connstr);
            Scon.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "USP_INS_SMS_MAIL_DTLS";
            try
            {
                cmd.Connection = Scon;
                cmd.Parameters.AddWithValue("@MOBILENO_EMAIL", Convert.ToString(MobileNo));
                cmd.Parameters.AddWithValue("@SMSTEXT", Convert.ToString(SMSText));
                cmd.Parameters.AddWithValue("@UNITID", Convert.ToString(UnitId));
                cmd.Parameters.AddWithValue("@INVESTORID", Convert.ToString(InvestorId));
                cmd.Parameters.AddWithValue("@MODULE", Convert.ToString(transaction));
                cmd.Parameters.AddWithValue("@SUBMODULE", Convert.ToString(Module));
                cmd.Parameters.AddWithValue("@SERVERRESPONSE", Convert.ToString(msg));
                cmd.Parameters.AddWithValue("@TEMPLATEID", Convert.ToString(Template));
                cmd.Parameters.AddWithValue("@MODE", Convert.ToString(Mode));
                cmd.ExecuteNonQuery();
                Scon.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Scon.Close();
                Scon.Dispose();
            }
        }
    }
}
