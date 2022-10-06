
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBooking.admin
{
    public partial class Room : System.Web.UI.Page
    {
       
        MainDatasetTableAdapters.RoomTableAdapter RoomTbl = new MainDatasetTableAdapters.RoomTableAdapter();
        MainDatasetTableAdapters.RoomTypeTableAdapter RoomTypeTbl = new MainDatasetTableAdapters.RoomTypeTableAdapter();
        DataTable Dt = new DataTable();
        DataTable Dt2 = new DataTable();
        DataTable Dt1 = new DataTable();
        DataTable DtDisplay = new DataTable();
        DataRow Dr;
        int Count;

        protected void DisplayRoom()
        {
            DtDisplay.Columns.Clear();
            DtDisplay.Rows.Clear();

            DtDisplay.Columns.Add("No");
            DtDisplay.Columns.Add("RoomID");
            DtDisplay.Columns.Add("RoomNumber");
            DtDisplay.Columns.Add("RoomTypeID");
            DtDisplay.Columns.Add("RoomTypeName");
            DtDisplay.Columns.Add("Price");
            DtDisplay.Columns.Add("Capacity");
            DtDisplay.Columns.Add("Description");
            DtDisplay.Columns.Add("RoomImage");

            Dr = DtDisplay.NewRow();
            DtDisplay.Rows.Add(Dr);

            Count = Dt.Rows.Count;
            if (Count > 0)
            {
                DtDisplay.Rows.Clear();
                for (int i = 0; i < Count; i++)
                {
                    Dr = DtDisplay.NewRow();
                    Dr[0] = Dt.Rows[i][0];//no
                    Dr[1] = Dt.Rows[i][1];//proid
                    Dr[2] = Dt.Rows[i][2];//proname
                    Dr[3] = Dt.Rows[i][3];//catid
                    Dr[4] = Dt.Rows[i][4];//catname
                    Dr[5] = Dt.Rows[i][5];//price
                    Dr[6] = Dt.Rows[i][6];//capacity
                    Dr[7] = Dt.Rows[i][7];//description
                    Dr[8] = Dt.Rows[i][8];//img
                    DtDisplay.Rows.Add(Dr);
                }
            }
            Session["SessionDtDisplay"] = DtDisplay;
            GridView1.DataSource = DtDisplay;
            GridView1.DataBind();

            txtSearch.Focus();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Dt = RoomTbl.GetData();
            DisplayRoom();
            MultiView1.ActiveViewIndex = 0;
        }
        protected void DisplayCategory()
        {
            ddlRoomTypeName.DataTextField = "RoomTypeName";
            ddlRoomTypeName.DataValueField = "RoomTypeID";
            ddlRoomTypeName.DataSource = RoomTypeTbl.GetData();
            ddlRoomTypeName.DataBind();
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            btnSave.Text = "Save";
            DisplayCategory();
            MultiView1.ActiveViewIndex = 1;
            ClearData();
            txtRoomNumber.Focus();
        }
        private string ImageLocation(int RoomID)//12
        {
            string filename = FileUploadImage.FileName;//speaker1.jpg
            string FilePath = Server.MapPath("../img/RoomImages/") + RoomID + ".jpg";
            //~/Images/ProImage/12.jpg

            if (System.IO.File.Exists(FilePath))
                System.IO.File.Delete(FilePath);

            if (filename != string.Empty)
            {
                FileUploadImage.SaveAs(FilePath);//images folder save
                return "../img/RoomImages/" + RoomID + ".jpg"; // 5.jpg with file path
            }
            else
            {
                return "../img/RoomImages/Image1.jpg";
            }
        }
        protected void ClearData()
        {
            txtSearch.Text = "";
            txtRoomID.Text = "";
            txtRoomNumber.Text = "";
            ddlRoomTypeName.SelectedIndex = -1;
            txtPrice.Text = "";
            txtCapacity.Text = "";
            txtDescription.Text = "";
            txtImage.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Dt2 = RoomTbl.Room_Select_By_SearchRoomTypeName(ddlRoomTypeName.SelectedItem.ToString());
            int rowRoom = Dt2.Rows.Count;
            Dt1=RoomTypeTbl.RoomType_Select_By_RoomTypeName(ddlRoomTypeName.SelectedItem.ToString());
            int rowRoomType = Convert.ToInt32(Dt1.Rows[0][3].ToString());
            int ok;

            if (txtRoomNumber.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Enter Room Number";
                txtRoomNumber.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (txtPrice.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Enter Price";
                txtPrice.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (int.TryParse(txtPrice.Text, out ok) == false)
            {
                lblError2.Text = "Price Should Be Number";
                txtPrice.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (Convert.ToInt32(txtPrice.Text) < 1000 || Convert.ToInt32(txtPrice.Text) > 10000000)
            {
                lblError2.Text = "Price Should Be Between 10,00 And 10,000,000";
                txtPrice.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (txtCapacity.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Enter Capacity";
                txtCapacity.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (int.TryParse(txtCapacity.Text, out ok) == false)
            {
                lblError2.Text = "Capacity Should Be Number";
                txtCapacity.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (Convert.ToInt32(txtCapacity.Text) < 1)
            {
                lblError2.Text = "Capacity Should Be One And Above";
                txtCapacity.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (txtDescription.Text.Trim().ToString() == string.Empty)
            {
                lblError2.Text = "Please Enter Description";
                txtDescription.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else if (rowRoom >= rowRoomType)
            {
                lblError2.Text = "Room Quantity exceed";
                ddlRoomTypeName.Focus();
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                Dt = RoomTbl.Room_Select_By_RoomNumberRoomTypeName(txtRoomNumber.Text, ddlRoomTypeName.SelectedItem.ToString());
                if (Dt.Rows.Count > 0)
                {
                    if (Dt.Rows[0][1].ToString() != txtRoomID.Text)
                    {
                        lblError2.Text = "This Room Is Already Exist";
                        MultiView1.ActiveViewIndex = 1;
                        return;
                    }
                }
                if (btnSave.Text == "Save")
                {
                    RoomTbl.Room_Insert(txtRoomNumber.Text, Convert.ToInt32(txtPrice.Text.ToString()), Convert.ToInt32(txtCapacity.Text.ToString()), txtDescription.Text.ToString(), Convert.ToInt32(ddlRoomTypeName.SelectedValue));
                    //catid,proname,price,qty

                    int RoomID = Convert.ToInt32(RoomTbl.Room_Select_By_MaxRoomID().Rows[0][1]);//12
                                                                                                //no,proid,proname,catid,catname,price,qty,image
                                                                                                //5 record
                    Response.Write(RoomID);                                                                       //1,5,system unit,3,desktop,90000,2,null

                    RoomTbl.Room_Insert_Image(RoomID, ImageLocation(RoomID));//1012,~\Images\ProImage\1012.jpg)
                                                                             //(5,~/Images/ProImage/5.jpg)
                                                                             //(5,~/Images/ProImage/Image1.jpg)
                }
                else if (btnSave.Text == "Update")
                {
                    int RoomID = Convert.ToInt32(txtRoomID.Text);//4

                    string ImagePath = ImageLocation(RoomID);//~/Images/Proimage/4.jpg

                    if (ImagePath == "../img/RoomImages/Image1.jpg" && txtImage.Text.ToString() == "")

                        RoomTbl.Room_Update(Convert.ToInt32(txtRoomID.Text), txtRoomNumber.Text, Convert.ToInt32(txtPrice.Text), Convert.ToInt32(txtCapacity.Text), txtDescription.Text, Convert.ToInt32(ddlRoomTypeName.SelectedValue), ImagePath.ToString());

                    else if (ImagePath == "../img/RoomImages/Image1.jpg" && txtImage.Text.ToString() != "")
                    {
                        ImagePath = txtImage.Text.ToString();
                        RoomTbl.Room_Update(Convert.ToInt32(txtRoomID.Text), txtRoomNumber.Text, Convert.ToInt32(txtPrice.Text), Convert.ToInt32(txtCapacity.Text), txtDescription.Text, Convert.ToInt32(ddlRoomTypeName.SelectedValue), ImagePath.ToString());
                    }
                    else
                        RoomTbl.Room_Update(Convert.ToInt32(txtRoomID.Text), txtRoomNumber.Text, Convert.ToInt32(txtPrice.Text), Convert.ToInt32(txtCapacity.Text), txtDescription.Text, Convert.ToInt32(ddlRoomTypeName.SelectedValue), ImagePath.ToString());

                }
                ClearData();
                Dt = RoomTbl.GetData();
                DisplayRoom();
                MultiView1.ActiveViewIndex = 0;

                Response.Redirect("Room.aspx");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RowIndex = GridView1.SelectedIndex;//0
            DtDisplay = (DataTable)Session["SessionDtDisplay"];


            //no,proid,proname,catid,catname,price,qty,img
            txtRoomID.Text = DtDisplay.Rows[RowIndex][1].ToString();//proid
            txtRoomNumber.Text = DtDisplay.Rows[RowIndex][2].ToString();//proname
            btnSave.Text = DtDisplay.Rows[RowIndex][3].ToString();//catid
            
            txtPrice.Text = DtDisplay.Rows[RowIndex][5].ToString();//price
            txtCapacity.Text = DtDisplay.Rows[RowIndex][6].ToString();//qty
            txtDescription.Text = DtDisplay.Rows[RowIndex][7].ToString();
            txtImage.Text = DtDisplay.Rows[RowIndex][8].ToString();//img
            GridViewRow Row2 = GridView1.Rows[RowIndex];//4
                                                        //5,9,rtwert,3,desktop,45454,4,image1.jpg
            CheckBox chkSelect2 = (CheckBox)Row2.FindControl("chkSelect");
            chkSelect2.Checked = true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtRoomID.Text.Trim().ToString() == string.Empty)
            {
                lblError1.Text = "Please Choose One Record For Update";
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                lblError1.Text = "";
                DisplayCategory();
                MultiView1.ActiveViewIndex = 1;
                txtRoomNumber.Focus();
                //lblError1.Text = btnSave.Text;
                ddlRoomTypeName.SelectedValue = btnSave.Text;
                btnSave.Text = "Update";
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtRoomID.Text.Trim().ToString() == string.Empty)
            {
                lblError1.Text = "Please Choose One Record For Delete";
            }
            //else if (Convert.ToInt32(txtCapacity.Text.Trim().ToString()) > 0)
            //{
            //    lblError1.Text = "This Product Have In Stock";
            //}
            else
            {
                string ImagePath = Server.MapPath(txtImage.Text);
                if (txtImage.Text.Contains("Image1.jpg") == false)
                {
                    if (System.IO.File.Exists(ImagePath))
                        System.IO.File.Delete(ImagePath);
                }
                RoomTbl.Room_Delete(Convert.ToInt32(txtRoomID.Text));
                Response.Redirect("Room.aspx");
            }
        }
        protected void ddlSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            txtSearch.Focus();
        }
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (ddlSearchType.SelectedIndex == 0)//productname
                Dt = RoomTbl.Room_Select_By_SearchRoomNumber(txtSearch.Text);
            else if (ddlSearchType.SelectedIndex == 1)//categoryname
                Dt = RoomTbl.Room_Select_By_SearchRoomTypeName(txtSearch.Text);
            else if (ddlSearchType.SelectedIndex == 2)//price
                Dt = RoomTbl.Room_Select_By_SearchPrice(Convert.ToInt32(txtPrice.Text));
            else if (ddlSearchType.SelectedIndex == 3)//qty
                Dt = RoomTbl.Room_Select_By_SearchCapacity(Convert.ToInt32(txtCapacity.Text));

            DisplayRoom();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Session["Data"] = txtSearch.Text;

            Response.Redirect("RoomReport.aspx");
        }
    }
}