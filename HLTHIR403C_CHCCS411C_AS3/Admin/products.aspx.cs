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
    }
}