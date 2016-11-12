<%@ Page Title="Equipment Type" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="EquipmentType.aspx.cs" Inherits="VivLimited2._0.EquipmentType" %>
<%@ OutputCache Duration="2592000" VaryByParam="*" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2>
            <asp:Literal ID="ltlTitle" runat="server"></asp:Literal></h2>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.equiprentalsubclass">
                <ItemTemplate>
                    <div class="col-sm-6 wow animated fadeInUp">
                        <asp:HyperLink ID="HyperLinkMainEquip" CssClass="col-img-text" runat="server" NavigateUrl='<%# "~/EquipmentDetails.aspx?TypeId=" + Item.Id %>'>
                            <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-centralise" ImageUrl='<%# Item.ImageUrl %>' AlternateText="Viv Equipment" />
                            <h6 class="sub-equip-format">
                                <asp:Literal ID="Literal" runat="server" Text='<%# Item.EquipName %>'></asp:Literal></h6>
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="equiprentalsubclasses" AutoGenerateWhereClause="True" Where="" OrderBy="it.[EquipName]">
                <WhereParameters>
                    <asp:QueryStringParameter Name="EquipRentalMainClassId" QueryStringField="CatId" Type="Int16" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
