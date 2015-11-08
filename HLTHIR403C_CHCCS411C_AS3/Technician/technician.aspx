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

    private void UpdateIncident(object source, EventArgs e)
    {
        try
        {
            DataSourceIncidentsHistory.Insert();
            Response.Redirect("technician.aspx");
        }
        catch (Exception ex)
        {
            lblError.Text = "The person you are trying to insert already exists in the database." + ex.Message;
        }
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 420px;
            background-color: #E9ECF1;
        }
        .auto-style4 {
            width: 194px;
        }
        .auto-style5 {
            width: 194px;
            height: 20px;
        }
        .auto-style6 {
            height: 20px;
        }
        .auto-style7 {
            width: 194px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            width: 194px;
            height: 21px;
        }
        .auto-style10 {
            height: 21px;
        }
    </style>
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
            <asp:GridView ID="GridViewIncidentsDisplay" runat="server" AllowPaging="True" AllowSorting="True" OnSorting="GridViewIncidentsDisplay_Sorting" AutoGenerateColumns="False" DataSourceID="DataSourceMyClosedIncidents" CellPadding="4" DataKeyNames="IncidentID" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewIncidentsDisplay_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="IncidentsHistoryID" HeaderText="IncidentsHistoryID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentsHistoryID" />
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:CommandField ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="DataSourceMyOpenIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT IncidentsHistory.IncidentsHistoryID, Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Users.UserName = @techName) AND (IncidentsHistory.JobStatus = 'Open')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="techName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceMyClosedIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT IncidentsHistory.IncidentsHistoryID, Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Users.UserName = @techName) AND (IncidentsHistory.JobStatus = 'Closed')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="techName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceAllOpenIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT IncidentsHistory.IncidentsHistoryID, Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (IncidentsHistory.JobStatus = 'Open') ORDER BY Incidents.IncidentID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceAllClosedIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT IncidentsHistory.IncidentsHistoryID, Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (IncidentsHistory.JobStatus = 'Closed') ORDER BY Incidents.IncidentID"></asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="420px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="IncidentID" DataSourceID="DataSourceIncidents" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <table class="auto-style3">
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lblIncidentHistoryID" runat="server" ForeColor="#333333" Text="IncidentsHistoryID" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="background-color: #f7f0f0" class="auto-style8">
                        <asp:Label ID="IncidentHistoryID" runat="server" Font-Bold="True" ForeColor="#333333"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblIncidentID" runat="server" Font-Bold="True" ForeColor="#004080" Text="IncidentID"></asp:Label>
                    </td>
                    <td style="background-color: white" class="auto-style10">
                        <asp:Label ID="IncidentID" runat="server" Font-Bold="True" ForeColor="#003366"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblUserID" runat="server" Font-Bold="True" ForeColor="#333333" Text="UserID"></asp:Label>
                    </td>
                    <td style="background-color: #f7f0f0">
                        <asp:TextBox ID="txtUserID" runat="server" Font-Bold="True" ForeColor="#333333"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblLastModified" runat="server" Font-Bold="True" ForeColor="#004080" Text="LastModified"></asp:Label>
                    </td>
                    <td style="background-color: white">
                        <asp:Label ID="LastModified" runat="server" Font-Bold="True" ForeColor="#003366"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblDescription" runat="server" Font-Bold="True" ForeColor="#333333" Text="Description"></asp:Label>
                    </td>
                    <td style="background-color: #f7f0f0">
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Font-Bold="True" ForeColor="#333333"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblJobStatus" runat="server" Font-Bold="True" ForeColor="#004080" Text="JobStatus"></asp:Label>
                    </td>
                    <td style="background-color: white" class="auto-style6">
                        <asp:TextBox ID="txtJobStatus" runat="server" Font-Bold="True" ForeColor="#003366"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lblSolutionApplied" runat="server" Font-Bold="True" ForeColor="#333333" Text="SolutionApplied"></asp:Label>
                    </td>
                    <td style="background-color: #f7f0f0" class="auto-style8">
                        <asp:TextBox ID="txtSolutionApplied" runat="server" Font-Bold="True" ForeColor="#333333"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Update Incident" OnClick="UpdateIncident" />
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="DataSourceDetailsView" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, Customers.FirstName, Customers.LastName, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Users.UserName FROM Customers INNER JOIN Incidents ON Customers.CustomerID = Incidents.CustomerID INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Incidents.IncidentID = @selectedIncident)"
                UpdateCommand ="UPDATE Incidents SET Title = @title FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Incidents.IncidentID = @incidentID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewIncidentsDisplay" Name="selectedIncident" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DetailsView1" Name="newparameter" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="DataSourceIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, Customers.FirstName, Customers.LastName FROM Customers INNER JOIN Incidents ON Customers.CustomerID = Incidents.CustomerID WHERE ([IncidentID] = @IncidentID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewIncidentsDisplay" Name="IncidentID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceIncidentsHistory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO IncidentsHistory(IncidentID, UserID, LastModified, Description, JobStatus, SolutionApplied) VALUES (@IncidentID, @UserID, @LastModified, @Description, @JobStatus, @SolutionApplied)" SelectCommand="SELECT * FROM [IncidentsHistory] WHERE ([IncidentID] = @IncidentID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewIncidentsDisplay" Name="IncidentID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="IncidentID" Name="IncidentID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="txtUserID" Name="UserID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="LastModified" Name="LastModified" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txtDescription" Name="Description" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtJobStatus" Name="JobStatus" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtSolutionApplied" Name="SolutionApplied" PropertyName="Text" Type="String" />
                </InsertParameters>
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

