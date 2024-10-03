using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace egov
{
    public partial class Attendence : System.Web.UI.Page
    {
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
                string query = "SELECT * FROM Attendence WHERE stu_id IN (SELECT stu_id FROM Student_info WHERE email=@Email)";
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Connection = con;
                cmd.CommandText = query;
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    // Create a new card for each semester's attendance
                    Panel attendanceCard = new Panel();
                    attendanceCard.CssClass = "attendance-card"; // Apply the CSS class for card styling

                    // Create labels for the semester and attendance
                    Label lblSem = new Label();
                    lblSem.Text = "Semester: " + rdr["semester"].ToString();
                    attendanceCard.Controls.Add(lblSem);

                    Label lblAttendance = new Label();
                    lblAttendance.Text = "Total Attendance: " + rdr["total_attendence"].ToString();
                    attendanceCard.Controls.Add(new LiteralControl("<br />")); // Line break
                    attendanceCard.Controls.Add(lblAttendance);

                    // Create a label for attendance status
                    Label lblStatus = new Label();
                    float totalAtt = Convert.ToSingle(rdr["total_attendence"]);
                    if (totalAtt >= 75)
                    {
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                        lblStatus.Text = "Eligible for External Exams.";
                    }
                    else
                    {
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                        lblStatus.Text = "Please maintain at least 75% attendance!";
                        // Send an email if attendance is less than 75%
                        SendAttendanceWarningEmail(email, totalAtt);
                    }
                    attendanceCard.Controls.Add(new LiteralControl("<br />")); // Line break
                    attendanceCard.Controls.Add(lblStatus);

                    // Add the card to the PlaceHolder
                    phAttendanceCards.Controls.Add(attendanceCard);
                }
            }
        }

        private void SendAttendanceWarningEmail(string userEmail, float attendance)
        {
            // Define SMTP client settings
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("kavangajera@gmail.com", "wslm qjoe htzp oxhp"),
                EnableSsl = true
            };

            // Create the email message
            MailMessage mailMessage = new MailMessage
            {
                From = new MailAddress("kavangajera@gmail.com","E.G.O.V"),
                Subject = "Low Attendance Warning",
                Body = $"Dear Student,\n\nYour attendance is currently {attendance}%, which is below the required 75%. Please improve your attendance to be eligible for exams.\n\nThank you.",
                IsBodyHtml = false // Plain text email
            };

            // Set recipient email address
            mailMessage.To.Add(userEmail);

            // Send the email
            try
            {
                smtpClient.Send(mailMessage);
                
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}
