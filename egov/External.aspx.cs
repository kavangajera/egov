using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace egov
{
    public partial class External : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            string email = Session["UserEmail"].ToString();
            string branch = Session["branch"].ToString();
            int semester = int.Parse(Request.QueryString["semester"].ToString());

            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Database"].ConnectionString))
            {
                con.Open();

                // Get student details (semester and branch)
                SqlCommand cmd2 = new SqlCommand(@"
                    SELECT 
                        c.course_name, 
                        e.marks, 
                        ISNULL(avgMarks.AvgMarks, 0) AS AvgMarks,
                        (e.marks + ISNULL(avgMarks.AvgMarks, 0)) AS AddedMarks,
                        c.course_id
                    FROM 
                        [External] e
                    INNER JOIN 
                        BranchCourse bc ON e.course_id = bc.course_id
                    INNER JOIN 
                        Course c ON e.course_id = c.course_id
                    LEFT JOIN (
                        SELECT 
                            ir.course_id, 
                            AVG(ir.marks+4) AS AvgMarks
                        FROM 
                            InternalResult ir
                        INNER JOIN 
                            BranchCourse bc ON ir.course_id = bc.course_id
                        WHERE 
                            ir.stu_id = @stuId AND bc.semester = @semester AND bc.branch = @branch
                        GROUP BY 
                            ir.course_id
                    ) AS avgMarks ON e.course_id = avgMarks.course_id
                    WHERE 
                        e.stu_id = @stuId AND bc.semester = @semester AND bc.branch = @branch 
                    GROUP BY 
                        c.course_name, e.marks, avgMarks.AvgMarks, c.course_id
                    ORDER BY 
                        c.course_id;
                ", con);

                cmd2.Parameters.AddWithValue("@branch", branch);
                cmd2.Parameters.AddWithValue("@stuId", Session["stu_id"]);
                cmd2.Parameters.AddWithValue("@semester", semester);

                SqlDataAdapter da = new SqlDataAdapter(cmd2);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // Bind the data to GridView
                    gvSessionalResults.DataSource = dt;
                    gvSessionalResults.DataBind();

                    lblResultMsg.Text = "Marks for Semester " + semester;

                    // Calculate total AddedMarks and percentage
                    decimal totalAddedMarks = 0;
                    int totalCourses = dt.Rows.Count;
                    foreach (DataRow row in dt.Rows)
                    {
                        totalAddedMarks += Convert.ToDecimal(row["AddedMarks"]);
                    }

                    // Assume each course is out of 100 marks, so the total possible marks
                    decimal totalPossibleMarks = totalCourses * 100;
                    decimal percentage = (totalAddedMarks / totalPossibleMarks) * 100;

                    // Display the final percentage
                    lblFinalPercentage.Text = "Overall Percentage: " + percentage.ToString("0.00") + "%";
                }
                else
                {
                    lblResultMsg.Text = "No marks found for the selected sessional.";
                }
            }
        }
    }
}
