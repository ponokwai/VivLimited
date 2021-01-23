<%@ Page Title="Homepage Slider" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="HomepageSlider.aspx.cs" Inherits="VivLimited2._0.Management.HomepageSlider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="Id, ImageUrl" DataSourceID="EntityDataSource3" GroupItemCount="1" InsertItemPosition="LastItem" ItemType="VivLimited2._0.HomePageSlider">

                        <EditItemTemplate>
                            <td runat="server" style="">
                                <asp:Image ID="EditItemImageUrl" ImageUrl='<%# BindItem.ImageUrl %>' CssClass="img-responsive img-thumbnail" runat="server" />
                                <br />
                                File Upload:                    
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="1200px * 450px"><span class="glyphicon glyphicon-question-sign"></span></a>
                                <br />
                                <asp:FileUpload ID="FileUploadEditItem" CssClass="form-control" runat="server" /><br />

                                Caption Heading:
                    <asp:TextBox ID="CaptionHeadingTextBox" runat="server" Text='<%# Bind("CaptionHeading") %>' />
                                <br />
                                Caption Description:
                    <asp:TextBox ID="CaptionDescTextBox" runat="server" Text='<%# Bind("CaptionDesc") %>' />
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
                            <td runat="server" style="">File Upload:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Upload image file" ControlToValidate="FileUploadInsertItem" SetFocusOnError="True" Display="Dynamic" CssClass="FormError" ValidationGroup="InsertItemVal"></asp:RequiredFieldValidator>
                                <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="1200px * 450px"><span class="glyphicon glyphicon-question-sign"></span></a>
                                <br />
                                <asp:FileUpload ID="FileUploadInsertItem" CssClass="form-control" runat="server" />
                                <br />
                                Caption Heading:
                    <asp:TextBox ID="CaptionHeadingTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CaptionHeading") %>' />
                                <br />
                                Caption Description:
                    <asp:TextBox ID="CaptionDescTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CaptionDesc") %>' />
                                <br />
                                <div class="btn btn-group">
                                    <asp:Button ID="InsertButton" CssClass="btn btn-success" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertItemVal" />
                                    <asp:Button ID="CancelButton" CssClass="btn btn-danger" runat="server" CommandName="Cancel" Text="Clear" />
                                </div>
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="">
                                <asp:Image ID="ImageUrl" ImageUrl='<%# Item.ImageUrl %>' CssClass="img-responsive img-thumbnail" runat="server" />
                                <br />
                                Caption Heading:
                    <asp:Label ID="CaptionHeadingLabel" runat="server" Text='<%# Eval("CaptionHeading") %>' />
                                <br />
                                Caption Description:
                    <asp:Label ID="CaptionDescLabel" runat="server" Text='<%# Eval("CaptionDesc") %>' />
                                <br />
                                Last Updated By:
                    <asp:Label ID="LastUpdatedByLabel" runat="server" Text='<%# Eval("LastUpdatedBy") %>' />
                                <br />
                                Last Update DateTime:
                    <asp:Label ID="LastUpdateDateTimeLabel" runat="server" Text='<%# Eval("LastUpdateDateTime") %>' />
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
                    <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="homepagesliders" OnDeleted="EntityDataSource3_Deleted" OnInserting="EntityDataSource3_Inserting" OnUpdating="EntityDataSource3_Updating">
                    </asp:EntityDataSource>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="ListView2" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div class="PleaseWait">
                    Please Wait...
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
