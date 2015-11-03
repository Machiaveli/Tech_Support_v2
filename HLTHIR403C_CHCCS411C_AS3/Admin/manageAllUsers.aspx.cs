 /*
  * Author: Yusuf Bhyat - 4105558614
  *  Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
  *  This page is used by the Admin to manage all users accounts
  *  Known bugs: None at the time of testing
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
    }
}