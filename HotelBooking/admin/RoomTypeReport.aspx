<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RoomTypeReport.aspx.cs" Inherits="HotelBooking.admin.RoomTypeReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center">
        <div class="col-auto">
            <div class="container-fluid">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <br />
                <asp:ObjectDataSource ID="DS_All" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="HotelBooking.MainDatasetTableAdapters.RoomTypeTableAdapter"></asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="DS_RoomTypeName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="RoomType_Select_By_Search_RoomTypeName" TypeName="HotelBooking.MainDatasetTableAdapters.RoomTypeTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="RoomTypeName" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>

                <div class="row justify-content-center">
                   <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000" CssClass="row justify-content-center">
                            <LocalReport ReportPath="admin\RoomType.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="DS_All" Name="DataSet1" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000" CssClass="row justify-content-center">
                            <LocalReport ReportPath="admin\RoomType.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="DS_RoomTypeName" Name="DataSet1" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>
                </asp:MultiView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
