using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace egov
{
    public partial class StudentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        }

        private void LoadStudentInfo(string email)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Database"].ConnectionString);
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Student_info WHERE email=@email", con);
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    Session["stu_id"] = rdr["stu_id"];
                    lblFirstName.Text = rdr["fname"].ToString();
                    lblMiddleName.Text = rdr["mname"].ToString();
                    lblLastName.Text = rdr["lname"].ToString();
                    lblDateOfBirth.Text = Convert.ToDateTime(rdr["birth_date"]).ToShortDateString();
                    lblMobileNumber.Text = rdr["mobile"].ToString();
                    lblBranchName.Text = rdr["branch"].ToString();
                    lblAdmissionQuota.Text = rdr["adm_quota"].ToString();
                    lblEnrollmentDate.Text = Convert.ToDateTime(rdr["enroll_date"]).ToShortDateString();
                    lblSem.Text = rdr["semester"].ToString();
                    Session["branch"] = rdr["branch"].ToString();
                    // Store the current semester in a session variable for later use
                    ViewState["CurrentSemester"] = Convert.ToInt32(rdr["semester"]);
                    
                }
                con.Close();
                
                //int semester = int.Parse(selectedSemester);
                //int sessional = int.Parse(selectedSessional);
               
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        

        

        
    }
}