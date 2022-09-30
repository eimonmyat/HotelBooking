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
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            if (txtCustomerEmail.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Email";
                txtCustomerEmail.Focus();
            }
            else if (txtCustomerEmail.Text.Contains(".") == false || txtCustomerEmail.Text.Contains("@") == false)
            {
                lblError.Text = "Please Type Correct Email Format";
                txtCustomerEmail.Focus();
            }
            else if (txtCustomerPassword.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Password";
                txtCustomerPassword.Focus();
            }
            else
            {
               
                Dt = CustomerTbl.Customer_Select_For_LogIn(txtCustomerEmail.Text, txtCustomerPassword.Text);
                if (Dt.Rows.Count > 0)
                {
                    int CustID = Convert.ToInt32(Dt.Rows[0][1].ToString());
                    BookingTbl.Booking_Insert(DateTime.Today,CustID,Convert.ToInt32(lblTotalPrice.Text), "Order...");
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
                    Da = BookingTbl.Booking_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
                    Count = Da.Rows.Count;
                    if (Count > 0)
                    {
                        Session["NotiStatus"] = "Y";
                    }
                    else
                    {
                        Session["NotiStatus"] = "-";
                    }

                }
                else
                {
                    lblError.Text = "Please Check Email And Password";
                }
            }

        }
        protected void ClearData()
        {
            txtAddress.Text = "";
            txtCustomerName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtCustomerName.Focus();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (txtCustomerName.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Customer Name";
                txtCustomerName.Focus();
            }
            else if (txtAddress.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Address";
                txtAddress.Focus();
            }
            else if (txtPhone.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Phone";
                txtPhone.Focus();
            }
            else if (txtEmail.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Email";
                txtEmail.Focus();
            }
            else if (txtEmail.Text.Contains(".") == false || txtEmail.Text.Contains("@") == false)
            {
                lblError.Text = "Please Type Correct Email Format";
                txtEmail.Focus();
            }
            else if (txtPassword.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Password";
                txtPassword.Focus();
            }
            else if (txtConfirmPassword.Text.Trim().ToString() == string.Empty)
            {
                lblError.Text = "Please Enter Confirm Password";
                txtConfirmPassword.Focus();
            }
            else if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblError.Text = "Password And Confirm Password Should Be Match";
                txtPassword.Focus();
            }

            else if (CustomerTbl.Customer_Select_By_Email(txtEmail.Text).Rows.Count > 0)
            {
                lblError.Text = "This Customer Email Is Already Exist";
                txtEmail.Focus();
            }
            else
            {
                CustomerTbl.Customer_Insert(txtCustomerName.Text, txtAddress.Text, txtPhone.Text, txtEmail.Text, txtPassword.Text);
                lblError.Text = "Save Successfully One Record";
                Dt = CustomerTbl.Customer_Select_By_CustName(txtCustomerName.Text);
                if (Dt.Rows.Count > 0)
                {
                    int CusID = Convert.ToInt32(Dt.Rows[0][1].ToString());
                    BookingTbl.Booking_Insert(DateTime.Today, CusID, Convert.ToInt32(lblTotalPrice.Text), "Order...");
                    
                }
                int RowIndex = BookingTbl.GetData().Rows.Count;//8
  
                int BookingID = Convert.ToInt32(BookingTbl.GetData().Rows[RowIndex - 1][0].ToString());
                //Label1.Text = BookingID.ToString();
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
                Da = BookingTbl.Booking_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
                Count = Da.Rows.Count;
                if (Count > 0)
                {
                    Session["NotiStatus"] = "Y";
                }
                else
                {
                    Session["NotiStatus"] = "-";
                }
                ClearData();
            }
        }

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
            TotalNDay();
            

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
        protected void txtRegister_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            
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

    }
}