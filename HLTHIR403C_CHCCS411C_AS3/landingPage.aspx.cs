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
        protected void Page_Load(object sender, EventArgs e)
        {


            //lblUserName.Visible = false;
            lblUserName.Text = User.Identity.Name.ToString();
            //GridView1.Visible = false;

            ////// redirects user based on role to home page
            ////if (Roles.IsUserInRole(User.Identity.Name.ToString(), "Admin"))
            ////{
            ////    Response.Redirect("~/Admin/addCustomer.aspx");
            ////}

            ////else if (Roles.IsUserInRole(User.Identity.Name.ToString(), "Technician"))
            ////{
            ////    Response.Redirect("~/Technician/technician.aspx");
            ////}
            ////else if (Roles.IsUserInRole(User.Identity.Name.ToString(), "SupportOfficer"))
            ////{
            ////    Response.Redirect("~/SupportOfficer/SupportOfficerHomePage.aspx");
            ////}

            
        }

       

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get value of third column. Index is zero based, to 
                // get text of third column we use Cells[2].Text
                string AccountStatus = (e.Row.Cells[2].Text.ToString());

                if (AccountStatus == "Inactive")
                {
                    //logouts out user upon redirection
                    FormsAuthentication.SignOut();
                    Response.Redirect("~/disabled.aspx");
                }

                else if (AccountStatus == "Active")
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
    }
}