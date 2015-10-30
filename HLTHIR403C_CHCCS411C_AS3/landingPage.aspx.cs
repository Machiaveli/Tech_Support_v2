// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
// Known bugs: None at the time of testing
// Version: 1.0

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3
{
    public partial class landingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // redirects user based on role to home page
            if (Roles.IsUserInRole(User.Identity.Name.ToString(), "Admin"))
            {
                Response.Redirect("~/Admin/addCustomer.aspx");
            }

            else if (Roles.IsUserInRole(User.Identity.Name.ToString(), "Technician"))
         {
               Response.Redirect("~/Technician/technician.aspx");
         }
            else if (Roles.IsUserInRole(User.Identity.Name.ToString(), "SupportOfficer"))
            {
                Response.Redirect("~/SupportOfficer/SupportOfficerHomePage.aspx");
            }
            
        }
    }
}