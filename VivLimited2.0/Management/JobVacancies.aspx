<%@ Page Title="Job Vacancies" Language="C#" MasterPageFile="~/backend.Master" AutoEventWireup="true" CodeBehind="JobVacancies.aspx.cs" Inherits="VivLimited2._0.Frontdesk.JobVacancies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" GroupItemCount="1" InsertItemPosition="LastItem" ItemType="VivLimited2._0.career">

                        <EditItemTemplate>
                            <td runat="server" style="">
                                <b>Job Title:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Job Title" CssClass="FormError" ValidationGroup="EditValItem" ControlToValidate="JobTitleTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' CssClass="form-control" />
                                <br />
                                <b>Job Description:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Job Description" CssClass="FormError" ValidationGroup="EditValItem" ControlToValidate="JobDescriptionTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="JobDescriptionTextBox" runat="server" Text='<%# Bind("JobDescription") %>' TextMode="MultiLine" CssClass="form-control" />
                                <br />
                                <b>How To Apply:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter How To Apply information" CssClass="FormError" ValidationGroup="EditValItem" ControlToValidate="HowToApplyTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="HowToApplyTextBox" runat="server" Text='<%# Bind("HowToApply") %>' TextMode="MultiLine" CssClass="form-control" />
                                <br />
                                <b>Expiry Date:</b>
                                <asp:TextBox ID="ExpiryDateTextBox" runat="server" Text='<%# Bind("ExpiryDate") %>' TextMode="Date" CssClass="form-control" />
                                <br />
                                <asp:CheckBox ID="PublishCheckBox" runat="server" Checked='<%# Bind("Publish") %>' Text="Publish" />
                                <br />
                                <div class="btn-group">
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="EditValItem" CssClass="btn btn-success" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
                                </div>

                                <br />
                            </td>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No vacancy published</td>
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
                            <td runat="server" style="">
                                <b>Job Title:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Job Title" CssClass="FormError" ValidationGroup="InsertValItem" ControlToValidate="JobTitleTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="JobTitleTextBox" runat="server" CssClass="form-control" Text='<%# Bind("JobTitle") %>' />
                                <br />
                                <b>Job Description:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Job Description" CssClass="FormError" ValidationGroup="InsertValItem" ControlToValidate="JobDescriptionTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="JobDescriptionTextBox" runat="server" TextMode="MultiLine" CssClass="form-control" Text='<%# Bind("JobDescription") %>' />
                                <br />
                                <b>How To Apply:</b>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter How To Apply information" CssClass="FormError" ValidationGroup="InsertValItem" ControlToValidate="HowToApplyTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="HowToApplyTextBox" runat="server" TextMode="MultiLine" CssClass="form-control" Text='<%# Bind("HowToApply") %>' />
                                <br />
                                <b>Expiry Date:</b>
                                <asp:TextBox ID="ExpiryDateTextBox" runat="server" TextMode="Date" CssClass="form-control" Text='<%# Bind("ExpiryDate") %>' />
                                <br />
                                <asp:CheckBox ID="PublishCheckBox" runat="server" Checked='<%# Bind("Publish") %>' Text="Publish" />
                                <br />
                                <div class="btn-group">
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" ValidationGroup="InsertValItem" Text="Insert" CssClass="btn btn-success" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-default" />
                                </div>

                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="">
                                <b>Job Title:</b><br />
                                <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                                <br /><hr />
                                <b>Job Description:</b><br />
                                <asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Eval("JobDescription").ToString().Replace(Environment.NewLine, "<br/>") %>' />
                                <br /><hr />
                                <b>How To Apply:</b><br />
                                <asp:Label ID="HowToApplyLabel" runat="server" Text='<%# Eval("HowToApply") %>' />
                                <br /><hr />
                                <b>Expiry Date:</b><br />
                                <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Eval("ExpiryDate") %>' />
                                <br /><hr />
                                <asp:CheckBox ID="PublishCheckBox" runat="server" Checked='<%# Eval("Publish") %>' Enabled="false" Text="Publish" />
                                <br /><hr />
                                <div class="btn-group">
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-danger" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-default" Text="Edit" />
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
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_vivlimitedEntities" DefaultContainerName="dbo_vivlimitedEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="careers">
                    </asp:EntityDataSource>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="ListView1" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="PleaseWait">
                    Please Wait...
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
