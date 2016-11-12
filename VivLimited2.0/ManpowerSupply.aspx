<%@ Page Title="Manpower Supply" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="ManpowerSupply.aspx.cs" Inherits="VivLimited2._0.ManpowerSupply" MetaDescription="We supply skilled and unskilled personnel to fill client technical and administrative positions. Our client base includes sectors, such as, oil and gas, construction, banking, power and energy.
" MetaKeywords="supply of manpower, supply of technical personnel, supply of expatiates, supply of administrative staff, supply of engineers, supply of labour,  warri, port-harcourt, lagos, delta, edo, Nigeria,
" %>
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
    <div class="container page-text-container">
        <div class="row"><br />
            <asp:Label ID="Label1" CssClass="page-text" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
