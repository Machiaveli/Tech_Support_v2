// Author: Yusuf Bhyat - 4105558614
// Purpose: ASP.NET C# Web_Based Application - TechSupport Project 
//          This page allows the Admin to register new users and assign roles
// Known bugs: None at the time of testing
// Version: 1.0


using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
            // gets numeric last UserName and converts it to INT - Kevin
            int UserName = Convert.ToInt32( DetailsView1.Rows[0].Cells[1].Text.ToString());
            
            // increments UserName by 1 - Kevin
            UserName = UserName + 1;

            // Prefills UserName field on form with Username - Kevin 
            CreateUserWizard2.UserName = UserName.ToString();

            // Sets email label to blank on load - Yusuf - 4105558614
            ((Label)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Label5")).Text = "";
        }

       
        // checks the select role from the dropdown on the create user wizard and 
        // runs the sql command to insert data into the techSupport DB
        protected void CreateUserWizard2_CreatedUser(object sender, EventArgs e)
        {
            try
            {
                DropDownList dropDownRole = ((DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRole"));

                // The admin code is not required but left in for future requirement / features

                //if (dropDownRole.SelectedItem.Text == "Admin")
                //{
                //    // calls add new user method and insert data into TechSupportDB
                //    Add_User();
                //
                //    SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Admin";
                //    SqlDataSource1.Insert();
                //
                //    inserts role into aspnetdb
                //    Roles.AddUserToRole(CreateUserWizard2.UserName, "Admin");
                //}

                if (dropDownRole.SelectedItem.Text == "Support Officer")
                {
                    // calls add new user method and insert data into TechSupportDB
                    Add_User();

                    SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Support Officer";
                    SqlDataSource1.Insert();

                    // inserts role into aspnetdb
                    Roles.AddUserToRole(CreateUserWizard2.UserName, "SupportOfficer");
                }

                else if (dropDownRole.SelectedItem.Text == "Technician")
                {
                    // calls add new user method and insert data into TechSupportDB
                    Add_User();

                    SqlDataSource1.InsertParameters["UserType"].DefaultValue = "Technician";
                    SqlDataSource1.Insert();

                    // inserts role into aspnetdb
                    Roles.AddUserToRole(CreateUserWizard2.UserName, "Technician");
                }
            }


            // catches any errors
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            
        }

        // Adds new user method (below fields will be inserted in techsupportDB
        private void Add_User()
        {
            String firstName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtFname")).Text;
            String lastName = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("txtLname")).Text;

            SqlDataSource1.InsertParameters["UserID"].DefaultValue = CreateUserWizard2.UserName.ToString();            
            SqlDataSource1.InsertParameters["UserName"].DefaultValue = CreateUserWizard2.UserName.ToString();
            SqlDataSource1.InsertParameters["FirstName"].DefaultValue = firstName.ToString().ToLower().Trim();
            SqlDataSource1.InsertParameters["LastName"].DefaultValue = lastName.ToString().ToLower().Trim();
            SqlDataSource1.InsertParameters["Email"].DefaultValue = CreateUserWizard2.Email.ToString();
        }


        // Checks DB id email existings - Yusuf - 4105558614
        protected void Email_TextChanged(object sender, EventArgs e)
        {
            String email = ((TextBox)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Email")).Text;

            DropDownList dropDownRole = ((DropDownList)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRole"));

            

            if (!string.IsNullOrWhiteSpace(email))
            {
                
                // sets up connection to DB
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                con.Open();

                SqlCommand cmd = new SqlCommand("Select * from Users where email=@email", con);
                cmd.Parameters.AddWithValue("@email", email);


                SqlDataReader findDuplicate = cmd.ExecuteReader();


                if (findDuplicate.HasRows)
                {
                    // displays error message
                   ((Label)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Label5")).Text = "Duplicate E-Mail";

                    // disables Role Dropdown so that user cant create new user without fixing email
                   dropDownRole.Enabled = false;
                    
                }
                else
                {
                    // clears error message
                    ((Label)CreateUserWizard2.CreateUserStep.ContentTemplateContainer.FindControl("Label5")).Text = "";

                    // enables Role dropdown
                    dropDownRole.Enabled = true;
                }

                con.Close();
            }
        }
    }
}