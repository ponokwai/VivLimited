using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Management
{
    public partial class PageContentDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {

            pagecontent myContent = (pagecontent)e.Entity;

            sbyte pageId = Convert.ToSByte(Request.QueryString.Get("Id"));
            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var getItem = (from i in myEntities.pagecontents
                               where i.Id == pageId
                               select i).Single();
                if (getItem != null)
                {
                    //Upload new icon image if file exist
                    FileUpload FileUploadIcon = (FileUpload)FormView1.FindControl("FileUploadIcon");
                    if (FileUploadIcon.HasFile == true)
                    {
                        //delete existing icon file
                        if (!string.IsNullOrEmpty(getItem.DefaultPageIconUrl))
                        {
                            string physicalLocation = Server.MapPath(getItem.DefaultPageIconUrl);
                            System.IO.File.Delete(physicalLocation);
                        }
                        //Upload new photo file
                        string virtualFolder = "~/Images/SiteBuild/";
                        string physicalFolder = Server.MapPath(virtualFolder);
                        string newFileName = Guid.NewGuid().ToString();
                        string extension = System.IO.Path.GetExtension(FileUploadIcon.FileName);

                        FileUploadIcon.SaveAs(System.IO.Path.Combine(physicalFolder, newFileName + extension));
                        myContent.DefaultPageIconUrl = virtualFolder + newFileName + extension;

                    }

                    //Upload new banner if file exist
                    FileUpload FileUploadPageBanner = (FileUpload)FormView1.FindControl("FileUploadPageBanner");
                    if (FileUploadPageBanner.HasFile == true)
                    {
                        //delete existing icon file
                        if (!string.IsNullOrEmpty(getItem.PageBannerUrl))
                        {
                            string physicalLocation = Server.MapPath(getItem.PageBannerUrl);
                            System.IO.File.Delete(physicalLocation);
                        }
                        //Upload new photo file
                        string virtualFolder = "~/Images/SiteBuild/";
                        string physicalFolder = Server.MapPath(virtualFolder);
                        string newFileName = Guid.NewGuid().ToString();
                        string extension = System.IO.Path.GetExtension(FileUploadPageBanner.FileName);

                        FileUploadPageBanner.SaveAs(System.IO.Path.Combine(physicalFolder, newFileName + extension));
                        myContent.PageBannerUrl = virtualFolder + newFileName + extension;

                    }
                }
            }

            //Update 'Edited By' and 'Date-Time Edited'
            myContent.EditedBy = User.Identity.Name;
            myContent.DateTimeEdited = DateTime.Now;
            
        }
    }
}