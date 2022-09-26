<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="RoomDetail.aspx.cs" Inherits="HotelBooking.user.RoomDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-7">

                    <div>
                        <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/img/RoomImages/Deluxe-Family-01-3-1024x652.jpg" />--%>
                        <asp:Image ID="imgRoom" runat="server" Width="600" Height="400" />
                    </div>

                </div>
                <div class="col-xl-5 col-lg-5">
                    <div class="about_info">
                        <%--<div class="section_title mb-20px">
                            <span>Delicious Food</span>
                            <h3>We Serve Fresh and
                                <br>
                                Delicious Food</h3>
                            
                        </div>--%>
                        <h3>
                                <asp:Label ID="lblRoomType" runat="server" Text="Label"></asp:Label></h3>
                        <table>
                            <tr>
                                <td>Capacity:</td>
                                <td>
                                    <asp:Label ID="lblCapacity" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Price:</td>
                                <td>
                                    <asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Description:</td>
                                <td>
                                    <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                           <%-- <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtQty" runat="server" TextMode="Number"></asp:TextBox></td>
                            </tr>--%>
                            <tr>
                                <td>
                                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnReserve" runat="server" Text="Reserve" OnClick="btnReserve_Click" />
                                </td>
                            </tr>
                        </table>



                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about_area_end -->
</asp:Content>
