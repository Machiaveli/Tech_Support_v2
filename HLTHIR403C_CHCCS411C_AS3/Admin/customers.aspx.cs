/* Author: Kevin Ewald - 8103677414, Sasha Graham - 5105498214, Eunice Yeh - 6100439115
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
using System.Data.SqlClient;
using System.Configuration;

namespace HLTHIR403C_CHCCS411C_AS3.Admin
{
    public partial class newCustomer : System.Web.UI.Page
    {
        TextBox txtCountries;
        DropDownList ddlCountries;
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

                    // deselects gridview row - Yusuf - 4105558614
                    GridViewDisplayCustomers.EditIndex = -1;

                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = true;
                    lblCustomerRegistrationResults.Text = "Customer ID '" + txtSearchQuery.Text + "' Returned " + ReturnedResultRowCount(DataSourceSearchCustByID) + " Result(s)";
                    GridViewDisplayCustomers.SelectedIndex = -1;
                    GridViewCustomers.SelectedIndex = -1;
                }
                catch
                {
                    lblCustomerRegistrationResults.Text = "Customer ID must be numeric. Please try again";
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

                    // deselects gridview row - Yusuf - 4105558614
                    GridViewDisplayCustomers.EditIndex = -1;

                    GridViewCustomers.Visible = false;
                    GridViewDisplayCustomers.Visible = true;
                    lblCustomerRegistrationResults.Text = "Customer Last Name '" + txtSearchQuery.Text + "' returned " + ReturnedResultRowCount(DataSourceSearchCustByLastName) + " result(s)";
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

                    // deselects gridview row - Yusuf - 4105558614
                    GridViewCustomers.EditIndex = -1;
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
                txtSearchQuery.Text = "";
            }
            else
            {
                txtSearchQuery.Enabled = true;
                btnSearch.Text = "Search";
                lblSearchRecords.ForeColor = System.Drawing.Color.White;
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

                lblSelectedCustomersIncidents.Text = "The selected customer has " + ReturnedResultRowCount(DataSourcePrevIncidentsFromGridViewDisplayCustomers) + " previous incident(s)";
                lblProductRegistrations.Text = "The selected customer has " + ReturnedResultRowCount(SqlDataSource2) + " product registration(s)";
            }
            else
                btnRegister.Visible = false;
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.DataSourceID = "";
            DetailsView1.DataSourceID = "DataSourceUpperGridViewSelectedCustomer";
            DetailsView1.DataBind();

            Session["state"] = GridViewCustomers.SelectedRow.Cells[6].Text;

            if (GridViewCustomers.SelectedIndex != -1)
            {
                lblSelectedCustomersIncidents.Visible = true;
                lblProductRegistrations.Visible = true;
                btnRegister.Visible = true;
                GridViewPreviousIncidents.DataSourceID = "";
                GridViewPreviousIncidents.DataSourceID = "DataSourcePrevIncidentsFromGridViewCustomers";
                GridViewPreviousIncidents.DataBind();

                lblSelectedCustomersIncidents.Text = "The selected customer has " + ReturnedResultRowCount(DataSourcePrevIncidentsFromGridViewCustomers) + " previous inicdent(s)";
                lblProductRegistrations.Text = "The selected customer has " + ReturnedResultRowCount(DataSourceUpperGridViewSelectedCustomer) + " product registration(s)";
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

        // returns a count of the number of results returned by an sql datasource.
        // @params: SqlDataSource
        public static int ReturnedResultRowCount(SqlDataSource dataSource)
        {
            DataView result = (DataView)dataSource.Select(DataSourceSelectArguments.Empty);
            return result.Count;
        }

        protected void GridViewCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            //Dim index = Convert.ToInt32(e.CommandArgument)
            //Dim row = ProductsGridView.Rows(index)
            //Dim labelText = CType(row.FindControl("LabelName"), Label).Text
            //if (e.CommandName == "Edit")
            //{
            //    int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            //    GridViewCustomers.EditIndex = rowIndex;
                
            //    // Re-bind the GridView to put it in edit mode
            //    GridViewCustomers.DataSourceID = "SqlDataSource1";
            //    GridViewCustomers.DataBind();

            //    // Get the row at the index. The row will be the
            //    // row reflected in edit mode.
            //    GridViewRow editRow = GridViewCustomers.Rows[rowIndex];

            //    GridViewRow row = GridViewCustomers.Rows[rowIndex];

            //    ListItem item = new ListItem();
            //    item.Text = Server.HtmlDecode(row.Cells[5].Text) + " " +
            //    Server.HtmlDecode(row.Cells[5].Text);

            //    DropDownList ddlCountries = editRow.FindControl("ddlCountries") as DropDownList;
            //    // If the contact is not already in the ListBox, add the ListItem 
            //    // object to the Items collection of the ListBox control. 
            //    if (!ddlCountries.Items.Contains(item))
            //    {
            //        ddlCountries.Items.Add(item);
            //    }
                
                
            //    // Find your DropDownLists in this edit row
                

            //}
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridViewCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
                //Label label1 = (Label)GridViewCustomers.Rows[e.NewEditIndex].FindControl("Label10");
                //string label1val = label1.Text;
                //txtCountries = (TextBox)GridViewCustomers.Rows[e.NewEditIndex].FindControl("txtCountries");
                //ddlCountries = GridViewCustomers.Rows[e.NewEditIndex].FindControl("ddlCountries") as DropDownList;
                

                //ListItem item = new ListItem();
                //item.Text = Server.HtmlDecode(row.Cells[5].Text) + " " +
                //    Server.HtmlDecode(row.Cells[5].Text);
                //if (!ddlCountries.Items.Contains(item))
                //{
                //    ddlCountries.Items.Add(txtCountries.ToString());
                //}
                //if (ddlCountries.Items == null)
                //{
                //    ddlCountries.Items.Add(txtCountries.ToString());
                //}
                GridViewCustomers.EditIndex = e.NewEditIndex;
                BindGrid();
            
        }

        private void BindGrid()
        {
            GridViewCustomers.DataSourceID = "SqlDataSource1";
            GridViewCustomers.DataBind();
        }

        protected void GridViewCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCustomers.EditIndex = -1;
            BindGrid();
        }

        protected void GridViewCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    ddlCountries = (DropDownList)e.Row.FindControl("ddlCountries");
                    ddlCountries.DataSourceID = "SqlDataSource3";
                    ddlCountries.DataValueField = "CountryCode";
                    ddlCountries.DataTextField = "Name";
                    ddlCountries.DataBind();

                    ddlCountries.SelectedValue = GridViewCustomers.DataKeys[e.Row.RowIndex].Value.ToString();
                }
            }
        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCountries = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlCountries.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    //ddlCountries.DataSourceID = "SqlDataSource3";
                    //ddlCountries.DataValueField = "CountryCode";
                    //ddlCountries.DataTextField = "Name";
                    //ddlCountries.DataBind();
                    string country = ddlCountries.SelectedValue;

                    DropDownList ddlStates = (DropDownList)row.FindControl("ddlStates");
                    //ddlStates.DataSourceID = SqlDataSource4(Convert.ToString(ddlCountries.SelectedValue);
                    //ddlStates.DataValueField = "StateCode";
                    //ddlStates.DataTextField = "StateName";
                    //ddlStates.DataBind();

                    string query = "SELECT StateName, StateCode FROM States INNER JOIN Countries ON States.CountryCode = Countries.CountryCode WHERE Countries.CountryCode=" + "'" + country + "'";
                    string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                while (sdr.Read())
                                {
                                    ListItem item = new ListItem();
                                    item.Text = sdr["StateName"].ToString();
                                    item.Value = sdr["StateCode"].ToString();
                                    ddlStates.Items.Add(item);
                                }
                            }
                            con.Close();
                        }
                    }
                    
                }
            }
            
        }

    }
}