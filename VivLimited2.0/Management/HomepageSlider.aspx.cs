using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Management
{
    public partial class HomepageSlider : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.Form.Attributes.Add("enctype", "multipart/form-data");
        }


        

        protected void EntityDataSource3_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Upload image file and save edited by and datetime edited
            homepageslider myHomePageSlider = (homepageslider)e.Entity;


            //image upload via fileupload control (insert item)
            FileUpload FileUploadInsertItem = (FileUpload)ListView2.InsertItem.FindControl("FileUploadInsertItem");
            string virtualFolder = "~/Images/SiteBuild/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(FileUploadInsertItem.FileName);

            FileUploadInsertItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension)); //save image file
            myHomePageSlider.ImageUrl = virtualFolder + fileName + extension;


            myHomePageSlider.LastUpdatedBy = User.Identity.Name;
            myHomePageSlider.LastUpdateDateTime = DateTime.Now;
        }

        protected void EntityDataSource3_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Upload image file (if new file exist first delete old file) and save edited by and datetime edited
            homepageslider myHomePageSlider = (homepageslider)e.Entity;

            FileUpload FileUploadEditItem = (FileUpload)ListView2.EditItem.FindControl("FileUploadEditItem");
            if (FileUploadEditItem.HasFile)
            {
                //Delete old file
                string imgFile = Server.MapPath(myHomePageSlider.ImageUrl);
                System.IO.File.Delete(imgFile);

                //Upload new file
                string virtualFolder = "~/Images/SiteBuild/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(FileUploadEditItem.FileName);

                FileUploadEditItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension)); //save image file
                myHomePageSlider.ImageUrl = virtualFolder + fileName + extension;

            }

            myHomePageSlider.LastUpdatedBy = User.Identity.Name;
            myHomePageSlider.LastUpdateDateTime = DateTime.Now;
        }

        protected void EntityDataSource3_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            //Delete image file
            homepageslider myHomePageSlider = (homepageslider)e.Entity;
            string imgFile = Server.MapPath(myHomePageSlider.ImageUrl);
            System.IO.File.Delete(imgFile);

            //Upload new file

        }

    }
}