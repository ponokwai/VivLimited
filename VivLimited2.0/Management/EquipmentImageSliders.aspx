<%@ Page Title="Equipment Sub-Class Sliders" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="EquipmentImageSliders.aspx.cs" Inherits="VivLimited2._0.Management.EquipmentImageSliders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <h2><asp:Literal ID="ltlTitle" runat="server"></asp:Literal></h2>
    <div class="container body-content">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id, ImageUrl" DataSourceID="EntityDataSource1" GroupItemCount="2" InsertItemPosition="LastItem" ItemType="VivLimited2._0.equiprentalimageslider" OnItemInserting="ListView1_ItemInserting">

            <EditItemTemplate>
                <td runat="server" style="">
                    <asp:Image ID="Image1" ImageUrl='<%# BindItem.ImageUrl %>' CssClass="img-thumbnail img-responsive" runat="server" />
                    <br />
                    <b>Upload Image:</b>
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="460px * 300px"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <br />
                    <asp:FileUpload ID="FileUploadEditItem" runat="server" CssClass="form-control" /><br />
                    <br />
                    <b>Image Description:</b>
                    <asp:TextBox ID="ImageDescriptionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ImageDescription") %>' />
                    <br />
                    <div class="btn-group">
                        <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-success" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-danger" CommandName="Cancel" Text="Cancel" />
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
                    <b>Upload Image:</b>
                    <asp:CustomValidator ID="CustValInsertItm" Display="Dynamic" runat="server" ErrorMessage="Upload image" CssClass="FormError" ControlToValidate="FileUploadInsertItem" SetFocusOnError="true"></asp:CustomValidator>
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="460px * 300px"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <br />
                    <asp:FileUpload ID="FileUploadInsertItem" runat="server" CssClass="form-control" /><br />
                    <%--<asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />--%>
                    <br />
                    <b>Image Description:</b>
                    <asp:TextBox ID="ImageDescriptionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ImageDescription") %>' />
                    <br />
                    <div class="btn-group">
                        <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-success" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-danger" CommandName="Cancel" Text="Clear" />
                    </div>
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="">
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Item.ImageUrl %>' CssClass="img-responsive img-thumbnail" />
                    <br />
                    <b>Image Description:</b>
                    <asp:Label ID="ImageDescriptionLabel" runat="server" Text='<%# Eval("ImageDescription") %>' />
                    <br />
                    <b>Date-Time Edited:</b>
                    <asp:Label ID="DateTimeCreatedLabel" runat="server" Text='<%# Item.DateTimeEdited %>' />
                    <br />
                    <b>Edited By:</b>
                    <asp:Label ID="EditedByLabel" runat="server" Text='<%# Eval("EditedBy") %>' />
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
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>

        </asp:ListView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="equiprentalimagesliders" AutoGenerateWhereClause="True" EntityTypeFilter="" OnDeleted="EntityDataSource1_Deleted" OnInserting="EntityDataSource1_Inserting" OnUpdating="EntityDataSource1_Updating" Select="" Where="">
            <WhereParameters>
                <asp:QueryStringParameter Name="EquipmentSubClassId" QueryStringField="SubClassId" Type="Int16" />
            </WhereParameters>
        </asp:EntityDataSource>
    </div>
</asp:Content>
