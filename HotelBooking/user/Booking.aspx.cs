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
        DataTable Dt1 = new DataTable();
        DataTable Dt2=new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtStartDate.Attributes["min"]=DateTime.Now.ToString("yyyy-MM-dd");
            //txtStartDate.Attributes["max"] = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
            txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtEndDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            //txtEndDate.Attributes["max"] = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
            txtEndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            RoomNumberList.DataSource = RoomTbl.GetData();
            RoomNumberList.DataBind();
        }

        protected void btnChecking_Click(object sender, EventArgs e)
        {
            Session["StartDate"] = txtStartDate.Text;
            Session["EndDate"] = txtEndDate.Text;
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
            Dt1 =RoomTbl.Room_Select_By_StartDateEndDate(DateTime.Parse(txtStartDate.Text),DateTime.Parse(txtEndDate.Text));
            int count = Dt1.Rows.Count;
            for(int i = 0; i < count; i++)
            {
                int RoomID = Convert.ToInt32(Dt1.Rows[i][1].ToString());
                Dt2 = RoomTbl.Room_Select_By_RoomID((RoomID));
                Dr = DtDisplay.NewRow();
                Dr[0] = Dt2.Rows[0][0];//0+1=1
                Dr[1] = Dt2.Rows[0][1];//proid=8
                Dr[2] = Dt2.Rows[0][2];//MSI
                Dr[3] = Dt2.Rows[0][3];//1
                Dr[4] = Dt1.Rows[0][4];
                Dr[5] = Dt1.Rows[0][5];
                Dr[6] = Dt1.Rows[0][6];
                Dr[7] = Dt1.Rows[0][7];
                Dr[8] = Dt1.Rows[0][8];
                
                DtDisplay.Rows.Add(Dr);


                RoomNumberList.DataSource = DtDisplay;
                RoomNumberList.DataBind();
            }
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