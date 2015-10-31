// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          This page allows the Admin to register new users and assign roles
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
    public partial class registration1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        // checks the select role from the dropdown on the create user wizard and 
        // runs the sql command to insert data into the techSupport DB
        protected void CreateUserWizard2_CreatedUser(object sender, EventArgs e)
        {
            try
            {
                DropDownList dropDownRole = ((DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRole"));

                if (dropDownRole.SelectedItem.Text == "Admin")
                {
                    String firstName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtFname")).Text;
                    String lastName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtLname")).Text;


                    SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();
                    SqlDataSource1.InsertParameters["UserName"].DefaultValue = CreateUserWizard2.UserName.ToString();
                    SqlDataSource1.InsertParameters["FirstName"].DefaultValue = firstName.ToString().ToLower().Trim();
                    SqlDataSource1.InsertParameters["LastName"].DefaultValue = lastName.ToString().ToLower().Trim();
                    SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Admin";

                    SqlDataSource1.Insert();

                    Roles.AddUserToRole(CreateUserWizard2.UserName, "Admin");
                }

                else if (dropDownRole.SelectedItem.Text == "Support Officer")
                {
                    String firstName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtFname")).Text;
                    String lastName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtLname")).Text;


                    SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();
                    SqlDataSource1.InsertParameters["UserName"].DefaultValue = CreateUserWizard2.UserName.ToString();
                    SqlDataSource1.InsertParameters["FirstName"].DefaultValue = firstName.ToString().ToLower().Trim();
                    SqlDataSource1.InsertParameters["LastName"].DefaultValue = lastName.ToString().ToLower().Trim();
                    SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Support Officer";

                    SqlDataSource1.Insert();

                    Roles.AddUserToRole(CreateUserWizard2.UserName, "SupportOfficer");
                }

                else if (dropDownRole.SelectedItem.Text == "Technician")
                {
                    String firstName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtFname")).Text;
                    String lastName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtLname")).Text;


                    SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();
                    SqlDataSource1.InsertParameters["UserName"].DefaultValue = CreateUserWizard2.UserName.ToString();
                    SqlDataSource1.InsertParameters["FirstName"].DefaultValue = firstName.ToString().ToLower().Trim();
                    SqlDataSource1.InsertParameters["LastName"].DefaultValue = lastName.ToString().ToLower().Trim();
                    SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Technician";

                    SqlDataSource1.Insert();

                    Roles.AddUserToRole(CreateUserWizard2.UserName, "Technician");
                }
            }


            // catches any errors
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}