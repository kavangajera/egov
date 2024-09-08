using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace egov
{
    public partial class Fees : System.Web.UI.Page
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
                string query = "SELECT * FROM Fees WHERE stu_id IN (SELECT stu_id FROM Student_info WHERE email=@email)";
                cmd.Connection = con;
                cmd.CommandText = query;
                SqlCommand cmd1 = new SqlCommand();
                string query1 = "SELECT amount FROM Fee_Quota WHERE adm_quota IN (SELECT adm_quota FROM Student_info WHERE email=@email)";
                cmd1.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@email", email);
                cmd1.Connection = con;
                cmd1.CommandText = query1;
                SqlDataReader rdr = cmd.ExecuteReader();
                List<int> Sem=new List<int>();
                List<int> Amount=new List<int>();
                List<string>Mode=new List<string>();
                if (rdr.Read())
                {
                    while (true)
                    {
                        Sem.Add(int.Parse(rdr["semester"].ToString()));
                        Mode.Add(rdr["mode_of_payment"].ToString());
                        if (!rdr.Read())
                        {
                            break;
                        }
                    }
                    rdr.Close();
                    SqlDataReader rdr1 = cmd1.ExecuteReader();
                    rdr1.Read();
                    while (true)
                    {
                        Amount.Add(int.Parse(rdr1["amount"].ToString()));
                        if (!rdr1.Read())
                        {
                            break;
                        }
                    }
                    int n = Sem.Count;
                    string res = "";
                    for(int i = 0; i < n; i++)
                    {
                        res += " Semester " + Sem[i].ToString()+"<br>"+ " Amount " + Amount[0].ToString()+"<br>"+" Mode of payment "+ Mode[i].ToString();
                        res += "<br><br><br>";
                    }
                    lblModeVal.Text = res;

                }
                else
                {
                    lblMsg.Text = "Fees unpaid.";
                }

                    
            }
        }
    }
}