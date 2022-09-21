using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace HotelBooking.admin
{
    public partial class roomType : System.Web.UI.Page
    {
        MainDatasetTableAdapters.RoomTypeTableAdapter RoomTypeTbl = new MainDatasetTableAdapters.RoomTypeTableAdapter();
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        DataTable Dt = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;
        protected void DisplayRoomType()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();

            DtDisplay.Columns.Add("No");
            DtDisplay.Columns.Add("RoomTypeID");
            DtDisplay.Columns.Add("RoomTypeName");

            Dr = DtDisplay.NewRow();
            DtDisplay.Rows.Add(Dr);

            Count = Dt.Rows.Count;
            if (Count > 0)
            {
                DtDisplay.Rows.Clear();
                for (int i = 0; i < Count; i++)
                {
                    Dr = DtDisplay.NewRow();
                    Dr[0] = Dt.Rows[i][0];
                    Dr[1] = Dt.Rows[i][1];
                    Dr[2] = Dt.Rows[i][2];
                    DtDisplay.Rows.Add(Dr);
                }
            }
            GridView1.DataSource = DtDisplay;
            GridView1.DataBind();
            txtSearch.Focus();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Dt = RoomTypeTbl.GetData();
            DisplayRoomType();
            MultiView1.ActiveViewIndex = 0;
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            btnSave.Text = "Save";
            txtRoomTypeName.Text = "";
            txtRoomTypeName.Focus();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblError2.Text = "";
            Dt.Rows.Clear();
            if (txtRoomTypeName.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Enter Category Name";
                txtRoomTypeName.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                Dt = RoomTypeTbl.RoomType_Select_By_RoomTypeName(txtRoomTypeName.Text);
                if (Dt.Rows.Count > 0)
                {
                    if (Dt.Rows[0][1].ToString() != txtRoomTypeID.Text)
                    {
                        lblError2.Text = "This Category is Already Exist";
                        txtRoomTypeName.Focus();
                        MultiView1.ActiveViewIndex = 1;
                        return;
                    }
                }
                if (btnSave.Text == "Save")
                {
                    RoomTypeTbl.RoomType_Insert(txtRoomTypeName.Text);
                }
                else
                {
                    RoomTypeTbl.RoomType_Update(Convert.ToInt32(txtRoomTypeID.Text), txtRoomTypeName.Text);
                }
                txtRoomTypeID.Text = "";
                Response.Redirect("RoomType.aspx");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RowIndex = GridView1.SelectedIndex;

            txtRoomTypeID.Text = DtDisplay.Rows[RowIndex][1].ToString();
            txtRoomTypeName.Text = DtDisplay.Rows[RowIndex][2].ToString();
            GridViewRow Row = GridView1.Rows[RowIndex];
            CheckBox chkSelect = (CheckBox)Row.FindControl("chkSelect");
            chkSelect.Checked = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtRoomTypeID.Text.Trim().ToString() == string.Empty)
            {
                lblError1.Text = "Please Choose One Record For Update";
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                lblError1.Text = "";
                MultiView1.ActiveViewIndex = 1;
                txtRoomTypeName.Focus();
                btnSave.Text = "Update";
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtRoomTypeID.Text.Trim().ToString() == string.Empty)
            {
                lblError1.Text = "Please Choose One Record For Delete";
                MultiView1.ActiveViewIndex = 0;
            }
            else if (RoomTbl.Room_Select_By_RoomTypeID(Convert.ToInt32(txtRoomTypeID.Text)).Rows.Count > 0)
            {
                lblError1.Text = "This RoomType Is Already Use In Room Table";
            }
            else
            {
                RoomTypeTbl.RoomType_Delete(Convert.ToInt32(txtRoomTypeID.Text));
                Response.Redirect("RoomType.aspx");
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text.Trim().ToString() == String.Empty)
            {
                Dt = RoomTypeTbl.GetData();

            }
            else
            {
                Dt = RoomTypeTbl.RoomType_Select_By_Search_RoomTypeName(txtSearch.Text);

            }

            Session["ReportDt"] = Dt;
            Session["ReportName"] = "crptCategory.rpt";
            Response.Redirect("Report.aspx");
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Dt = RoomTypeTbl.RoomType_Select_By_Search_RoomTypeName(txtSearch.Text.Trim().ToString());
            DisplayRoomType();
        }


    }
}