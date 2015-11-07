/* Author: Sasha Graham - 5105498214
 * Last Edit: 11/2/2015
 * 
 * Purpose: 
 * 
 * 
 * Edit: Eunice Yeh - 6100439115
 * - Added search bar and search function
 * - Enabled ability to edit after search
 * - Added validation
 * Last edit: 07/11/2015
 * 

 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3.Admin
{
    public partial class newCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCustomerRegistrationResults.Visible = false;
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
                    lblCustomerRegistrationResults.Text = "The following customers matched your search:";
                    lblCustomerRegistrationResults.Visible = true;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message + " Please ensure that you have entered a valid customer ID.";
                    lblCustomerRegistrationResults.Visible = true;
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = false;
                    btnRegister.Visible = false;
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
                    lblCustomerRegistrationResults.Text = "The following customers matched your search:";
                    lblCustomerRegistrationResults.Visible = true;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message;
                    lblCustomerRegistrationResults.Visible = true;
                }
            }
            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("ListAllCustomers"))
            {

                try
                {
                    GridViewCustomers.Visible = true;
                    GridViewDisplayCustomers.Visible = false;
                    lblCustomerRegistrationResults.Text = "The following customers matched your search:";
                    lblCustomerRegistrationResults.Visible = false;
                }
                catch (Exception ex)
                {
                    lblCustomerRegistrationResults.Text = ex.Message;
                    lblCustomerRegistrationResults.Visible = true;
                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = false;
                    btnRegister.Visible = false;
                }
            }
        }

        protected void dropDownSearchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dropDownSearchFilter.SelectedValue.Trim().Equals("ListAllCustomers"))
            {
                lblSearchRecords.Enabled = false;
                lblSearchRecords.ForeColor = System.Drawing.Color.Gray;
                btnSearch.Text = "Get";
            }
            else
            {
                txtSearchQuery.Enabled = true;
                lblSearchRecords.ForeColor = System.Drawing.Color.White;
                btnSearch.Text = "Search";
            }
        }

        protected void GridViewDisplayCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get customer ID and show grid of previous incidents based on this

        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Session["selectedCustomer"] = GridViewDisplayCustomers.SelectedValue;
            Response.Redirect("link.aspx");
        }

        protected void txtSearchQuery_TextChanged(object sender, EventArgs e)
        {

        }


    }
}