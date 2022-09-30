<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="BookingList.aspx.cs" Inherits="HotelBooking.admin.BookingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Search Type:</td>
            <td>
                <asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True" Width="200">
                    <asp:ListItem>BookingDate</asp:ListItem>
                    <asp:ListItem>CustomerName</asp:ListItem>
                    <asp:ListItem>Email</asp:ListItem>
                    <asp:ListItem>TotalStatus</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="txtBookingDate" runat="server" AutoPostBack="True" Width="200"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtSearchData" runat="server" Width="200" Visible="False" AutoPostBack="True"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnPrint" runat="server" Text="Print" />
            </td>
        </tr>
        </table>
    <p>&nbsp;</p>
    <asp:DataList ID="DataList1" runat="server" Width="800">
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <p>&nbsp;</p>
                    </td>
                </tr>
                 <tr>
                    <td style="background-color:#3333FF">

                    </td>
                </tr>
                 <tr>
                    <td>
                        <table>
                            <tr>
                                <td>No:</td>
                                <td>
                                    <asp:Label ID="lblNo" runat="server" Text='<%#Eval("No") %>'></asp:Label></td>
                                <td></td>
                                <td>Booking Date:</td>
                                <td>
                                    <asp:Label ID="lblBookingDate" runat="server" Text='<%#Eval("BookingDate") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Customer Name:</td>
                                <td>
                                    <asp:Label ID="lblCustName" runat="server" Text='<%#Eval("CustName") %>'></asp:Label></td>
                                <td></td>
                                <td>Email:</td>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label></td>
                            </tr>
                            <tr>
                               <td>Total:</td>
                                <td>
                                    <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("TotalAmount") %>'></asp:Label></td>
                                <td></td>
                                <td>Status:</td>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("CheckStatus") %>'></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                 <tr>
                    <td>

                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
