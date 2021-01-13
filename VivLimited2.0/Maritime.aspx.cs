using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0
{
    public partial class Maritime : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
            {
                var myTxt = (from t in myEntities.pagecontents
                             where t.Id == 6
                             select t).SingleOrDefault();

                if (myTxt.PageText != null)
                {
                    Label1.Text = myTxt.PageText.ToString().Replace(Environment.NewLine, "<br />");
                }
                
                Image1.ImageUrl = myTxt.PageBannerUrl;

            }
        }
    }
}