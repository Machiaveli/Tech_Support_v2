// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          This page allows users to change their password
// Known bugs: None at the time of testing
// Version: 1.0

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3.AccManage
{
    // gets login username and saves it to a hidden label which is used by in gridview query
    public partial class pswReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserName.Visible = false;
            lblUserName.Text = User.Identity.Name.ToString();
        }
    }
}