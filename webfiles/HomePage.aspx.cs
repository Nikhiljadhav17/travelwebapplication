using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M_Indicator_System
{
    public partial class HomePage : System.Web.UI.Page
    {
        string login;
        protected void Page_Load(object sender, EventArgs e)
        {
            login = Session["login"].ToString();
        }

        protected void ImgbtnTr_Click(object sender, ImageClickEventArgs e)
        {
            string log = Session["log"].ToString();
            if (log == "Admin")
            {
                Session["login"] = "AdminTrain";
                Response.Redirect("ManageStation.aspx");
            }
            else if (log == "User")
            {
                Session["login"] = "UserTrain";
                Session["select"] = "Train";
                Response.Redirect("UserTrainDet.aspx");
            }
        }

        protected void ImgbtnBs_Click(object sender, ImageClickEventArgs e)
        {
            string log = Session["log"].ToString();
            if (log == "Admin")
            {
                
                Session["login"] = "AdminBus";
                Response.Redirect("ManageBusStops.aspx");
            }
            else if (log == "User")
            {
                Session["login"] = "UserBus";
                Session["select"] = "Bus";
                Response.Redirect("UserBusDetails.aspx");
            }
        }
    }
}