// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          This page allows users to change their password
// Known bugs: None at the time of testing
// Version: 1.0

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3.AccManage
{
    // gets login username and saves it to a hidden label which is used by in gridview query - Yusuf 4105558614
    public partial class pswReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserName.Visible = false;
            lblUserName.Text = User.Identity.Name.ToString();
        }


        // gets user Account status from GridView1 - Yusuf 4105558614
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get value of third column. Index is zero based, to 
                // get text of 6th column we use Cells[5].Text
                string AccountStatus = (e.Row.Cells[5].Text.ToString());

                // if user account is disable
                if (AccountStatus == "Inactive")
                {
                    //logouts out user and redirects user to disabled.aspx page
                    FormsAuthentication.SignOut();
                    Response.Redirect("~/disabled.aspx");
                }
            }
        }
    }
}