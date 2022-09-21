<%@ Page Title="Administration" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="HotelBooking.admin.Room" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="container">
                <div class="form-edit">
                     <table>
                <tr>
                    <td>
                        <asp:Label ID="lblError1" runat="server" Text="" Font-Size="10" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        Search Types : <asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True">
                            <asp:ListItem>Room Number</asp:ListItem>
                            <asp:ListItem>Room Type Name</asp:ListItem>
                            <asp:ListItem>Price</asp:ListItem>
                            <asp:ListItem>Capacity</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                         <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />

                    </td>
                </tr>
                 <tr>
                    <td>
                        <br />
                       
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" Width="900px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" />
                                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" Visible="False" />
                                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                                    <asp:BoundField DataField="RoomTypeID" HeaderText="RoomTypeID" Visible="False" />
                                    <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type Name" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" />
                                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image ID="imgImage" runat="server" ImageUrl='<%#Bind("RoomImage") %>' Width="50" Height="50" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select">
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                
                        </asp:GridView>
                    </td>
                </tr>
            </table>
                </div>
            </div>
        </asp:View>


        <asp:View ID="View2" runat="server">
             <div class="container">
               <div class="form-new">
                   <asp:Label ID="lblError2" runat="server" Text=""></asp:Label>
               <asp:TextBox ID="txtRoomID" runat="server" Visible="False"></asp:TextBox>
               <table style="color: #000000; border-width: medium; text-align: left;" class="table">
                <tr>
                    <th colspan="2" style="text-align: center">
                        Room
                    </th>
                </tr>
                <tr>
                    <td>
                        Room Number : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomNumber" runat="server" Width="200"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Room Type Name: 
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRoomTypeName" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                   <tr>
                    <td>
                        Price : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" Width="200"></asp:TextBox>
                    </td>
                </tr>
                   <tr>
                    <td>
                        Capacity : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtCapacity" runat="server" Width="200"></asp:TextBox>
                    </td>
                </tr>
                   <tr>
                    <td>
                        Description : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" Width="200"></asp:TextBox>
                    </td>
                </tr>
                   <tr>
                    <td>
                        Room Image : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtImage" runat="server" Width="200" Visible="False"></asp:TextBox>
                        <asp:FileUpload ID="FileUploadImage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
               </div>
               
           </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
