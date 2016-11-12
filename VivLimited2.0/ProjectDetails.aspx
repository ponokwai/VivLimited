<%@ Page Title="Project Details" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="VivLimited2._0.ProjectDetails" %>
<%@ OutputCache Duration="2592000" VaryByParam="*" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <%--<h2>
            <asp:Literal ID="ltlTitle" runat="server"></asp:Literal></h2>--%>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.project">
            
            
            <ItemTemplate>
                <h2><asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' /></h2>               
                <br /><hr />
                <b>Client:</b>
                <asp:Label ID="ClientLabel" runat="server" Text='<%# Bind("Client") %>' />
                <br /><hr />
                <b>Consultant:</b>
                <asp:Label ID="ConsultantLabel" runat="server" Text='<%# Bind("Consultant") %>' />
                <br /><hr />
                <b>Year Awarded:</b>
                <asp:Label ID="DateAwardedLabel" runat="server" Text='<%# Bind("DateAwarded","{0:yyyy}") %>' />
                <br /><hr />
                <b>Year Completed:</b>
                <asp:Label ID="DateCompletedLabel" runat="server" Text='<%# Bind("DateCompleted","{0:yyyy}") %>' />
                <br /><hr />
                <b>Status:</b>
                <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                <br /><hr />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ProjectPictures.aspx?ProjId=" + Item.Id %>'>View Project Pictures</asp:HyperLink>

            </ItemTemplate>
        </asp:FormView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="projects" Where="">
            <WhereParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="ProjId" Type="Int16" />
            </WhereParameters>
        </asp:EntityDataSource>
    </div>
</asp:Content>
