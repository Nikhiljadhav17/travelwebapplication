using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M_Indicator_System
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Login"].ToString()=="login")
            {
                PLogin.Visible = true;
                PAdminTr.Visible = false;
                PAdminBus.Visible = false;
            }
            else if(Session["login"].ToString() == "AdminTrain")
            {
                PAdminTr.Visible = true;
                PAdminBus.Visible = false;
                PLogin.Visible = false;
            }
            else if (Session["login"].ToString() == "AdminBus")
            {
                PAdminTr.Visible = false;
                PAdminBus.Visible = true;
                PLogin.Visible = false;
            }
            if (Session["select"].ToString() == "Train")
            {
                PTrain.Visible = true;
                PLogin.Visible = false;
                PAdminTr.Visible = false;
                PAdminBus.Visible = false;
                PBus.Visible = false;
            }
            else if(Session["select"].ToString() == "Bus")
            {
                PTrain.Visible = false;
                PLogin.Visible = false;
                PAdminTr.Visible = false;
                PAdminBus.Visible = false;
                PBus.Visible = true;
            }
        }
    }
}