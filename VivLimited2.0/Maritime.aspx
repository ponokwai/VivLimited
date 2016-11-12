<%@ Page Title="Maritime" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Maritime.aspx.cs" Inherits="VivLimited2._0.Maritime" MetaDescription="Our maritime service division offers transportation of petroleum products, provision of maritime personnel, provision of maritime vessels for hire, such as, tug boats, barges, passport 19 boats and other maritime vessels. We also offer steel fabrication and assembly, vessel building, vessel optimisation and related services.
" MetaKeywords="Maritime services, transportation of crude oil, transportation of petroleum products, barges for hire, tug boats for hire, passport 9 boats for hire, warri, port-harcourt, lagos, Nigeria, "%>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>

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
    </div>
</asp:Content>
