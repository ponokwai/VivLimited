<%@ Page Title="Manage Equipment Reservation" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="EquipmentReservation.aspx.cs" Inherits="VivLimited2._0.Frontdesk.EquipmentReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.equipmentreservation">
                
                
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Frontdesk/EquipmentReservationDetails.aspx?ResId=" + Item.Id %>' ><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></asp:HyperLink></td><td>
                            <asp:Label ID="CompanyLabel" runat="server" Text='<%# Eval("Company") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneNumbLabel" runat="server" Text='<%# Eval("PhoneNumb") %>' />
                        </td>
                        
                        <td>
                            <asp:Label ID="EquipmentTypeIdLabel" runat="server" Text='<%# Item.equiprentalsubclass.EquipName %>' />
                        </td>
                        
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-responsive">
                                    <tr runat="server" style="">
                                        
                                        <th runat="server">Name</th><th runat="server">Company</th><th runat="server">Phone</th><th runat="server">Equipment</th></tr><tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="equipmentreservations" Include="equiprentalsubclass" EntityTypeFilter="" OrderBy="it.[Id] DESC" Select=""></asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
