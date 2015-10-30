// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          This is the homepage for Technicians
// Known bugs: None at the time of testing
// Version: 1.0

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3.Technician
{
    public partial class technician : System.Web.UI.Page
    {
        // gets login user details and stores in hidden label
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserName.Visible = false;
            lblUserName.Text = User.Identity.Name.ToString();
        }

        // refreshes grid view and unselects row
        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
        }
    }
}