using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelBooking.user
{
    public partial class Reserve : System.Web.UI.Page
    {
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        DataTable Dt1 = new DataTable();
        DataTable Dt2 = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
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
                
           
        }
        protected void SelectTempTbl()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();
            //DtDisplay.Columns.Add("No");//1
            //DtDisplay.Columns.Add("ProID");//8
            //DtDisplay.Columns.Add("ProName");//Dell i5
            DtDisplay.Columns.Add("RoomID");//laptop
            
            DtDisplay.Columns.Add("Qty");//1
            DtDisplay.Columns.Add("Price");//5000000

            Count = Dt1.Rows.Count;//2
            int total = 0;
            int price = 0;
            for (int i = 0; i < Count; i++)
            {
                int RoomID = Convert.ToInt32(Dt1.Rows[i][0].ToString());//proid=1,8
                Dt2 = RoomTbl.Room_Select_By_RoomID(RoomID); //no=1 proid=8 proname=MSI catid=5 catname=Gaming Mouse price=55000 qty=15 image-
                                                                 //Dt2=No,proid,proname,catid,catname,price,qty,img
                //Dr = DtDisplay.NewRow();
                //Dr[0] = i + 1;//0+1=1
                //Dr[1] = Dt2.Rows[0][4];//proid=8
                //Dr[2] = Dt2.Rows[0][5];//MSI
                
                //Dr[3] = Dt1.Rows[i][1];//1
                //DtDisplay.Rows.Add(Dr);
                lblRoomType.Text = Dt2.Rows[0][4].ToString();
                lblQuantity.Text = Dt1.Rows[i][1].ToString();
                price = Convert.ToInt32(Dt2.Rows[0][5].ToString()) * Convert.ToInt32(Dt1.Rows[i][1].ToString());
                total=total + price;
                //GridView1.DataSource = DtDisplay;
                //GridView1.DataBind();
            }
            lblTotalPrice.Text = total.ToString();
        }
        protected void txtRegister_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }
}