using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace HotelBooking.admin
{
    public partial class Check : System.Web.UI.Page
    {
        MainDatasetTableAdapters.Admin_BookingTableAdapter Admin_Booking = new MainDatasetTableAdapters.Admin_BookingTableAdapter();
        MainDatasetTableAdapters.BookingTableAdapter BookingTbl = new MainDatasetTableAdapters.BookingTableAdapter();
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        DataTable Dt = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;
        protected void Page_Load(object sender, EventArgs e)
        {
            Dt = Admin_Booking.Admin_Booking_Select_By_Check();
            //no,orderid,orderdate,custid,custname,shippingadd,total,delverstatus,notistatus
            //1,3,3.7.2020,8,PMH,Mdy,700000,order...,null
            //2,5,5.7.2020,34,MMK,Ygn,800000,order...,null
            DisplayAdminOrder();
        }
        protected void DisplayAdminOrder()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();

            DtDisplay.Columns.Add("No");
            DtDisplay.Columns.Add("BookingID");
            DtDisplay.Columns.Add("BookingDate");
            DtDisplay.Columns.Add("RoomNumber");
            DtDisplay.Columns.Add("CustName");
            
            DtDisplay.Columns.Add("TotalAmount");
            DtDisplay.Columns.Add("CheckStatus");

            Dr = DtDisplay.NewRow();
            DtDisplay.Rows.Add(Dr);

            Count = Dt.Rows.Count;//2
                                  //1,3,3.7.2020,8,PMH,Mdy,700000,order...,null
                                  //2,5,5.7.2020,34,MMK,Ygn,800000,order...,null
            if (Count > 0)
            {
                DtDisplay.Rows.Clear();
                for (int i = 0; i < Count; i++)
                {
                    Dr = DtDisplay.NewRow();
                    Dr[0] = Dt.Rows[i][0];//no=1,2
                    Dr[1] = Dt.Rows[i][1];//orderid=3,5
                    Dr[2] = Dt.Rows[i][2];//orderdate=3.7.2020,5.7.2020
                    Dr[4] = Dt.Rows[i][5];//shippingadd=mdy,Ygn
                    Dr[5] = Dt.Rows[i][6];//total=700000,800000
                    Dr[6] = Dt.Rows[i][7];
                    DataTable roomNo = RoomTbl.Room_Select_By_RoomID(Convert.ToInt32(Dt.Rows[i][3]));
                    
                    Dr[3] = roomNo.Rows[0][2];//custname=PMH,MMK
                    //deliverstatus=order...,order...
                    DtDisplay.Rows.Add(Dr);
                }
            }
            GridView1.DataSource = DtDisplay;
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string DelvierStatus = "";
            int BookingID = 0;

            if (txtBookingID.Text.ToString() == string.Empty)
                lblError.Text = "Please Select BookingID";
            else
            {
                BookingID = Convert.ToInt32(txtBookingID.Text);//5
               
                
                        DelvierStatus = "Check";

                Admin_Booking.Admin_Booking_Update(BookingID, DelvierStatus);
                BookingTbl.Booking_NotiStatus_Update(Convert.ToInt32(BookingID), "Y");
                    Response.Redirect("Check.aspx");
               
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RowIndex = GridView1.SelectedIndex;//1
            txtBookingID.Text = DtDisplay.Rows[RowIndex][1].ToString();//5
            GridViewRow Row = GridView1.Rows[RowIndex];
            CheckBox chkSelect = (CheckBox)Row.FindControl("chkSelect");
            chkSelect.Checked = true;
        }
    }
}