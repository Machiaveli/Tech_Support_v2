// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          login page for project and also checks if password was changed
// Known bugs: None at the time of testing
// Version: 1.0

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLTHIR403C_CHCCS411C_AS3
{
    public partial class _default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Login5_LoggedIn(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(Login5.UserName, Login5.Password))
            {
                MembershipUser user = Membership.GetUser(Login5.UserName);

                // checks if account creation date is same as lastpassword date.
                //if true, that means user never changed their password before and will be 
                // redirect to change their password

                if (user.LastPasswordChangedDate == user.CreationDate) //if true, that means user never changed their password before
                {
                    Response.Redirect("~/AccManage/pswReset.aspx");
                }
            }
        }

        

       
    }
}