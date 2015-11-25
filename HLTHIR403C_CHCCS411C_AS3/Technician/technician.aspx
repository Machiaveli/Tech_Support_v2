<%@ Page Title="Technician Incidents" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="technician.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Technician.technician" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    // Method to insert the updated incident into incidentsHistory table
    private void UpdateIncident(object source, EventArgs e)
    {
        try
        {
            DataSourceIncidentsHistory.Insert();
            Response.Redirect("technician.aspx");
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 420px;
            background-color: #E9ECF1;
        }
        .auto-style5 {
            width: 212px;
            height: 20px;
        }
        .auto-style6 {
            height: 20px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            width: 212px;
            height: 21px;
        }
        .auto-style10 {
            height: 21px;
        }
        .auto-style15 {
            width: 212px;
            height: 26px;
        }
        .auto-style16 {
            width: 212px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="Margin5Percent">
            <asp:Label ID="lblFilter" runat="server" Text="Filter: "></asp:Label>
            &nbsp;&nbsp;
            <asp:DropDownList ID="dropDownFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropDownFilter_SelectedIndexChanged">
                <asp:ListItem Value="ListMyClosedIncidents">List My Closed Incidents</asp:ListItem>
                <asp:ListItem Value="ListAllClosedIncidents">List All Closed Incidents</asp:ListItem>
                <asp:ListItem Value="ListAllIncidentsInProgress">List Incidents In Progress</asp:ListItem>
                <asp:ListItem Value="ListAllOpenIncidents">List All Open Incidents</asp:ListItem>
                

            </asp:DropDownList>
            </div>
            &nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="lblDisplayedInfoMessage" runat="server" CssClass="Margin5Percent" Font-Size="Large" Text="All My Closed Incidents"></asp:Label>
            <br />
            <asp:GridView ID="GridViewIncidentsDisplay" runat="server" CssClass="GridViewStyleXLarge centered" AllowPaging="True" AllowSorting="True" OnSorting="GridViewIncidentsDisplay_Sorting" AutoGenerateColumns="False" DataSourceID="DataSourceMyClosedIncidents" CellPadding="4" DataKeyNames="IncidentID, CustomerID" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewIncidentsDisplay_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="IncidentsHistoryID" HeaderText="IncidentsHistoryID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentsHistoryID" />
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                    <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
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
            <br />
            <asp:GridView ID="GridViewCustomersIncidents" runat="server" CssClass="GridViewStyleXLarge" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IncidentID" DataSourceID="DataSourceListAllIncidents" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="IncidentsHistoryID" HeaderText="IncidentsHistoryID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentsHistoryID" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                    <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
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
            <asp:SqlDataSource ID="DataSourceListAllIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.CustomerID, Customers.FirstName, Customers.LastName, Incidents.IncidentID, IncidentsHistory.IncidentsHistoryID, IncidentsHistory.UserID, IncidentsHistory.LastModified, Incidents.ProductCode, Incidents.Title, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied FROM Customers INNER JOIN Incidents ON Customers.CustomerID = Incidents.CustomerID INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID WHERE (Incidents.CustomerID = @CustomerID) ORDER BY LastModified DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CustomerID" Name="CustomerID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceMyClosedIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT IncidentsHistory.IncidentsHistoryID, Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Users.UserName = @techName) AND (IncidentsHistory.JobStatus = 'Closed') ORDER BY LastModified DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="techName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceAllOpenIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT h.IncidentsHistoryID, i.IncidentID, h.UserID, i.CustomerID, c.FirstName, c.LastName, i.ProductCode, h.LastModified, i.Title, h.Description, h.JobStatus, h.SolutionApplied FROM Incidents AS i INNER JOIN Customers AS c ON c.CustomerID = i.CustomerID INNER JOIN IncidentsHistory AS h ON h.IncidentID = i.IncidentID WHERE (NOT EXISTS (SELECT IncidentsHistoryID, IncidentID, UserID, LastModified, Description, JobStatus, SolutionApplied FROM IncidentsHistory AS h WHERE (IncidentID = i.IncidentID) AND (JobStatus = 'Closed'))) AND (NOT EXISTS (SELECT IncidentsHistoryID, IncidentID, UserID, LastModified, Description, JobStatus, SolutionApplied FROM IncidentsHistory AS h WHERE (IncidentID = i.IncidentID) AND (JobStatus = 'In Progress'))) ORDER BY h.LastModified ASC"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceAllClosedIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT IncidentsHistory.IncidentsHistoryID, Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Customers.CustomerID AS Expr1, Customers.FirstName, Customers.LastName, Users.UserName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (IncidentsHistory.JobStatus = 'Closed') ORDER BY Incidents.IncidentID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceAllIncidentsInProgress" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT h.IncidentsHistoryID, i.IncidentID, h.UserID, i.CustomerID, c.FirstName, c.LastName, i.ProductCode, h.LastModified, i.Title, h.Description, h.JobStatus, h.SolutionApplied FROM Incidents AS i INNER JOIN Customers AS c ON c.CustomerID = i.CustomerID INNER JOIN IncidentsHistory AS h ON h.IncidentID = i.IncidentID WHERE (h.JobStatus = 'In Progress') AND (NOT EXISTS (SELECT IncidentsHistoryID, IncidentID, UserID, LastModified, Description, JobStatus, SolutionApplied FROM IncidentsHistory AS h WHERE (IncidentID = i.IncidentID) AND (JobStatus = 'Closed'))) ORDER BY i.IncidentID"></asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="Margin5Percent" Height="50px" Width="420px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="IncidentID" DataSourceID="DataSourceIncidents" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" Visible="False" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" Visible="False" />
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
            <table id="tableIncidentsHistory" class="auto-style3 Margin5Percent" runat="server">
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblCustomerID" runat="server" Font-Bold="True" ForeColor="#333333" Text="CustomerID"></asp:Label>
                    </td>
                    <td style="background-color: #F7F6F3" class="auto-style8">
                        <asp:Label ID="CustomerID" runat="server" Font-Bold="True" ForeColor="#333333"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblIncidentHistoryID" runat="server" Font-Bold="True" ForeColor="#004080" Text="IncidentsHistoryID"></asp:Label>
                    </td>
                    <td class="auto-style8" style="background-color: white">
                        <asp:Label ID="IncidentHistoryID" runat="server" Font-Bold="True" ForeColor="#004080"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblIncidentID" runat="server" Font-Bold="True" ForeColor="#333333" Text="IncidentID"></asp:Label>
                    </td>
                    <td style="background-color: #F7F6F3" class="auto-style10">
                        <asp:Label ID="IncidentID" runat="server" Font-Bold="True" ForeColor="#333333"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">
                        <asp:Label ID="lblUserID" runat="server" Font-Bold="True" ForeColor="#004080" Text="UserID"></asp:Label>
                    </td>
                    <td style="background-color: white">
                        <asp:Label ID="UserID" runat="server" Font-Bold="True" ForeColor="#004080"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">
                        <asp:Label ID="lblLastModified" runat="server" Font-Bold="True" ForeColor="#333333" Text="LastModified"></asp:Label>
                    </td>
                    <td style="background-color: #F7F6F3">
                        <asp:Label ID="LastModified" runat="server" Font-Bold="True" ForeColor="#333333"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">
                        <asp:Label ID="lblDescription" runat="server" Font-Bold="True" ForeColor="#004080" Text="Description"></asp:Label>
                    </td>
                    <td style="background-color: white">
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Font-Bold="True" ForeColor="#004080"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblJobStatus" runat="server" Font-Bold="True" ForeColor="#333333" Text="JobStatus"></asp:Label>
                    </td>
                    <td style="background-color: #F7F6F3" class="auto-style6">
                        <asp:DropDownList ID="dLJobStatus" runat="server">
                            <asp:ListItem>In Progress</asp:ListItem>
                            <asp:ListItem>Closed</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblSolutionApplied" runat="server" Font-Bold="True" ForeColor="#004080" Text="SolutionApplied"></asp:Label>
                    </td>
                    <td style="background-color: white" class="auto-style8">
                        <asp:TextBox ID="txtSolutionApplied" runat="server" Font-Bold="True" ForeColor="#004080"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">&nbsp;</td>
                    <td style="background-color: #F7F6F3">
                        <asp:Button ID="Button1" runat="server" Text="Update Incident" OnClick="UpdateIncident" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblError" runat="server" CssClass="Margin5Percent" ForeColor="Red"></asp:Label>
            <br />
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
                    <asp:ControlParameter ControlID="UserID" Name="UserID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="LastModified" Name="LastModified" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txtDescription" Name="Description" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="dLJobStatus" Name="JobStatus" PropertyName="SelectedValue" Type="String" />
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

