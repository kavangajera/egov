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
                    }
                }
            }
        }
    }
}