<%@ Page Title="Administration" Language="C#" MasterPageFile="GeneralMaster.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="HotelBooking.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblError" Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>


    <div class="section-top-border">
        <div class="text-center">
            <h3>ADMIN LOGIN</h3>
        </div>
        <div class="row justify-content-center">
            <div class="col-auto">
                <table class="table">
                    <tr>
                        <td>Name : 
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAdminName" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Password : 
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPassword" Width="200px" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button runat="server" Text="Log In" ID="btnLogIn" CssClass="genric-btn info radius" ForeColor="Black" OnClick="btnLogIn_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>




</asp:Content>
