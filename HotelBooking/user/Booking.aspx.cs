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
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl=new MainDatasetTableAdapters.RoomTableAdapter ();
        //MainDatasetTableAdapters.Room2TableAdapter Room2=new MainDatasetTableAdapters.Room2TableAdapter();
        DataTable Dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            RoomNumberList.DataSource = RoomTbl.GetData();
            RoomNumberList.DataBind();
        }

        protected void btnChecking_Click(object sender, EventArgs e)
        {
            Response.Redirect("Booking.aspx"); 
        }

        protected void RoomNumberList_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["RoomID"] = RoomNumberList.SelectedValue.ToString();
            ////Label5.Text = RoomNumberList.SelectedValue.ToString();
            Response.Redirect("RoomDetail.aspx");
            //MultiView1.ActiveViewIndex = 1;
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reserve.aspx");
        }
    }
}