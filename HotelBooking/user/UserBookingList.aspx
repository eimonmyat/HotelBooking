<%@ Page Title="" Language="C#" MasterPageFile="../Book.Master" AutoEventWireup="true" CodeBehind="UserBookingList.aspx.cs" Inherits="HotelBooking.user.BookingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-top-border">
        <div class="text-center">
            <h3>Booking List</h3>
            <asp:Label ID="lblError2" runat="server" Text=""></asp:Label>
        </div>
        <div class="row justify-content-center">
            <div class="col-auto">
                <%--<table class="table">
                    <tr>
                        <td>--%>
                            <asp:Button ID="btnAll" runat="server" Text="<<All" OnClick="btnAll_Click" CssClass="genric-btn info radius"/>
                        <br />
                <br />
                <%--</td>--%>
                        <%--<td style="text-align:right">
                            <asp:Button ID="Button1" runat="server" Text="Print" CssClass="genric-btn info radius"/>
                        </td>--%>
                    <%--</tr>
                    <tr>
                        <td>--%>
                            <asp:DataList ID="DataList1" runat="server" Width="800px" OnPreRender="DataList1_PreRender1">
                                <ItemTemplate>
                                    <table class="table">

                                        <tr>
                                            <td style="background-color: #009DFF"></td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td>Booking Date:</td>
                                                        <td>
                                                            <asp:Label ID="lblBookingDate" runat="server" Text='<%#Eval("BookingDate") %>'></asp:Label>
                                                        </td>
                                                        <td width="220px"></td>
                                                        <td >Email:</td>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
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
                       <%-- </td>
                    </tr>
                </table>--%>
                </div>
            </div>
        </div>
</asp:Content>
