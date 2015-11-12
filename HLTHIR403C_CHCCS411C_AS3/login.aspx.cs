// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
// Used by logout control - this page is redirected to defaut.aspx 
// Known bugs: None at the time of testing
// Version: 1.0

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3
{
    public partial class login1 : System.Web.UI.Page
    {
        //this page is redirected to defaut.aspx at page load
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
            
        }
    }
}