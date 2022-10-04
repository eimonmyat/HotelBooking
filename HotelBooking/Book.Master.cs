using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelBooking
{
    public partial class Book : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MainDatasetTableAdapters.BookingTableAdapter BookingTbl = new MainDatasetTableAdapters.BookingTableAdapter();
            DataTable Dt = new DataTable();
            if (Session["LogInCustomer"] != null)
            {
                Dt = BookingTbl.Booking_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
                if (Dt.Rows.Count > 0)
                {
                    Session["NotiStatus"] = "Y";
                }
            }
            if (Session["NotiStatus"] != null)
            {
                if (Session["NotiStatus"] == "-")
                {
                    imgMessage.Visible = false;
                }
                else
                    imgMessage.Visible = true;
            }
        }
    }
}