using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivLimited2._0.Administrator
{
    public partial class AllUserAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = Membership.GetAllUsers();
            GridView1.DataBind();
        }

        protected void btnUnlock_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MembershipUser user = Membership.GetUser(tbxUserName.Text);
                if (user != null)
                {
                    user.UnlockUser();
                    lblUserFeed.Text = "User account is now unlocked";
                }
                else
                {
                    lblUserFeed.Text = "User account was not found";
                }

            }
        }
    }
}