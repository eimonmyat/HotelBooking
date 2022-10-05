<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="BookingListReport.aspx.cs" Inherits="HotelBooking.admin.BookingListReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center " style="height: 14.08in">
        <div class="col-auto">

            <div style="height: 95%">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <br />
                <asp:ObjectDataSource ID="DS_All" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="HotelBooking.MainDatasetTableAdapters.Admin_Booking_ReportTableAdapter"></asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="DS_BookingDate" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Admin_Booking_Report_Select_By_BookingDate" TypeName="HotelBooking.MainDatasetTableAdapters.Admin_Booking_ReportTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="BookingDate" SessionField="Data" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DS_CustomerName" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Admin_Booking_Report_Select_By_CustomerName" TypeName="HotelBooking.MainDatasetTableAdapters.Admin_Booking_ReportTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="CustName" SessionField="Data" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DS_Email" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Admin_Booking_Report_Select_By_Email" TypeName="HotelBooking.MainDatasetTableAdapters.Admin_Booking_ReportTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="Email" SessionField="Data" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DS_Total" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Admin_Booking_Report_Select_By_Total" TypeName="HotelBooking.MainDatasetTableAdapters.Admin_Booking_ReportTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="TotalAmount" SessionField="Data" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        aa
                        <%--<div style="height:100vh;">--%>
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1250px" ExportContentDisposition="AlwaysInline" Height="100%" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
                            <LocalReport ReportPath="admin\BookingList.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="DS_All" Name="DataSet1" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                        <%--</div>--%>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        bb<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <%--<div style="height:100vh;">--%>
                        <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1250px" ExportContentDisposition="AlwaysInline" Height="100%" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
                            <LocalReport ReportPath="admin\BookingList.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="DS_BookingDate" Name="DataSet1" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1250px" ExportContentDisposition="AlwaysInline" Height="100%" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
                            <LocalReport ReportPath="admin\BookingList.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="DS_CustomerName" Name="DataSet1" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <rsweb:ReportViewer ID="ReportViewer4" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1250px" ExportContentDisposition="AlwaysInline" Height="100%" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
                            <LocalReport ReportPath="admin\BookingList.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="DS_Email" Name="DataSet1" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <rsweb:ReportViewer ID="ReportViewer5" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1250px" ExportContentDisposition="AlwaysInline" Height="100%" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
                            <LocalReport ReportPath="admin\BookingList.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="DS_Total" Name="DataSet1" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                        </asp:View>
                        
                   
                </asp:MultiView>


            </div>


        </div>
    </div>
</asp:Content>
