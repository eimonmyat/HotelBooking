<%@ Page Title="Administration" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="roomType.aspx.cs" Inherits="HotelBooking.admin.roomType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <table class="table">
                        <tr>
                            <td>
                                <asp:Label ID="lblError1" runat="server" Text="" Font-Size="10" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" CssClass="genric-btn info radius"/>
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="genric-btn info radius"/>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="genric-btn info radius"/>
                                <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" CssClass="genric-btn info radius"/>
                                &nbsp;&nbsp;&nbsp; RoomType Name :
                                <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomTypeID" Width="900px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="No" HeaderText="No" />
                                        <asp:BoundField DataField="RoomTypeID" HeaderText="RoomTypeID" Visible="False" />
                                        <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type Name" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select">
                                                    <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="False" />
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
                    <asp:TextBox ID="txtRoomTypeID" runat="server" Visible="False"></asp:TextBox>
                    <table style="color: #000000; border-width: medium; text-align: left;" class="table">
                        <tr>
                            <th colspan="2" style="text-align: center">Room Type Entry
                            </th>
                        </tr>
                        <tr>
                            <td>Room Type Name : 
                            </td>
                            <td>
                                <asp:TextBox ID="txtRoomTypeName" runat="server" Width="200"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>Quantity : 
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuantity" runat="server" Width="200"></asp:TextBox>

                            </td>
                        </tr>

                        <tr>
                            <td></td>
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
