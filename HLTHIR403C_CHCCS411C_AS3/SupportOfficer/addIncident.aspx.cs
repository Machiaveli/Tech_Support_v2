/**
 * Author: Sasha Graham - 5105498214
 * 
 * Purpose: Allows the user to register a new incident for a customer
 * 
 * Known Bugs: None
 * 
 * Edited: Kevin Ewald - 8103677414
 * Changed: made the userID be stored in a hidden label rather than a visible drop down list (removed drop down list)
 * Added: Made page automatically redirect if customerID was not found in session variable (to stop users from manually navigating to the page)
 * */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HLTHIR403C_CHCCS411C_AS3.SupportOfficer
{
    public partial class addIncident : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCurrentUser.Visible = false;
            lblCurrentUser.Text = User.Identity.Name.ToString();
        }

        protected void btnAddIncident_Click(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            DropDownList2.Items.Clear();
            DropDownList2.DataSourceID = "SqlDataSource2";
            DropDownList2.DataBind();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
        }


    }
}