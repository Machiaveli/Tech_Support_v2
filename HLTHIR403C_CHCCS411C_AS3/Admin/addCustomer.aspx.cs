/**
 * Author: Sasha Graham - 5105498214
 * 
 * Purpose: Allows the user to add a new customer to the database. Cannot add a new customer with the same email as someone else.
 *          added validation and regex.
 * 
 * Known Bugs: None
 * */

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
    public partial class addCustomer : System.Web.UI.Page
    {
        // On page load event, I query the db to get the stateNames to put into the dropDownList for states with the value of the stateCode
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "SELECT StateName, StateCode FROM States";
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
                            dLStates.Items.Add(item);
                        }
                    }
                    con.Close();
                }
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            
        }

        protected void dLCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            dLStates.Items.Clear(); // Clear the dropDownList
            dLStates.DataSourceID = "SqlDataSource2"; // Link to the chosen dataSourceID
            dLStates.DataBind(); // Bind it to the dropDownList
        }

        protected void InsertCustomer(object sender, EventArgs e)
        {

        }

    }
}