using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking.admin
{
    public partial class RoomTypeReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Data"].ToString() == "")
                MultiView1.ActiveViewIndex = 0;
            else
                MultiView1.ActiveViewIndex = 1;
        }
    }
}