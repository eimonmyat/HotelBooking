<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="BookingList.aspx.cs" Inherits="HotelBooking.admin.BookingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-top-border">
          <div class="text-center">
            <h3>Booking List</h3>
          </div>
        <br />
    <div class="row justify-content-center">
        <div class="col-auto">
            <table class="table">
                <tr>
                    <td>Search Type:</td>
                    <td>
                        <asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True" Width="200" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged" CssClass="default-select">
                            <asp:ListItem>BookingDate</asp:ListItem>
                            <asp:ListItem>CustomerName</asp:ListItem>
                            <asp:ListItem>Email</asp:ListItem>
                            <asp:ListItem>TotalStatus</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBookingDate" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="btnImg" runat="server" ImageUrl="../img/calendar.png" Height="36px" Width="36px" ImageAlign="AbsBottom" OnClick="Image2_Click" />
                        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>

                    </td>
                    <td>
                        <asp:TextBox ID="txtSearchData" runat="server" Width="200" Visible="False" AutoPostBack="True" OnTextChanged="txtSearchData_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" CssClass="genric-btn info radius"/>
                    </td>
                </tr>
            </table>

            <p>&nbsp;</p>
            <asp:DataList ID="DataList1" runat="server" Width="800px" OnPreRender="DataList1_PreRender" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <p>&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color: #3333FF"></td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>No:</td>
                                        <td>
                                            <asp:Label ID="lblNo" runat="server" Text='<%#Eval("No") %>'></asp:Label>
                                        </td>
                                        <td></td>
                                        <td>Booking Date:</td>
                                        <td>
                                            <asp:Label ID="lblBookingDate" runat="server" Text='<%#Eval("BookingDate") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Customer Name:</td>
                                        <td>
                                            <asp:Label ID="lblCustName" runat="server" Text='<%#Eval("CustName") %>'></asp:Label>
                                        </td>
                                        <td></td>
                                        <td>Email:</td>
                                        <td>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Total:</td>
                                        <td>
                                            <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("TotalAmount") %>'></asp:Label>
                                        </td>
                                        <td></td>
                                        <td>Status:</td>
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("CheckStatus") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="800px">
                                    <Columns>
                                        <asp:BoundField DataField="No" HeaderText="No" />
                                        <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" />
                                        <asp:BoundField DataField="RoomTypeName" HeaderText="RoomTypeName" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" />

                                    </Columns>

                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            </div>
        </div>
        </div>
</asp:Content>
