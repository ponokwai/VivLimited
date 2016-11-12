using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0
{
    public partial class EquipmentDetails : System.Web.UI.Page
    {
        protected string GetBooleanText(object booleanValue)
        {
            bool avalable = (bool)booleanValue;
            if (avalable)
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_DataBinding(object sender, EventArgs e)
        {
            
        }
    }
}