<%@ Page Title="Administration" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="HotelBooking.admin.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section-top-border">
    
    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="View1" runat="server">
            <div class="text-center">
            <h3>ADMIN LIST</h3>
        </div>
            <div class="row justify-content-center">
                <div class="col-auto">
                    <table class="table">
                        <tr>
                            <td>
                                <asp:Label ID="lblError1" runat="server" Text="" Font-Size="10" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" Width="100px" CssClass="genric-btn info radius" />&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="100px" CssClass="genric-btn info radius"/>&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Width="100px" CssClass="genric-btn info radius"/>&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Width="100px" CssClass="genric-btn info radius"/>&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Admin :&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" Width="184px"></asp:TextBox>

                            </td>
                        </tr>
                        <tr class="table">
                            <td>
                                <br />
                                
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AdminID" Width="900px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" CssClass="table">
                                    <columns>
                                        <asp:BoundField DataField="No" HeaderText="No" />
                                        <asp:BoundField DataField="AdminID" HeaderText="AdminID" Visible="False" />
                                        <asp:BoundField DataField="AdminName" HeaderText="Admin Name" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" />
                                        <asp:TemplateField HeaderText="Select">
                                            <itemtemplate>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Select">
                                                    <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="False" />
                                                </asp:LinkButton>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                    </columns>

                                </asp:GridView>





                            </td>
                        </tr>
                    </table>
                </div>
            </div>






        </asp:View>


        <asp:View ID="View2" runat="server">
            <div class="row justify-content-center">
                <div class="col-auto">
                    
                    <asp:Label ID="lblError2" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="txtAdminID" runat="server" Visible="False"></asp:TextBox>
                    <table class="table">
                        <tr>
                            <th colspan="2" style="text-align: center">New Admin
                            </th>
                        </tr>
                        <tr>
                            <td>Admin Name 
                            </td>
                            <td>
                                <asp:TextBox ID="txtAdminName" runat="server" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Password 
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>ConfirmPassword 
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
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
