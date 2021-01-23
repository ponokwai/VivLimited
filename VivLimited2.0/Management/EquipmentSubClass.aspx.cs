using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Management
{
    public partial class EquipmentSubClass : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.Get("ClassId")))
            {
                Int16 classId = Convert.ToInt16(Request.QueryString.Get("ClassId"));
                using (dbo_vivlimitedEntities myEntites = new dbo_vivlimitedEntities())
                {
                    var ClassCat = (from k in myEntites.equiprentalmainclasses
                                    where k.Id == classId
                                    select k.EquipCategory).SingleOrDefault();
                    if (ClassCat != null)
                    {
                        ltlTitle.Text = ClassCat + " Sub-Category";
                    }
                }
            }

        }

        protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            EquipRentalSubclass myEquipSubClass = (EquipRentalSubclass)e.Entity;
            Int16 EquipMainId = Convert.ToInt16(Request.QueryString.Get("ClassId"));

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
                myEquipSubClass.ImageUrl = virtualFolder + fileName + extension;
            }

            //Add Edited By and Date-Time Edited fields
            myEquipSubClass.EditedBy = User.Identity.Name;
            myEquipSubClass.DateTimeEdited = DateTime.Now;
            myEquipSubClass.EquipRentalMainClassId = EquipMainId;
        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            EquipRentalSubclass myEquipSubClass = (EquipRentalSubclass)e.Entity;
            //if fileupload has file, delete old file then upload new file

            FileUpload FileUploadEditItem = (FileUpload)ListView1.EditItem.FindControl("FileUploadEditItem");
            if (FileUploadEditItem.HasFile)
            {
                //Delete previous file
                string physicalPath = Server.MapPath(myEquipSubClass.ImageUrl);
                System.IO.File.Delete(physicalPath);

                //Upload new file
                string virtualFolder = "~/Images/Equipment/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(FileUploadEditItem.FileName);

                FileUploadEditItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                myEquipSubClass.ImageUrl = virtualFolder + fileName + extension;

            }
            //Update other parameters
            myEquipSubClass.EditedBy = User.Identity.Name;
            myEquipSubClass.DateTimeEdited = DateTime.Now;
        }

        protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            //Remove photo file
            EquipRentalSubclass myEquipSubClass = (EquipRentalSubclass)e.Entity;
            string physicalPath = Server.MapPath(myEquipSubClass.ImageUrl);
            System.IO.File.Delete(physicalPath);
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload FileUploadInsertItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertItem");
            TextBox SpecificationTextBox = (TextBox)ListView1.InsertItem.FindControl("SpecificationTextBox");

            if (!FileUploadInsertItem.HasFile)
            {
                CustomValidator CustValInsertItm = (CustomValidator)ListView1.InsertItem.FindControl("CustValInsertItm");
                CustValInsertItm.IsValid = false;
                e.Cancel = true;
            }

            if (SpecificationTextBox.Text == "")
            {
                CustomValidator CustValInsertItm2 = (CustomValidator)ListView1.InsertItem.FindControl("CustValInsertItm2");
                CustValInsertItm2.IsValid = false;
                e.Cancel = true;
            }
        }

        protected void EntityDataSource1_Deleting(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Remove photo slider collection
            EquipRentalSubclass mySubClass = (EquipRentalSubclass)e.Entity;
            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var Sliders = from s in myEntities.equiprentalimageSliders
                              where s.EquipmentSubClassId == mySubClass.Id
                              select s;
                if (Sliders.Any())
                {
                    foreach (var pic in Sliders)
                    {
                        //remove photp file
                        string filePath = Server.MapPath(pic.ImageUrl);
                        System.IO.File.Delete(filePath);

                        //update dbo
                        myEntities.equiprentalimageSliders.Remove(pic);
                    }
                    myEntities.SaveChanges();
                }
            }
        }
    }
}