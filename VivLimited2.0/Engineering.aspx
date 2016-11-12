<%@ Page Title="Engineering" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Engineering.aspx.cs" Inherits="VivLimited2._0.Engineering"
    MetaDescription="We major in civil engineering, mechanical engineering, pipeline construction and maintenance, and consultancy. We serve both upstream and downstream
     clients in the oil and gas industry, government ministries, NGOs and more." MetaKeywords="Construction, company, civil, engineering, company, mechanical, pipeline, maintenance, company, engineering, consultancy, company, warri, port-harcourt, lagos, Nigeria, delta, state, rivers, state, edo, state" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container-fluid carousel-inner <%--page-banner--%>">
        <asp:Image ID="Image1" Width="100%" CssClass="img-responsive page-banner" runat="server" />
        <div class="carousel-caption glideLeft">
            <h4><%: Title %></h4>            
        </div>
    </div><br />
    <div class="container page-text-container">
        <div class="row"><br />
            <asp:Label ID="Label1" CssClass="page-text" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
