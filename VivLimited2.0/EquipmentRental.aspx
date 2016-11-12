<%@ Page Title="Equipment Rental" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="EquipmentRental.aspx.cs" Inherits="VivLimited2._0.EquipmentRental" MetaDescription="We rent construction, haulage, and maritime equipment, such as, cranes, graders, trucks, lowbeds, marsh excavators, bulldozers, barges, tug boats, passport 19 boat, and offshore vessels from our base in Warri, Delta State, Nigeria." MetaKeywords="Crane hire, marsh, excavators, rent, hire, grader hire, truck hire, lowbed hire, bulldozer hire, barge hire, passport 19 boat hire, warri, port-harcourt, lagos, delta, edo, Nigeria,
" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container-fluid carousel-inner <%--page-banner--%>">
        <asp:Image ID="Image1" Width="100%" CssClass="img-responsive page-banner" runat="server" />
        <div class="carousel-caption glideLeft">
            <h4><%: Title %></h4>            
        </div>
    </div><br />
    <div class="container page-text-container">
        <div class="row"><br />
            <asp:Label ID="Label1" runat="server" CssClass="page-text"></asp:Label>
        </div>
        <div class="row">
            <h3 class="text-center">Rental Equipment Category</h3>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.equiprentalmainclass">
                <ItemTemplate>
                    <div class="col-md-4 col-xs-6 wow animated glideLeft">
                        <asp:HyperLink ID="HyperLinkMainEquip" CssClass="col-img-text" runat="server" NavigateUrl='<%# "~/EquipmentType.aspx?CatId=" + Item.Id %>'>
                            <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-centralise" ImageUrl='<%# Item.ImgIconUrl %>' AlternateText="Viv Equipment" />
                            <h6 class="main-equip-format">
                                <asp:Literal ID="Literal" runat="server" Text='<%# Item.EquipCategory %>'></asp:Literal></h6>
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="equiprentalmainclasses" EntityTypeFilter="" OrderBy="it.[EquipCategory]" Select="">
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
