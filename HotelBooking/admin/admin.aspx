<%@ Page Title="Administration" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="HotelBooking.admin.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="View1" runat="server">
            <div class="container">
                <div class="form-edit">
                     <table>
                <tr>
                    <td>
                        <asp:Label ID="lblError1" runat="server" Text="" Font-Size="10" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />
                        &nbsp;&nbsp;&nbsp; Admin : <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                    </td>
                </tr>
                 <tr>
                    <td>
                        <br />
                       
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AdminID" Width="900px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="No" />
                                    <asp:BoundField DataField="AdminID" HeaderText="AdminID" Visible="False" />
                                    <asp:BoundField DataField="AdminName" HeaderText="Admin Name" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" />
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
                 
             
             
                     
                
           
        </asp:View>


        <asp:View ID="View2" runat="server">
           <div class="container">
               <div class="form-new">
                   <asp:Label ID="lblError2" runat="server" Text=""></asp:Label>
               <asp:TextBox ID="txtAdminID" runat="server" Visible="False"></asp:TextBox>
               <table style="color: #000000; border-width: medium; text-align: left;" class="table">
                <tr>
                    <th colspan="2" style="text-align: center">
                        New Admin
                    </th>
                </tr>
                <tr>
                    <td>
                        Admin Name : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtAdminName" runat="server" Width="200"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        ConfirmPassword : 
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
               </div>
               
           </div>
            
            
            
        </asp:View>
    </asp:MultiView>
</asp:Content>
