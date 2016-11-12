<%@ Page Title="Project Pictures" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="ProjectPictures.aspx.cs" Inherits="VivLimited2._0.ProjectPictures" %>
<%@ OutputCache Duration="2592000" VaryByParam="*" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2>
            <asp:Literal ID="ltlTitle" runat="server"></asp:Literal></h2>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" ItemType="VivLimited2._0.projectpic">
                <ItemTemplate>
                    <div class="col-sm-6 img-col-proj">
                        <asp:Image ID="imgPic" runat="server" ImageUrl='<%# Item.ImageUrl %>' CssClass="img-project img-responsive" />
                        <b><asp:Literal ID="ltlDesc" runat="server" Text='<%# Item.Description %>' ></asp:Literal></b>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
