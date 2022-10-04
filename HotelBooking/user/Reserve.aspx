<%@ Page Title="" Language="C#" MasterPageFile="../Book.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="HotelBooking.user.Reserve" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<section class="blog_area section-padding">--%>
    <div class="section-top-border">
        <div class="text-center">
            <h3>Booking Detail</h3>
        </div>
        <br />
        <div class="container">

            <div class="row">
                <div class="col-xl-7 col-lg-7">

                    <div>
                        <table class="table">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Customer Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCustName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>






                <div class="col-xl-5 col-lg-5">

                    <table class="table">
                        
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="No" HeaderText="No" />
                                        <asp:BoundField DataField="RoomID" HeaderText="RoomID" Visible="False" />
                                        <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    </Columns>

                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Total Price :
                                <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" CssClass="genric-btn info radius"/>
                            </td>
                        </tr>
                        <%--<tr>
                                    <td>Room Type</td>
                                    <td>
                                        <asp:Label runat="server" Text="Label" ID="lblRoomType"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Quantity</td>
                                    <td>
                                        <asp:Label runat="server" Text="Label" ID="lblQuantity"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Total Price</td>
                                    <td>
                                        <asp:Label runat="server" Text="Label" ID="lblTotalPrice"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button runat="server" Text="Change" ID="btnChange" />
                                    </td>
                                </tr>--%>
                    </table>


                </div>
            </div>
        </div>
    </div>
    <%--</section>--%>
</asp:Content>
