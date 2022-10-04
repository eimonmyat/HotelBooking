using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Data.Odbc;
using System.Data.SqlClient;

namespace HotelBooking.user
{
    public partial class Reserve : System.Web.UI.Page
    {
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        MainDatasetTableAdapters.CustomerTableAdapter CustomerTbl = new MainDatasetTableAdapters.CustomerTableAdapter();
        MainDatasetTableAdapters.BookingTableAdapter BookingTbl = new MainDatasetTableAdapters.BookingTableAdapter();
        MainDatasetTableAdapters.BookingDetailTableAdapter BookingDetailTbl = new MainDatasetTableAdapters.BookingDetailTableAdapter();
        DataTable Dt1 = new DataTable();
        DataTable Dt2 = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;
        int Qty, Price, Total;
        String TodayDate;
        String Day, Month, Year;
        DataTable Dt = new DataTable();
       
        

       

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Dt1 = (DataTable)Session["TempTbl"];
            //proid     qty
            //1         1
            //8         1

            
                if (Session["TempTbl"] == null)
                {
                    Response.Redirect("Booking.aspx");
                }
                else
                {
                    if (Dt1.Rows.Count <= 0)
                        Response.Redirect("Booking.aspx");
                    else
                        SelectTempTbl();
                }
            TotalNDay();
            if (Session["LogInCustomer"] != null)
            {
                Dt2 = CustomerTbl.Customer_Select_By_CustID(Convert.ToInt32(Session["LogInCustomer"].ToString()));
                //no,custid,custname,address,phone,email,password,ctype,accno
                foreach (DataRow Dr in Dt2.Rows)
                {
                    txtCustName.Text = Dr["CustName"].ToString();
                    txtEmail.Text = Dr["Email"].ToString();
                    
                }
                
            }

        }
        protected void SelectTempTbl()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();
            DtDisplay.Columns.Add("No");//1
            DtDisplay.Columns.Add("RoomID");//8
            DtDisplay.Columns.Add("RoomTypeName");//Dell i5
            DtDisplay.Columns.Add("Price");//laptop
            
            
            DtDisplay.Columns.Add("Quantity");//5000000

            Count = Dt1.Rows.Count;//2
            
            for (int i = 0; i < Count; i++)
            {
                int RoomID = Convert.ToInt32(Dt1.Rows[i][0].ToString());//proid=1,8
                Dt2 = RoomTbl.Room_Select_By_RoomID(RoomID); //no=1 proid=8 proname=MSI catid=5 catname=Gaming Mouse price=55000 qty=15 image-
                                                             //Dt2=No,proid,proname,catid,catname,price,qty,img
                Dr = DtDisplay.NewRow();
                Dr[0] = Dt2.Rows[0][0];//0+1=1
                Dr[1] = Dt2.Rows[0][1];//proid=8
                Dr[2] = Dt2.Rows[0][4];//MSI

                Dr[3] = Dt2.Rows[0][5];//1
                Dr[4] = Dt1.Rows[i][1];
                DtDisplay.Rows.Add(Dr);


                GridView1.DataSource = DtDisplay;
                GridView1.DataBind();
            }
            
        }
        
        protected void TotalNDay()
        {
            foreach (GridViewRow Row in GridView1.Rows)//no,proid,proname,catname,price,qty
            {
                Price = Convert.ToInt32(Row.Cells[3].Text.ToString());
                Qty = Convert.ToInt32(Row.Cells[4].Text.ToString());

                Total += Convert.ToInt32(Qty * Price);
            }

            lblTotalPrice.Text = Total.ToString();

            //Day = string.Format("{0:D2}", DateTime.Now.Day);
            //Month = string.Format("{0:D2}", DateTime.Now.Month);
            //Year = DateTime.Today.Year.ToString();

            //TodayDate = Day + "/" + Month + "/" + Year;
        }


        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Session["LogInCustomer"] == null)
            {
                Response.Redirect("CustomerLogIn.aspx");
            }
            else
            {
                //int CustID = Convert.ToInt32(Dt.Rows[0][1].ToString());
                BookingTbl.Booking_Insert(DateTime.Today, Convert.ToInt32(Session["LogInCustomer"].ToString()), Convert.ToInt32(lblTotalPrice.Text), "Order...");
                int RowIndex = BookingTbl.GetData().Rows.Count;//8
                int BookingID = Convert.ToInt32(BookingTbl.GetData().Rows[RowIndex - 1][0].ToString());
                int Index = 0;
                foreach (GridViewRow Row in GridView1.Rows)
                {
                    BookingDetailTbl.BookingDetail_Insert(BookingID, Convert.ToInt32(Dt1.Rows[Index][0].ToString()), Convert.ToDateTime(Session["StartDate"].ToString()), Convert.ToDateTime(Session["EndDate"].ToString()));
                    //8,57,700000,2
                    //8,86,5500,10
                    //8,12,900000,1
                    Index = Index + 1;//1,2,3
                }
                DataTable Da = (DataTable)Session["TempTbl"];
                //proid,qty
                //57,2
                //86,10
                //12,1
                Da.Rows.Clear();
                Response.Redirect("Booking.aspx");
                //BookingDetailTbl.BookingDetail_Insert(BookingID, Convert.ToInt32(Dt1.Rows[Index][0].ToString()), Convert.ToDateTime(Session["StartDate"].ToString()), Convert.ToDateTime
            }

        }

    }
}