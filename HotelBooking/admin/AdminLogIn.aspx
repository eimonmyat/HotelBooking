<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminLogIn.aspx.cs" Inherits="HotelBooking.admin.AdminLogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="lblError" Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label>
    <div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h3>LOGIN</h3>
          </div>
        </div>
        <form class="login-form">
          <table>
              <tr>
                  <td>
                      Name : 
                  </td>
                  <td>
                      <asp:TextBox runat="server" ID="txtAdminName" Width="200px"></asp:TextBox>
                  </td>
              </tr>
               <tr>
                  <td>
                      Password : 
                  </td>
                  <td>
                      <asp:TextBox runat="server" ID="txtPassword" Width="200px" TextMode="Password"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td>

                  </td>
                  <td>
                      <asp:Button runat="server" Text="Log In" ID="btnLogIn" CssClass="form button" ForeColor="Black" OnClick="btnLogIn_Click"/>
                  </td>
              </tr>
          </table>
        </form>
      </div>
    </div>
</asp:Content>
