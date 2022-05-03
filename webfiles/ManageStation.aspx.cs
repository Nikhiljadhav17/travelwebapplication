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
    public partial class ManageStation : System.Web.UI.Page
    {
        readonly string constr = ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString;
        SqlConnection con;
        int id;
        string Date;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(constr);
            
        }
        protected void ddlTrainLine_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlTrainLine.SelectedItem.Text == "Select")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Select the Station Line');", true);
            }
           
            if(ddlTrainLine.SelectedItem.Text == "Western")
            {
                con.Open();
                string qu = "select StatId, StationName, Date from WesternStat Order By (StatId) Desc";
                SqlDataAdapter sda = new SqlDataAdapter(qu, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string sid =ds.Tables[0].Rows[0][0].ToString();
                    id = Convert.ToInt32(sid);
                    id++;
                    Session["id"] = id.ToString();
                }
                else
                {
                    id = 100;
                }
                gvBind();
                Panel1.Visible = true;
                
            }
            else if (ddlTrainLine.SelectedItem.Text == "Central")
            {
                con.Open();
                string qu = "select StatId,StationName, Date from CentralStat Order By (StatId) Desc";
                SqlDataAdapter sda = new SqlDataAdapter(qu, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string sid = ds.Tables[0].Rows[0][0].ToString();
                    id = Convert.ToInt32(sid);
                    id++;
                    Session["id"] = id.ToString();
                }
                else
                {
                    id = 100;
                }
                gvBind();
                Panel1.Visible = true;
            }
            else if (ddlTrainLine.SelectedItem.Text == "Harbour")
            {
                con.Open();
                string qu = "select StatId,StationName, Date from HarbourStat Order By (StatId) Desc";
                SqlDataAdapter sda = new SqlDataAdapter(qu, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string sid = ds.Tables[0].Rows[0][0].ToString();
                    id = Convert.ToInt32(sid);
                    id++;
                    Session["id"] = id.ToString();
                }
                else
                {
                    id = 100;
                }
                gvBind();
                Panel1.Visible = true;
            }
            
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Date = DateTime.Now.ToString("dd-MM-yyyy");
            if(ddlTrainLine.SelectedItem.Text=="Select")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Select the Station Line');", true);
            }
            else if (ddlTrainLine.SelectedItem.Text == "Western")
            {
                string id = Session["id"].ToString();
                con.Open();
                string q = "Insert into WesternStat values('"+id.ToString()+"','"+txtstat.Text+"','"+Date+"')";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                con.Close();
                gvBind();
                
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Added successfully!!!');", true);
            }
            else if (ddlTrainLine.SelectedItem.Text == "Central")
            {
                string id = Session["id"].ToString();
                con.Open();
                string q = "Insert into CentralStat values('" + id.ToString() + "','" + txtstat.Text + "','" + Date + "')";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                con.Close();
                gvBind();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Added successfully!!!');", true);
            }
            else if (ddlTrainLine.SelectedItem.Text == "Harbour")
            {
                string id = Session["id"].ToString();
                con.Open();
                string q = "Insert into HarbourStat values('" + id.ToString() + "','" + txtstat.Text + "','" + Date + "')";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                con.Close();
                gvBind();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Added successfully!!!');", true);
            }
            
        }
       
        protected void gvBind()
        {
            if (ddlTrainLine.SelectedItem.Text == "Western")
            {
                con.Open();
                string qq = "select StatId, StationName, Date from WesternStat";
                SqlDataAdapter da = new SqlDataAdapter(qq, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                ViewState["ds"] = ds;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else if (ddlTrainLine.SelectedItem.Text == "Central")
            {
                con.Open();
                string qq = "select StatId, StationName, Date from CentralStat";
                SqlDataAdapter da = new SqlDataAdapter(qq, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                ViewState["ds"] = ds;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else if(ddlTrainLine.SelectedItem.Text == "Harbour")
            {
                con.Open();
                string qq = "select StatId, StationName, Date from HarbourStat";
                SqlDataAdapter da = new SqlDataAdapter(qq, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                ViewState["ds"] = ds;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void lbtnedit_Click(object sender, EventArgs e)
        {
            LinkButton lbtnedit = sender as LinkButton;

            //Reference the GridView Row.
            GridViewRow row = lbtnedit.NamingContainer as GridViewRow;
            string statId = row.Cells[0].Text;

            
        }
        protected void lbtndelete_Click(object sender, EventArgs e)
        {
            LinkButton lbtndelete = sender as LinkButton;

            //Reference the GridView Row.
            GridViewRow row = lbtndelete.NamingContainer as GridViewRow;
            string statId = row.Cells[0].Text;

            if(ddlTrainLine.Text=="Western")
            {
                con.Open();
                string q = "Delete from WesternStat where StatId='" + statId + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Deleted Successfully!!!');", true);
            }
            else if (ddlTrainLine.Text == "Central")
            {
                con.Open();
                string q = "Delete from CentralStat where StatId='" + statId + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Deleted Successfully!!!');", true);
            }
            else if (ddlTrainLine.Text == "Harbour")
            {
                con.Open();
                string q = "Delete from HarbourStat where StatId='" + statId + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Deleted Successfully!!!');", true);
            }
            gvBind();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvBind();
        }        

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            if (ddlTrainLine.Text == "Harbour")
            {
                con.Open();
                string q = "Update WesternStat set StationName='" + name + "' where StatId='" + id.ToString() + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);

                gvBind();
            }
            
        }
       
    }
}