<%@ Page Title="" Language="C#" MasterPageFile="~/Book.Master" AutoEventWireup="true" CodeBehind="ReserveList.aspx.cs" Inherits="HotelBooking.user.ReserveList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-top-border">
        <div class="text-center">
            <h3>Room Reserve List</h3>
        </div>
        <div class="row justify-content-center">
            <div class="col-auto">
                <table class="table">

                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" />
                                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" Visible="False" />
                                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                                    <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    <asp:TemplateField HeaderText="Change Quantity" Visible="False">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtNewQty" Visible="false" runat="server" Text='<%#Bind("Quantity")%>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>

                    </tr>
                    <tr style="text-align: center">
                        <td>
                            <asp:Button ID="btnContinue" runat="server" Text="Continue"  OnClick="btnContinue_Click" CssClass="genric-btn info radius" Width="150px"/>
                            <asp:Button ID="btnCheckOut" runat="server" Text="Check Out"  OnClick="btnCheckOut_Click" CssClass="genric-btn info radius" Width="150px"/>
                            <asp:Button ID="btnCancelBooking" runat="server" Text="Cancel Booking"  OnClick="btnCancelShopping_Click" CssClass="genric-btn info radius" Width="150px"/>
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

</asp:Content>
