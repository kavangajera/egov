using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
namespace egov
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {

        }

        protected void datasubmit(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            using (con)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                string command = "Insert into Student_info (fname,mname,lname,birth_date,mobile,email,password,enroll_date,adm_quota,branch,semester) Values (@fname,@mname,@lname,@birth_date,@mobile,@email,@password,@enroll_date,@adm_quota,@branch,1)";
                cmd.Connection = con;
                cmd.CommandText = command;
                string fname1 = fname.Text;
                string mname1 = mname.Text;
                string lname1 = lname.Text;
                DateTime dateofbirth = DateTime.Parse(dob.Text);
                string mob = mobile.Text;
                string emailid = email.Text;
                string password = pass.Text;
                string adq = quota.Text;
                string br = branch.Text;
                DateTime creation = DateTime.Today;
                cmd.Parameters.AddWithValue("@fname", fname1);
                cmd.Parameters.AddWithValue("@mname", mname1);
                cmd.Parameters.AddWithValue("@lname", lname1);
                cmd.Parameters.AddWithValue("@birth_date", dateofbirth);
                cmd.Parameters.AddWithValue("@mobile", mob);
                cmd.Parameters.AddWithValue("@email", emailid);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@adm_quota", adq);
                cmd.Parameters.AddWithValue("@branch", br);
                cmd.Parameters.AddWithValue("@enroll_date", creation);
                cmd.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
            }
        }
    }
}