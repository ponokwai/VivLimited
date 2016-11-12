using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Management
{
    public partial class ProjectPictures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get project title
            if (!string.IsNullOrEmpty(Request.QueryString.Get("ProjId")))
            {
                Int16 projId = Convert.ToInt16(Request.QueryString.Get("ProjId"));

                using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
                {
                    var projTitle = (from t in myEntities.projects
                                     where t.Id == projId
                                     select t.Title).SingleOrDefault();
                    if (projTitle != null)
                    {
                        ltlTitle.Text = projTitle;
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
            projectpic myProjectPic = (projectpic)e.Entity;

            if (!string.IsNullOrEmpty(Request.QueryString.Get("ProjId")))
            {
                Int16 projId = Convert.ToInt16(Request.QueryString.Get("ProjId"));

                //Upload picture file
                FileUpload FileUploadInsertItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertItem");
                if (FileUploadInsertItem.HasFile)
                {
                    //Save image file
                    string virtualFolder = "~/Images/Project/";
                    string physicalFolder = Server.MapPath(virtualFolder);
                    string fileName = Guid.NewGuid().ToString();
                    string extension = System.IO.Path.GetExtension(FileUploadInsertItem.FileName);

                    FileUploadInsertItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                    myProjectPic.ImageUrl = virtualFolder + fileName + extension;

                    //Update other blank fields
                    myProjectPic.ProjectId = projId;
                    myProjectPic.CreatedBy = User.Identity.Name;
                    myProjectPic.DateTimeCreated = DateTime.Now;

                }

            }
        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            projectpic myProjectPic = (projectpic)e.Entity;

            if (!string.IsNullOrEmpty(Request.QueryString.Get("ProjId")))
            {
                Int16 projId = Convert.ToInt16(Request.QueryString.Get("ProjId"));
                //Upload new image and delete old if fileupload have file

                FileUpload FileUploadEditItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadEditItem");
                if (FileUploadEditItem.HasFile)
                {
                    //Delete Previous file
                    string filePath = Server.MapPath(myProjectPic.ImageUrl);
                    System.IO.File.Delete(filePath);

                    //Save image file
                    string virtualFolder = "~/Images/Project/";
                    string physicalFolder = Server.MapPath(virtualFolder);
                    string fileName = Guid.NewGuid().ToString();
                    string extension = System.IO.Path.GetExtension(FileUploadEditItem.FileName);

                    FileUploadEditItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                    myProjectPic.ImageUrl = virtualFolder + fileName + extension;

                    //Update other blank fields
                    myProjectPic.CreatedBy = User.Identity.Name;
                    myProjectPic.DateTimeCreated = DateTime.Now;

                }
            }

        }

        protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            //delete file
            projectpic myProjectPic = (projectpic)e.Entity;

            string filePath = Server.MapPath(myProjectPic.ImageUrl);
            System.IO.File.Delete(filePath);

        }
    }
}