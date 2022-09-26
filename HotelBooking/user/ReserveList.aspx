<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="ReserveList.aspx.cs" Inherits="HotelBooking.user.ReserveList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            
                <div class="container">
                    <div class="form-new">
                        <table class="table">
                            <tr>
                                <th style="text-align: center">Reserve List
                                </th>
                            </tr>
                            <tr>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID">
                                    <Columns>
                                        <asp:BoundField DataField="No" HeaderText="No" />
                                        <asp:BoundField DataField="RoomID" HeaderText="RoomID" Visible="False" />
                                        <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                        <asp:TemplateField HeaderText="Change Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtNewQty" runat="server" Text='<%#Bind("Quantity")%>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </tr>
                            <tr style="text-align: center">
                                <td>
                                    <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="book_now" OnClick="btnContinue_Click" />
                                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="book_now" OnClick="btnCheckOut_Click" />
                                    <asp:Button ID="btnCancelBooking" runat="server" Text="Cancel Booking" CssClass="book_now" OnClick="btnCancelShopping_Click" />
                                </td>
                            </tr>
                            <%-- <tr>
            <td>Room Type</td>
            <td>Price</td>
            <td>Quantity</td>
            <td>
                <asp:Label runat="server" Text="Label" ID="lblRoomType"></asp:Label>
            </td>
        </tr>
        <tr>
           
            <td>
                <asp:Label runat="server" Text="Label" ID="lblQuantity"></asp:Label>
            </td>
        </tr>
        <tr>
            
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
</asp:Content>
