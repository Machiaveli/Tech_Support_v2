<%@ Page Title="Home - Create New Incident" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupportOfficerHomePage.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.SupportOfficer.SupportOfficerHomePage" %>


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
            <div class="Margin10Percent">
            <asp:Label ID="lblSearchRecords" runat="server" Text="Search all customers: "></asp:Label>
            &nbsp;<asp:TextBox ID="txtSearchQuery" runat="server" style="margin-bottom: 0px" Width="181px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="dropDownSearchFilter" runat="server" OnSelectedIndexChanged="dropDownSearchFilter_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="customerLastName" Selected="True">Last Name</asp:ListItem>
                <asp:ListItem Value="customerID">Customer ID</asp:ListItem>
                <asp:ListItem Value="ListMyIncidents">List My Incidents</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" />
            </div>
            <br />
            <br />
            <asp:Label ID="lblOpenIncidents" runat="server" CssClass="Margin10Percent" Font-Size="Large" Text="Your Open Incidents"></asp:Label>
            <br />
            <asp:GridView ID="GridViewCustomers" runat="server" CssClass="GridViewStyleLarge centered" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IncidentID,Expr2" DataSourceID="DataSourceListMyIncidents" OnPageIndexChanging="GridViewCustomers_PageIndexChanged" OnSorting="GridViewCustomers_Sorting" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                    <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
                    <asp:BoundField DataField="Expr2" HeaderText="UserID" SortExpression="Expr2" ReadOnly="True" />
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
            <asp:SqlDataSource ID="DataSourceListMyIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT i.IncidentID, i.CustomerID, c.FirstName, c.LastName, i.ProductCode, i.Title, h.LastModified, h.JobStatus, h.Description, h.SolutionApplied, Users.UserID AS Expr2 FROM Incidents i INNER JOIN IncidentsHistory h ON i.IncidentID = h.IncidentID INNER JOIN Users ON h.UserID = Users.UserID INNER JOIN Customers c ON i.CustomerID = c.CustomerID AND h.UserID = Users.UserID WHERE (Users.UserName = @userName) AND (h.JobStatus = 'Open') ORDER BY LastModified DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblHiddenUserName" Name="userName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="lblCustomerRegistrationResults" runat="server" CssClass="Margin10Percent" Font-Size="Large" Text="The following customers matched your search:"></asp:Label>
            <br />
            <asp:GridView ID="GridViewDisplayCustomers" runat="server" CssClass="GridViewStyleLarge" AllowPaging="True" AllowSorting="True" DataKeyNames="CustomerID" DataSourceID="DataSourceSearchCustByLastName" OnSelectedIndexChanged="GridViewDisplayCustomers_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>         
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="false" ReadOnly="true" SortExpression="CustomerID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="AccountStatus" HeaderText="AccountStatus" SortExpression="AccountStatus" />
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
            <asp:SqlDataSource ID="DataSourceSearchCustByLastName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CustomerID, FirstName, LastName, Address, City, State, ZipCode, Phone, Email, AccountStatus FROM Customers WHERE (LastName LIKE @custLastName + '%') ORDER BY LastName ASC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="custLastName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID FROM Customers INNER JOIN Registrations ON Customers.CustomerID = Registrations.CustomerID WHERE (Customers.CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewCustomers" Name="CustomerID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceSearchCustByID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Customers WHERE (Customers.CustomerID = @custID) ORDER BY CustomerID ASC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="custID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="Margin10Percent" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="IncidentID" DataSourceID="DataSourceSelectedCustomersIncidents" Height="50px" Width="735px" OnPageIndexChanged="DetailsView1_PageIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
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
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="DataSourceSelectedCustomersIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Customers.FirstName, Customers.LastName FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID WHERE (Incidents.CustomerID = @selectedCustID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewDisplayCustomers" Name="selectedCustID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="btnAddIncident" runat="server" CssClass="Margin10Percent" OnClick="btnAddIncident_Click" Text="Add Incident" />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblinactiveAccount" runat="server" ForeColor="#CC0000" Text="Label"></asp:Label>
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
    <asp:Label ID="lblHiddenUserName" runat="server" Text="userName" Visible="False"></asp:Label>
    <br />
    <br />
</asp:Content>
