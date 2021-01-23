<%@ Page Title="Equipment Sub Class" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="EquipmentSubClass.aspx.cs" Inherits="VivLimited2._0.Management.EquipmentSubClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2>
            <asp:Literal ID="ltlTitle" runat="server"></asp:Literal></h2>
        <div class="row">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id, ImageUrl" DataSourceID="EntityDataSource1" GroupItemCount="2" InsertItemPosition="LastItem" ItemType="VivLimited2._0.EquipRentalSubclass" OnItemInserting="ListView1_ItemInserting">

                <EditItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="Image1" ImageUrl='<%# BindItem.ImageUrl %>' CssClass="img-thumbnail img-responsive" runat="server" /><br />
                        <b>Upload Image:</b>
                        <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="460px * 300px"><span class="glyphicon glyphicon-question-sign"></span></a>
                        <br />
                        <asp:FileUpload ID="FileUploadEditItem" runat="server" CssClass="form-control" /><br />
                        <%--<asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />--%>
                        <br />
                        <b>Equipment Name:</b>
                        <asp:TextBox ID="EquipNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("EquipName") %>' />
                        <br />
                        <b>Specification:</b>
                        <asp:TextBox ID="SpecificationTextBox" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Specification") %>' />
                        <br />
                        <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' Text="Available" />
                        <br />
                        <b>Cost per Day:</b>
                        <asp:TextBox ID="CostTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Cost") %>' />
                        <br />
                        <%--EquipRentalMainClassId:
                        <asp:TextBox ID="EquipRentalMainClassIdTextBox" runat="server" Text='<%# Bind("EquipRentalMainClassId") %>' />
                        <br />--%>
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-success" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
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
                    <td runat="server" style=""><b>Upload Image:</b>
                        <asp:CustomValidator ID="CustValInsertItm" Display="Dynamic" runat="server" ErrorMessage="Upload image" CssClass="FormError" ControlToValidate="FileUploadInsertItem" SetFocusOnError="true"></asp:CustomValidator>
                        <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="460px * 300px"><span class="glyphicon glyphicon-question-sign"></span></a>
                        <br />
                        <asp:FileUpload ID="FileUploadInsertItem" runat="server" CssClass="form-control" /><br />
                        <b>Equipment Name:</b>
                        <asp:TextBox ID="EquipNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EquipName") %>' />
                        <br />
                        <b>Specification:</b>
                        <asp:CustomValidator Display="Dynamic" ID="CustValInsertItm2" runat="server" ErrorMessage="Enter equipment specification details" ControlToValidate="SpecificationTextBox" SetFocusOnError="true" CssClass="FormError"></asp:CustomValidator>
                        <asp:TextBox ID="SpecificationTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Text='<%# Bind("Specification") %>' />
                        <br />
                        <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' Text="Available" />
                        <br />
                        <b>Cost Per Day:</b>
                        <asp:TextBox ID="CostTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Cost") %>' />
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" CssClass="btn btn-success" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-default" Text="Clear" />
                        </div>
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Item.ImageUrl %>' CssClass="img-responsive img-thumbnail" /><br />
                        <b>Equipment Name:</b>
                        <asp:Label ID="EquipNameLabel" runat="server" Text='<%# Eval("EquipName") %>' />
                        <br />
                        <b>Specification:</b>
                        <asp:Label ID="SpecificationLabel" runat="server" Text='<%# Item.Specification.ToString().Replace(Environment.NewLine, "<br />") %>' />
                        <br />
                        <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Eval("Available") %>' Enabled="false" Text="Available" />
                        <br />
                        <b>Cost Per Day:</b>
                        <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>' />
                        <br />
                        <b>Edited By:</b>
                        <asp:Label ID="EditedByLabel" runat="server" Text='<%# Eval("EditedBy") %>' />
                        <br />
                        <b>Date-Time Edited:</b>
                        <asp:Label ID="DateTimeEditedLabel" runat="server" Text='<%# Eval("DateTimeEdited") %>' />
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Management/EquipmentImageSliders.aspx?SubClassId=" + Item.Id %>'>Update Slider Images</asp:HyperLink>
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default" />
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
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>

            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="equiprentalsubclasses" Where="" Include="equiprentalmainclass" OnDeleted="EntityDataSource1_Deleted" OnInserting="EntityDataSource1_Inserting" OnUpdating="EntityDataSource1_Updating" OnDeleting="EntityDataSource1_Deleting" OrderBy="it.[EquipName]">
                <WhereParameters>
                    <asp:QueryStringParameter Name="EquipRentalMainClassId" QueryStringField="ClassId" Type="Int16" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
