using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Management
{
    public partial class ProjectList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Save Edited By and Date-Time Edited fields
            project myProject = (project)e.Entity;
            myProject.EditedBy = User.Identity.Name;
            myProject.DateTimeEdited = DateTime.Now;
        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Save Edited By and Date-Time Edited fields
            project myProject = (project)e.Entity;
            myProject.EditedBy = User.Identity.Name;
            myProject.DateTimeEdited = DateTime.Now;
        }

        protected void EntityDataSource1_Deleting(object sender, EntityDataSourceChangingEventArgs e)
        {
            project myProject = (project)e.Entity;
            //Delete project pictures
            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var projPics = from p in myEntities.projectpics
                               where p.ProjectId == myProject.Id
                               select p;
                if (projPics.Any())
                {
                    foreach (var pic in projPics)
                    {
                        //Remove file
                        string filePath = Server.MapPath(pic.ImageUrl);
                        System.IO.File.Delete(filePath);

                        //Update dbo
                        myEntities.projectpics.Remove(pic);
                    }
                    myEntities.SaveChanges();
                }
            }
        }
    }
}