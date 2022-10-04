using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelBooking.user
{
    public partial class BookingList : System.Web.UI.Page
    {

        MainDatasetTableAdapters.BookingTableAdapter Booking = new MainDatasetTableAdapters.BookingTableAdapter();
        MainDatasetTableAdapters.Admin_BookingDetailTableAdapter Admin_BookingDetail = new MainDatasetTableAdapters.Admin_BookingDetailTableAdapter();
        MainDatasetTableAdapters.Admin_BookingTableAdapter Admin_Booking = new MainDatasetTableAdapters.Admin_BookingTableAdapter();
        DataTable Dt = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogInCustomer"] == null)
            {
                Session["URL"] = "UserBookingList.aspx";
                Response.Redirect("CustomerLogIn.aspx");
            }
            if (Session["NotiStatus"].ToString() == "-")
            {
                Dt = Admin_Booking.Admin_Booking_Select_By_CustID(Convert.ToInt32(Session["LogInCustomer"]));
                DisplayOrder();
            }
            else
            {
                Dt = Admin_Booking.Admin_Booking_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
                DisplayOrder();
            }
           
            
              
        }
        protected void DisplayOrder()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();
            
            DtDisplay.Columns.Add("BookingID");
            DtDisplay.Columns.Add("BookingDate");
            
            DtDisplay.Columns.Add("Email");
            DtDisplay.Columns.Add("TotalAmount");
            DtDisplay.Columns.Add("CheckStatus");


            Dr = DtDisplay.NewRow();
            DtDisplay.Rows.Add(Dr);

            Count = Dt.Rows.Count;
            if (Count > 0)
            {
                DtDisplay.Rows.Clear();
                for (int i = 0; i < Count; i++)
                {
                    Dr = DtDisplay.NewRow();
                    Dr[0] = Dt.Rows[i][1];
                    Dr[1] = Dt.Rows[i][2];
                    Dr[2] = Dt.Rows[i][9];
                    Dr[3] = Dt.Rows[i][6];
                    Dr[4] = Dt.Rows[i][7];
                    DtDisplay.Rows.Add(Dr);
                }
            }
            DataList1.DataSource = DtDisplay;
            DataList1.DataBind();
        }

        //protected void btnAll_Click(object sender, EventArgs e)
        //{
        //    Session["NotiStatus"] = "-";
        //    Booking.Booking_Cust_NotiStatus_Update(Convert.ToInt32(Session["LogInCustomer"]));
        //    Response.Redirect("UserBookingList.aspx");
        //}

        

        protected void DataList1_PreRender1(object sender, EventArgs e)
        {
            for (int i = 0; i < Count; i++)
            {
                Dr = DtDisplay.Rows[i];
                DataListItem Row = DataList1.Items[i];
                GridView GV = (GridView)Row.FindControl("GridView1");
                Dt = Admin_BookingDetail.Admin_BookingDetail_Select_By_BookingID(Convert.ToInt32(Dr[0]));
                GV.DataSource = Dt;
                GV.DataBind();

            }
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            Session["NotiStatus"] = "-";
            Booking.Booking_Cust_NotiStatus_Update(Convert.ToInt32(Session["LogInCustomer"]));
            Response.Redirect(("UserBookingList.aspx"));
        }
    }
}