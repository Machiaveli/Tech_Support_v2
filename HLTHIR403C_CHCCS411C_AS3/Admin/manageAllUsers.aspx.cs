/*
 * Author: Yusuf Bhyat - 4105558614
 *  Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
 *  This page is used by the Admin to manage all users accounts
 *  Known bugs: Allows fields to be updated with null value, even with validator (suspected to be database problem) 
 *              
 *  Version: 1.0
  
 * Edit: Eunice Yeh - 6100439115
 * Added search bar and search function, as well as ability to edit after search
 * Last Edit Date: 03/11/2015
 * 
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3.AccountManagement
{
    public partial class manageAllUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear the current datasourceID
            GridViewDisplayUsers.DataSourceID = "";
            // binds the correct data source to the correct GridView depending on the dropdownlist Selection
            if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("userID"))
            {
                GridViewDisplayUsers.DataSourceID = "sqlSearchUserID";
                GridViewDisplayUsers.DataBind();
                GridView1.Visible = false;
                GridViewDisplayUsers.Visible = true;
                lblMatch.Visible = true;

            }

            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("userLastName"))
            {
                GridViewDisplayUsers.DataSourceID = "sqlSearchLastName";
                GridViewDisplayUsers.DataBind();
                GridView1.Visible = false;
                GridViewDisplayUsers.Visible = true;
                lblMatch.Visible = true;
            }
            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("ListAllUsers"))
            {
                GridView1.Visible = true;
                GridViewDisplayUsers.Visible = false;
                lblMatch.Visible = false;
            }
      
        }

        protected void dropDownSearchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dropDownSearchFilter.SelectedValue.Trim().Equals("ListAllUsers"))
            {
                lblSearch.Enabled = false;
                txtSearch.Enabled = false;
                lblSearch.ForeColor = System.Drawing.Color.Gray;
                btnSearch.Text = "Get";
            }
            else
            {
                txtSearch.Enabled = true;
                btnSearch.Text = "Search";
            }
        }
        

        // Yusuf - 4105558614
        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            
                // Retrieves updated Account Type from Gridview and updates Role in ASPNETDB
                DropDownList accountType = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
                string UserAccountType = accountType.SelectedValue.ToString();

                // Retrives value of UserID
                string userID = GridView1.Rows[GridView1.EditIndex].Cells[0].Text.ToString();


            // adds you to Admin role and remove other roles
            if (UserAccountType == "Admin")
            {
                try
                {
                    Roles.RemoveUserFromRoles(userID, Roles.GetRolesForUser(userID));
                    Roles.AddUserToRole(userID, "Admin");
                }
                catch
                {
                }
                
            }

            // adds you to Support Officer role and remove other roles
            else if (UserAccountType == "Support Officer")
            {
                try
                {
                    Roles.RemoveUserFromRoles(userID, Roles.GetRolesForUser(userID));
                    Roles.AddUserToRole(userID, "SupportOfficer");
                }
                catch
                {
                }
            }

            // adds you to technician role and remove other roles
            else if (UserAccountType == "Technician")
            {
                try
                {
                    Roles.RemoveUserFromRoles(userID, Roles.GetRolesForUser(userID));
                    Roles.AddUserToRole(userID, "Technician");
                }
                catch
                {
                }         
            }
        }


        // Yusuf - 4105558614
        protected void GridViewDisplayUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Retrieves updated Account Type from Gridview and updates Role in ASPNETDB
            DropDownList accountType = (DropDownList)GridViewDisplayUsers.Rows[e.RowIndex].FindControl("DropDownList3");
            string UserAccountType = accountType.SelectedValue.ToString();

            // Retrives value of UserID
            string userID = GridViewDisplayUsers.Rows[GridViewDisplayUsers.EditIndex].Cells[0].Text.ToString();


            // adds you to Admin role and remove other roles
            if (UserAccountType == "Admin")
            {
                try
                {
                    Roles.RemoveUserFromRoles(userID, Roles.GetRolesForUser(userID));
                    Roles.AddUserToRole(userID, "Admin");
                }
                catch
                {
                }

            }

            // adds you to Support Officer role and remove other roles
            else if (UserAccountType == "Support Officer")
            {
                try
                {
                    Roles.RemoveUserFromRoles(userID, Roles.GetRolesForUser(userID));
                    Roles.AddUserToRole(userID, "SupportOfficer");
                }
                catch
                {
                }
            }

            // adds you to technician role and remove other roles
            else if (UserAccountType == "Technician")
            {
                try
                {
                    Roles.RemoveUserFromRoles(userID, Roles.GetRolesForUser(userID));
                    Roles.AddUserToRole(userID, "Technician");
                }
                catch
                {
                }
            }

        }
    }
}