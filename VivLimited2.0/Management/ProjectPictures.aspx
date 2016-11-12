<%@ Page Title="Project Pictures" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="ProjectPictures.aspx.cs" Inherits="VivLimited2._0.Management.ProjectPictures" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <div class="row">
            <h2>
                <asp:Literal ID="ltlTitle" runat="server"></asp:Literal></h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id, ImageUrl" DataSourceID="EntityDataSource1" GroupItemCount="3" InsertItemPosition="LastItem" ItemType="VivLimited2._0.projectpic" OnItemInserting="ListView1_ItemInserting">

                <EditItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="Image2" ImageUrl='<%# BindItem.ImageUrl %>' CssClass="img-responsive img-thumbnail" runat="server" />
                        <b>Upload Image:</b>
                        <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="522px * 295px"><span class="glyphicon glyphicon-question-sign"></span></a>
                        <br />
                        <asp:FileUpload ID="FileUploadEditItem" CssClass="form-control" runat="server" />
                        <br />
                        <b>Description:</b>
                        <asp:TextBox ID="DescriptionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Description") %>' />
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-success" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-default" CommandName="Cancel" Text="Cancel" />
                        </div>
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No project photo is available</td>
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
                        <b>Upload Image:</b>
                        <asp:CustomValidator ID="CustValInsertItm" Display="Dynamic" runat="server" ErrorMessage="Upload image" CssClass="FormError" ControlToValidate="FileUploadInsertItem" SetFocusOnError="true"></asp:CustomValidator>
                        <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="522px * 295px"><span class="glyphicon glyphicon-question-sign"></span></a>
                        <br />
                        <asp:FileUpload ID="FileUploadInsertItem" CssClass="form-control" runat="server" />
                        <br />
                        <b>Description:</b>
                        <asp:TextBox ID="DescriptionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Description") %>' />
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-success" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-default" CommandName="Cancel" Text="Clear" />
                        </div>
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-thumbnail" ImageUrl='<%# Eval("ImageUrl") %>' />
                        <br />
                        <b>Description:</b>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        <br />
                        <b>Edited By:</b>
                        <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Eval("CreatedBy") %>' />
                        <br />
                        <b>Date-Time Edited:</b>
                        <asp:Label ID="DateTimeCreatedLabel" runat="server" Text='<%# Eval("DateTimeCreated") %>' />
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CssClass="btn btn-default" CommandName="Edit" Text="Edit" />
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
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ButtonCssClass="btn btn-default" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ButtonCssClass="btn btn-default" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>



            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="projectpics" AutoGenerateWhereClause="True" EntityTypeFilter="" OnDeleted="EntityDataSource1_Deleted" OnInserting="EntityDataSource1_Inserting" OnUpdating="EntityDataSource1_Updating" Select="" Where="">
                <WhereParameters>
                    <asp:QueryStringParameter Name="ProjectId" QueryStringField="ProjId" Type="Int16" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
