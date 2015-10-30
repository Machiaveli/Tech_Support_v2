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

       

        protected void CreateUserWizard2_CreatedUser(object sender, EventArgs e)
        {
            //SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();
            //SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Technician";
            //SqlDataSource1.Insert();



            ////SqlDataSource1.InsertParameters.Add("FirstName", "username1");
            ////SqlDataSource1.InsertParameters.Add("UserType", "technician");

            ////SqlDataSource1.DataBind();
            ////SqlDataSource1.Insert();

            //Roles.AddUserToRole(CreateUserWizard2.UserName, "Technician");

            DropDownList dropDownRole = (DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRole");

            if (dropDownRole.SelectedItem.Text == "Admin")
            {
                String fName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtFname")).Text;
                String lName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtLname")).Text;
                
                SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();
                SqlDataSource1.InsertParameters["UserName"].DefaultValue = CreateUserWizard2.UserName.ToString();
                SqlDataSource1.InsertParameters["FirstName"].DefaultValue = fName.ToString();
                SqlDataSource1.InsertParameters["LastName"].DefaultValue = lName.ToString();
                SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Admin";

                SqlDataSource1.Insert();

                Roles.AddUserToRole(CreateUserWizard2.UserName, "Admin");
            }

            else if (dropDownRole.SelectedItem.Text == "Support Officer")
            {
                String fName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtFname")).Text;
                String lName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtLname")).Text;

                SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();
                SqlDataSource1.InsertParameters["UserName"].DefaultValue = CreateUserWizard2.UserName.ToString();
                SqlDataSource1.InsertParameters["FirstName"].DefaultValue = fName.ToString();
                SqlDataSource1.InsertParameters["LastName"].DefaultValue = lName.ToString();
                SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Support Officer";

                SqlDataSource1.Insert();

                Roles.AddUserToRole(CreateUserWizard2.UserName, "SupportOfficer");
            }
            
            else if (dropDownRole.SelectedItem.Text == "Technician")
            {
                String fName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtFname")).Text;
                String lName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtLname")).Text;

                SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();
                SqlDataSource1.InsertParameters["UserName"].DefaultValue = CreateUserWizard2.UserName.ToString();
                SqlDataSource1.InsertParameters["FirstName"].DefaultValue = fName.ToString();
                SqlDataSource1.InsertParameters["LastName"].DefaultValue = lName.ToString();
                SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Technician";

                SqlDataSource1.Insert();

                Roles.AddUserToRole(CreateUserWizard2.UserName, "Technician");
            }
        }

        

        

       
    }
}