<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="VivLimited2._0.Contact" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container-fluid">
        <!-- Google Map API -->
        <script
            src="http://maps.googleapis.com/maps/api/js">
        </script>

        <script>
            var myCenter = new google.maps.LatLng(5.567727, 5.730274);

            function initialize() {
                var mapProp = {
                    center: myCenter,
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                var marker = new google.maps.Marker({
                    position: myCenter,
                });

                marker.setMap(map);
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>

        <div id="googleMap" style="width: 100%; height: 350px"></div>

    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 text-center">
                <h2><%: Title %></h2>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-4 wow glideLeft2">
                <address>
                    HEAD OFFICE: <br />
                    KM 3 NPA Expressway<br />
                    Ekpan-Warri<br />
                    Delta State<br />
                    Nigeria<br />
                    <abbr title="Phone">P:</abbr>
                    +234 (0) 803 454 5821
                </address>
                <address>
                    BRANCH OFFICE: <br />
                    Plot 29 Dr.Peter Odili Road <br />
                    Trans-Amadi Ind. Layout <br />
                    Port-Harcourt <br />
                    Rivers State, Nigeria <br />
                    <abbr title="Phone">P:</abbr>
                    +234 (0) 84 766924 <br />
                    <abbr title="Phone">P:</abbr>
                    +234 (0) 803 509 1882
                </address>

                <address>
                    <strong>Email:</strong>   <a href="mailto:info@vivlimited.com">info@vivlimited.com</a> <br />
                    <a href="mailto:vivlimitedph@yahoo.com">vivlimitedph@yahoo.com</a>
                    <br />
                </address>
            </div>
            <div class="col-md-8 wow glideRight">
                <!-- Client Validation js -->
                <script type="text/javascript">
                    function validatePhoneAndEmail(source, args) {
                        var phoneNumber = document.getElementById('<%= txtYourNumber.ClientID %>');
                        var emailAddress = document.getElementById('<%= txtYourEmail.ClientID %>');
                        if (phoneNumber.value != '' || emailAddress.value != '') {
                            args.IsValid = true;
                        }
                        else {
                            args.IsValid = false;
                        }
                    }
                </script>

                <!--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>-->
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" HeaderText="Please correct the following errors:" />
                        <asp:Panel ID="ContactFormPanel" runat="server">
                            Name: 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYourName" CssClass="ErrorMessage" ErrorMessage="Enter your name" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtYourName" runat="server" CssClass="form-control"></asp:TextBox>
                            Phone Number:
                        <asp:TextBox ID="txtYourNumber" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            Email:
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtYourEmail" CssClass="ErrorMessage" ErrorMessage="Enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">*</asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePhoneAndEmail" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter your phone number or email address" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                            <asp:TextBox ID="txtYourEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            Comments:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtYourComments" CssClass="ErrorMessage" ErrorMessage="Enter a comment" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtYourComments" runat="server" TextMode="MultiLine" CssClass="form-control" ValidateRequestMode="Enabled"></asp:TextBox><br />
                            <asp:Button ID="Button1" runat="server" Text="Send" CssClass="btn btn-default" OnClick="Button1_Click" />
                        </asp:Panel>
                        <asp:Label ID="iMessage" runat="server" Text="Message Sent" CssClass="success text-center" Visible="false"></asp:Label>
             <!--       </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div class="PleaseWait">
                            Sending Message...
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
               -->
            </div>
        </div>
    </div>
</asp:Content>
