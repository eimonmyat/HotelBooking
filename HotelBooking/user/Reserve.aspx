<%@ Page Title="" Language="C#" MasterPageFile="../Book.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="HotelBooking.user.Reserve" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<section class="blog_area section-padding">--%>
    <div class="section-top-border">
        <div class="text-center">
            <h3>Booking Details</h3>
        </div>
        <br />
        <div class="container">

            <div class="row">
                <div class="col-xl-7 col-lg-7">
                    <%--<table class="table">
                        
                        <tr>
                            <td>--%>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table">
                                    <Columns>
                                        <asp:BoundField DataField="No" HeaderText="No" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="RoomID" HeaderText="RoomID" Visible="False" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" HeaderStyle-BackColor="#009DFF"/>
                                    </Columns>

                                </asp:GridView>
                            <%--</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">--%>
                    <div align="right">
                        Total Price :
                        <asp:TextBox ID="txtTotalPrice" runat="server" Enabled="False"></asp:TextBox>
                                <%--<asp:Label ID="lblTotalPrice" runat="server"></asp:Label>--%>
                    </div>
                                
                            <%--</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                
                            </td>
                        </tr>--%>
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






                <div class="col-xl-5 col-lg-5">

                    
                     <div>
                        <table class="table">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Customer Name"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txtCustName" runat="server" Width="250px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Phone"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txtPhone" runat="server" Width="250px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                         <div align="right">
                             <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" CssClass="genric-btn info radius"/>
                         </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%--</section>--%>
</asp:Content>
