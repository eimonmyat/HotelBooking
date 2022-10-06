<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RoomReport.aspx.cs" Inherits="HotelBooking.admin.RoomReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center" style="height: 14.08in">
        <div class="col-auto">
            <div style="height:95%">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <br />
                <asp:ObjectDataSource ID="DS_All" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="HotelBooking.MainDatasetTableAdapters.RoomTableAdapter"></asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="DS_RoomNumber" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Room_Select_By_SearchRoomNumber" TypeName="HotelBooking.MainDatasetTableAdapters.RoomTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="RoomNumber" SessionField="Data" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DS_RoomTypeName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Room_Select_By_SearchRoomTypeName" TypeName="HotelBooking.MainDatasetTableAdapters.RoomTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="RoomTypeName" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DS_Price" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Room_Select_By_SearchPrice" TypeName="HotelBooking.MainDatasetTableAdapters.RoomTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="Price" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DS_Capacity" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Room_Select_By_SearchCapacity" TypeName="HotelBooking.MainDatasetTableAdapters.RoomTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="Capacity" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="row justify-content-center">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1250px" Height="100%" ExportContentDisposition="AlwaysInline">
                                <LocalReport ReportPath="admin\Room.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="DS_All" Name="DataSet1" />
                                    </DataSources>
                                </LocalReport>
                            </rsweb:ReportViewer>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1250px" Height="100%">
                                <LocalReport ReportPath="admin\Room.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="DS_RoomNumber" Name="DataSet1" />
                                    </DataSources>
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="DS_RoomTypeName" Name="DataSet1" />
                                    </DataSources>
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="DS_Price" Name="DataSet1" />
                                    </DataSources>
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="DS_Capacity" Name="DataSet1" />
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
