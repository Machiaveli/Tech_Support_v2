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
            DataRowView drv = result[0];
            lblID.Text = "Customer ID: " + drv["CustomerID"];
            lblName.Text = "Name: " + drv["FirstName"] + " " + drv["LastName"];
            lblAddress.Text = "Address: " + drv["Address"] + ", " + drv["City"] + " " + drv["State"].ToString().Trim() + ", " + drv["ZipCode"];
            lblPhone.Text = "Phone: " + drv["Phone"];
            lblEmail.Text = "Email: " + drv["Email"];
        }
    }
}