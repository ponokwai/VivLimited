<%@ Page Title="Careers" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Careers.aspx.cs" Inherits="VivLimited2._0.Careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container-fluid carousel-inner <%--page-banner--%>">
        <asp:Image ID="Image1" Width="100%" CssClass="img-responsive page-banner" runat="server" />
        <div class="carousel-caption glideLeft">
            <h4><%: Title %></h4>            
        </div>
    </div>
    <div class="container page-text-container">
        <div class="row"><br />
            <asp:Label ID="Label1" CssClass="page-text" runat="server"></asp:Label>
        </div>
        <div class="row">
            <h3 class="text-center">Current Vacancies</h3>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.career">
                
                
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>We currently have no vacancy</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/JobDetails.aspx?JobId=" + Item.Id %>'><asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' /></asp:HyperLink>
                        </td>
                        
                        <td>
                            <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Eval("ExpiryDate", "{0:dd/M/yyyy}") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-responsive">
                                    <tr runat="server" style="">
                                        <th runat="server">Job Title</th>
                                        <th runat="server">Expiry Date</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="careers" EntityTypeFilter="" Select="" Where="it.[Publish] == true">
            </asp:EntityDataSource>
        </div>
    </div>    
</asp:Content>
