<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="HotelBooking.user.Reserve" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<section class="blog_area section-padding">--%>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mb-5 mb-lg-0">
                <asp:MultiView runat="server" ID="MultiView1">
                    <asp:View runat="server">
                       
                        <%--<div class="blog_left_sidebar">--%>
                            <div class="container">
                                <div class="form-new">
                                     <asp:Label runat="server" ID="lblError" Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
                                    <table style="color: #000000; border-width: medium; text-align: left;" class="table">
                                        <tr>
                                            <th colspan="2" style="text-align: center">Customer Log In
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>Email : 
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtCustomerEmail" Width="200px" TextMode="Email"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Password : 
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtCustomerPassword" Width="200px" TextMode="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button runat="server" Text="Log In and Confirm Booking" ID="btnLogIn" CssClass="form button" ForeColor="Black" OnClick="btnLogIn_Click" />
                                            </td>
                                        </tr>
                                        <tr class="text-center">
                                            <td colspan="2">
                                                <asp:LinkButton runat="server" ID="txtRegister" OnClick="txtRegister_Click">New Customer? Go to Register</asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View runat="server">
                        <div class="blog_left_sidebar">
                            <div class="container">
                                <div class="form-new">
                                    <asp:Label ID="lblError2" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="txtAdminID" runat="server" Visible="False"></asp:TextBox>
                                    <table style="color: #000000; border-width: medium; text-align: left;" class="table">
                                        <tr>
                                            <th colspan="2" style="text-align: center">Customer Information
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>Customer Name : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCustomerName" runat="server" Width="200"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Address : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAddress" runat="server" Width="200"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Phone : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPhone" runat="server" Width="200" TextMode="Phone"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Email : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmail" runat="server" Width="200" TextMode="Email"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Password : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>ConfirmPassword : 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button ID="btnConfirm" runat="server" Text="Save and Confirm Booking" OnClick="btnConfirm_Click" />
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>


            </div>
            <div class="col-lg-4">
                <div class="blog_right_sidebar">
                    <div class="container">
                        <div class="form-new">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                            <table style="color: #000000; border-width: medium; text-align: left;" class="table">
                                <tr>
                                    <th style="text-align: center">Booking Details
                                    </th>
                                </tr>
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
                                    <td style="text-align:right">
                                       Total Price : <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
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
        </div>
    </div>
    <%--</section>--%>
</asp:Content>
