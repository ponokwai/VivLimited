<%@ Page Title="Home" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VivLimited2._0.Default" MetaDescription="We are an engineering, equipment rental, manpower supply, maritime, procurement and logistics, and haulage company based in Warri, Delta State, Nigeria.
" MetaKeywords="civil, engineering, mechanical, engineering, pipeline, construction, and, maintenance, engineering, consultancy, rent, cranes, rental, excavators, hire, tug, boats, hire, barges, hire, maritime, vessels, hire, security, boat, hire, excavators, hire, trucks, hire, CAT, equipment, hire, motor, grader, hire, lowbed, hire, passport19, boats, warri, port-harcourt, lagos, nigeria
" %>
<%--<%@ OutputCache Duration="2592000" VaryByParam="*" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container-fluid <%--default-body-content--%>">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <asp:Repeater ID="Repeater1" runat="server" ItemType="VivLimited2._0.homepageslider">
                    <ItemTemplate>
                        <div class="item">
                            <asp:Image ID="Image1" ImageUrl='<%# Item.ImageUrl %>' CssClass="img-responsive carousel-height" Width="100%" runat="server" />
                            <div class="carousel-caption wow glideLeft">
                                <h4>
                                    <asp:Literal ID="Literal1" Text='<%# Item.CaptionHeading %>' runat="server"></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal2" Text='<%# Item.CaptionDesc %>' runat="server"></asp:Literal>
                                </p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <br />
    <div class="container body-content">
        
        <div class="row">
            <div class="col-sm-2 col-sm-push-10 wow glideRight" style="border-left: 2px solid red;">
                <%--<h3>Quick Link</h3>--%>
                <%--<asp:ImageButton ID="ImageButton1" runat="server" />--%>
                <a runat="server" class="btn btn-danger" href="~/EquipmentReservation.aspx">Rent Equipment <span class="glyphicon glyphicon-triangle-right"></span></a>
            </div>
            <div class="col-sm-10 col-sm-pull-2">
                <asp:Label ID="lblText" runat="server" CssClass="page-text" Text="Label"></asp:Label>
            </div>

        </div>
        <%--<hr />--%>
        <div class="row">
            <h2 class="text-capitalize" style="line-height: 40px;">Services</h2>
            <hr class="homePage-service" />
            <asp:Repeater ID="Repeater2" runat="server" ItemType="VivLimited2._0.pagecontent">
                <ItemTemplate>
                    <div class="col-sm-6 wow animated glideLeft">
                        <asp:HyperLink ID="HyperLink1" CssClass="col-img-text" runat="server" NavigateUrl='<%# Item.PageUrl %>'>
                            <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-centralise" ImageUrl='<%# Item.DefaultPageIconUrl %>' AlternateText="Viv Limited Services" />
                            <h6 class="serv-name-format">
                                <asp:Literal ID="Literal" runat="server" Text='<%# Item.PageTitle %>'></asp:Literal></h6>
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
