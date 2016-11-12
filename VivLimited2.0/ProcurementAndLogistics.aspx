<%@ Page Title="Procurement and Logistics" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="ProcurementAndLogistics.aspx.cs" Inherits="VivLimited2._0.ProcurementAndLogistics" MetaDescription="We purchase and supply general and specialised goods, like, machines, machine parts, office equipment, white goods, automobile and stationeries to clients around Nigeria.
" MetaKeywords="supply of machine, supply of machine parts, supply of office equipment, supply of white goods, supply of automobile, supply of stationeries, supply of OEM parts, warri, port-harcourt, lagos, delta, edo, nigeria,
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
