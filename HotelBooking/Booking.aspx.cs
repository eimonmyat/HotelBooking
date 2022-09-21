using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelBooking
{
    public partial class Booking : System.Web.UI.Page
    {
        MainDatasetTableAdapters.RoomTypeTableAdapter RoomTypeTbl = new MainDatasetTableAdapters.RoomTypeTableAdapter();
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        DataTable Dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            RoomNumberList.DataSource = RoomTbl.GetData();
            RoomNumberList.DataBind();
        }

        protected void btnChecking_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void RoomNumberList_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}