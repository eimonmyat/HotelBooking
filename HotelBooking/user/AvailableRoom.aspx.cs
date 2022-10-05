using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 

namespace HotelBooking.user
{
    public partial class AvailableRoom : System.Web.UI.Page
    {
        MainDatasetTableAdapters.RoomTypeTableAdapter RoomTypeTbl = new MainDatasetTableAdapters.RoomTypeTableAdapter();
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        MainDatasetTableAdapters.BookingDetailTableAdapter BookingDetailTbl = new MainDatasetTableAdapters.BookingDetailTableAdapter();
        DataTable Dt = new DataTable();
        DataTable Dt1 = new DataTable();

        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            Dt1 = RoomTbl.Room_Select_By_StartDateEndDate(Convert.ToDateTime(Session["StartDate"].ToString()), Convert.ToDateTime(Session["EndDate"].ToString()));
            setRoomList();
            ddlRoomType.DataTextField = "RoomTypeName";
            ddlRoomType.DataValueField = "RoomTypeID";
            ddlRoomType.DataSource = RoomTypeTbl.GetData();
            ddlRoomType.DataBind();
                
        }

        protected void RoomNumberList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["RoomID"] = RoomNumberList.SelectedValue.ToString();

             Response.Redirect("RoomDetail.aspx");
        }
        protected void setRoomList()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();
            DtDisplay.Columns.Add("No");//1
            DtDisplay.Columns.Add("RoomID");//8
            DtDisplay.Columns.Add("RoomNumber");
            DtDisplay.Columns.Add("RoomTypeID");
            DtDisplay.Columns.Add("RoomTypeName");//Dell i5
            DtDisplay.Columns.Add("Price");//laptop
            DtDisplay.Columns.Add("Capacity");
            DtDisplay.Columns.Add("Description");
            DtDisplay.Columns.Add("RoomImage");

            int count = Dt1.Rows.Count;
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {

                    Dr = DtDisplay.NewRow();
                    Dr[0] = Dt1.Rows[i][0];//0+1=1
                    Dr[1] = Dt1.Rows[i][1];//proid=8
                    Dr[2] = Dt1.Rows[i][2];//MSI
                    Dr[3] = Dt1.Rows[i][3];//1
                    Dr[4] = Dt1.Rows[i][4];
                    Dr[5] = Dt1.Rows[i][5];
                    Dr[6] = Dt1.Rows[i][6];
                    Dr[7] = Dt1.Rows[i][7];
                    Dr[8] = Dt1.Rows[i][8];

                    DtDisplay.Rows.Add(Dr);



                }
            }
            else
            {
                lblMsg.Text = "No Room for this date!Please select again.";


            }


            RoomNumberList.DataSource = DtDisplay;
            RoomNumberList.DataBind();
        }

        protected void ddlRoomType_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSearch.Enabled = false;
            Dt1 = RoomTbl.GetDataBy4(Convert.ToDateTime(Session["StartDate"].ToString()), Convert.ToDateTime(Session["EndDate"].ToString()), ddlRoomType.SelectedItem.ToString());
            setRoomList();
            ddlRoomType.DataTextField = "RoomTypeName";
            ddlRoomType.DataValueField = "RoomTypeID";
            ddlRoomType.DataSource = RoomTypeTbl.GetData();
            ddlRoomType.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            ddlRoomType.Enabled = false;
            Dt1 = RoomTbl.GetDataBy5(Convert.ToDateTime(Session["StartDate"].ToString()), Convert.ToDateTime(Session["EndDate"].ToString()), Convert.ToInt32(txtSearch.Text.ToString()));
            setRoomList();
            ddlRoomType.DataTextField = "RoomTypeName";
            ddlRoomType.DataValueField = "RoomTypeID";
            ddlRoomType.DataSource = RoomTypeTbl.GetData();
            ddlRoomType.DataBind();
        }
    }
}