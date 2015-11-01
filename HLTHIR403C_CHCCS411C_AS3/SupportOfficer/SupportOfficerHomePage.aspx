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
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            &nbsp;
            <br />
            <asp:Label ID="lblSearchRecords" runat="server" Text="Search Records: "></asp:Label>
            &nbsp;<asp:TextBox ID="txtSearchQuery" runat="server" style="margin-bottom: 0px" Width="181px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="dropDownSearchFilter" runat="server" OnSelectedIndexChanged="dropDownSearchFilter_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="customerLastName" Selected="True">Last Name</asp:ListItem>
                <asp:ListItem Value="customerID">Customer ID</asp:ListItem>
                <asp:ListItem Value="ListMyIncidents">List My Incidents</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" />
            <br />
            <br />
            <asp:Label ID="lblOpenIncidents" runat="server" Font-Size="Large" Text="Your Open Incidents"></asp:Label>
            <br />
            <asp:GridView ID="GridViewCustomers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IncidentID,Expr2" DataSourceID="DataSourceListMyIncidents" OnPageIndexChanging="GridViewCustomers_PageIndexChanged" OnSorting="GridViewCustomers_Sorting" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
                    <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
                    <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" ReadOnly="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="DataSourceListMyIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.ProductCode, Incidents.Title, Incidents.CustomerID, IncidentsHistory.LastModified, IncidentsHistory.JobStatus, IncidentsHistory.Description, IncidentsHistory.SolutionApplied, Users.UserID AS Expr2 FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID AND IncidentsHistory.UserID = Users.UserID WHERE (Users.UserName = @userName) AND (IncidentsHistory.JobStatus = 'Open')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblHiddenUserName" Name="userName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="lblCustomerRegistrationResults" runat="server" Font-Size="Large" Text="The Following Customer Registrations Matched Your Search"></asp:Label>
            <br />
            <asp:GridView ID="GridViewDisplayCustomers" runat="server" AllowPaging="True" AllowSorting="True" DataKeyNames="CustomerID" DataSourceID="DataSourceSearchCustByLastName" OnSelectedIndexChanged="GridViewDisplayCustomers_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="DataSourceSearchCustByLastName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Registrations.CustomerID, Registrations.ProductCode, Registrations.RegistrationDate, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, Customers.ZipCode, Customers.Phone, Customers.Email FROM Registrations INNER JOIN Customers ON Registrations.CustomerID = Customers.CustomerID WHERE (Customers.LastName LIKE '%' + @custLastName + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="custLastName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID FROM Customers INNER JOIN Registrations ON Customers.CustomerID = Registrations.CustomerID WHERE (Customers.CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewCustomers" Name="CustomerID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceSearchCustByID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, Customers.ZipCode, Customers.Phone, Customers.Email, Registrations.ProductCode, Registrations.RegistrationDate FROM Customers INNER JOIN Registrations ON Customers.CustomerID = Registrations.CustomerID WHERE (Customers.CustomerID = @custID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="custID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="IncidentID" DataSourceID="DataSourceSelectedCustomersIncidents" Height="50px" Width="735px" OnPageIndexChanged="DetailsView1_PageIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="IncidentID" HeaderText="Incident ID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="ProductCode" HeaderText="Product Code" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="LastModified" HeaderText="Last Modified" SortExpression="LastModified" />
                    <asp:BoundField DataField="JobStatus" HeaderText="Job Status" SortExpression="JobStatus" />
                    <asp:BoundField DataField="SolutionApplied" HeaderText="Solution Applied" SortExpression="SolutionApplied" />
                    <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="UserID" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="DataSourceSelectedCustomersIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Customers.FirstName, Customers.LastName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID WHERE (Incidents.CustomerID = @selectedCustID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewDisplayCustomers" Name="selectedCustID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="btnAddIncident" runat="server" OnClick="btnAddIncident_Click" Text="Add Incident" />
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="dropDownSearchFilter" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <br />
    <br />&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    <br />
    <br />&nbsp;&nbsp;&nbsp;<br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<br />
    <br />
&nbsp;
    <br />
    <br />
    <br />
    <br />&nbsp;
    <asp:Label ID="lblHiddenUserName" runat="server" Text="userName"></asp:Label>
    <br />
    <br />
</asp:Content>
