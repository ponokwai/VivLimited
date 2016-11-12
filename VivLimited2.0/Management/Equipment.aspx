<%@ Page Title="Update Equipment List" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="VivLimited2._0.Management.Equipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <h4 class="text-center">Add/Remove Equipment Category</h4>
            <h3 class="text-success"><asp:Literal ID="ltlFeedback" runat="server"></asp:Literal></h3>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id, ImgIconUrl" DataSourceID="EntityDataSource1" GroupItemCount="3" InsertItemPosition="LastItem" ItemType="VivLimited2._0.equiprentalmainclass" OnItemInserting="ListView1_ItemInserting" OnItemDeleting="ListView1_ItemDeleting">

                        <EditItemTemplate>
                            <td runat="server" style="">
                                <asp:Image ID="ImgEditTemp" runat="server" ImageUrl='<%# BindItem.ImgIconUrl %>' CssClass="img-responsive img-thumbnail" />
                                <br />
                                <b>Upload New File: </b>
                                <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="300px * 210px"><span class="glyphicon glyphicon-question-sign"></span></a>
                                <asp:FileUpload ID="FileUploadEditTemp" CssClass="form-control" runat="server" />
                                <br />
                                <%--<asp:TextBox ID="ImgIconUrlTextBox" runat="server" Text='<%# Bind("ImgIconUrl") %>' />--%>
                                <br />
                                <b>Category Name:</b>
                                <asp:TextBox ID="EquipCategoryTextBox" CssClass="form-control" runat="server" Text='<%# Bind("EquipCategory") %>' />
                                <br />
                                <div class="btn btn-group">
                                    <asp:Button ID="UpdateButton" CssClass="btn btn-success" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" CssClass="btn btn-default" runat="server" CommandName="Cancel" Text="Cancel" />
                                </div>
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
                                <b>Upload Image Icon:</b>
                                <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="300px * 210px"><span class="glyphicon glyphicon-question-sign"></span></a>
                                <asp:CustomValidator ID="CustValInsertItm" runat="server" ErrorMessage="Upload image" CssClass="FormError" ControlToValidate="FileUploadInsertTemp" SetFocusOnError="true"></asp:CustomValidator>
                                <asp:FileUpload ID="FileUploadInsertTemp" CssClass="form-control" runat="server" />

                                <%--<asp:TextBox ID="ImgIconUrlTextBox" runat="server" Text='<%# Bind("ImgIconUrl") %>' />--%>
                                <br />
                                <b>Name Category:</b>
                                <asp:TextBox ID="EquipCategoryTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EquipCategory") %>' />
                                <br />
                                <div class="btn btn-group">
                                    <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-success" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-default" CommandName="Cancel" Text="Clear" />
                                </div>
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="">
                                <asp:Image ID="ImgItemTemp" CssClass="img-responsive img-thumbnail" ImageUrl='<%# Item.ImgIconUrl %>' runat="server" />
                                <%--<asp:Label ID="ImgIconUrlLabel" runat="server" Text='<%# Eval("ImgIconUrl") %>' />--%>
                                <br />
                                <b>Category Name:</b>
                                <asp:Label ID="EquipCategoryLabel" runat="server" Text='<%# Eval("EquipCategory") %>' />
                                <br />
                                <b>Edited By:</b>
                                <asp:Label ID="EditedByLabel" runat="server" Text='<%# Eval("EditedBy") %>' />
                                <br />
                                <b>Date-Time Edited:</b>
                                <asp:Label ID="DateTimeEditedLabel" runat="server" Text='<%# Eval("DateTimeEdited") %>' />
                                <br />
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Management/EquipmentSubClass.aspx?ClassId=" + Item.Id %>'>Update Sub-class</asp:HyperLink><br />
                                <div class="btn btn-group">
                                    <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CssClass="btn btn-success" CommandName="Edit" Text="Edit" />
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
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="equiprentalmainclasses" OnDeleted="EntityDataSource1_Deleted" OnInserting="EntityDataSource1_Inserting" OnUpdating="EntityDataSource1_Updating" OnDeleting="EntityDataSource1_Deleting" EntityTypeFilter="" OrderBy="it.[EquipCategory] " Select="">
                    </asp:EntityDataSource>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="ListView1" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div class="PleaseWait">
                        Please Wait...
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <%--<h3 class="text-success"><asp:Literal ID="ltlFeedback" runat="server"></asp:Literal></h3>--%>
        </div>
    </div>
</asp:Content>
