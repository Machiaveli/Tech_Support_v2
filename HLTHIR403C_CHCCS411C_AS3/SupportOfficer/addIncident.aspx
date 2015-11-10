<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addIncident.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.SupportOfficer.addIncident" %>

<script runat="server">

    private void Page_Load(object source, EventArgs e)
    {
        DropDownList3.DataSourceID = "SqlDataSource3";
        DropDownList3.DataBind();
        lblLastModified.Text = DateTime.Now.ToString("MM/dd/yyyy");
        if (Session["selectedCustomer"] != null)
        {
            txtCustomerID.Text = Session["selectedCustomer"].ToString();
        }
        else
            Response.Redirect("SupportOfficerHomePage.aspx"); // ensures this page cannot be accessed unless going through SupportOfficerHomePage.aspx 

        if (Session["currentUser"] != null)
        {
            lblCurrentUser.Text = Session["currentUser"].ToString();
        }
        
        string userName = string.Empty;

        if (System.Web.HttpContext.Current != null &&
            System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            System.Web.Security.MembershipUser usr = Membership.GetUser();
            if (usr != null)
            {
                userName = usr.UserName;
            }
        }
    }

private void AddIncident(object source, EventArgs e) { 
    try
    {
        //DataSourceAddIncident.DataBind();
        DataSourceInsertIncident.Insert();
        DataSourceAddIncientHistory.Insert();
        Session["selectedCustomer"] = null;
        Response.Redirect("SupportOfficerHomePage.aspx");
    }
    catch (Exception)
    {
        lblError.Text = "This product already has an open incident";
    }
}
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 258px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <h1>Add Incident</h1>
    <asp:Label ID="lblCurrentUser" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <br />
    <table class="auto-style3">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCustomerID" runat="server" Enabled="False" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblProductCode" runat="server" Text="Product Code:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ProductCode" DataValueField="ProductCode">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [ProductCode] FROM [Registrations] WHERE ([CustomerID] = @CustomerID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Title is a required field" ForeColor="Red" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="88px" Width="379px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Description is a required field" ForeColor="Red" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblLastModified" runat="server" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Column1" DataValueField="Column1">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="btnAddIncident" runat="server" OnClick="AddIncident" Text="Add Incident" />
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <asp:SqlDataSource ID="DataSourceAddIncident" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="BEGIN TRANSACTION;
INSERT INTO Incidents (CustomerID, ProductCode, Title) VALUES (@CustomerID, @ProductCode, @Title);
INSERT INTO IncidentsHistory (IncidentID, UserID, LastModified, Description, JobStatus, SolutionApplied) VALUES (@IncidentID, @UserID, @LastModified, @Description, 'Open', NULL);
COMMIT TRANSACTION;">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="ProductCode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtTitle" Name="Title" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="IncidentID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="lblCurrentUser" Name="UserID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lblLastModified" Name="LastModified" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDescription" Name="Description" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataSourceInsertIncident" runat="server" InsertCommand="INSERT INTO Incidents(CustomerID, ProductCode, Title) VALUES (@CustomerID, @ProductCode, @Title)" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.*, IncidentsHistory.* FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="ProductCode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtTitle" Name="Title" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MAX (IncidentID + 1) FROM Incidents">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataSourceAddIncientHistory" runat="server" InsertCommand="INSERT INTO IncidentsHistory (IncidentID, UserID, LastModified, Description, JobStatus, SolutionApplied) VALUES (@IncidentID, @UserID, @LastModified, @Description, 'Open', NULL);" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incidents.*, IncidentsHistory.* FROM Incidents INNER JOIN IncidentsHistory ON Incidents.IncidentID = IncidentsHistory.IncidentID">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="IncidentID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="lblCurrentUser" Name="UserID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lblLastModified" Name="LastModified" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDescription" Name="Description" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
