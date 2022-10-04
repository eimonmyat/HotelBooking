using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 

namespace HotelBooking.admin
{
    public partial class LogIn : System.Web.UI.Page
    {
        MainDatasetTableAdapters.AdminTableAdapter AdminTbl = new MainDatasetTableAdapters.AdminTableAdapter();
        DataTable Dt = new DataTable();
        DataTable DtDisplay = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lbtnLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin/LogIn.aspx");
        }
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            if (txtAdminName.Text.Trim() == string.Empty)
            {
                lblError.Text = "Please type Admin Name";
                txtAdminName.Focus();
            }
            else if (txtPassword.Text.Trim() == string.Empty)
            {
                lblError.Text = "Please Type Password";
                txtPassword.Focus();
            }
            else
            {
                Dt = AdminTbl.Admin_Select_By_AdminNamePassword(txtAdminName.Text, txtPassword.Text);
                if (Dt.Rows.Count > 0)
                {
                    Session["LogInAdmin"] = Dt.Rows[0][1];
                    Response.Redirect("admin/Admin.aspx");

                }
                else
                {
                    lblError.Text = "Please Retype Admin Name And Password";
                }
            }

        }
    }
}