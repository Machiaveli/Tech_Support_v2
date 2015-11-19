/* Author: Eunice Yeh - 6100439115
 * Last Edit: 19/11/2015
 * 
 * Purpose: This page allows admins to add a new product. All fields are validated.
 * Known bugs: None at time of last edit.
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
    public partial class addProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //add new product to database
        protected void InsertProduct(object sender, EventArgs e)
        {
            try
            {
                //add
                SqlDataSource1.Insert();
                //redirect to manage products page
                Response.Redirect("products.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

    }
}