<%@ Page Title="Frontend Page Content" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="PageContent.aspx.cs" Inherits="VivLimited2._0.Management.PageContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="VivLimited2._0.pagecontent">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Management/PageContentDetails.aspx?Id={0}" DataTextField="PageTitle" HeaderText="Page Title" SortExpression="PageTitle" />
                    <asp:TemplateField HeaderText="Homepage Icon" SortExpression="DefaultPageIconUrl">
                        <%--<EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DefaultPageIconUrl") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Item.DefaultPageIconUrl %>' CssClass="img-responsive img-thumbnail" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PageUrl" HeaderText="PageUrl" SortExpression="PageUrl" />
                    <asp:TemplateField HeaderText="Frontend pages Banner" SortExpression="PageBannerUrl">
                        <%--<EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PageBannerUrl") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Item.PageBannerUrl %>' CssClass="img-responsive img-thumbnail"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EditedBy" HeaderText="EditedBy" SortExpression="EditedBy" />
                    <asp:BoundField DataField="DateTimeEdited" HeaderText="DateTimeEdited" SortExpression="DateTimeEdited" />
                </Columns>
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableFlattening="False" EntitySetName="pagecontents">
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
