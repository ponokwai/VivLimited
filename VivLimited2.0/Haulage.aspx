<%@ Page Title="Haulage" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Haulage.aspx.cs" Inherits="VivLimited2._0.Haulage" MetaDescription="You can count on us whenever you consider moving goods and services around Nigeria. We have a business model that is built on trust, service and timely delivery." 
    MetaKeywords="Transport goods, transport  cement, transport petroleum, transport fertiliser, transport equipment, warri, port-harcourt, lagos, Nigeria, delta state, rivers state, edo state" %>
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
            <asp:Label ID="Label1" CssClass="page-text" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
</asp:Content>
