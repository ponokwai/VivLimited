<%@ Page Title="Equipment Reservation Details" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="EquipmentReservationDetails.aspx.cs" Inherits="VivLimited2._0.Frontdesk.EquipmentReservationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.equipmentreservation">
                <EditItemTemplate>

                    <b>Name:</b>
                    <asp:TextBox ID="NameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <hr />
                    <b>Company:</b>
                    <asp:TextBox ID="CompanyTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Company") %>' />
                    <br />
                    <hr />
                    <b>Phone Number:</b>
                    <asp:TextBox ID="PhoneNumbTextBox" CssClass="form-control" runat="server" Text='<%# Bind("PhoneNumb") %>' />
                    <br />
                    <hr />
                    <b>Email:</b>
                    <asp:TextBox ID="EmailTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    <hr />
                    <b>Start Date:</b>
                    <asp:TextBox ID="StartDateTextBox" CssClass="form-control" ReadOnly="true" runat="server" Text='<%# Bind("StartDate", "{0: dd/M/yyy}") %>' />
                    <br />
                    <hr />
                    <b>End Date:</b>
                    <asp:TextBox ID="EndDateTextBox" CssClass="form-control" ReadOnly="true" runat="server" Text='<%# Bind("EndDate", "{0: dd/M/yyy}") %>' />
                    <br />
                    <hr />
                    <b>Equipment Category:</b>
                    <asp:Label ID="Label1" runat="server" Text='<%# Item.equiprentalmainclass.EquipCategory %>'></asp:Label>
                    <%--<asp:TextBox ID="EquipmentCategoryIdTextBox" runat="server" Text='<%# BindItem.equiprentalmainclass.EquipCategory %>' />--%>
                    <br />
                    <hr />
                    <b>Equipment Type:</b>
                    <asp:Label ID="Label2" runat="server" Text='<%# Item.equiprentalsubclass.EquipName %>'></asp:Label>
                    <%--<asp:TextBox ID="EquipmentTypeIdTextBox" runat="server" Text='<%# BindItem.equiprentalsubclass.EquipName %>' />--%>
                    <br />
                    <hr />
                    <b>Comments:</b>
                    <asp:TextBox ID="CommentsTextBox" TextMode="MultiLine" CssClass="form-control" runat="server" Text='<%# Bind("Comments") %>' />
                    <br />

                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>

                <ItemTemplate>

                    <b>Name:</b>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <hr />
                    <b>Company:</b>
                    <asp:Label ID="CompanyLabel" runat="server" Text='<%# Bind("Company") %>' />
                    <br />
                    <hr />
                    <b>Phone Number:</b>
                    <asp:Label ID="PhoneNumbLabel" runat="server" Text='<%# Bind("PhoneNumb") %>' />
                    <br />
                    <hr />
                    <b>Email:</b>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    <hr />
                    <b>Start Date:</b>
                    <asp:Label ID="StartDateLabel" runat="server" Text='<%# Bind("StartDate") %>' />
                    <br />
                    <hr />
                    <b>End Date:</b>
                    <asp:Label ID="EndDateLabel" runat="server" Text='<%# Bind("EndDate") %>' />
                    <br />
                    <hr />
                    <b>Equipment Category:</b>
                    <asp:Label ID="EquipmentCategoryIdLabel" runat="server" Text='<%# Item.equiprentalmainclass.EquipCategory %>' />
                    <br />
                    <hr />
                    <b>Equipment Type:</b>
                    <asp:Label ID="EquipmentTypeIdLabel" runat="server" Text='<%# Item.equiprentalsubclass.EquipName %>' />
                    <br />
                    <hr />
                    <b>Comments:</b>
                    <asp:Label ID="CommentsLabel" runat="server" Text='<%# Bind("Comments") %>' />
                    <br />

                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:FormView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="equipmentreservations" Where="" Include="equiprentalmainclass, equiprentalsubclass" OnDeleted="EntityDataSource1_Deleted">
                <WhereParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="ResId" Type="Int16" />
                </WhereParameters>
            </asp:EntityDataSource>
            <br />
        </div>
    </div>
</asp:Content>
