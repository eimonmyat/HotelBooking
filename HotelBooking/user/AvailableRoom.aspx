<%@ Page Title="" Language="C#" MasterPageFile="../Book.Master" AutoEventWireup="true" CodeBehind="AvailableRoom.aspx.cs" Inherits="HotelBooking.user.AvailableRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="offer">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="section_title text-center mb-100">
                                <span></span>
                                <h3>Ongoing Offers</h3>
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="row" height="00">

                        <asp:DataList ID="RoomNumberList" runat="server" DataKeyField="RoomID" RepeatColumns="3" RepeatDirection="Horizontal" OnSelectedIndexChanged="RoomNumberList_SelectedIndexChanged">
                            <ItemTemplate>

                                <div class="col-xl-4 col-md-4">
                                    <div class="single_offers">
                                        <div class="about_thumb">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("RoomImage")%>' Height="400" Width="350" />
                                        </div>

                                        
                                        <ul>
                                            <li>
                                                <asp:Label ID="RoomType" runat="server" Text='<%#Eval("RoomTypeID")%>'></asp:Label>
                                            </li>
                                            <%--<li>
                                                <asp:Label ID="Detail" runat="server" Text='<%#Eval("Description")%>'></asp:Label>

                                            </li>--%>

                                            <li>
                                                <asp:Label ID="Price" runat="server" Text='<%#Eval("Price")%>'></asp:Label></li>
                                            <%--<li>
                                                <asp:TextBox ID="txtRoomCount" runat="server" TextMode="Number"></asp:TextBox></li>--%>
                                        </ul>
                                        <br />
                                        
                                        <asp:LinkButton ID="btnBooking" runat="server" Text="Detail" CssClass="genric-btn info radius" CommandName="Select"></asp:LinkButton>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>

                    </div>
                </div>
            </div>
     <!-- forQuery_start -->
            <div class="forQuery">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-10 offset-xl-1 col-md-12">
                            <div class="Query_border">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-xl-6 col-md-6">
                                        <div class="Query_text">
                                            <p>For Reservation 0r Query?</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-md-6">
                                        <div class="phone_num">
                                            <a href="#" class="mobile_no">+10 576 377 4789</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- forQuery_end-->

            <!-- instragram_area_start -->
            <div class="instragram_area">
                <div class="single_instagram">
                    <img src="img/instragram/1.png" alt="">
                    <div class="ovrelay">
                        <a href="#">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                </div>
                <div class="single_instagram">
                    <img src="img/instragram/2.png" alt="">
                    <div class="ovrelay">
                        <a href="#">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                </div>
                <div class="single_instagram">
                    <img src="img/instragram/3.png" alt="">
                    <div class="ovrelay">
                        <a href="#">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                </div>
                <div class="single_instagram">
                    <img src="img/instragram/4.png" alt="">
                    <div class="ovrelay">
                        <a href="#">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                </div>
                <div class="single_instagram">
                    <img src="img/instragram/5.png" alt="">
                    <div class="ovrelay">
                        <a href="#">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- instragram_area_end -->
</asp:Content>
