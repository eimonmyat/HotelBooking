<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="ReserveList.aspx.cs" Inherits="HotelBooking.user.ReserveList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="color: #000000; border-width: medium; text-align: left;" class="table">
        <tr>
            <th style="text-align: center">Reserve List
            </th>
        </tr>
        <tr>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID">
                <Columns>
                    <asp:BoundField DataField="No" HeaderText="No" />
                    <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:TemplateField HeaderText="Change Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtNewQty" runat="server" Text='<%#Bind("RoomTypeID")%>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
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
</asp:Content>
