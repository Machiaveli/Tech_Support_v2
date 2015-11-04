<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addCustomer.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.addCustomer" %>

<script runat="server">
private void InsertCustomer (object source, EventArgs e) {
    try
    {
        SqlDataSource3.Insert();
        Response.Redirect("customers.aspx");
    }
    catch (Exception)
    {
        lblError.Text = "The person you are trying to insert already exists in the database.";
    }
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 245px;
        }
        .auto-style5 {
            width: 245px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 245px;
            height: 29px;
        }
        .auto-style8 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="dLCountries" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CountryCode" AutoPostBack="True" OnSelectedIndexChanged="dLCountries_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldCountries" runat="server" ControlToValidate="dLCountries" ErrorMessage="You must select a country" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CountryCode], [Name] FROM [Countries] ORDER BY [Name]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="You must enter a first name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="You must enter a last name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="You must enter an address" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldCity" runat="server" ControlToValidate="txtCity" ErrorMessage="You must enter a city" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="dLStates" runat="server" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateCode" AutoPostBack="True">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldState" runat="server" ControlToValidate="dLStates" ErrorMessage="You must select a state" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StateCode], [CountryCode], [StateName] FROM [States] WHERE ([CountryCode] = @CountryCode) ORDER BY [StateName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dLCountries" Name="CountryCode" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblZipCode" runat="server" Text="Zip Code:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldZipCode" runat="server" ControlToValidate="txtZipCode" ErrorMessage="You must enter a zip code" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="You must enter a phone number" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter an email address" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
                <td class="auto-style4"><asp:button
           id="btnAddCustomer"
           runat="server"
           text="Add Customer"
           onclick="InsertCustomer" />

    
                </td>
                <td>
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
    <br />
    <br />
</asp:Content>
