// Author(s): Kevin Ewald - 8103677414, Yusuf Bhyat - 4105558614 
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          This is the homepage for Technicians
// Known bugs: None at the time of testing
// Version: 1.0

// Still to be completed on this page:
// Update command for after a user has selected an incident, and has selected "Edit" in the details view, i have gotten it so that the title can be updated
// however i cannot select any other fields for it to update. To see what i mean, Select "DataSourceDetailsView" and look at its properties.
// Looks at the "UpdateQuery" property and open it then select query builder. You are only able to select column from the Incidents table, meaning i can only update those.
// Let me know if you have any questions or find a solution, - Kevin 

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HLTHIR403C_CHCCS411C_AS3.Technician
{
    public partial class technician : System.Web.UI.Page
    {
        // gets login user details and stores in hidden label
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserName.Visible = false;
            lblUserName.Text = User.Identity.Name.ToString();
            UserID.Text = User.Identity.Name.ToString();
            tableIncidentsHistory.Visible = false;
        }

        // refreshes grid view and unselects row
        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            //GridView1.DataBind();
            //GridView1.SelectRow(-1);
        }


        protected void dropDownFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            // clear the current datasource to avoid potential errors
            GridViewIncidentsDisplay.DataSourceID = "";

            // assign new datasourceID based on selected filter
            if (dropDownFilter.SelectedValue.ToString().Trim().Equals("ListMyOpenIncidents"))
            {
                GridViewIncidentsDisplay.DataSourceID = "DataSourceMyOpenIncidents";
                lblDisplayedInfoMessage.Text = "Your Open Incidents";
            }

            else if (dropDownFilter.SelectedValue.ToString().Trim().Equals("ListMyClosedIncidents"))
            {
                GridViewIncidentsDisplay.DataSourceID = "DataSourceMyClosedIncidents";
                lblDisplayedInfoMessage.Text = "Your Closed Incidents";
            }

            else if (dropDownFilter.SelectedValue.ToString().Trim().Equals("ListAllOpenIncidents"))
            {
                GridViewIncidentsDisplay.DataSourceID = "DataSourceAllOpenIncidents";
                lblDisplayedInfoMessage.Text = "All Open Incidents";
            }

            else if (dropDownFilter.SelectedValue.ToString().Trim().Equals("ListAllClosedIncidents"))
            {
                GridViewIncidentsDisplay.DataSourceID = "DataSourceAllClosedIncidents";
                lblDisplayedInfoMessage.Text = "All Closed Incidents";
            }
            else if (dropDownFilter.SelectedValue.ToString().Trim().Equals("ListAllIncidentsInProgress"))
            {
                GridViewIncidentsDisplay.DataSourceID = "DataSourceAllIncidentsInProgress";
                lblDisplayedInfoMessage.Text = "All Incidents In Progress";
            }
            //Bind new data source to the GridView
            GridViewIncidentsDisplay.DataBind();
        }



             //___________\\
            //ADDED CLASSES\\
           //***************\\
          // These classes are used so that paging and sorting function works correctly. They are also in the technician.aspx file near the top.
         // Ensure that the GridView code in the thechnican.aspx file also has "OnSorting="GridViewIncidentsDisplay_Sorting" method call
        private string ConvertSortDirectionToSql(SortDirection sortDirection)
        {
            string newSortDirection = String.Empty;

            switch (sortDirection)
            {
                case SortDirection.Ascending:
                    newSortDirection = "ASC";
                    break;

                case SortDirection.Descending:
                    newSortDirection = "DESC";
                    break;
            }

            return newSortDirection;
        }

        protected void GridViewIncidentDisplay_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewIncidentsDisplay.PageIndex = e.NewPageIndex;
            GridViewIncidentsDisplay.DataBind();
        }

        protected void GridViewIncidentsDisplay_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dataTable = GridViewIncidentsDisplay.DataSource as DataTable;

            if (dataTable != null)
            {
                DataView dataView = new DataView(dataTable);
                dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

                GridViewIncidentsDisplay.DataSource = dataView;
                GridViewIncidentsDisplay.DataBind();
            }
        }

        protected void GridViewIncidentsDisplay_SelectedIndexChanged(object sender, EventArgs e)
        {
            LastModified.Text = DateTime.Now.ToString();
            IncidentHistoryID.Text = GridViewIncidentsDisplay.SelectedRow.Cells[0].Text;
            IncidentID.Text = GridViewIncidentsDisplay.SelectedValue.ToString();
            tableIncidentsHistory.Visible = true;
        }
    }
}