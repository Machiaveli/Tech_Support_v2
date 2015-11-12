/* Author: Sasha Graham - 5105498214, Eunice Yeh - 6100439115, Kevin Ewald - 8103677414
 * Last Edit: 12/11/2015
 * 
 * Purpose: 
 * Allows Admin users to list all customers, and also search for specific customers based on customer last name or customer ID. Once a customer has been selected
 * from the returned search query, this page will also display a list of all previous incidents linked to the selected customer, as well as give the user a list of
 * all products the user has registered. The user can then click the 'ARegister Product' button in order to register a product to a particular user.
 * 
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HLTHIR403C_CHCCS411C_AS3.Admin
{
    public partial class newCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (dropDownSearchFilter.SelectedValue.Trim().Equals("ListAllCustomers"))
            {
                txtSearchQuery.Enabled = false;
                lblSearchRecords.ForeColor = System.Drawing.Color.Gray;
            }
            btnRegister.Visible = false;
            lblCustomerRegistrationResults.Visible = false;
            lblProductRegistrations.Visible = false;
            lblSelectedCustomersIncidents.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear the current datasourceID
            GridViewDisplayCustomers.DataSourceID = "";
            // binds the correct data source to the correct GridView depending on the dropdownlist Selection
            if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerID"))
            {
                lblCustomerRegistrationResults.Visible = true;
                lblProductRegistrations.Visible = false;
                lblSelectedCustomersIncidents.Visible = false;

                try
                {
                    GridViewDisplayCustomers.DataSourceID = "DataSourceSearchCustByID";
                    GridViewDisplayCustomers.DataBind();
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = true;
                    lblCustomerRegistrationResults.Text = "The following customers matched your search: ";
                    GridViewDisplayCustomers.SelectedIndex = -1;
                    GridViewCustomers.SelectedIndex = -1;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message + " Please ensure that you have entered a valid customer ID.";
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = false;
                    btnRegister.Visible = false;
                }
            }

            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerLastName"))
            {
                lblCustomerRegistrationResults.Visible = true;
                lblProductRegistrations.Visible = false;
                lblSelectedCustomersIncidents.Visible = false;

                try
                {
                    GridViewDisplayCustomers.DataSourceID = "DataSourceSearchCustByLastName";
                    GridViewDisplayCustomers.DataBind();
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = true;
                    lblCustomerRegistrationResults.Text = "The following customers matched your search: ";
                    GridViewDisplayCustomers.SelectedIndex = -1;
                    GridViewCustomers.SelectedIndex = -1;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message;
                    lblCustomerRegistrationResults.Text = "The following customers matched your search: ";

                }
            }
            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("ListAllCustomers"))
            {
                try
                {
                    GridViewCustomers.Visible = true;
                    GridViewDisplayCustomers.Visible = false;
                    lblCustomerRegistrationResults.Visible = false;
                    lblProductRegistrations.Visible = false;
                    lblSelectedCustomersIncidents.Visible = false;
                    GridViewDisplayCustomers.SelectedIndex = -1;
                    GridViewCustomers.SelectedIndex = -1;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message;
                    lblCustomerRegistrationResults.Visible = true;
                    lblProductRegistrations.Visible = false;
                    lblSelectedCustomersIncidents.Visible = false;
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = false;
                    btnRegister.Visible = false;
                }
            }
        }

        protected void dropDownSearchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCustomerRegistrationResults.Visible = false;
            lblProductRegistrations.Visible = false;
            lblSelectedCustomersIncidents.Visible = false;


            if (dropDownSearchFilter.SelectedValue.Trim().Equals("ListAllCustomers"))
            {
                lblSearchRecords.Enabled = false;
                lblSearchRecords.ForeColor = System.Drawing.Color.Gray;
                btnSearch.Text = "Get";
                txtSearchQuery.Enabled = false;
            }
            else
            {
                txtSearchQuery.Enabled = true;
                lblSearchRecords.ForeColor = System.Drawing.Color.White;
                btnSearch.Text = "Search";
                txtSearchQuery.Enabled = true;
            }
        }

        protected void GridViewDisplayCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get customer ID and show grid of previous incidents based on this
            DetailsView1.DataSourceID = "";

            DetailsView1.DataSourceID = "SqlDataSource2";
            DetailsView1.DataBind();
            lblCustomerRegistrationResults.Visible = true;

            if (GridViewDisplayCustomers.SelectedIndex != -1)
            {
                lblProductRegistrations.Visible = true;
                lblSelectedCustomersIncidents.Visible = true;
                btnRegister.Visible = true;
                GridViewPreviousIncidents.DataSourceID = "";
                GridViewPreviousIncidents.DataSourceID = "DataSourcePrevIncidentsFromGridViewDisplayCustomers";
                GridViewPreviousIncidents.DataBind();
            }
            else
                btnRegister.Visible = false;
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.DataSourceID = "";
            DetailsView1.DataSourceID = "DataSourceUpperGridViewSelectedCustomer";
            DetailsView1.DataBind();

            if (GridViewCustomers.SelectedIndex != -1)
            {
                lblSelectedCustomersIncidents.Visible = true;
                lblProductRegistrations.Visible = true;
                btnRegister.Visible = true;
                GridViewPreviousIncidents.DataSourceID = "";
                GridViewPreviousIncidents.DataSourceID = "DataSourcePrevIncidentsFromGridViewCustomers";
                GridViewPreviousIncidents.DataBind();
            }
            else
                btnRegister.Visible = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (GridViewCustomers.SelectedIndex != -1)
                Session["selectedCustomer"] = GridViewCustomers.SelectedRow.Cells[0].Text;
            else if (GridViewDisplayCustomers.SelectedIndex != -1)
                Session["selectedCustomer"] = GridViewDisplayCustomers.SelectedRow.Cells[0].Text;
            else
                Session["selectedCustomer"] = null;

            Response.Redirect("link.aspx");
        }


    }
}