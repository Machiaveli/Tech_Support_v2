/* Author: Sasha Graham - 5105498214
 * Last Edit: 11/2/2015
 * 
 * Purpose: 
 * 
 * 
 * Edit: Eunice Yeh - 6100439115
 * Added search bar and search function, as well as ability to edit after search
 * Date: 01/11/2015
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
        object selectedCustID = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (dropDownSearchFilter.SelectedValue.Trim().Equals("ListAllCustomers"))
            {
                txtSearchQuery.Enabled = false;
                lblSearchRecords.ForeColor = System.Drawing.Color.Gray;
            }
            btnRegister.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear the current datasourceID
            GridViewDisplayCustomers.DataSourceID = "";
            // binds the correct data source to the correct GridView depending on the dropdownlist Selection
            if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerID"))
            {
                GridViewDisplayCustomers.DataSourceID = "DataSourceSearchCustByID";
                GridViewDisplayCustomers.DataBind();
                GridViewCustomers.Visible = false;
                GridViewDisplayCustomers.Visible = true;
                lblCustomerRegistrationResults.Visible = true;
                GridViewDisplayCustomers.SelectedIndex = -1;
                GridViewCustomers.SelectedIndex = -1;
            }

            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerLastName"))
            {
                GridViewDisplayCustomers.DataSourceID = "DataSourceSearchCustByLastName";
                GridViewDisplayCustomers.DataBind();
                GridViewCustomers.Visible = false;
                GridViewDisplayCustomers.Visible = true;
                lblCustomerRegistrationResults.Visible = true;
                GridViewDisplayCustomers.SelectedIndex = -1;
                GridViewCustomers.SelectedIndex = -1;
            }
            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("ListAllCustomers"))
            {
                GridViewCustomers.Visible = true;
                GridViewDisplayCustomers.Visible = false;
                lblCustomerRegistrationResults.Visible = false;
                GridViewDisplayCustomers.SelectedIndex = -1;
                GridViewCustomers.SelectedIndex = -1;
            }
        }

        protected void dropDownSearchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
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
                lblSearchRecords.ForeColor = System.Drawing.Color.Yellow;
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

            if (GridViewDisplayCustomers.SelectedIndex != -1)
                btnRegister.Visible = true;
            else
                btnRegister.Visible = false;
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.DataSourceID = "";

            DetailsView1.DataSourceID = "DataSourceUpperGridViewSelectedCustomer";
            DetailsView1.DataBind();

            if (GridViewCustomers.SelectedIndex != -1)
                btnRegister.Visible = true;
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