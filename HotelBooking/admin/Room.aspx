<%@ Page Title="Administration" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="HotelBooking.admin.Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-top-border">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="text-center">
            <h3>ROOM LIST</h3>
        </div>
            <div align="center">
                <asp:Label ID="lblError1" runat="server" Text="" Font-Size="10" ForeColor="#FF3300"></asp:Label>
            </div>
            <br />
            <div class="row justify-content-center">
                <div class="col-auto">
                    <%--<table class="table">
                        <tr>
                            <td>--%>
                                
                            <%--</td>
                        </tr>
                        <tr>
                            <td>--%>
                                <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" CssClass="genric-btn info radius" />
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="genric-btn info radius" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="genric-btn info radius" />
                                <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" CssClass="genric-btn info radius" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search Types :&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True" CssClass="default-select">
                                    <asp:ListItem>Room Number</asp:ListItem>
                                    <asp:ListItem>Room Type Name</asp:ListItem>
                                    <asp:ListItem>Price</asp:ListItem>
                                    <asp:ListItem>Capacity</asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" Width="152px"></asp:TextBox>
                                

                            <%--</td>
                        </tr>
                        <tr>
                            <td>--%>
                                <br />
                    <br />

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" Width="900px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table">
                                    <Columns>
                                        <asp:BoundField DataField="No" HeaderText="No" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="RoomID" HeaderText="RoomID" Visible="False" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="RoomTypeID" HeaderText="RoomTypeID" Visible="False" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="RoomTypeName" HeaderText="Room Type Name" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-BackColor="#009DFF"/>
                                        <asp:TemplateField HeaderText="Image" HeaderStyle-BackColor="#009DFF">
                                            <ItemTemplate>
                                                <asp:Image ID="imgImage" runat="server" ImageUrl='<%#Bind("RoomImage") %>' Width="50" Height="50" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select" HeaderStyle-BackColor="#009DFF">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select">
                                                    <asp:CheckBox ID="chkSelect" runat="server" />
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
        </asp:View>


        <asp:View ID="View2" runat="server">
            <div class="text-center">
            <h3>ROOM ENTRY</h3>
        </div>
            <br />
            <div class="row justify-content-center">
                <div class="col-auto">
                    <asp:Label ID="lblError2" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="txtRoomID" runat="server" Visible="False"></asp:TextBox>
                    <table class="table">
                        <%--<tr>
                            <th colspan="2" style="text-align: center">Room
                            </th>
                        </tr>--%>
                        <tr>
                            <td>Room Number : 
                            </td>
                            <td>
                                <asp:TextBox ID="txtRoomNumber" runat="server" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Room Type Name: 
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlRoomTypeName" runat="server" CssClass="default-select"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Price : 
                            </td>
                            <td>
                                <asp:TextBox ID="txtPrice" runat="server" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Capacity : 
                            </td>
                            <td>
                                <asp:TextBox ID="txtCapacity" runat="server" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Description : 
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Room Image : 
                            </td>
                            <td>
                                <asp:TextBox ID="txtImage" runat="server" Width="200" Visible="False"></asp:TextBox>
                                <asp:FileUpload ID="FileUploadImage" runat="server" CssClass="default-select" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="genric-btn info radius"/>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
        </asp:View>
    </asp:MultiView>
        </div>
</asp:Content>
