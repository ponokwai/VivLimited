<%@ Page Title="Equipment Details" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="EquipmentDetails.aspx.cs" Inherits="VivLimited2._0.EquipmentDetails" %>
<%@ OutputCache Duration="2592000" VaryByParam="*" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2><%:Title %></h2>
        <div class="row">
            <div class="col-md-6">
                <%-- Image Slider (repeater) --%>

                <div id="owl-demo" class="owl-carousel owl-theme">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.equiprentalimageslider">
                        <ItemTemplate>
                            <div class="item owl-carousel-col">
                                <asp:Image ID="imgowl" CssClass="img-responsive owl-carousel-image" ImageUrl='<%# Item.ImageUrl %>' runat="server" />
                                <b class="text-center"><asp:Literal ID="Literal1" runat="server" Text='<%# Item.ImageDescription %>'></asp:Literal></b>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="equiprentalimagesliders">
                        <WhereParameters>
                            <asp:QueryStringParameter Name="EquipmentSubClassId" QueryStringField="TypeId" Type="Int16" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                </div>
            </div>
            <div class="col-md-6 wow glideRight">
                <%-- Formview info --%>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource2" ItemType="VivLimited2._0.equiprentalsubclass" OnDataBinding="FormView1_DataBinding">
                    <ItemTemplate>
                        <b>Name:</b>
                        <asp:Label ID="EquipNameLabel" runat="server" Text='<%# Bind("EquipName") %>' />
                        <br /><hr />
                        <b>Specification:</b>
                        <asp:Label ID="SpecificationLabel" runat="server" Text='<%# Eval("Specification").ToString().Replace(Environment.NewLine, "<br/>") %>' />
                        <br /><hr />
                        <b>Available:</b>
                        <asp:Label ID="lblAvailable" runat="server" Text='<%# GetBooleanText(Eval("Available")) %>'></asp:Label>
                        <br /><hr />
                        <b>Cost:</b>
                        <asp:Label ID="CostLabel" runat="server" Text='<%# Bind("Cost") %>' />
                        <br /><hr />
                        <%--<b>Rent Equipment</b>--%>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/EquipmentReservation.aspx?CatId=" + Item.EquipRentalMainClassId + "&TypeId=" + Item.Id %>' CssClass="btn btn-danger btn-lg">Rent This Equipment <span class="glyphicon glyphicon-arrow-right"></span></asp:HyperLink>
                    </ItemTemplate>
                </asp:FormView>
                <asp:EntityDataSource ID="EntityDataSource2" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="equiprentalsubclasses" Where="">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="TypeId" Type="Int16" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {

            $("#owl-demo").owlCarousel({

                navigation: true, // Show next and prev buttons
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true

                // "singleItem:true" is a shortcut for:
                // items : 1, 
                // itemsDesktop : false,
                // itemsDesktopSmall : false,
                // itemsTablet: false,
                // itemsMobile : false

            });

        });
    </script>
</asp:Content>
