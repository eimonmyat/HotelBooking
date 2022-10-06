using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelBooking.admin
{
    public partial class BookingList : System.Web.UI.Page
    {
        MainDatasetTableAdapters.Admin_BookingTableAdapter Admin_Booking = new MainDatasetTableAdapters.Admin_BookingTableAdapter();
        MainDatasetTableAdapters.Admin_BookingDetailTableAdapter Admin_BookingDetail = new MainDatasetTableAdapters.Admin_BookingDetailTableAdapter();
        MainDatasetTableAdapters.Admin_Booking_ReportTableAdapter Admin_BookingReport = new MainDatasetTableAdapters.Admin_Booking_ReportTableAdapter();
        DataTable Dt = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
            }
            Dt = Admin_Booking.GetData();
            //No,Bookingid,Bookingdate,cutid,custname,shippingadd,total,deliverstatus,notistatus

            DisplayAdminBooking();
        }
        protected void DisplayAdminBooking()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();

            DtDisplay.Columns.Add("No");
            DtDisplay.Columns.Add("BookingID");
            DtDisplay.Columns.Add("BookingDate");
            DtDisplay.Columns.Add("CustName");
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
                    Dr[0] = Dt.Rows[i][0];//No=No
                    Dr[1] = Dt.Rows[i][1];//Bookingid=Bookingid
                    Dr[2] = Dt.Rows[i][2];//Bookingdate=
                    Dr[3] = Dt.Rows[i][5];//custname
                    Dr[4] = Dt.Rows[i][9];//shipadd
                    Dr[5] = Dt.Rows[i][6];//total
                    Dr[6] = Dt.Rows[i][7];//delivstatus
                    DtDisplay.Rows.Add(Dr);
                }
            }
            DataList1.DataSource = DtDisplay;
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void txtBookingDate_TextChanged(object sender, EventArgs e)
        {
            if (ddlSearchType.SelectedIndex == 0)
            {
                if (txtBookingDate.Text.Trim().ToString() == string.Empty)
                    Dt = Admin_Booking.GetData();
                //No,Bookingid,Bookingdate,cutid,custname,shippingadd,total,deliverstatus,notistatus
                else
                    Dt = Admin_Booking.Admin_Booking_Select_By_BookingDate(Convert.ToDateTime(txtBookingDate.Text.ToString()));

                DisplayAdminBooking();
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

            if (ddlSearchType.SelectedIndex == 0)
            {
                if (txtBookingDate.Text.ToString() == string.Empty)
                {
                    Session["View"] = "";
                    Session["Data"] = txtBookingDate.Text;
                    //Response.Redirect("BookingListReport.aspx");
                }
                else
                {
                    Session["View"] = "0";
                    Session["Data"] = txtBookingDate.Text;
                    //Response.Redirect("BookingListReport.aspx");
                }
            }
            else
            {
                if (txtSearchData.Text.ToString() == string.Empty)
                {
                    Session["View"] = "";
                    Session["Data"] = txtSearchData.Text;
                    //Response.Redirect("BookingListReport.aspx");
                }
            }

            if (ddlSearchType.SelectedIndex == 0)
            {
                if (txtBookingDate.Text.ToString() != string.Empty)
                {
                    Session["View"] = "0";
                    Session["Data"] = txtBookingDate.Text;
                    //Response.Redirect("BookingListReport.aspx");
                }

            }
            else if (ddlSearchType.SelectedIndex == 1)
            {
                Session["View"] = "1";
                Session["Data"] = txtSearchData.Text;

                //Response.Redirect("BookingListReport.aspx");
            }
            else if (ddlSearchType.SelectedIndex == 2)
            {
                Session["View"] = "2";
                Session["Data"] = txtSearchData.Text;

                //Response.Redirect("BookingListReport.aspx");
            }
            else if (ddlSearchType.SelectedIndex == 3)
            {
                Session["View"] = "3";
                Session["Data"] = txtSearchData.Text;

                //Response.Redirect("BookingListReport.aspx");
            }
            Response.Redirect("BookingListReport.aspx");
            
        }

        protected void txtSearchData_TextChanged(object sender, EventArgs e)
        {
            if (ddlSearchType.SelectedIndex == 1)
            {
                Dt = Admin_Booking.Admin_Booking_Select_By_CustName(txtSearchData.Text);
            }
            else if (ddlSearchType.SelectedIndex == 2)
            {
                Dt = Admin_Booking.Admin_Booking_Select_By_Email(txtSearchData.Text);
            }
            else if (ddlSearchType.SelectedIndex == 3)
            {
                Dt = Admin_Booking.Admin_Booking_Select_By_Total(Convert.ToInt32(txtSearchData.Text));
            }
            else if (ddlSearchType.SelectedIndex == 4)
            {
                Dt = Admin_Booking.Admin_Booking_Select_By_CheckStatus(txtSearchData.Text);
            }
            DisplayAdminBooking();
        }

        protected void DataList1_PreRender(object sender, EventArgs e)
        {
            for (int i = 0; i < Count; i++)
            {
                Dr = DtDisplay.Rows[i];
                //No,Bookingid,Bookingdate,custname,shippingadd,total,deliverstatus
                DataListItem Row = DataList1.Items[i];
                GridView GV = (GridView)Row.FindControl("GridView1");
                Dt = Admin_BookingDetail.Admin_BookingDetail_Select_By_BookingID(Convert.ToInt32(Dr[1]));
                //No,Bookingid,proid,proname,catname,unitpirce,qty
                GV.DataSource = Dt;
                GV.DataBind();

            }
        }

        protected void ddlSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlSearchType.SelectedIndex == 0)
            {
                txtBookingDate.Visible = true;
                btnImg.Visible = true;
                txtBookingDate.Text = "";
                txtBookingDate.Focus();
                txtSearchData.Visible = false;
            }
            else
            {
                txtBookingDate.Visible = false;
                btnImg.Visible = false;
                txtSearchData.Visible = true;
                txtSearchData.Text = "";
                txtSearchData.Focus();
            }
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
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtBookingDate.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            if (ddlSearchType.SelectedIndex == 0)
            {
                if (txtBookingDate.Text.Trim().ToString() == string.Empty)
                    Dt = Admin_Booking.GetData();
                //No,Bookingid,Bookingdate,cutid,custname,shippingadd,total,deliverstatus,notistatus
                else
                    Dt = Admin_Booking.Admin_Booking_Select_By_BookingDate(Convert.ToDateTime(txtBookingDate.Text));

                DisplayAdminBooking();
            }
            Calendar1.Visible = false;
        }
    }
}