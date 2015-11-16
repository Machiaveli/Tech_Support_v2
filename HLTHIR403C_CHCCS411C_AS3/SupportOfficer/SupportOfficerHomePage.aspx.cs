/**
 * Author: Kevin Ewald - 8103677414 
 * Last Edit: 30/10/2015
 * 
 * Purpose: This page allows a support officer to view the incidents they have opened, as well as search
 * customer product registrations by customer ID or last name so that only customers who have registered their products can have incidents opened 
 * for technical support help.
 * 
 * Known Bugs:
 * -MINOR- When system is displaying list of customers registrations and the user switches the search filter drop down list to "List My Incidents"
 *         the label above the customers registrations disappears
 *         
 * Edited: Sasha Graham - 5105498214
 * Last Edit: 11/2/2015
 * 
 * Added: ConvertSortDirectionToSql, GridViewCustomers_PageIndexChanged, GridViewCustomers_Sorting
 * 
 * Changed: SqlDataSource - DataSourceSearchCustByLastName and DataSourceSearchCustByID, changed the sql select query.
 * 
 * Edited: Eunice Yeh - 6100439115
 * Last edit: 07/11/2015
 * - Added validation
 * */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HLTHIR403C_CHCCS411C_AS3.SupportOfficer
{
    public partial class SupportOfficerHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // get the username of the currently logged in user
            lblHiddenUserName.Text = User.Identity.Name.ToString();
            lblHiddenUserName.Visible = false;

            lblCustomerRegistrationResults.Visible = false;
            btnAddIncident.Visible = false;
            lblinactiveAccount.Visible = false;

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear the current datasourceID
            GridViewDisplayCustomers.DataSourceID = "";
            // binds the correct data source to the correct GridView depending on the dropdownlist Selection
            if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerID"))
            {
                try
                {
                    GridViewDisplayCustomers.DataSourceID = "DataSourceSearchCustByID";
                    GridViewDisplayCustomers.DataBind();
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = true;
                    lblOpenIncidents.Visible = false;
                    lblCustomerRegistrationResults.Text = "The following customers matched your search:";
                    lblCustomerRegistrationResults.Visible = true;
                }
                catch
                {
                    lblCustomerRegistrationResults.Text = "Customer ID must be numeric. Please try again";
                    lblCustomerRegistrationResults.Visible = true;
                }

            }

            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerLastName"))
            {
                try
                {
                    GridViewDisplayCustomers.DataSourceID = "DataSourceSearchCustByLastName";
                    GridViewDisplayCustomers.DataBind();
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = true;
                    lblOpenIncidents.Visible = false;
                    lblCustomerRegistrationResults.Text = "The following customers matched your search:";
                    lblCustomerRegistrationResults.Visible = true;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message;
                    lblCustomerRegistrationResults.Visible = true;
                }
            }
            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("ListMyIncidents"))
            {
                try
                {
                    GridViewCustomers.Visible = true;
                    GridViewDisplayCustomers.Visible = false;
                    DetailsView1.Visible = false;
                    lblOpenIncidents.Visible = true;
                    lblCustomerRegistrationResults.Visible = false;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message;
                    lblCustomerRegistrationResults.Visible = true;
                }
            }
        }

        // redirects to the add incident page, passing the currently selected customer to the form
        protected void btnAddIncident_Click(object sender, EventArgs e)
        {
            Response.Redirect("addIncident.aspx");
        }

        protected void dropDownSearchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSearchQuery.Text = string.Empty;
            // changes search button text, enables/disables text box and changes label color depending on dropdown list selection
            if (dropDownSearchFilter.SelectedValue.Trim().Equals("ListMyIncidents"))
            {
                txtSearchQuery.Enabled = false;
                lblSearchRecords.Enabled = false;
                lblSearchRecords.ForeColor = System.Drawing.Color.Gray;
                btnSearch.Text = "Get";
            }
            else
            {
                txtSearchQuery.Enabled = true;
                btnSearch.Text = "Search";
            }
        }

        protected void GridViewDisplayCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //store the selected cutomers ID in a session in order to auto fill the add incident page
            Session["selectedCustomer"] = GridViewDisplayCustomers.SelectedValue;
            Session["currentUser"] = lblHiddenUserName.Text.Trim();
            string accountStatus = GridViewDisplayCustomers.SelectedRow.Cells[9].Text;

            lblCustomerRegistrationResults.Visible = true;
            lblOpenIncidents.Visible = false;
            if (GridViewDisplayCustomers.SelectedIndex != -1)
            {
                if (!accountStatus.Equals("Active")) // ensures the selected customers account status is active
                {
                    lblinactiveAccount.Visible = true;
                    lblinactiveAccount.Text = "The selected customers account status is " + accountStatus;
                    btnAddIncident.Enabled = false;
                }
                else
                {
                    lblinactiveAccount.Visible = false;
                    btnAddIncident.Enabled = true;
                }
                btnAddIncident.Visible = true;
                DetailsView1.Visible = true;
            }
            else
            {
                btnAddIncident.Visible = false;
                DetailsView1.Visible = false;
            }
        }

        protected void DetailsView1_PageIndexChanged(object sender, EventArgs e)
        {
            lblCustomerRegistrationResults.Visible = true;
            lblOpenIncidents.Visible = false;
            btnAddIncident.Visible = true;
        }



        //*******CLASSES*********\\
        // changes the sort direction of the sort function between Ascending and Descending
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

        //triggered when the pageIndex is changed and binds the data to the next page
        protected void GridViewCustomers_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            GridViewCustomers.PageIndex = e.NewPageIndex;
            GridViewCustomers.DataBind();
        }

        //gets the auto generated sort expression, apends the correct sorting method (ASC / DESC) and binds it to the GridViews DataSource
        protected void GridViewCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dataTable = GridViewCustomers.DataSource as DataTable;

            if (dataTable != null)
            {
                DataView dataView = new DataView(dataTable);
                dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

                GridViewCustomers.DataSource = dataView;
                GridViewCustomers.DataBind();
            }
        }
    }
}