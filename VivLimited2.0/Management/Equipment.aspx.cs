using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Management
{
    public partial class Equipment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            EquipRentalMainClass myEquipRentalMainClass = (EquipRentalMainClass)e.Entity;

            //Upload photo
            FileUpload FileUploadInsertTemp = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertTemp");
            if (FileUploadInsertTemp.HasFile)
            {
                //Save image file
                string virtualFolder = "~/Images/Equipment/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(FileUploadInsertTemp.FileName);

                FileUploadInsertTemp.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                myEquipRentalMainClass.ImgIconUrl = virtualFolder + fileName + extension;
            }

            //Add Edited By and Date-Time Edited fields
            myEquipRentalMainClass.EditedBy = User.Identity.Name;
            myEquipRentalMainClass.DateTimeEdited = DateTime.Now;
        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Delete existing photo file if fileupload have new picture
            EquipRentalMainClass myEquipRentalMainClass = (EquipRentalMainClass)e.Entity;

            FileUpload FileUploadEditTemp = (FileUpload)ListView1.EditItem.FindControl("FileUploadEditTemp");
            if (FileUploadEditTemp.HasFile)
            {
                //Delete photo file
                string physicalPath = Server.MapPath(myEquipRentalMainClass.ImgIconUrl);
                System.IO.File.Delete(physicalPath);

                //Add new file to folder and dbo
                string virtualFolder = "~/Images/Equipment/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(FileUploadEditTemp.FileName);

                FileUploadEditTemp.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                myEquipRentalMainClass.ImgIconUrl = virtualFolder + fileName + extension;

            }
            //Update Edited By and Date-Time Edited
            myEquipRentalMainClass.EditedBy = User.Identity.Name;
            myEquipRentalMainClass.DateTimeEdited = DateTime.Now;
        }

        protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            //Delete photo file
            EquipRentalMainClass myEquipRentalMainClass = (EquipRentalMainClass)e.Entity;

            string physicalPath = Server.MapPath(myEquipRentalMainClass.ImgIconUrl);
            System.IO.File.Delete(physicalPath);
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload FileUploadInsertTemp = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertTemp");

            if (!FileUploadInsertTemp.HasFile )
            {
                CustomValidator CustValInsertItm = (CustomValidator)ListView1.InsertItem.FindControl("CustValInsertItm");
                CustValInsertItm.IsValid = false;
                e.Cancel = true;
            }
            

        }

        protected void EntityDataSource1_Deleting(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Check if there are sub-class entries that will be affected
            EquipRentalMainClass myEquipRentalMainClass = (EquipRentalMainClass)e.Entity;
            Int16 mainClassId = myEquipRentalMainClass.Id;
            //Literal ltlFeedback = (Literal)ListView1.Items[1].FindControl("ltlFeedback");
            

            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var subClass = from s in myEntities.equiprentalsubclasses
                               where s.EquipRentalMainClassId == mainClassId
                               select s;
                if (subClass.Any())
                {
                    e.Cancel = true;
                    
                    ltlFeedback.Text = "You must first delete all sub-class items";
                }
            }
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            
        }
    }
}