<%@ Page Title="Equipment Rental Request" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="EquipmentReservation.aspx.cs" Inherits="VivLimited2._0.EquipmentReservation" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            
            <div class="col-sm-8 col-sm-push-4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>
                            <asp:Panel ID="PanelResForm" runat="server">

                                <%-- Electronic form --%>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
                                <b>Name:</b><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a contact name" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="tbxName" runat="server" CssClass="form-control"></asp:TextBox><br />

                                <b>Company:</b>
                                <asp:TextBox ID="tbxCompany" runat="server" CssClass="form-control"></asp:TextBox><br />

                                <b>Phone Number:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPhone" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a contact number" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="tbxPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox><br />

                                <b>Email:</b>
                                <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox><br />

                                <b>Equipment Category:</b>
                                <asp:DropDownList ID="ddlEquipCat" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="EntityDataSource1" DataTextField="EquipCategory" DataValueField="Id" >
                                    
                                </asp:DropDownList>
                                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="equiprentalmainclasses">
                                </asp:EntityDataSource>
                                <br />

                                <b>Equipment Name:</b>
                                <asp:DropDownList ID="ddlEquipType" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="EquipName" DataValueField="Id" AutoPostBack="True" OnTextChanged="ddlEquipType_TextChanged">
                                    
                                </asp:DropDownList>
                                <asp:EntityDataSource ID="EntityDataSource2" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="equiprentalsubclasses" Where="">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="ddlEquipCat" Name="EquipRentalMainClassId" PropertyName="SelectedValue" Type="Int16" />
                                    </WhereParameters>
                                </asp:EntityDataSource>
                                
                                <b class="text-success"><asp:Literal ID="ltlCost" runat="server"></asp:Literal></b>
                                <%--<asp:Label ID="lblCost" runat="server" CssClass="text-success"></asp:Label>--%><br />
                                <asp:HyperLink ID="HyperLinkViewProfile" runat="server">
                                    <asp:Label ID="lblViewProfile" runat="server" CssClass="text-danger"></asp:Label>
                                </asp:HyperLink>
                                <br />

                                <b>Start Date:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxStartDate" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter start date" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="tbxStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox><br />

                                <b>End Date:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxEndDate" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter end date" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="tbxEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox><br />

                                <b>Comments:</b>
                                <asp:TextBox ID="tbxComment" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox><br />

                                <asp:Button ID="btnSend" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="btnSend_Click" />

                            </asp:Panel>
                            <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div class="PleaseWait">
                            Please Wait...
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

            </div>

            <div class="col-sm-4 col-sm-pull-8">
                <%-- Phone and Email Contact --%>
                <address>
                    HEAD OFFICE:
                    <br />
                    KM 3 NPA Expressway<br />
                    Ekpan-Warri<br />
                    Delta State<br />
                    Nigeria<br />
                    <abbr title="Phone">P:</abbr>
                    +234 (0) 803 454 5821
                </address>
                <address>
                    BRANCH OFFICE:
                    <br />
                    Plot 29 Dr.Peter Odili Road
                    <br />
                    Trans-Amadi Ind. Layout
                    <br />
                    Port-Harcourt
                    <br />
                    Rivers State, Nigeria
                    <br />
                    <abbr title="Phone">P:</abbr>
                    +234 (0) 84 766924
                    <br />
                    <abbr title="Phone">P:</abbr>
                    +234 (0) 803 509 1882
                </address>

                <address>
                    <strong>Email:</strong>   <a href="mailto:info@vivlimited.com">info@vivlimited.com</a>
                    <br />
                    <a href="mailto:vivlimitedph@yahoo.com">vivlimitedph@yahoo.com</a>
                    <br />
                </address>
            </div>
        </div>
    </div>
</asp:Content>
