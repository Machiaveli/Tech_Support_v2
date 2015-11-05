/* Author: Eunice Yeh - 6100439115
 * Last Edit: 05/11/2015
 * 
 * Purpose: This page allows admins to view all products, search by product ID, and manage products. All fields are validated.
 * Known bugs: Pressing "enter" while updating fires btnSearch instead of update.
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
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvProducts.Visible = false;
            gvSearch.Visible = true;
        }

        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}