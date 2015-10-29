/**
 * Bugs to be fixed:
 * Sorting creates error
 * paging creates error
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
            //lblHiddenUserName.Visible = false;
            //lblHiddenUserName.Text = User.Identity.Name.ToString();
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerID"))
            {
                try
                {
                    GridViewCustomers.DataSourceID = "";
                    GridViewCustomers.DataSource = DataSourceSearchCustByID;
                    GridViewCustomers.DataBind();
                    
                }
                catch (Exception) { }
                finally
                {
                    // switch data source
                }
            }
            else if (dropDownSearchFilter.SelectedValue.ToString().Trim().Equals("customerLastName"))
            {
                try
                {
                    GridViewCustomers.DataSourceID = "";
                    GridViewCustomers.DataSource = DataSourceSearchCustByLastName;
                    GridViewCustomers.DataBind();
                }
                catch (Exception)  { }
                finally
                {
                    // switch datasource
                }
            }
        }

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

        protected void GridViewCustomers_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            GridViewCustomers.PageIndex = e.NewPageIndex;
            GridViewCustomers.DataBind();
        }

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

        protected void btnAddIncident_Click(object sender, EventArgs e)
        {
            Session["selectedCustomer"] = GridViewCustomers.SelectedValue;
            Response.Redirect("addIncident.aspx");
        }

        

        
    }
}