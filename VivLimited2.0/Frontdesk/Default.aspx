<%@ Page Title="Manage Website" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VivLimited2._0.Frontdesk.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <p>Welcome to the administration page of <a href="http://www.vivlimited.com">http://www.vivlimited.com</a>. If you are here in error or have an incorrect priviledge please log out and report to the website administrator or <a href="mailto:info@rickwaisolutions.com">info@rickwaisolutions.com</a>. </p>
        <h4>User Priviledges</h4>
        <table class="table table-bordered">
            <tr>
                <td>
                    <h4>Role</h4>
                </td>
                <td>
                    <h4>Access</h4>
                </td>
            </tr>
            <tr>
                <td>Frontdesk</td>
                <td>This role can only use the FrontDesk menu to manage equipment rental request.</td>
            </tr>
            <tr>
                <td>Manager</td>
                <td>This role has full access to the FrontDesk and Manager menus. The Manager menu is used to manage website content.</td>
            </tr>
            <tr>
                <td>Administrator</td>
                <td>This is the super user role. An administrator can access all menus and is responsible for managing all roles and access to the website.</td>
            </tr>
        </table>
        <p>
            If you have a challenge using this website or encounter bugs, meet your supervisor or email <a href="mailto:info@rickwaisolutions.com">info@rickwaisolutions.com</a>.</p>
        <p>
            Warm regards</p>
        <p>
            &nbsp;</p>
        <p>
            Rickwai Solutions Team</p>
        <p class="auto-style1">
            <em>Developers</em></p>
    </div>
</asp:Content>
