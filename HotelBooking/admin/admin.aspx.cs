using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking.admin
{
    public partial class admin : System.Web.UI.Page
    {
        MainDatasetTableAdapters.AdminTableAdapter AdminTbl = new MainDatasetTableAdapters.AdminTableAdapter();
        DataTable Dt = new DataTable();             //virtual table
        DataTable DtDisplay = new DataTable();
        DataRow Dr;                                 //virtual row
        int Count;

        protected void DisplayAdmin()               //General method
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();

            DtDisplay.Columns.Add("No");
            DtDisplay.Columns.Add("AdminID");
            DtDisplay.Columns.Add("AdminName");
            DtDisplay.Columns.Add("Password");      //DtDisaply have 4 cols

            Dr = DtDisplay.NewRow();
            DtDisplay.Rows.Add(Dr);                 //DtDiaplay has new row

            Count = Dt.Rows.Count;                  //if admin has record,eg 6 or else 0
            if (Count > 0)
            {
                DtDisplay.Rows.Clear();             //delete empty record
                for (int i = 0; i < Count; i++)     //eg 0 to 5
                {
                    Dr = DtDisplay.NewRow();
                    Dr[0] = Dt.Rows[i][0];          //DtDisplay's No col=Dt's No field
                    Dr[1] = Dt.Rows[i][1];          //DtDisplay's AdminID col=Dt's Admin field
                    Dr[2] = Dt.Rows[i][2];
                    Dr[3] = Dt.Rows[i][3];
                    DtDisplay.Rows.Add(Dr);         //Add Record to DtDisplay
                }
            }
            GridView1.DataSource = DtDisplay;           //GridView has only one record, empty record
            GridView1.DataBind();

            txtSearch.Focus();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Dt = AdminTbl.GetData();        //call function from Dataset.AdminTableAdapter
            DisplayAdmin();                 //method call

            MultiView1.ActiveViewIndex = 0;
        }
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Dt = AdminTbl.Admin_Select_By_SearchAdminName(txtSearch.Text);
            DisplayAdmin();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtAdminID.Text.Trim().ToString() == string.Empty)
            {
                lblError1.Text = "Please Choose One Record For Delete";
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                AdminTbl.Admin_Delete(Convert.ToInt32(txtAdminID.Text));
                Response.Redirect("Admin.aspx");
            }
        }


        protected void ClearData()
        {
            lblError1.Text = "";
            lblError2.Text = "";
            txtAdminID.Text = "";
            txtAdminName.Text = "";
            txtConfirmPassword.Text = "";
            txtPassword.Text = "";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtAdminName.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Type AdminName";
                txtAdminName.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (txtPassword.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Type Password";
                txtPassword.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (txtConfirmPassword.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Type ConfirmPassword";
                txtConfirmPassword.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
            {
                lblError2.Text = "Password And ConfirmPassword Should Be Match";
                txtPassword.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                Dt = AdminTbl.Admin_Select_By_AdminNamePassword(txtAdminName.Text.Trim().ToString(), txtPassword.Text.Trim().ToString());
                //txtAdminName=Sett Naing Tun, txtPassword=snt
                if (Dt.Rows.Count > 0)          //duplicate record occurs
                {
                    if (Dt.Rows[0][1].ToString() != txtAdminID.Text)
                    {
                        lblError2.Text = "This Admin Is Already Exist";
                        MultiView1.ActiveViewIndex = 1;
                        return;         //method exit
                    }
                }
                if (btnSave.Text == "Save")
                {
                    AdminTbl.Admin_Insert(txtAdminName.Text.Trim(), txtPassword.Text.Trim());
                }
                else if (btnSave.Text == "Update")
                {
                    AdminTbl.Admin_Update(Convert.ToInt32(txtAdminID.Text), txtAdminName.Text.Trim(), txtPassword.Text.Trim());
                }
                ClearData();
                Dt = AdminTbl.GetData();
                DisplayAdmin();
                MultiView1.ActiveViewIndex = 0;
            }
        }
       
        

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Session["Data"] = txtSearch.Text;

            Response.Redirect("AdminReport.aspx");
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            ClearData();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int RowIndex = GridView1.SelectedIndex;
            txtSearch.Text = Convert.ToString(RowIndex);  //RowIndex=4
                                                          //  txtSearch.Text = DtDisplay.Rows[RowIndex][1].ToString();
            txtAdminID.Text = DtDisplay.Rows[RowIndex][1].ToString();   //DtDiaply.Rows[4][1]
            txtAdminName.Text = DtDisplay.Rows[RowIndex][2].ToString(); //DtDiaply.Rows[4][2]
            DisplayAdmin();
            GridViewRow Row = GridView1.Rows[RowIndex];
            CheckBox chkSelect = (CheckBox)Row.FindControl("chkSelect");
            chkSelect.Checked = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtAdminID.Text.Trim().ToString() == string.Empty)
            {
                lblError1.Text = "Please Choose One Record For Update";
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                lblError1.Text = "";
                DisplayAdmin();
                MultiView1.ActiveViewIndex = 1;
                txtAdminName.Focus();
                btnSave.Text = "Update";

            }
        }

           }
}