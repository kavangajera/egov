using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace egov
{
    public partial class Sessional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                string sessionalNumber = Request.QueryString["sessional"];
                if (!string.IsNullOrEmpty(sessionalNumber))
                {
                    string email = Session["UserEmail"].ToString();

                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Database"].ConnectionString))
                    {
                        con.Open();

                        // Get student details (semester and branch)
                        SqlCommand cmd = new SqlCommand("SELECT semester, branch FROM Student_info WHERE email = @email", con);
                        cmd.Parameters.AddWithValue("@email", email);
                        SqlDataReader rdr = cmd.ExecuteReader();

                        int semester = 0;
                        string branch = null;
                        if (rdr.Read())
                        {
                            semester = int.Parse(rdr["semester"].ToString());
                            branch = rdr["branch"].ToString();
                        }
                        rdr.Close();

                        // Display marks for the selected sessional
                         // Adjust based on your sessional number
                        
                            SqlCommand cmd2 = new SqlCommand(@"
                                SELECT c.course_name, ir.marks
                                FROM InternalResult ir
                                JOIN Course c ON ir.course_id = c.course_id
                                JOIN Student_info si ON ir.stu_Id = si.stu_id
                                WHERE si.branch = @branch AND si.semester = @semester AND ir.sessional_no = @sessionalNo
                                ORDER BY c.course_name", con);

                            cmd2.Parameters.AddWithValue("@branch", branch);
                            cmd2.Parameters.AddWithValue("@semester", semester);
                            cmd2.Parameters.AddWithValue("@sessionalNo", sessionalNumber);

                            SqlDataAdapter da = new SqlDataAdapter(cmd2);
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                gvSessionalResults.DataSource = dt;
                                gvSessionalResults.DataBind();
                                lblSessionalResult.Text = "Marks for Sessional " + sessionalNumber;
                            }
                            else
                            {
                                lblSessionalResult.Text = "No marks found for the selected sessional.";
                            }
                        
                        
                    }
                }
                else
                {
                    lblSessionalResult.Text = "No Sessional Selected";
                }
            }
        }
    }
}
