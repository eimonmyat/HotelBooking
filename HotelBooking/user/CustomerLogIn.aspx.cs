using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 

namespace HotelBooking.user
{
    public partial class CustomerLogIn : System.Web.UI.Page
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

        protected void txtRegister_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            if (txtCustomerEmail.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Enter Email";
                txtCustomerEmail.Focus();
            }
            else if (txtCustomerEmail.Text.Contains(".") == false || txtCustomerEmail.Text.Contains("@") == false)
            {
                lblError2.Text = "Please Type Correct Email Format";
                txtCustomerEmail.Focus();
            }
            else if (txtCustomerPassword.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Enter Password";
                txtCustomerPassword.Focus();
            }
            else
            {

                Dt = CustomerTbl.Customer_Select_For_LogIn(txtCustomerEmail.Text, txtCustomerPassword.Text);
                if (Dt.Rows.Count > 0)
                {
                    Session["LogInCustomer"] = Dt.Rows[0][1].ToString();
                    
                    Dt = BookingTbl.Booking_Select_By_NotiStatus(Convert.ToInt32(Session["LogInCustomer"]));
                    Count = Dt.Rows.Count;
                    if (Count > 0)
                    {
                        Session["NotiStatus"] = "Y";
                    }
                    else
                    {
                        Session["NotiStatus"] = "-";
                    }
                    if (Session["URL"] != null)
                    {
                        Response.Redirect(Session["URL"].ToString());
                    }
                    else
                    {
                        Response.Redirect("Booking.aspx");
                    }
                }
                else
                {
                    lblError2.Text = "Please Check Email And Password";
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
                
                ClearData();
            }
        }
    }
}