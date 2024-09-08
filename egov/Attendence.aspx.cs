using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace egov
{
    public partial class Attendence : System.Web.UI.Page
    {
        private void SendEmail(string toEmail, string subject, string body)
        {
            try
            {
                // Set up the SMTP client
                SmtpClient smtpClient = new SmtpClient("smtp.yourmailserver.com")
                {
                    Port = 587, // Use port 25 or 465 or 587 depending on your SMTP provider
                    Credentials = new NetworkCredential("yourEmail@domain.com", "yourPassword"),
                    EnableSsl = true,  // Use SSL if your provider requires it
                };

                // Compose the message
                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress("yourEmail@domain.com"),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true,  // Set to true if the body contains HTML
                };
                mailMessage.To.Add(toEmail);

                // Send the email
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                // Handle exception (log it, show an error message, etc.)
                Console.WriteLine("Error sending email: " + ex.Message);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            using (con)
            {
                con.Open();
                string email = Session["UserEmail"].ToString();
                SqlCommand cmd = new SqlCommand();
                string query = "SELECT * FROM Attendence WHERE stu_id IN (SELECT stu_id FROM Student_info WHERE email=@email)";
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Connection = con;
                cmd.CommandText = query;
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    lblSemVal.Text = rdr["semester"].ToString();
                    lblAtdVal.Text = rdr["total_attendence"].ToString();
                    float totalAtt = Convert.ToSingle(rdr["total_attendence"]);
                    if (totalAtt >= 75)
                    {
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                        lblStatus.Text = "Eligible for External Exams.";
                    }
                    else
                    {
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                        lblStatus.Text = "Please maintain at least 75% attendence!";
                        SendEmail(email, "Attendance Alert", "Your attendance is below 75%. Please maintain your attendance.");
                    }
                }
            }
        }
    }
}