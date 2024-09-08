using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;

namespace egov
{
    public partial class Login : System.Web.UI.Page
    {
        List<string>LoginEmail = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                Response.Redirect("StudentInfo.aspx");
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
        }

        protected void loginbtn_click(object sender, EventArgs e)
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
                string email = txtEmail.Text;
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (!rdr.Read())
                {
                    lblValid.Text = "Invalid Email!";
                }
                else if (rdr["password"].ToString().Trim() != txtPass.Text)
                {
                    int len = rdr["password"].ToString().Trim().Length;
                    lblPassValid.Text = len.ToString();
                }
                else
                {
                    if (!(Session["UserEmail"]==txtEmail.Text))
                    {
                        Session["UserEmail"] = email;
                        LoginEmail.Add(txtEmail.Text);
                        Response.Redirect("StudentInfo.aspx");
                    }
                    else
                    {
                        Response.Write("You are already logged in!!!");
                    }
                    

                  
                    
                }
            }
        }
    }
}
