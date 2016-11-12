<%@ Page Title="Recover your Password" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="VivLimited2._0.Account.PasswordRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>

        <div class="row">
            <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6 col-xs-12">
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
                    <SubmitButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <SuccessTextStyle Font-Bold="True" ForeColor="#990000" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:PasswordRecovery>
            </div>
        </div>


    </div>
</asp:Content>
