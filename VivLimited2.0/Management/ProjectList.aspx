<%@ Page Title="Project List" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="ProjectList.aspx.cs" Inherits="VivLimited2._0.Management.ProjectList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" ItemType="VivLimited2._0.project" GroupItemCount="3">
            <EditItemTemplate>
                <td runat="server" style="">
                    <b>Project Title:</b>
                    <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Title") %>' />
                    <br />
                    <b>Client:</b>
                    <asp:TextBox ID="ClientTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Client") %>' />
                    <br />
                    <b>Consultant:</b>
                    <asp:TextBox ID="ConsultantTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Consultant") %>' />
                    <br />
                    <b>Date Awarded:</b>
                    <asp:TextBox ID="DateAwardedTextBox" runat="server" CssClass="form-control" TextMode="Date" Text='<%# Bind("DateAwarded") %>' />
                    <br />
                    <b>Date Completed:</b>
                    <asp:TextBox ID="DateCompletedTextBox" runat="server" CssClass="form-control" TextMode="Date" Text='<%# Bind("DateCompleted") %>' />
                    <br />
                    <b>Status:</b>
                    <asp:TextBox ID="StatusTextBox" runat="server" CssClass="form-control" Text='<%# BindItem.Status %>' />
                    <br />
                    <div class="btn-group">
                        <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-link" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-link" CommandName="Cancel" Text="Cancel" />
                    </div>
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">
                    <b>Project Title:</b>
                    <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Title") %>' />
                    <br />
                    <b>Client:</b>
                    <asp:TextBox ID="ClientTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Client") %>' />
                    <br />
                    <b>Consultant:</b>
                    <asp:TextBox ID="ConsultantTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Consultant") %>' />
                    <br />
                    <b>Date Awarded:</b>
                    <asp:TextBox ID="DateAwardedTextBox" runat="server" CssClass="form-control" TextMode="Date" Text='<%# Bind("DateAwarded") %>' />
                    <br />
                    <b>Date Completed:</b>
                    <asp:TextBox ID="DateCompletedTextBox" runat="server" CssClass="form-control" TextMode="Date" Text='<%# Bind("DateCompleted") %>' />
                    <br />
                    <b>Status:</b>
                    <asp:TextBox ID="StatusTextBox" runat="server" CssClass="form-control" Text='<%# BindItem.Status %>' />
                    <br />
                    <div class="btn-group">
                        <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-link" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-link" CommandName="Cancel" Text="Clear" />
                    </div>
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="">
                    <b>Project Title:</b>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    <b>Client:</b>
                    <asp:Label ID="ClientLabel" runat="server" Text='<%# Eval("Client") %>' />
                    <br />
                    <b>Consultant:</b>
                    <asp:Label ID="ConsultantLabel" runat="server" Text='<%# Eval("Consultant") %>' />
                    <br />
                    <b>Date Awarded:</b>
                    <asp:Label ID="DateAwardedLabel" runat="server" Text='<%# Eval("DateAwarded") %>' />
                    <br />
                    <b>Date Completed:</b>
                    <asp:Label ID="DateCompletedLabel" runat="server" Text='<%# Eval("DateCompleted") %>' />
                    <br />
                    <b>Status:</b>
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Item.Status %>' />
                    <br />
                    <b>Edited By:</b>
                    <asp:Label ID="EditedByLabel" runat="server" Text='<%# Eval("EditedBy") %>' />
                    <br />
                    <b>Date-Time Edited:</b>
                    <asp:Label ID="DateTimeEditedLabel" runat="server" Text='<%# Eval("DateTimeEdited") %>' />
                    <br />
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/Management/ProjectPictures.aspx?ProjId=" + Item.Id %>' runat="server">Update Project Pictures</asp:HyperLink>
                    <br />
                    <div class="btn-group">
                        <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-link" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CssClass="btn btn-link" CommandName="Edit" Text="Edit" />
                    </div>

                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-link" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-link" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="projects" EntityTypeFilter="" OnInserting="EntityDataSource1_Inserting" OnUpdating="EntityDataSource1_Updating" OrderBy="it.[DateAwarded] DESC" Select="" OnDeleting="EntityDataSource1_Deleting">
        </asp:EntityDataSource>
    </div>
</asp:Content>
