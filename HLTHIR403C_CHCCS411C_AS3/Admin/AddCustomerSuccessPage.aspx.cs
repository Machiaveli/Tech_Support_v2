/**
 * Author(s): Kevin Ewald - 8103677414
 * Purpose: Display a message to the user indicating the success or failure of the add customer operation. If successful, this page will also display
 *          a summary of the added customers details.
 * 
 * Last Edited: 16/11/2015
 * Known Bugs: None
 * */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HLTHIR403C_CHCCS411C_AS3.Admin
{
    public partial class AddCustomerSuccessPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            DataView result = (DataView)DataSourceAddedCustomerDetails.Select(DataSourceSelectArguments.Empty);
            if (result.Count > 0) // checks how many rows were returned by the sql query (should be 1 if customer was added successfully)
            {
                lblH1.ForeColor = System.Drawing.Color.White;
                lblH1.Text = "Customer Successfully Added!";
                DataRowView drv = result[0];
                lblID.Text = "Customer ID: " + drv["CustomerID"];
                lblName.Text = "Name: " + drv["FirstName"] + " " + drv["LastName"];
                lblAddress.Text = "Address: " + drv["Address"] + ", " + drv["City"] + " " + drv["State"].ToString().Trim() + ", " + drv["ZipCode"];
                lblPhone.Text = "Phone: " + drv["Phone"];
                lblEmail.Text = "Email: " + drv["Email"];
            }
            else
            {
                lblH1.ForeColor = System.Drawing.Color.Red;
                lblH1.Text = "An Error Occured While Attempting to Add the Customer!";
                lblID.Visible = false;
                lblName.Visible = false;
                lblAddress.Visible = false;
                lblPhone.Visible = false;
                lblEmail.Visible = false;
            }
        }
    }
}