/* Author: Eunice Yeh - 6100439115
 * Last Edit: 05/11/2015
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
            gvSearch.Visible = false;
            btnSearch.UseSubmitBehavior = true;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvProducts.Visible = false;
            gvSearch.Visible = true;
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            btnSearch.UseSubmitBehavior = false;            
        
        }

        protected void gvProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            btnSearch.UseSubmitBehavior = true;
        }
    }
}