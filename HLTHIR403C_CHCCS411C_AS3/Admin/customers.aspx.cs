/* Author: Kevin Ewald - 8103677414, Sasha Graham - 5105498214, Eunice Yeh - 6100439115
 * Last Edit: 12/11/2015
 * 
 * Purpose: 
 * Allows Admin users to list all customers, and also search for specific customers based on customer last name or customer ID. Once a customer has been selected
 * from the returned search query, this page will also display a list of all previous incidents linked to the selected customer, as well as give the user a list of
 * all products the user has registered. The user can then click the 'ARegister Product' button in order to register a product to a particular user.
 * 
 * Author: Eunice Yeh - 6100439115
 * Last Edit: 26/11/2015
 * Edited: Added regex and validation to customers page
 * 
 * 
 * Author: Sasha Graham - 5105498214
 * Last Edit: 24/11/2105
 * Edited: I changed the text boxes into dropDownLists in edit mode. And made the default country there previous country and default state their previous state.
 *         I also linked the state dropDownList with the countries dropDownList so that when a country is changed, the states will change to the states in that country.
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
        TextBox txtCountryName;
        TextBox txtCountries;
        TextBox txtCountry;
        DropDownList ddlCountries;
        DropDownList ddlCountryName;
        DropDownList ddlStates;
        DropDownList ddlStateName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (dropDownSearchFilter.SelectedValue.Trim().Equals("ListAllCustomers"))
            {
                txtSearchQuery.Enabled = false;
                lblSearchRecords.ForeColor = System.Drawing.Color.Gray;
            }
            if (GridViewCustomers.SelectedIndex == -1 && GridViewDisplayCustomers.SelectedIndex == -1)
                btnRegister.Visible = false;
            else
                btnRegister.Visible = true;
            lblCustomerRegistrationResults.Visible = false;
            lblProductRegistrations.Visible = false;
            lblSelectedCustomersIncidents.Visible = false;
            labelError.Visible = false;
            
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

            //Session["state"] = GridViewCustomers.SelectedRow.Cells[6].Text;

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
                Session["selectedCustomer"] = GridViewCustomers.SelectedValue;
            else if (GridViewDisplayCustomers.SelectedIndex != -1)
                Session["selectedCustomer"] = GridViewDisplayCustomers.SelectedValue;
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
            
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridViewCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
                
                GridViewCustomers.EditIndex = e.NewEditIndex;
                BindGrid();
            
        }

        private void BindGrid()
        {
            GridViewCustomers.DataSourceID = "SqlDataSource1";
            GridViewCustomers.DataBind();
        }

        //private void BindGridView()
        //{
        //    GridViewDisplayCustomers.DataSourceID = "SqlDataSource1";
        //    GridViewDisplayCustomers.DataBind();
        //}

        protected void GridViewCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCustomers.EditIndex = -1;
            BindGrid();
        }

        // Sets the dataSource for dropDownList countries when in edit mode. Searches for the value of the country, and then I have done a select query for dropDownList states
        // where the countryCode matches the value of countries in the country dropDownList. And made the selected value for both dropDownLists the same as the origional value
        // - Sasha Graham
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
                    txtCountry = (TextBox)e.Row.FindControl("txtCountries");
                    ListItem match = ddlCountries.Items.FindByText(txtCountry.Text);
                    ddlCountries.SelectedValue = match.Value;

                    ddlStates = (DropDownList)e.Row.FindControl("ddlStates");
                    DropDownList ddlStateName = (DropDownList)e.Row.FindControl("ddlStateName");

                    string query = "SELECT StateName, StateCode FROM States INNER JOIN Countries ON States.CountryCode = Countries.CountryCode WHERE Countries.CountryCode=" + "'" + match.Value + "'";
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
                                    ddlStateName.Items.Add(item);
                                }
                            }
                            con.Close();
                        }
                    }
                    TextBox txtStateName = (TextBox)e.Row.FindControl("txtStateName");
                    string state = txtStateName.Text.Trim();
                    ListItem matchState = ddlStates.Items.FindByText(state);
                    ddlStateName.SelectedValue = matchState.Value;

                }
            }
        }

        // When the index is changed in dropDownList countries, I get the new selected value and do another select query for the dropDownList States and add the states to the
        // dropDownList where the new value of countries selected matches the countryCode in States. - Sasha Graham
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCountries = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlCountries.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    
                    string country = ddlCountries.SelectedValue;

                    DropDownList ddlStates = (DropDownList)row.FindControl("ddlStates");
                    ddlStates.Items.Clear();
                    

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


        protected void ddlCountries_Load(object sender, EventArgs e)
        {
            DropDownList ddlCountries = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlCountries.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    if (ddlCountries.Items == null)
                    {
                        ddlCountries.Items.Add(txtCountries.Text);
                    }
                    
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
            
        }

        // Find the control for all the textboxes and dropDownLists and do an update query with the parameters of the textboxes and dropDownLists - Sasha Graham
        protected void GridViewCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TextBox firstName = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtFirstName");
                TextBox lastName = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtLastName");
                TextBox city = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtCity");
                TextBox address = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtAddress");
                TextBox zipCode = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtZipCode");
                TextBox phone = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtPhone");
                TextBox email = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtEmail");
                DropDownList accountStatus = (DropDownList)GridViewCustomers.Rows[e.RowIndex].FindControl("ddlAccountStatus");
                DropDownList ddlStates = (DropDownList)GridViewCustomers.Rows[e.RowIndex].FindControl("ddlStates");
                TextBox customerID = (TextBox)GridViewCustomers.Rows[e.RowIndex].FindControl("txtCustomerID");


                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                Conn.Open();

                string sqlQuery = "UPDATE [Customers] SET [FirstName] = @FirstName,  [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State," +
                            " [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email, [AccountStatus] = @AccountStatus WHERE [CustomerID] = @CustomerID";

                SqlCommand cmd = new SqlCommand(sqlQuery, Conn);

                cmd.Parameters.AddWithValue("@CustomerID", customerID.Text);
                cmd.Parameters.AddWithValue("@FirstName", firstName.Text);
                cmd.Parameters.AddWithValue("@LastName", lastName.Text);
                cmd.Parameters.AddWithValue("@Address", address.Text);
                cmd.Parameters.AddWithValue("@City", city.Text);
                cmd.Parameters.AddWithValue("@State", ddlStates.SelectedValue);
                cmd.Parameters.AddWithValue("@ZipCode", zipCode.Text);
                cmd.Parameters.AddWithValue("@Phone", phone.Text);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                cmd.Parameters.AddWithValue("@AccountStatus", accountStatus.SelectedValue);


                cmd.ExecuteNonQuery();

                 Conn.Close();
                 Response.Redirect("customers.aspx");
                 labelError.Visible = false;

            }
            catch (Exception ex)
            {
                labelError.Text = ex.Message;
                labelError.Visible = true;
            }
            
        }

        // When the index is changed in dropDownList countries, I get the new selected value and do another select query for the dropDownList States and add the states to the
        // dropDownList where the new value of countries selected matches the countryCode in States. - Sasha Graham
        protected void ddlCountryName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCountries = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlCountries.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {

                    string country = ddlCountries.SelectedValue;

                    DropDownList ddlStates = (DropDownList)row.FindControl("ddlStates");
                    ddlStates.Items.Clear();


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

        protected void ddlCountryName_Load(object sender, EventArgs e)
        {
            DropDownList ddlCountries = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlCountries.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    if (ddlCountries.Items == null)
                    {
                        ddlCountries.Items.Add(txtCountries.Text);
                    }

                }
            }
        }

        // Find the control for all the textboxes and dropDownLists and do an update query with the parameters of the textboxes and dropDownLists - Sasha Graham
        protected void GridViewDisplayCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TextBox firstName = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtFirstName");
                TextBox lastName = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtLastName");
                TextBox city = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtCity");
                TextBox address = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtAddress");
                TextBox zipCode = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtZipCode");
                TextBox phone = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtPhone");
                TextBox email = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtEmail");
                DropDownList accountStatus = (DropDownList)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("ddlAccountStatus");
                DropDownList ddlStates = (DropDownList)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("ddlStates");
                TextBox customerID = (TextBox)GridViewDisplayCustomers.Rows[e.RowIndex].FindControl("txtCustomerID");


                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                Conn.Open();

                string sqlQuery = "UPDATE [Customers] SET [FirstName] = @FirstName,  [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State," +
                            " [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email, [AccountStatus] = @AccountStatus WHERE [CustomerID] = @CustomerID";

                SqlCommand cmd = new SqlCommand(sqlQuery, Conn);

                cmd.Parameters.AddWithValue("@CustomerID", customerID.Text);
                cmd.Parameters.AddWithValue("@FirstName", firstName.Text);
                cmd.Parameters.AddWithValue("@LastName", lastName.Text);
                cmd.Parameters.AddWithValue("@Address", address.Text);
                cmd.Parameters.AddWithValue("@City", city.Text);
                cmd.Parameters.AddWithValue("@State", ddlStates.SelectedValue);
                cmd.Parameters.AddWithValue("@ZipCode", zipCode.Text);
                cmd.Parameters.AddWithValue("@Phone", phone.Text);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                cmd.Parameters.AddWithValue("@AccountStatus", accountStatus.SelectedValue);


                cmd.ExecuteNonQuery();

                Conn.Close();
                Response.Redirect("customers.aspx");


            }
            catch (Exception ex)
            {
                labelError.Text = ex.Message;
            }
        }

        // Sets the dataSource for dropDownList countries when in edit mode. Searches for the value of the country, and then I have done a select query for dropDownList states
        // where the countryCode matches the value of countries in the country dropDownList. And made the selected value for both dropDownLists the same as the origional value
        // - Sasha Graham
        protected void GridViewDisplayCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    ddlCountries = (DropDownList)e.Row.FindControl("ddlCountries");
                    ddlCountries.DataSourceID = "SqlDataSource5";
                    ddlCountries.DataValueField = "CountryCode";
                    ddlCountries.DataTextField = "Name";
                    ddlCountries.DataBind();
                    txtCountry = (TextBox)e.Row.FindControl("txtCountries");
                    ListItem match = ddlCountries.Items.FindByText(txtCountry.Text);
                    ddlCountries.SelectedValue = match.Value;

                    ddlStates = (DropDownList)e.Row.FindControl("ddlStates");
                    DropDownList ddlStateName = (DropDownList)e.Row.FindControl("ddlStateName");

                    string query = "SELECT StateName, StateCode FROM States INNER JOIN Countries ON States.CountryCode = Countries.CountryCode WHERE Countries.CountryCode=" + "'" + match.Value + "'";
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
                                    ddlStateName.Items.Add(item);
                                }
                            }
                            con.Close();
                        }
                    }
                    TextBox txtStateName = (TextBox)e.Row.FindControl("txtStateName");
                    string state = txtStateName.Text.Trim();
                    ListItem matchState = ddlStates.Items.FindByText(state);
                    ddlStateName.SelectedValue = matchState.Value;

                }
            }
        }

        protected void GridViewDisplayCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridViewDisplayCustomers.EditIndex = e.NewEditIndex;
            //BindGrid();
        }

    }
}