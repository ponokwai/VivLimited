﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!string.IsNullOrEmpty(txtYourNumber.Text) || !string.IsNullOrEmpty(txtYourEmail.Text))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string fileName = Server.MapPath("~/App_Data/ContactForm.txt");
                string mailBody = File.ReadAllText(fileName);

                mailBody = mailBody.Replace("##Name##", txtYourName.Text);
                mailBody = mailBody.Replace("##PhoneNumber##", txtYourNumber.Text);
                mailBody = mailBody.Replace("##Email##", txtYourEmail.Text);
                mailBody = mailBody.Replace("##Comments##", txtYourComments.Text);

                MailMessage myMessage = new MailMessage();
                myMessage.Subject = "Message from website";
                myMessage.Body = mailBody;

                myMessage.From = new MailAddress("info@vivlimited.com", "Website");
                myMessage.To.Add(new MailAddress("info@vivlimited.com", "Viv Limited Team"));
                if (!string.IsNullOrEmpty(txtYourEmail.Text))
                {
                    myMessage.ReplyToList.Add(new MailAddress(txtYourEmail.Text));
                }

                SmtpClient mySmtpClient = new SmtpClient();
                mySmtpClient.Send(myMessage);

                ContactFormPanel.Visible = false;
                iMessage.Visible = true;
            }
        }
    }
}