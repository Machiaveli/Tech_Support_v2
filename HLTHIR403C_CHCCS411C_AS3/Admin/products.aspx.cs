﻿/* Author: Eunice Yeh - 6100439115
 * Last Edit: 19/11/2015
 * 
 * Purpose: This page allows admins to view all products, search by product ID, and manage products. All fields are validated.
 * Known bugs: "Enter" key has been disabled completely instead of only when editing a row.
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
    public partial class products : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            gvProducts.Visible = true;
            gvResults.Visible = false;
            lblMatch.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //return results in gridview once search button is clicked
            try
            {
                gvResults.DataSourceID = "sqlProductSearch";
                gvResults.DataBind();
                lblMatch.Text = "The following products matched your search: ";
                lblMatch.Visible = true;
                gvProducts.Visible = false;
                gvResults.Visible = true;
            }
            catch (Exception ex)
            {
                lblMatch.Text = ex.Message;
                lblMatch.Visible = true;
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //disable enter button so that it doesn't fire the "search" button when user hits enter while updating rows in gridview
            btnSearch.UseSubmitBehavior = false;

        }

        protected void gvResults_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.Enabled = false;
            gvProducts.Visible = false;
            gvResults.Visible = true;
            btnSearch.UseSubmitBehavior = false;
        }

        protected void gvResults_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //once the item is updated, redirect to list of all products
            Response.Redirect("products.aspx");
        }

    }
}