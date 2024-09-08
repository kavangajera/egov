using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

namespace egov
{
    public partial class StudentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserEmail"] != null)
            {
                string userEmail = Session["UserEmail"].ToString();
                LoadStudentInfo(userEmail);
            }
            else
            {
                // Redirect to login page if no session is found
                Response.Redirect("Login.aspx");
            }
        }

        private void LoadStudentInfo(string email)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;

            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                string command = "SELECT * FROM Student_info WHERE email=@email";
                cmd.Connection = con;
                cmd.CommandText = command;
                cmd.Parameters.AddWithValue("@email", email);

                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    
                    lblFirstName.Text = rdr["fname"].ToString();
                    lblMiddleName.Text = rdr["mname"].ToString();
                    lblLastName.Text = rdr["lname"].ToString();
                    lblDateOfBirth.Text = Convert.ToDateTime(rdr["birth_date"]).ToShortDateString();
                    lblMobileNumber.Text = rdr["mobile"].ToString();
                    lblBranchName.Text = rdr["branch"].ToString();
                    lblAdmissionQuota.Text = rdr["adm_quota"].ToString();
                    lblEnrollmentDate.Text = Convert.ToDateTime(rdr["enroll_date"]).ToShortDateString();
                    lblSem.Text = rdr["semester"].ToString();
                }
                
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            Session.Abandon();

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }

        protected void goToFee(object sender, EventArgs e)
        {
            Response.Redirect("Fees.aspx");
        }

        protected void goToAttendence(object sender, EventArgs e)
        {
            Response.Redirect("Attendence.aspx");
        }

        protected void goToSessional(object sender, EventArgs e)
        {
            Response.Redirect("Sessional.aspx");
        }
    }
}
