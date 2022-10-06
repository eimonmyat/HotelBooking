<%@ Page Title="" Language="C#" MasterPageFile="../Book.Master" AutoEventWireup="true" CodeBehind="CustomerLogIn.aspx.cs" Inherits="HotelBooking.user.CustomerLogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:MultiView runat="server" ID="MultiView1">
        <asp:View runat="server">

            <div class="section-top-border">
                <div class="text-center">
                    <h3>Customer LogIn</h3>
                    <asp:Label ID="lblError2" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div class="row justify-content-center">
                    <div class="col-auto">
                        <table class="table">

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
                                    <asp:Button runat="server" Text="LogIn" ID="btnLogIn" CssClass="genric-btn info radius" ForeColor="Black" OnClick="btnLogIn_Click" />
                                </td>
                            </tr>
                            <tr class="text-center">
                                <td colspan="2">
                                    <asp:LinkButton runat="server" ID="txtRegister" OnClick="txtRegister_Click" class="genric-btn link">New Customer? Go to Register</asp:LinkButton></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View runat="server">
            <div class="section-top-border">
                <div class="text-center">
                    <h3>Customer Registration</h3>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <div class="row justify-content-center">
                    <div class="col-auto">
                        <asp:TextBox ID="txtAdminID" runat="server" Visible="False"></asp:TextBox>
                        <table class="table">


                            
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
                                    <asp:Button ID="btnConfirm" runat="server" Text="Save" OnClick="btnConfirm_Click" CssClass="genric-btn info radius"/>
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="genric-btn info radius" Width="100px"/>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>
        </asp:View>
    </asp:MultiView>



</asp:Content>
