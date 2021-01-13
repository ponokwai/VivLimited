using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Sliders
            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var mySliders = from s in myEntities.homepagesliders
                                select s;

                Repeater1.DataSource = mySliders.ToList();
                Repeater1.DataBind();
            }

            //Text Content
            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var myTxt = (from t in myEntities.pagecontents
                             where t.Id == 1
                             select t.PageText).SingleOrDefault();
                lblText.Text = myTxt.ToString().Replace(Environment.NewLine, "<br />");

            }

            //Service Icons
            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var myIcons = from ic in myEntities.pagecontents
                              where ic.Id > 2 && ic.Id < 9 
                              select ic;

                Repeater2.DataSource = myIcons.ToList();
                Repeater2.DataBind();
            }
        }
    }
}