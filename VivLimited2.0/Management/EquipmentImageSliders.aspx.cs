using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Management
{
    public partial class EquipmentImageSliders : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get subclass name
            if (!string.IsNullOrEmpty(Request.QueryString.Get("SubClassId")))
            {
                Int16 subClassId = Convert.ToInt16(Request.QueryString.Get("SubClassId"));
                using (dbo_vivlimitedEntities myEntites = new dbo_vivlimitedEntities())
                {
                    var SubCat = (from k in myEntites.equiprentalsubclasses
                                    where k.Id == subClassId
                                    select k.EquipName).SingleOrDefault();
                    if (SubCat != null)
                    {
                        ltlTitle.Text = SubCat;
                    }
                }
            }
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            //Validate the inserting template to ensure there is picture to upload
            FileUpload FileUploadInsertItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertItem");

            if (!FileUploadInsertItem.HasFile)
            {
                CustomValidator CustValInsertItm = (CustomValidator)ListView1.InsertItem.FindControl("CustValInsertItm");
                CustValInsertItm.IsValid = false;
                e.Cancel = true;
            }
        }

        protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            // Save photo file to disk and update EquipmentSubClassId, EditedBy,and DateTimeEdited fields


            equiprentalimageslider myEquipImgSlider = (equiprentalimageslider)e.Entity;
            Int16 EquipSubClassId = Convert.ToInt16(Request.QueryString.Get("SubClassId"));

            //Upload photo
            FileUpload FileUploadInsertItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertItem");
            if (FileUploadInsertItem.HasFile)
            {
                //Save image file
                string virtualFolder = "~/Images/Equipment/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(FileUploadInsertItem.FileName);

                FileUploadInsertItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                myEquipImgSlider.ImageUrl = virtualFolder + fileName + extension;
            }

            //Add Edited By and Date-Time Edited fields
            myEquipImgSlider.EditedBy = User.Identity.Name;
            myEquipImgSlider.DateTimeEdited = DateTime.Now;
            myEquipImgSlider.EquipmentSubClassId = EquipSubClassId;
        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            // Save new photo file to disk and delete old file and update EquipmentSubClassId, EditedBy,and DateTimeEdited fields
            equiprentalimageslider myEquipImgSlider = (equiprentalimageslider)e.Entity;

            FileUpload FileUploadEditItem = (FileUpload)ListView1.EditItem.FindControl("FileUploadEditItem");
            if (FileUploadEditItem.HasFile)
            {
                //Delete previous file
                string physicalPath = Server.MapPath(myEquipImgSlider.ImageUrl);
                System.IO.File.Delete(physicalPath);

                //Upload new file
                string virtualFolder = "~/Images/Equipment/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(FileUploadEditItem.FileName);

                FileUploadEditItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                myEquipImgSlider.ImageUrl = virtualFolder + fileName + extension;

            }
            //Update other parameters
            myEquipImgSlider.EditedBy = User.Identity.Name;
            myEquipImgSlider.DateTimeEdited = DateTime.Now;
        }

        protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            //Delete photo file from disk
            equiprentalimageslider myEquipImgSlider = (equiprentalimageslider)e.Entity;

            string physicalPath = Server.MapPath(myEquipImgSlider.ImageUrl);
            System.IO.File.Delete(physicalPath);
        }
    }
}