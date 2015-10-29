<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupportOfficerHomePage.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.SupportOfficer.SupportOfficerHomePage" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    private string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;

        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;

            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
    }

    protected void GridViewCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewCustomers.PageIndex = e.NewPageIndex;
        GridViewCustomers.DataBind();
    }

    protected void GridViewCustomers_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = GridViewCustomers.DataSource as DataTable;

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            GridViewCustomers.DataSource = dataView;
            GridViewCustomers.DataBind();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Search Records: "></asp:Label>
    <asp:TextBox ID="txtSearchQuery" runat="server" Width="181px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="dropDownSearchFilter" runat="server">
        <asp:ListItem Value="customerLastName">Customer Last Name</asp:ListItem>
        <asp:ListItem Selected="True" Value="customerID">Customer ID</asp:ListItem>
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
    <br />
    <br />&nbsp;&nbsp;&nbsp;<asp:GridView ID="GridViewCustomers" OnPageIndexChanging="GridViewCustomers_PageIndexChanged" OnSorting="GridViewCustomers_Sorting" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="DataSourceSearchCustByID" AllowPaging="True" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="RegistrationDate" HeaderText="RegistrationDate" SortExpression="RegistrationDate" />
        </Columns>
    </asp:GridView>
&nbsp;<asp:SqlDataSource ID="DataSourceListMyIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, Customers.ZipCode, Customers.Phone, Customers.Email FROM Customers INNER JOIN Registrations ON Customers.CustomerID = Registrations.CustomerID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DataSourceSearchCustByLastName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Registrations.CustomerID, Registrations.ProductCode, Registrations.RegistrationDate, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, Customers.ZipCode, Customers.Phone, Customers.Email FROM Registrations INNER JOIN Customers ON Registrations.CustomerID = Customers.CustomerID WHERE (Customers.LastName LIKE '%' + @custLastName + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearchQuery" Name="custLastName" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnAddIncident" runat="server" OnClick="btnAddIncident_Click" Text="Add Incident" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID FROM Customers INNER JOIN Registrations ON Customers.CustomerID = Registrations.CustomerID WHERE (Customers.CustomerID = @CustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewCustomers" Name="CustomerID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="DataSourceSearchCustByID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, Customers.ZipCode, Customers.Phone, Customers.Email, Registrations.ProductCode, Registrations.RegistrationDate FROM Customers INNER JOIN Registrations ON Customers.CustomerID = Registrations.CustomerID WHERE (Customers.CustomerID = @custID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearchQuery" Name="custID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="IncidentID" DataSourceID="DataSourceSelectedCustomersIncidents" Height="50px" Width="735px">
        <Fields>
            <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
            <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
            <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="DataSourceSelectedCustomersIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Customers.FirstName, Customers.LastName FROM Incidents JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID JOIN Customers ON Incidents.CustomerID = Customers.CustomerID WHERE (Incidents.CustomerID = @selectedCustID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewCustomers" Name="selectedCustID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />&nbsp;
    <asp:Label ID="lblHiddenUserName" runat="server" Text="userName"></asp:Label>
    <br />
    <br />
</asp:Content>
