using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelBooking.user
{
    public partial class ReserveList : System.Web.UI.Page
    {
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        DataTable Dt1 = new DataTable();
        DataTable Dt2 = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;
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
                
            }
       
        protected void SelectTempTbl()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();
            DtDisplay.Columns.Add("No");//1
            DtDisplay.Columns.Add("RoomID");
            DtDisplay.Columns.Add("RoomTypeName");//8
            DtDisplay.Columns.Add("Price");//Dell i5
            DtDisplay.Columns.Add("Quantity");//laptop
            

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
                Dr[3] = Dt2.Rows[0][5];
                Dr[4] = Dt1.Rows[i][1];//1
                DtDisplay.Rows.Add(Dr);
                GridView1.DataSource = DtDisplay;
                GridView1.DataBind();
            }
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {

            Response.Redirect("AvailableRoom.aspx");
        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            int NewQty, RoomID;
            int Index = 0;
            foreach (GridViewRow Row in GridView1.Rows)//1,  3,   Western Digital External HD 1TB,   External HD,   80000,  1
            {
                TextBox txtNewQty = (TextBox)Row.FindControl("txtNewQty");

                NewQty = Convert.ToInt32(txtNewQty.Text);       //newqty    3
                RoomID = Convert.ToInt32(Dt1.Rows[Index][0].ToString());     //proid 3

                DataRow[] DrArray = Dt1.Select("RoomID='" + RoomID + "'");
                if (NewQty > 0)
                {
                    foreach (DataRow Dr in DrArray)
                        Dr[1] = NewQty;
                    Index = Index + 1;
                }
                else
                {
                    foreach (DataRow Dr in DrArray)
                    {
                        Dr.Delete();
                    }
                }
                Dt1.AcceptChanges();
            }
            Session["TempTbl"] = Dt1;

            if (Dt1.Rows.Count != 0)
            {
                if (Session["LogInCustomer"] == null)
                {
                    Session["URL"] = "Reserve.aspx";
                    Response.Redirect("CustomerLogin.aspx");
                }
                else
                {
                    Response.Redirect("Reserve.aspx");
                }
            }
            else
            {
                Response.Redirect("Booking.aspx");
            }

        }
        protected void btnCancelShopping_Click(object sender, EventArgs e)
        {
            DataTable Dt = (DataTable)Session["TempTbl"];
            Dt.Rows.Clear();

            Response.Redirect("Booking.aspx");
        }
    }
}