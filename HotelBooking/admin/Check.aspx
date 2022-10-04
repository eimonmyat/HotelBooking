<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Check.aspx.cs" Inherits="HotelBooking.admin.Check" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 587px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-top-border">
        <div class="text-center">
            <h3>Check Booking</h3>
        </div>
        <div class="row justify-content-center">
            <div class="col-auto">
                <table class="table">
                
                 <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lblError" runat="server" Text="" Font-Size="10" ForeColor="#FF3300"></asp:Label>
                        </td>
                     <td class="align-left">
                        <asp:TextBox ID="txtBookingID" runat="server" AutoPostBack="True"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp; <asp:Button ID="btnUpdate" runat="server" Text="Check" OnClick="btnUpdate_Click" CssClass="genric-btn info radius"/>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <br />
                       
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID" Width="900px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" />
                                    <asp:BoundField DataField="BookingID" HeaderText="BookingID" Visible="False" />
                                    <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" />
                                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                                    <asp:BoundField DataField="CustName" HeaderText="Customer Name" />
                                    <asp:BoundField DataField="TotalAmount" HeaderText="Total" />
                                    <asp:BoundField DataField="CheckStatus" HeaderText="CheckStatus" />
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select">
                                                <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="False" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                
                        </asp:GridView>
                    </td>
                </tr>
            </table>
                </div>
            </div>
        </div>
</asp:Content>
