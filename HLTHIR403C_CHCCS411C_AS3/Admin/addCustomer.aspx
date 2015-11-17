<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addCustomer.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.addCustomer" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    // Method that binds the SqlDataSource and the button with this method which allows the admin to add a new customer to the db
    private void InsertCustomer (object source, EventArgs e) 
    {
        try
        {
            SqlDataSource3.DataBind();
            SqlDataSource3.Insert();
            Session["custFirstName"] = txtFirstName.Text;
            Session["custLastName"] = txtLastName.Text;
            Session["custEmail"] = txtEmail.Text;
            Response.Redirect("AddCustomerSuccessPage.aspx");
        }
        catch (Exception)
        {
            lblError.Text = "The person you are trying to insert already exists in the database.";
        }
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 556px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
            width: 436px;
        }
        .auto-style7 {
            width: 556px;
            height: 29px;
        }
        .auto-style8 {
            height: 29px;
            width: 436px;
        }
        .auto-style9 {
            width: 436px;
        }
        .auto-style10 {
            width: 556px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Customer</h1>
    <table style="width: 500px; margin-left: auto; margin-right:auto; font-weight: 600;">
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:DropDownList ID="dLCountries" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CountryCode" AutoPostBack="True" OnSelectedIndexChanged="dLCountries_SelectedIndexChanged" Width="150px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CountryCode], [Name] FROM [Countries] ORDER BY [Name]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is a required field" ForeColor="Yellow">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtFirstName" ErrorMessage="You must enter a valid first name" ForeColor="Yellow" ValidationExpression="^[a-zA-Z]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is a required field" ForeColor="Yellow">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="You must enter a valid last name" ForeColor="Yellow" ValidationExpression="^[a-zA-Z]+$" ControlToValidate="txtLastName">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field" ForeColor="Yellow">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required field" ForeColor="Yellow">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:DropDownList ID="dLStates" runat="server" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateCode" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StateCode], [CountryCode], [StateName] FROM [States] WHERE ([CountryCode] = @CountryCode) ORDER BY [StateName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dLCountries" Name="CountryCode" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblZipCode" runat="server" Text="Zip Code:"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldZipCode" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip code is a required field" ForeColor="Yellow">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtZipCode" ErrorMessage="You must enter a valid zip code" ForeColor="Yellow" ValidationExpression="^[a-zA-Z0-9]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone number is a required field" ForeColor="Yellow">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="You must enter a valid phone number" ForeColor="Yellow" ValidationExpression="^[0-9]*$" >*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is a required field" ForeColor="Yellow">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter a valid email" ForeColor="Yellow" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> *</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
                <td class="auto-style10"><asp:button
           id="btnAddCustomer"
           runat="server"
           text="Add Customer"
           onclick="InsertCustomer" />

    
                </td>
                <td class="auto-style9">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        InsertCommand="INSERT INTO Customers(FirstName, LastName, Address, City, State, ZipCode, Phone, Email, AccountStatus) VALUES (@FirstName, @LastName, @Address, @City, @State, @ZipCode, @Phone, @Email, 'Active')" SelectCommand="SELECT * FROM [Customers]" >
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtFirstName" Name="FirstName" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtLastName" Name="LastName" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtAddress" Name="Address" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtCity" Name="City" PropertyName="Text" />
                            <asp:ControlParameter ControlID="dLStates" Name="State" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="txtZipCode" Name="ZipCode" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtPhone" Name="Phone" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="margin-left: auto; margin-right:auto; font-weight: 600; text-align:left" ForeColor="Yellow" Width="250px" />
    <br />
    <br />
    
</asp:Content>
