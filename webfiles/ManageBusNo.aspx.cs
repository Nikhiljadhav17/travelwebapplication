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
    public partial class ManageBusNo : System.Web.UI.Page
    {
        readonly string constr = ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString;
        SqlConnection con;
        int id, stopNo;
        string Date, trainLine, statsNo;
        TextBox txtStop = new TextBox();
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(constr);
            for (int i = 0; i < 15; i++)
            {
                ddlStopNo.Items.Add(i.ToString());
            }
            gridviewB();
        }
        protected void ddlStopNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            stopNo = Convert.ToInt32(ddlStopNo.SelectedItem.Text);
            if (stopNo > 0)
            {
                Session["stopNo"] = stopNo.ToString();
                for (int i = 1; i <= stopNo; i++)
                {
                    Label lbsName = new Label();
                    lbsName.Text = "Stop Name : ";

                    txtStop = new TextBox();
                    txtStop.ID = "txtStop" + i;

                   
                    Label lbl = new Label();
                    lbl.Text = "<br/>";

                    PlaceHolder1.Controls.Add(lbsName);
                    PlaceHolder1.Controls.Add(txtStop);                    
                    PlaceHolder1.Controls.Add(lbl);
                }
                btnAddBusNo.Visible = true;
                
            }
        }
        protected void gridviewB()
        {
            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                con.Open();
                string s = "Select Distinct BusNo from BbusNo";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                con.Open();
                string s = "Select Distinct BusNo from NbusNo";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                con.Open();
                string s = "Select Distinct BusNo from TbusNo";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
        protected void grBind()
        {
            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                string bNo = Session["BusNo"].ToString();
                con.Open();
                string s = "Select BusNo, HaltStops,Bid from BbusNo where BusNo ='" + bNo + "' ";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
            else if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                string bNo = Session["BusNo"].ToString();
                con.Open();
                string s = "Select BusNo, HaltStops,Bid from NbusNo where BusNo ='" + bNo + "' ";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
            else if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                string bNo = Session["BusNo"].ToString();
                con.Open();
                string s = "Select BusNo, HaltStops,Bid from TbusNo where BusNo ='" + bNo + "' ";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
        }
        protected void lbdelete_Click(object sender, EventArgs e)
        {
            LinkButton lbtndelete = sender as LinkButton;

            //Reference the GridView Row.
            GridViewRow row = lbtndelete.NamingContainer as GridViewRow;
            string BId = row.Cells[0].Text;
            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                con.Open();
                string q = "Delete from BbusNo where Bid='" + BId + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Deleted Successfully!!!');", true);
                
            }
            else if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                con.Open();
                string q = "Delete from NbusNo where Bid='" + BId + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Deleted Successfully!!!');", true);
            }
            else if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                con.Open();
                string q = "Delete from TbusNo where Bid='" + BId + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Deleted Successfully!!!');", true);
            }
            grBind();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                int Bid = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
                string BusNo = ((TextBox)GridView2.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                string stName = ((TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

                con.Open();
                string q = "Update BbusNo set HaltStops='" + stName + "' where BusNo='" + BusNo + "' and Bid='"+Bid+"'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);

                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);
                grBind();
            }
            else if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                int Bid = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
                string BusNo = ((TextBox)GridView2.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                string stName = ((TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

                con.Open();
                string q = "Update NbusNo set HaltStops='" + stName + "' where BusNo='" + BusNo + "' and Bid='" + Bid + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);

                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);
                grBind();
            }
            else if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                int Bid = Convert.ToInt16(GridView2.DataKeys[e.RowIndex].Value.ToString());
                string BusNo = ((TextBox)GridView2.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                string stName = ((TextBox)GridView2.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

                con.Open();
                string q = "Update TbusNo set HaltStops='" + stName + "' where BusNo='" + BusNo + "' and Bid='" + Bid + "'";
                SqlCommand cmdd = new SqlCommand(q, con);
                cmdd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);

                con.Close();

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Station is Updated Successfully!!!');", true);
                grBind();
            }
        }
        
        protected void lbtnBusNo_Click(object sender,EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            GridViewRow row = lbtn.NamingContainer as GridViewRow;
            string BusNo = row.Cells[0].Text;
            Session["BusNo"] = BusNo;

            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                con.Open();
                string s = "Select BusNo, HaltStops,Bid from BbusNo where BusNo='" + BusNo + "'";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
            else if (ddlBusLine.SelectedItem.Text == "NMMT")
            {
                con.Open();
                string s = "Select BusNo, HaltStops,Bid from NbusNo where BusNo='" + BusNo + "'";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView2.DataSource = ds;
                GridView2.DataBind();
                
            }
            else if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                con.Open();
                string s = "Select BusNo, HaltStops,Bid from TbusNo where BusNo='" + BusNo + "'";
                SqlDataAdapter sda = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                GridView2.DataSource = ds;
                GridView2.DataBind();
            }

        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            grBind();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            grBind();
        }
       
        protected void ddlBusLine_SelectedIndexChanged(object sender,EventArgs e)
        {            
            lbtnAddBusNo.Visible = true;
            GridView1.Visible = true;
            
        }
        protected void lbtnAddBusNo_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
        protected void btnAddBusNo_Click(object sender, EventArgs e)
        {
            string StopNo = Session["stopNo"].ToString();
            int stopNo = Convert.ToInt32(StopNo);
            Date = DateTime.Now.ToString("dd-MM-yyyy");
            if (ddlBusLine.SelectedItem.Text == "BEST")
            {
                if (stopNo > 0)
                {
                    con.Open();
                    string q = "Insert into BbusDetails values('" + txtBusNo.Text + "','" + txtSrc.Text + "','" + txtDest.Text + "','" + Date + "')";
                    SqlCommand cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    string qu = "Insert into BbusNo values('" + txtBusNo.Text + "','" + txtSrc.Text + "')";
                    SqlCommand cmdd = new SqlCommand(qu, con);
                    cmdd.ExecuteNonQuery();
                    for (int j = 0; j <= stopNo; j++)
                    {
                        var stop = Request.Form.Get("ctl00$ContentPlaceHolder1$txtStop" + j.ToString());
                        if (stop == null)
                        {
                            continue;
                        }
                        else
                        {
                            qu = "Insert into BbusNo values('" + txtBusNo.Text + "','" + stop + "')";
                            cmdd = new SqlCommand(qu, con);
                            cmdd.ExecuteNonQuery();

                            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Bus is Added successfully!!!');", true);
                        }
                    }
                    qu = "Insert into BbusNo values('" + txtBusNo.Text + "','" + txtDest.Text + "')";
                    cmdd = new SqlCommand(qu, con);
                    cmdd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else if(ddlBusLine.SelectedItem.Text == "NMMT")
            {
                if (stopNo > 0)
                {
                    con.Open();
                    string q = "Insert into NbusDetails values('" + txtBusNo.Text + "','" + txtSrc.Text + "','" + txtDest.Text + "','" + Date + "')";
                    SqlCommand cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    string qu = "Insert into NbusNo values('" + txtBusNo.Text + "','" + txtSrc.Text + "')";
                    SqlCommand cmdd = new SqlCommand(qu, con);
                    cmdd.ExecuteNonQuery();
                    for (int j = 0; j <= stopNo; j++)
                    {
                        var stop = Request.Form.Get("ctl00$ContentPlaceHolder1$txtStop" + j.ToString());
                        if (stop == null)
                        {
                            continue;
                        }
                        else
                        {
                            qu = "Insert into NbusNo values('" + txtBusNo.Text + "','" + stop + "')";
                            cmdd = new SqlCommand(qu, con);
                            cmdd.ExecuteNonQuery();

                            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Bus is Added successfully!!!');", true);
                        }
                    }
                    qu = "Insert into NbusNo values('" + txtBusNo.Text + "','" + txtDest.Text + "')";
                    cmdd = new SqlCommand(qu, con);
                    cmdd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else if (ddlBusLine.SelectedItem.Text == "TMT")
            {
                if (stopNo > 0)
                {
                    con.Open();
                    string q = "Insert into TbusDetails values('" + txtBusNo.Text + "','" + txtSrc.Text + "','" + txtDest.Text + "','" + Date + "')";
                    SqlCommand cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    string qu = "Insert into TbusNo values('" + txtBusNo.Text + "','" + txtSrc.Text + "')";
                    SqlCommand cmdd = new SqlCommand(qu, con);
                    cmdd.ExecuteNonQuery();
                    for (int j = 0; j <= stopNo; j++)
                    {
                        var stop = Request.Form.Get("ctl00$ContentPlaceHolder1$txtStop" + j.ToString());
                        if (stop == null)
                        {
                            continue;
                        }
                        else
                        {
                            qu = "Insert into TbusNo values('" + txtBusNo.Text + "','" + stop + "')";
                            cmdd = new SqlCommand(qu, con);
                            cmdd.ExecuteNonQuery();

                            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Bus is Added successfully!!!');", true);
                        }
                    }
                    qu = "Insert into TbusNo values('" + txtBusNo.Text + "','" + txtDest.Text + "')";
                    cmdd = new SqlCommand(qu, con);
                    cmdd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }
    }
    
}