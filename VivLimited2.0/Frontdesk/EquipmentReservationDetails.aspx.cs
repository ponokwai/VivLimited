using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Frontdesk
{
    public partial class EquipmentReservationDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            //Redirect to equipment reservation page
            Response.Redirect("~/Frontdesk/EquipmentReservation.aspx");
        }
    }
}