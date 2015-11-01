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
            
        }

        //protected void linkInsert_Click(object sender, EventArgs e)
        //{
        //    SqlDataSource1.InsertParameters["FirstName"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtfName")).Text;

        //    SqlDataSource1.InsertParameters["LastName"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtlName")).Text;

        //    SqlDataSource1.InsertParameters["Address"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtAddress")).Text;

        //    SqlDataSource1.InsertParameters["City"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtCity")).Text;

        //    SqlDataSource1.InsertParameters["State"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtState")).Text;

        //    SqlDataSource1.InsertParameters["ZipCode"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtZipCode")).Text;

        //    SqlDataSource1.InsertParameters["Phone"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtPhone")).Text;

        //    SqlDataSource1.InsertParameters["Email"].DefaultValue =
        //        ((TextBox)GridView1.FooterRow.FindControl("txtEMail")).Text;

        //    SqlDataSource1.Insert();

 
        //}

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

            }

            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerLastName"))
            {
                GridViewDisplayCustomers.DataSourceID = "DataSourceSearchCustByLastName";
                GridViewDisplayCustomers.DataBind();
                GridViewCustomers.Visible = false;
                GridViewDisplayCustomers.Visible = true;
                lblCustomerRegistrationResults.Visible = true;
            }
            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("ListAllCustomers"))
            {
                GridViewCustomers.Visible = true;
                GridViewDisplayCustomers.Visible = false;
                lblCustomerRegistrationResults.Visible = false;
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
                lblSearchRecords.ForeColor = System.Drawing.Color.Yellow;
                btnSearch.Text = "Search";
            }
        }

        protected void GridViewDisplayCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get customer ID and show grid of previous incidents based on this
        }


    }
}