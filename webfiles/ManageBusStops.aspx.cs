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
    public partial class ManageBusStops : System.Web.UI.Page
    {
        readonly string constr = ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString;
        SqlConnection con;
        int id;
        string Date;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(constr);
        }
        protected void ddlBusLine_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBusLine.SelectedItem.Text == "Select")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Select the Station Line');", true);
            }

            else if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                con.Open();
                string qu = "select BusId, BusStop, Date from BbusStops Order By (BusId) Desc";
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
            else if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                con.Open();
                string qu = "select BusId, BusStop, Date from NbusStops Order By (BusId) Desc";
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
            else if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                con.Open();
                string qu = "select BusId, BusStop, Date from TbusStops Order By (BusId) Desc";
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
            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                con.Open();
                string id = Session["id"].ToString();
                string qq = "Insert into BbusStops values('"+id.ToString()+"','"+txtBstop.Text+"','"+Date+"')";
                SqlCommand cmd = new SqlCommand(qq, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Bus Stop is Added successfully!!!');", true);

                gvBind();
            }
            if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                con.Open();
                string id = Session["id"].ToString();
                string qq = "Insert into NbusStops values('" + id.ToString() + "','" + txtBstop.Text + "','" + Date + "')";
                SqlCommand cmd = new SqlCommand(qq, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Bus Stop is Added successfully!!!');", true);

                gvBind();
            }
            if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                con.Open();
                string id = Session["id"].ToString();
                string qq = "Insert into TbusStops values('" + id.ToString() + "','" + txtBstop.Text + "','" + Date + "')";
                SqlCommand cmd = new SqlCommand(qq, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Bus Stop is Added successfully!!!');", true);

                gvBind();
            }
        }
        protected void gvBind()
        {
            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                con.Open();
                string qq = "select BusId, BusStop, Date from BbusStops";
                SqlDataAdapter da = new SqlDataAdapter(qq, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();

                
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                con.Open();
                string qq = "select BusId, BusStop, Date from NbusStops";
                SqlDataAdapter da = new SqlDataAdapter(qq, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();

                
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                con.Open();
                string qq = "select BusId, BusStop, Date from TbusStops";
                SqlDataAdapter da = new SqlDataAdapter(qq, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();

                ViewState["ds"] = ds;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            con.Open();
            string q = "Update BbusStops set BusStop='" + name + "' where BusId='" + id.ToString() + "'";
            SqlCommand cmdd = new SqlCommand(q, con);
            cmdd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);

            gvBind();
        }
        
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvBind();
        }
    }
}