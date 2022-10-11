using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Reflection.Emit;

namespace HotelBooking.user
{
    public partial class RoomDetail : System.Web.UI.Page
    {
        MainDatasetTableAdapters.RoomTypeTableAdapter RoomTypeTbl = new MainDatasetTableAdapters.RoomTypeTableAdapter();
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
       
        DataTable Dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Session["RoomID"].ToString();
            Dt = RoomTbl.Room_Select_By_RoomID(Convert.ToInt32(Session["RoomID"]));
            
            if (Dt.Rows.Count > 0)
            {
                foreach (DataRow Dr in Dt.Rows)
                {
                    
                    imgRoom.ImageUrl = Dr["RoomImage"].ToString();
                    lblRoomType.Text = Dr["RoomTypeName"].ToString();
                    lblRoomNumber.Text = Dr["RoomNumber"].ToString();
                    lblCapacity.Text = Dr["Capacity"].ToString();
                    lblPrice.Text = Dr["Price"].ToString();
                    lblDescription.Text = Dr["Description"].ToString();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Booking.aspx");
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            DataTable Tbl = new DataTable();
            DataRow TblDr;

            Tbl.Columns.Add("RoomID");//field no 0
            Tbl.Columns.Add("Qty");//field no 1
            Tbl.Rows.Clear();
            //tbl data table has two columns (proid,qty)
            //tbl data table has no record

            if (Session["TempTbl"] != null)
            {
                Tbl = (DataTable)Session["TempTbl"];        // proid=1 and qty=1 
                
                
                DataRow[] DrArray = Tbl.Select("RoomID='" + Session["RoomID"] + "'");

                foreach (DataRow Dr in DrArray)
                {
                    /*Dr[1] = Convert.ToInt32(Dr[1]) + 1;*///qty
                    Tbl.AcceptChanges();
                    Session["TempTbl"] = Tbl;
                    Response.Redirect("ReserveList.aspx");
                    return;
                }
            }

            TblDr = Tbl.NewRow();
            TblDr[0] = Session["RoomID"];//proid=user choose productid 1002 or 2004
            TblDr[1] = 1;//qty=1
            Tbl.Rows.Add(TblDr);
            //tbl data table has one row(user choose proid, 1)

            Session["TempTbl"] = Tbl;//proid,qty
                                     //session tempTbl=tbl data table has one row
            Response.Redirect("ReserveList.aspx");
        }
    }
}