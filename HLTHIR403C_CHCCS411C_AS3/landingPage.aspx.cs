// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          This page checks user account status
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
        // stores logged in username in label
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblUserName.Visible = false;
            lblUserName.Text = User.Identity.Name.ToString();
            //GridView1.Visible = false;
        }

       
        // checks account status column in gridview
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get value of third column. Index is zero based, to 
                // get text of third column we use Cells[2].Text
                string AccountStatus = (e.Row.Cells[2].Text.ToString());

                // if user account is disable
                if (AccountStatus == "Inactive")
                {
                    //logouts out user and redirects user to disabled.aspx page
                    FormsAuthentication.SignOut();
                    Response.Redirect("~/disabled.aspx");
                }

                // if user account is active - user will be redirected as per their role
                else if (AccountStatus == "Active")
                {
                    // redirects user based on role to home page
                    if (Roles.IsUserInRole(User.Identity.Name.ToString(), "Admin"))
                    {
                        Response.Redirect("~/Technician/technician.aspx");
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
    }
}