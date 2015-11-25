<%@ Page Title="Manage Customers" Language="C#" MasterPageFile="~/Site1.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.newCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Margin5Percent">
    &nbsp;<asp:Label ID="lblSearchRecords" runat="server" Text="Search all customers: "></asp:Label>
    &nbsp;<asp:TextBox ID="txtSearchQuery" runat="server" style="margin-bottom: 0px" Width="181px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="dropDownSearchFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropDownSearchFilter_SelectedIndexChanged">
        <asp:ListItem Value="customerLastName">Last Name</asp:ListItem>
        <asp:ListItem Value="customerID">Customer ID</asp:ListItem>
        <asp:ListItem Value="ListAllCustomers" Selected="True">List All Customers</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" />
     </div>
    <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Yellow" />
    <br />
    <asp:GridView ID="GridViewCustomers" runat="server" CssClass="GridViewStyleXLarge centered" EditRowStyle-CssClass="GridViewStyleXLarge" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridViewCustomers_RowCommand" OnRowEditing="GridViewCustomers_RowEditing" OnRowCancelingEdit="GridViewCustomers_RowCancelingEdit" OnRowDataBound="GridViewCustomers_RowDataBound" OnRowUpdating="GridViewCustomers_RowUpdating">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="CustomerID" InsertVisible="False" SortExpression="CustomerID">
                <EditItemTemplate>
                    <asp:Label ID="lblCustID" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                    <asp:TextBox ID="txtCustomerID" runat="server" Text='<%# Eval("CustomerID") %>' Visible="False"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="nameRegex1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please enter a valid first name." ForeColor="Red" ValidationExpression="^[-'a-zA-ZÀ-ÖØ-öø-ſ]+$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is a required field." ForeColor="Red" >*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="nameRegex2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please enter a valid last name." ForeColor="Red" ValidationExpression="^[-'a-zA-ZÀ-ÖØ-öø-ſ]+$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field." ForeColor="Red" >*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCity" ErrorMessage="City is a required field." ForeColor="Red" >*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Countries" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCountries" runat="server" Text='<%# Bind("Name") %>' Visible="False"></asp:TextBox>
                    <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged" OnLoad="ddlCountries_Load">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Countries] ORDER BY Name"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="State">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlStates" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlStates" ErrorMessage="State is a required field." ForeColor="Red" >*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtSelectedState" runat="server" Text='<%# Eval("State") %>' Visible="False"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="StateName" SortExpression="StateName" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="txtStateName" runat="server" Text='<%# Bind("StateName") %>'></asp:TextBox>
                    <asp:DropDownList ID="ddlStateName" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                <EditItemTemplate>
                    <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip Code is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is a required field." ForeColor="Red" >*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter a valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> *</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AccountStatus" SortExpression="AccountStatus">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlAccountStatus" runat="server" SelectedValue='<%# Bind("AccountStatus") %>'>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("AccountStatus") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" Visible="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="LinkButton1_Click"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.* FROM Customers" UpdateCommand="UPDATE Customers SET FirstName = @FirstName, LastName = @LastName, Address = @Address, City = @City, State = @State, ZipCode = @ZipCode, Phone = @Phone, Email = @Email, AccountStatus = @AccountStatus">
                        <UpdateParameters>
                            <asp:Parameter Name="FirstName" />
                            <asp:Parameter Name="LastName" />
                            <asp:Parameter Name="Address" />
                            <asp:Parameter Name="City" />
                            <asp:Parameter Name="State" />
                            <asp:Parameter Name="ZipCode" />
                            <asp:Parameter Name="Phone" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="AccountStatus" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="Edit" runat="server" CausesValidation="False" CommandName="Edit" OnClick="Edit_Click" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, States.StateName, Customers.ZipCode, Customers.Phone, Customers.Email, Customers.AccountStatus, Countries.Name FROM Customers INNER JOIN States ON Customers.State = States.StateCode INNER JOIN Countries ON States.CountryCode = Countries.CountryCode" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [AccountStatus] = @original_AccountStatus" InsertCommand="INSERT INTO [Customers] ([FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email], [AccountStatus]) VALUES (@FirstName, @LastName, @Address, @City, @State, @ZipCode, @Phone, @Email, @AccountStatus)" UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email, [AccountStatus] = @AccountStatus WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [AccountStatus] = @original_AccountStatus">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_AccountStatus" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="AccountStatus" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="AccountStatus" Type="String" />
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_AccountStatus" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="labelError" runat="server" Text="Label"></asp:Label>
    <br />
            <asp:Label ID="lblCustomerRegistrationResults" runat="server" CssClass="Margin5Percent" Font-Size="Large" Text="The following customers matched your search:"></asp:Label>

    <asp:GridView ID="GridViewDisplayCustomers" runat="server" CssClass="GridViewStyleXLarge centered" AllowPaging="True" AllowSorting="True" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="DataSourceSearchCustByLastName" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewDisplayCustomers_SelectedIndexChanged" OnRowDataBound="GridViewDisplayCustomers_RowDataBound" OnRowEditing="GridViewDisplayCustomers_RowEditing" OnRowUpdating="GridViewDisplayCustomers_RowUpdating">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <Columns>
               <asp:TemplateField HeaderText="CustomerID" InsertVisible="False" SortExpression="CustomerID">
                   <EditItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                       <asp:TextBox ID="txtCustomerID" runat="server" Text='<%# Bind("CustomerID") %>' Visible="False"></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label12" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
            <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is a required field." ForeColor="Red" >*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="nameRegex3" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please enter a valid first name." ForeColor="Red" ValidationExpression="^[-'a-zA-ZÀ-ÖØ-öø-ſ]+$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="nameRegex4" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please enter a valid last name." ForeColor="Red" ValidationExpression="^[-'a-zA-ZÀ-ÖØ-öø-ſ]+$">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="City is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Country" SortExpression="Name">
                   <EditItemTemplate>
                       <asp:TextBox ID="txtCountries" runat="server" Text='<%# Bind("Name") %>' Visible="False"></asp:TextBox>
                       <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="True" OnLoad="ddlCountryName_Load" OnSelectedIndexChanged="ddlCountryName_SelectedIndexChanged">
                       </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Countries] ORDER BY Name"></asp:SqlDataSource>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label10" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="StateName" SortExpression="StateName" Visible="False">
                   <EditItemTemplate>
                       <asp:TextBox ID="txtStateName" runat="server" Text='<%# Bind("StateName") %>'></asp:TextBox>
                       <asp:DropDownList ID="ddlStateName" runat="server">
                       </asp:DropDownList>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label11" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="State">
                <EditItemTemplate>
                    <asp:TextBox ID="txtSelectedState" runat="server" Text='<%# Bind("State") %>' Visible="False"></asp:TextBox>
                    <asp:DropDownList ID="ddlStates" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlStates" ErrorMessage="State is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                <EditItemTemplate>
                    <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip Code is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone is a required field." ForeColor="Red">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is a required field." ForeColor="Red" >*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter a valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> *</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AccountStatus" SortExpression="AccountStatus">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlAccountStatus" runat="server" SelectedValue='<%# Bind("AccountStatus") %>'>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("AccountStatus") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField ShowHeader="False" Visible="False">
                   <EditItemTemplate>
                       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                       &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                       &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
            <asp:SqlDataSource ID="DataSourceSearchCustByLastName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, States.StateName, Customers.ZipCode, Customers.Phone, Customers.Email, Customers.AccountStatus, Countries.Name FROM Customers INNER JOIN States ON Customers.State = States.StateCode INNER JOIN Countries ON States.CountryCode = Countries.CountryCode WHERE ([LastName] LIKE @LastName + '%')" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [AccountStatus] = @original_AccountStatus" InsertCommand="INSERT INTO [Customers] ([FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email], [AccountStatus]) VALUES (@FirstName, @LastName, @Address, @City, @State, @ZipCode, @Phone, @Email, @AccountStatus)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email, [AccountStatus] = @AccountStatus WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [AccountStatus] = @original_AccountStatus">
                <DeleteParameters>
                    <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_ZipCode" Type="String" />
                    <asp:Parameter Name="original_Phone" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_AccountStatus" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="AccountStatus" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="LastName" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="AccountStatus" />
                    <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_ZipCode" Type="String" />
                    <asp:Parameter Name="original_Phone" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_AccountStatus" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceSearchCustByID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, States.StateName, Customers.ZipCode, Customers.Phone, Customers.Email, Customers.AccountStatus, Countries.Name FROM Customers INNER JOIN States ON Customers.State = States.StateCode INNER JOIN Countries ON States.CountryCode = Countries.CountryCode WHERE ([CustomerID] = @CustomerID)" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email, [AccountStatus] = @AccountStatus WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [AccountStatus] = @original_AccountStatus">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="CustomerID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="AccountStatus" />
                    <asp:Parameter Name="original_CustomerID" Type="Int32" />
                    <asp:Parameter Name="original_FirstName" Type="String" />
                    <asp:Parameter Name="original_LastName" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_City" Type="String" />
                    <asp:Parameter Name="original_State" Type="String" />
                    <asp:Parameter Name="original_ZipCode" Type="String" />
                    <asp:Parameter Name="original_Phone" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_AccountStatus" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblSelectedCustomersIncidents" runat="server" CssClass="Margin5Percent" Font-Size="Large" Text="Selected customers previous incidents: "></asp:Label>
    <asp:GridView ID="GridViewPreviousIncidents" runat="server" CssClass="GridViewStyleXLarge centered" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IncidentID" DataSourceID="DataSourcePrevIncidentsFromGridViewDisplayCustomers" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
            <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
            <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="DataSourcePrevIncidentsFromGridViewCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID WHERE (Incidents.CustomerID = @selectedCustomer)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewCustomers" Name="selectedCustomer" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DataSourcePrevIncidentsFromGridViewDisplayCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.SolutionApplied, IncidentsHistory.JobStatus FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID WHERE (Incidents.CustomerID = @selectedCustomer)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewDisplayCustomers" Name="selectedCustomer" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="lblProductRegistrations" runat="server" CssClass="Margin5Percent" Text="The selected customer has the following product registrations:" Font-Size="Large"></asp:Label>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" CssClass="Margin5Percent" AllowPaging="True" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="735px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:Button ID="btnRegister" runat="server" CssClass="Margin5Percent" OnClick="btnRegister_Click" Text="Register Product" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.CustomerID, c.FirstName, c.LastName, r.ProductCode, r.RegistrationDate, p.Name, p.Version, p.ReleaseDate, p.ProductSupported FROM Customers c INNER JOIN Registrations r ON c.CustomerID = r.CustomerID INNER JOIN Products p ON r.ProductCode = p.ProductCode WHERE (c.CustomerID = @selectedCustID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewDisplayCustomers" Name="selectedCustID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DataSourceUpperGridViewSelectedCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.CustomerID, c.FirstName, c.LastName, r.ProductCode, r.RegistrationDate, p.Name, p.Version, p.ReleaseDate, p.ProductSupported FROM Customers c INNER JOIN Registrations r ON c.CustomerID = r.CustomerID INNER JOIN Products p ON r.ProductCode = p.ProductCode WHERE (c.CustomerID = @selectedCustID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewCustomers" Name="selectedCustID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
&nbsp;
</asp:Content>
