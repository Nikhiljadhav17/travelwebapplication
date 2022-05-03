using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace M_Indicator_System
{
    public partial class Login : System.Web.UI.Page
    {
        readonly string constr = ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(constr);
            Session["Login"] = "login";
            Session["select"] = "select";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(txtId.Text=="admin" && txtPass.Text=="admin")
            {
                Session["Login"] = "login";
                Session["log"] = "Admin";
                Response.Redirect("HomePage.aspx");
               
            }
            else 
            {
                string q = "select * from UserRegister where UserId='" + txtId.Text + "' and Password='" + txtPass.Text + "'";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet dss = new DataSet();
                da.Fill(dss);
                if(dss.Tables[0].Rows.Count > 0)
                {
                    Session["Login"] = "login";
                    Session["log"] = "User";
                    Response.Redirect("HomePage.aspx");
                }
                
            }
            //else if (txtId.Text == "admin" && txtPass.Text == "admin")
            //{
            //    Response.Redirect("Home.aspx");
            //    Session["login"] = "User";
            //}

        }
    }
}