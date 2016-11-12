using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Administrator
{
    public partial class RoleManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            allRoles();
        }

        protected void btnRole_Click(object sender, EventArgs e)
        {
            Roles.CreateRole(tbxCreateRole.Text);
            allRoles();
        }

        protected void allRoles()
        {
            lbxRoles.DataSource = Roles.GetAllRoles();
            lbxRoles.DataBind();
        }
    }
}