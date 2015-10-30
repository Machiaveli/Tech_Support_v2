<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="technician.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Technician.technician" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" style="margin-left: 0px; text-align: left;" Width="100%" HorizontalAlign="Center" DataKeyNames="CustomerID,Expr1,Expr10" DataSourceID="SqlDataSource1" Height="20px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" ReadOnly="True" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Expr10" HeaderText="Expr10" SortExpression="Expr10" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Expr11" HeaderText="Expr11" SortExpression="Expr11" />
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
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
        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, Customers.ZipCode, Customers.Phone, Customers.Email, IncidentsHistory.IncidentID, IncidentsHistory.UserID, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, Users.UserID AS Expr1, Users.UserName, Incidents.IncidentID AS Expr10, Incidents.CustomerID AS Expr11, Incidents.ProductCode, Incidents.Title FROM Customers INNER JOIN Incidents ON Customers.CustomerID = Incidents.CustomerID INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Users.FirstName = @techName) AND (IncidentsHistory.JobStatus = 'open') ORDER BY IncidentsHistory.JobStatus">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblUserName" Name="techName" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="IncidentID,UserID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" />
                <asp:BoundField DataField="LastModified" HeaderText="LastModified" SortExpression="LastModified" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="JobStatus" HeaderText="JobStatus" SortExpression="JobStatus" />
                <asp:BoundField DataField="SolutionApplied" HeaderText="SolutionApplied" SortExpression="SolutionApplied" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Incidents] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Incidents] WHERE [IncidentID] = @IncidentID" InsertCommand="INSERT INTO [Incidents] ([CustomerID], [ProductCode], [Title]) VALUES (@CustomerID, @ProductCode, @Title)" SelectCommand="SELECT Incidents.IncidentID, Incidents.CustomerID, Incidents.ProductCode, Incidents.Title, IncidentsHistory.IncidentID AS Expr1, IncidentsHistory.LastModified, IncidentsHistory.Description, IncidentsHistory.JobStatus, IncidentsHistory.SolutionApplied, Users.UserName, Users.UserID FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Incidents.CustomerID = @CustomerID)" UpdateCommand="UPDATE Incidents SET CustomerID = @CustomerID, ProductCode = @ProductCode, Title = @Title FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID INNER JOIN Users ON IncidentsHistory.UserID = Users.UserID WHERE (Incidents.IncidentID = @IncidentID)">
            <DeleteParameters>
                <asp:Parameter Name="IncidentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="IncidentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </p>
</asp:Content>
