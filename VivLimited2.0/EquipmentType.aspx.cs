using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0
{
    public partial class EquipmentType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get Category Name
            if (!string.IsNullOrEmpty(Request.QueryString.Get("CatId")))
            {
                Int16 catId = Convert.ToInt16(Request.QueryString.Get("CatId"));
                using (dbo_vivlimitedEntities myEntities = new dbo_vivlimitedEntities())
                {
                    var catName = (from n in myEntities.equiprentalmainclasses
                                   where n.Id == catId
                                   select n.EquipCategory).SingleOrDefault();
                    ltlTitle.Text = catName;

                }
            }
        }
    }
}