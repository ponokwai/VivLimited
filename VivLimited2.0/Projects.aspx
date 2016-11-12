<%@ Page Title="Projects" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="VivLimited2._0.Projects" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container-fluid carousel-inner">
        <asp:Image ID="Image1" Width="100%" CssClass="img-responsive page-banner" runat="server" />
        <div class="carousel-caption glideLeft">
            <h4><%: Title %></h4>            
        </div>
    </div>
    <br />
    <div class="container page-text-container">
        <div class="row"><br />
            <asp:Label ID="Label1" CssClass="page-text" runat="server"></asp:Label>
        </div>
        <div class="row">
            <h3 class="text-center">Ongoing and Completed Projects</h3>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.project">


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
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ProjectDetails.aspx?ProjId=" + Item.Id %>'>
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                            </asp:HyperLink>

                        </td>
                        <td>
                            <asp:Label ID="DateAwardedLabel" runat="server" Text='<%# Eval("DateAwarded", "{0:yyyy}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                        </td>

                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-responsive">
                                    <tr runat="server" style="">
                                        <th runat="server">Project Name</th>
                                        <th runat="server">Year Awarded</th>
                                        <th runat="server">Status</th>
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

            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="projects" EntityTypeFilter="" OrderBy="it.[DateAwarded] DESC" Select=""></asp:EntityDataSource>

        </div>
    </div>
</asp:Content>
