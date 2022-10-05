using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking.admin
{
    public partial class BookingListReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["View"].ToString()=="")
                MultiView1.ActiveViewIndex = 0;
            else if (Session["View"].ToString() == "0")
                MultiView1.ActiveViewIndex = 1;
            else if (Session["View"].ToString() == "1")
                MultiView1.ActiveViewIndex = 2;
            else if (Session["View"].ToString() == "2")
                MultiView1.ActiveViewIndex = 3;
            else if (Session["View"].ToString() == "3")
                MultiView1.ActiveViewIndex = 4;
            
        }
    }
}