<%@ Page Title="Job Vacancy Details" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="VivLimited2._0.JobDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1">
                <ItemTemplate>
                    <b>Job Title:</b>
                    <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' />
                    <br /><hr />
                    <b>Job Description:</b>
                    <asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Eval("JobDescription").ToString().Replace(Environment.NewLine, "<br/>") %>' />
                    <br /><hr />
                    <b>How To Apply:</b>
                    <asp:Label ID="HowToApplyLabel" runat="server" Text='<%# Eval("HowToApply").ToString().Replace(Environment.NewLine, "<br/>") %>' />
                    <br /><hr />
                    <b>Expiry Date:</b>
                    <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Bind("ExpiryDate", "{0:dd/M/yyyy}") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="careers" Where="">
                <WhereParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="JobId" Type="Int16" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>

    </div>
</asp:Content>
