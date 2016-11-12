<%@ Page Title="Page Content Details" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="PageContentDetails.aspx.cs" Inherits="VivLimited2._0.Management.PageContentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.pagecontent">
                <EditItemTemplate>
                    
                    <b>Page Title:</b><br />
                    <asp:TextBox ID="PageTitleTextBox" CssClass="form-control" runat="server" ReadOnly="true" Text='<%# Bind("PageTitle") %>' />
                    <br />
                    <b>Page Text:</b><br />
                    <asp:TextBox ID="PageTextTextBox" CssClass="form-control" runat="server" TextMode="MultiLine" Text='<%# Bind("PageText") %>' />
                    <br />
                    <b>Page Url:</b><br />
                    <asp:TextBox ID="PageUrlTextBox" CssClass="form-control" ReadOnly="true" runat="server" Text='<%# Bind("PageUrl") %>' />
                    <br />
                    <b>Homepage Icon:</b><br />
                    <asp:Image ID="HomepageIcon" ImageUrl='<%# Item.DefaultPageIconUrl %>' runat="server" CssClass="img-responsive img-thumbnail" Height="150px" /><br />
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="400px * 267px"><span class="glyphicon glyphicon-question-sign"></span></a><br />
                    <asp:FileUpload ID="FileUploadIcon" runat="server" CssClass="form-control" />
                    <%--<asp:TextBox ID="DefaultPageIconUrlTextBox" runat="server" Text='<%# Bind("DefaultPageIconUrl") %>' />--%>
                    <br />
                    <b>Page Banner Image:</b><br />
                    <asp:Image ID="PageBannerImage" ImageUrl='<%# Item.PageBannerUrl %>' runat="server" CssClass="img-responsive img-thumbnail" Height="200px" /><br />
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="1280px * 400px"><span class="glyphicon glyphicon-question-sign"></span></a><br />
                    <asp:FileUpload ID="FileUploadPageBanner" runat="server" CssClass="form-control" />
                    <%--<asp:TextBox ID="PageBannerUrlTextBox" runat="server" Text='<%# Bind("PageBannerUrl") %>' />--%>
                    <br />
                    
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                
                <ItemTemplate>
                    <b>Page Title:</b><br />
                    <asp:Label ID="PageTitleLabel" runat="server" Text='<%# Bind("PageTitle") %>' />
                    <br />
                    <b>Page Text:</b><br />
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" ReadOnly="true" Text='<%# Bind("PageText") %>' Width="550px" runat="server"></asp:TextBox>
                    <%--<asp:Label ID="PageTextLabel" runat="server" Text='<%# Bind("PageText") %>' />--%>
                    <br />
                    <b>Page Url:</b><br />
                    <asp:Label ID="PageUrlLabel" runat="server" Text='<%# Bind("PageUrl") %>' />
                    <br />
                    <b>Homepage Icon:</b><br />
                    <asp:Image ID="HomepageIcon" ImageUrl='<%# Item.DefaultPageIconUrl %>' runat="server" CssClass="img-responsive img-thumbnail" Height="150px" />
                    <br />
                    <b>Page Banner Image:</b><br />
                    <asp:Image ID="PageBannerImage" ImageUrl='<%# Item.PageBannerUrl %>' runat="server" CssClass="img-responsive img-thumbnail" Height="200px" />
                    <br />
                    <b>Edited By:</b><br />
                    <asp:Label ID="EditedByLabel" runat="server" Text='<%# Bind("EditedBy") %>' />
                    <br />
                    <b>Date-Time Edited:</b><br />
                    <asp:Label ID="DateTimeEditedLabel" runat="server" Text='<%# Bind("DateTimeEdited") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                </ItemTemplate>
            </asp:FormView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="pagecontents" Where="" OnUpdating="EntityDataSource1_Updating">
                <WhereParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="SByte" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
