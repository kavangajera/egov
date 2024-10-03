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
                int semester = int.Parse(Request.QueryString["semester"].ToString());
                string sessionalNumber = Request.QueryString["sessional"];
                string branch = Session["branch"].ToString();
                if (!string.IsNullOrEmpty(sessionalNumber))
                {
                    string email = Session["UserEmail"].ToString();

                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Database"].ConnectionString))
                    {
                        con.Open();

                        // Get student details (semester and branch)
                        
                        
                        
                        // Display marks for the selected sessional
                         // Adjust based on your sessional number
                            
                            SqlCommand cmd2 = new SqlCommand(@"
                                SELECT *
                                FROM InternalResult ir
                                INNER JOIN BranchCourse bc ON ir.course_id = bc.course_id
                                INNER JOIN Course c ON ir.course_id = c.course_id
                                WHERE ir.stu_id = @stuId AND ir.sessional_no = @sessionalNo AND bc.semester = @semester AND bc.branch = @branch;
                                ", con);
                            
                            cmd2.Parameters.AddWithValue("@branch", branch);
                            cmd2.Parameters.AddWithValue("@stuId", Session["stu_id"]);
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
