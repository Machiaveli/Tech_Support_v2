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

        protected void InsertProduct(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Insert();
                Response.Redirect("products.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

    }
}