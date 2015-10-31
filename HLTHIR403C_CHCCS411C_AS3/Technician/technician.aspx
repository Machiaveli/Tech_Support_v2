<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="technician.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Technician.technician" %>
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

    protected void GridIncidentsDisplay(object sender, GridViewPageEventArgs e)
    {
        GridViewIncidentsDisplay.PageIndex = e.NewPageIndex;
        GridViewIncidentsDisplay.DataBind();
    }

    protected void GridIncidentsDisplay_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = GridViewIncidentsDisplay.DataSource as DataTable;

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            GridViewIncidentsDisplay.DataSource = dataView;
            GridViewIncidentsDisplay.DataBind();
        }
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblFilter" runat="server" Text="Filter: "></asp:Label>
            &nbsp;&nbsp;
            <asp:DropDownList ID="dropDownFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropDownFilter_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="ListMyOpenIncidents">List My Open Incidents</asp:ListItem>
                <asp:ListItem Value="ListMyClosedIncidents">List My Closed Incidents</asp:ListItem>
                <asp:ListItem Value="ListAllOpenIncidents">List All Open Incidents</asp:ListItem>
                <asp:ListItem Value="ListAllClosedIncidents">List All Closed Incidents</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;
            <%--<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click1" Text="Search" />--%>
            <br />
            <br />
            <asp:Label ID="lblDisplayedInfoMessage" runat="server" Font-Size="Large" Text="Your Open Incidents"></asp:Label>
            <br />
            <asp:GridView ID="GridViewIncidentsDisplay" runat="server" AllowPaging="True" AllowSorting="True" OnSorting="GridViewIncidentsDisplay_Sorting" AutoGenerateColumns="False" DataSourceID="DataSourceMyOpenIncidents" CellPadding="4" DataKeyNames="IncidentID" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
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
            <asp:SqlDataSource ID="DataSourceMyOpenIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Users.UserName = @techName) AND (IncidentsHistory.JobStatus = 'Open')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="techName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceMyClosedIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Users.UserName = @techName) AND (IncidentsHistory.JobStatus = 'Closed')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="techName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceAllOpenIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (IncidentsHistory.JobStatus = 'Open') ORDER BY Incidents.IncidentID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceAllClosedIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (IncidentsHistory.JobStatus = 'Closed') ORDER BY Incidents.IncidentID"></asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="IncidentID" DataSourceID="DataSourceDetailsView" ForeColor="#333333" GridLines="None" Height="50px" Width="406px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                    <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="DataSourceDetailsView" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, Customers.FirstName, Customers.LastName, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Users.UserName FROM Customers INNER JOIN Incidents ON Customers.CustomerID = Incidents.CustomerID INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Incidents.IncidentID = @selectedIncident)"
                UpdateCommand ="UPDATE Incidents SET Title = @title FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Incidents.IncidentID = @incidentID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewIncidentsDisplay" Name="selectedIncident" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DetailsView1" Name="newparameter" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <br />
    </p>
</asp:Content>
