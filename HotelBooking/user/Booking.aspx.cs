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
        MainDatasetTableAdapters.BookingDetailTableAdapter BookingDetailTbl=new MainDatasetTableAdapters.BookingDetailTableAdapter();
        DataTable Dt = new DataTable();
        DataTable Dt1 = new DataTable();
        
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            String today = DateTime.Now.ToString("yyyy-MM-dd");
            
            if (!IsPostBack)
            {
                Calendar1.Visible=false;
                Calendar2.Visible = false;
            }
            
                Dt1 = RoomTbl.Room_Select_By_StartDateEndDate(Convert.ToDateTime(today), Convert.ToDateTime(today));
                setRoomList();
            
            
            //MultiView1.ActiveViewIndex = 0;
            //txtStartDate.Attributes["min"]=DateTime.Now.ToString("yyyy-MM-dd");
            ////txtStartDate.Attributes["max"] = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
            //txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            //txtEndDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            ////txtEndDate.Attributes["max"] = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
            //txtEndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            //RoomNumberList.DataSource = RoomTbl.GetData();
            //RoomNumberList.DataBind();
            //Session["StartDate"] = txtStartDate.Text;
            //Session["EndDate"] = txtEndDate.Text;
        }

        protected void btnChecking_Click(object sender, EventArgs e)
        {
            //MultiView1.ActiveViewIndex = 1;
            //Session["StartDate"] = DateTime.Parse(txtStartDate.Text);
            //Session["EndDate"] = DateTime.Parse(txtEndDate.Text);
            //Label3.Text = Session["StartDate"].ToString();
            //Label4.Text = Session["EndDate"].ToString();
            //Label5.Text = Session["StartDate"].ToString();
            Dt1 = RoomTbl.Room_Select_By_StartDateEndDate(Convert.ToDateTime(Session["StartDate"].ToString()), Convert.ToDateTime(Session["EndDate"].ToString()));

            setRoomList();

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
                    //    int RoomID = Convert.ToInt32(Dt1.Rows[i][1].ToString());

                    //    Dt2 = RoomTbl.Room_Select_By_RoomID((RoomID));
                    //for (int j = 0; j < Dt2.Rows.Count; j++)
                    //{
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
                //Dt2 = RoomTbl.GetData();
                //for (int i = 0; i < Dt2.Rows.Count; i++)
                //{
                //    Dr = DtDisplay.NewRow();
                //Dr[0] = Dt2.Rows[i][0];//0+1=1
                //Dr[1] = Dt2.Rows[i][1];//proid=8
                //Dr[2] = Dt2.Rows[i][2];//MSI
                //Dr[3] = Dt2.Rows[i][3];//1
                //Dr[4] = Dt2.Rows[i][4];
                //Dr[5] = Dt2.Rows[i][5];
                //Dr[6] = Dt2.Rows[i][6];
                //Dr[7] = Dt2.Rows[i][7];
                //Dr[8] = Dt2.Rows[i][8];

                //DtDisplay.Rows.Add(Dr);
                //}

            }

            
            RoomNumberList.DataSource = DtDisplay;
            RoomNumberList.DataBind();
        }
        protected void RoomNumberList_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["RoomID"] = RoomNumberList.SelectedValue.ToString();
            ////Label5.Text = RoomNumberList.SelectedValue.ToString();
            Response.Redirect("RoomDetail.aspx");
            //MultiView1.ActiveViewIndex = 1;
        }

        

        protected void Image2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
            //Calendar1.Attributes.Add("style", "position:absolute");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Calendar1.Visible = false;
            Session["StartDate"] = txtStartDate.Text;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor=System.Drawing.Color.Red;
            }
        }

        protected void Image3_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            else
            {
                Calendar2.Visible = true;
            }
            //Calendar2.Attributes.Add("style", "position:absolute");
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = Calendar2.SelectedDate.ToString("yyyy-MM-dd");
            Calendar2.Visible = false;
            Session["EndDate"] = txtEndDate.Text;
        }

        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}