<%@ Page Title="Log In to Website" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VivLimited2._0.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row"><br />
            <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6 col-xs-12">
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/Frontdesk/Default.aspx" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" PasswordRecoveryText="Recover Password" PasswordRecoveryUrl="~/Account/PasswordRecovery.aspx" TextLayout="TextOnTop">
                            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                            <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                            <TextBoxStyle Font-Size="0.8em" />
                            <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                        </asp:Login>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <p>
                            Hello
                            <asp:LoginName ID="LoginName1" runat="server" />
                            you are already logged in.
                        </p>
                        <p>
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Frontdesk/Default.aspx" runat="server">Go To Management</asp:HyperLink>
                            |
                            <asp:LoginStatus ID="LoginStatus1" runat="server" />
                        </p>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
        </div>

    </div>
</asp:Content>
