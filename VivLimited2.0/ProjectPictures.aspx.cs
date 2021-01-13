using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0
{
    public partial class ProjectPictures : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.Get("ProjId")))
            {
                Int16 projId = Convert.ToInt16(Request.QueryString.Get("ProjId"));

                //Title
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

                //Photo
                using (dbo_vivlimitedEntities myContext = new dbo_vivlimitedEntities())
                {
                    var projImg = from i in myContext.projectpics
                                  where i.ProjectId == projId
                                  select i;
                    if (projImg.Any())
                    {
                        Repeater1.DataSource = projImg.ToList();
                        Repeater1.DataBind();
                    }
                }
            }
            
        }
    }
}