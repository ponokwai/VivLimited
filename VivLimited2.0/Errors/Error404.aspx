<%@ Page Title="File Not Found" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="VivLimited2._0.Errors.Error404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h1><%: Title %></h1>
        <p>The page you requested cannot be found. Please check <a runat="server" href="~/">Homepage</a> or choose a different page from the Menu.</p>
        <p>&nbsp;</p>
        <p>Viv Limited Team</p>
    </div>
</asp:Content>
