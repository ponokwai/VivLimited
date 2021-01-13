using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using VivLimited2._0.App_Code;
using VivLimited2._0.Model;

namespace VivLimited2._0
{
    public partial class EquipmentReservation : Page
    {
        Int16 _catId = -1;
        Int16 _typeId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if page contains query string, preload data
            if (!string.IsNullOrEmpty(Request.QueryString.Get("TypeId")) && !string.IsNullOrEmpty(Request.QueryString.Get("CatId")))
            {
                _typeId = Convert.ToInt16(Request.QueryString.Get("TypeId"));
                _catId = Convert.ToInt16(Request.QueryString.Get("CatId"));
            }
            if (!Page.IsPostBack && _typeId > -1)
            {
                //Get values for dropdown lists
                using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
                {
                    var ddlVals = (from dl in myEntities.equiprentalsubclasses.Include("equiprentalmainclass")
                                   where dl.Id == _typeId
                                   select dl).SingleOrDefault();
                    if (ddlVals != null)
                    {
                        //bind equip category value
                        ddlEquipCat.DataBind();
                        ListItem myDdlEquipCat = ddlEquipCat.Items.FindByValue(ddlVals.equiprentalmainclass.Id.ToString());
                        if (myDdlEquipCat != null)
                        {
                            myDdlEquipCat.Selected = true;
                        }

                        //bind equip type
                        ddlEquipType.DataBind();
                        ListItem myDdlEquipType = ddlEquipType.Items.FindByValue(ddlVals.Id.ToString());
                        if (myDdlEquipType != null)
                        {
                            myDdlEquipType.Selected = true;
                        }
                        //Update cost infomation and view profile
                        ltlCost.Text = "Cost: " + ddlVals.Cost.ToString();
                        lblViewProfile.Text = "View equipment profile";
                        HyperLinkViewProfile.NavigateUrl = "~/EquipmentDetails.aspx?TypeId=" + ddlVals.Id; 
                    }


                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    //Update database
                    using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
                    {
                        Model.EquipmentReservation  myReservation = new Model.EquipmentReservation();

                        myReservation.Name = tbxName.Text;
                        myReservation.Company = tbxCompany.Text;
                        myReservation.PhoneNumb = tbxPhone.Text;
                        myReservation.Email = tbxEmail.Text;
                        myReservation.EquipmentCategoryId = Convert.ToInt16(ddlEquipCat.SelectedValue);
                        myReservation.EquipmentTypeId = Convert.ToInt16(ddlEquipType.SelectedValue);
                        myReservation.StartDate = Convert.ToDateTime(tbxStartDate.Text);
                        myReservation.EndDate = Convert.ToDateTime(tbxEndDate.Text);
                        myReservation.Comments = tbxComment.Text;

                        myEntities.EquipmentReservations.Add(myReservation);
                        myEntities.SaveChanges();
                    }

                    //Send email notification
                    string fileName = Server.MapPath("~/App_Data/EquipmentRentalNotification.txt");
                    string mailBody = File.ReadAllText(fileName);

                    MailMessage myMailMessage = new MailMessage();
                    myMailMessage.Body = mailBody;
                    myMailMessage.Subject = "New Equipment Reservation";
                    myMailMessage.From = new MailAddress(AppConfiguration.FromAddress, AppConfiguration.FromName);
                    myMailMessage.To.Add(new MailAddress(AppConfiguration.ToAddress, AppConfiguration.ToName));

                    SmtpClient mySmtpClient = new SmtpClient();
                    mySmtpClient.Send(myMailMessage);

                    //Send feedback
                    PanelResForm.Visible = false;
                    lblFeedback.Text = "Thank you for the equipment reservation. We will contact you to conclude the process.";
                    lblFeedback.CssClass = "text-success";
                }
                catch
                {
                    lblFeedback.Text = "An error has occured. Please try resending or use our alternative equipment reservation information on this page";
                    lblFeedback.CssClass = "text-danger";
                }
                

            }
        }

        protected void ddlEquipType_TextChanged(object sender, EventArgs e)
        {
            //Pupulate equipment price and view profile link
            Int16 equipId = Convert.ToInt16(ddlEquipType.SelectedValue);

            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var EquipData = (from i in myEntities.equiprentalsubclasses
                                 where i.Id == equipId
                                 select i).SingleOrDefault();
                if (EquipData != null)
                {
                    ltlCost.Text = "Cost: " + EquipData.Cost.ToString();
                    lblViewProfile.Text = "View equipment profile";
                    HyperLinkViewProfile.NavigateUrl = "~/EquipmentDetails.aspx?TypeId=" + EquipData.Id;

                }
            }
        }
    }
}