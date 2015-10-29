﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addIncident.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.SupportOfficer.addIncident" %>

<script runat="server">

    private void Page_Load(object source, EventArgs e)
    {
        if (Session["selectedCustomer"] != null)
        {
            txtCustomerID.Text = Session["selectedCustomer"].ToString();
        }
        
        string userName = string.Empty;

        if (System.Web.HttpContext.Current != null &&
            System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            System.Web.Security.MembershipUser usr = Membership.GetUser();
            if (usr != null)
            {
                userName = usr.UserName;
                txtUserName.Text = userName;
            }
        }
    }

private void AddIncident(object source, EventArgs e) {
    try
    {
        txtLastModified.Text = DateTime.Now.ToString("MM/dd/yyyy");
        txtJobStatus.Text = "Open";
        SqlDataSource3.Insert();
        SqlDataSource5.Insert();
        Response.Redirect("SupportOfficerHomePage.aspx");
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
    <h1>Add Incident</h1><br />
    <br />
    <br />
    <table class="auto-style3">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCustomerID" runat="server" Enabled="False"></asp:TextBox>
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
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="btnAddIncident" runat="server" OnClick="AddIncident" Text="Add Incident" />
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="UserID" DataValueField="UserID" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Incidents(CustomerID, ProductCode, Title) VALUES (@CustomerID, @ProductCode, @Title)" SelectCommand="SELECT * FROM [Incidents]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="ProductCode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtTitle" Name="Title" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="txtUserName" runat="server" Enabled="False" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtLastModified" runat="server" Text='<% DateTime.Now.ToString(); %>' Visible="False"></asp:TextBox>
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserID] FROM [Users] WHERE ([FirstName] = @FirstName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUserName" Name="FirstName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="txtJobStatus" runat="server" Text='<% "Open"; %>' Visible="False"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO IncidentsHistory(UserID, LastModified, Description, JobStatus, SolutionApplied) VALUES (@UserID, @LastModified, @Description, @JobStatus, @SolutionApplied)" SelectCommand="SELECT * FROM [IncidentsHistory]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="UserID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtLastModified" Name="LastModified" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDescription" Name="Description" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtJobStatus" Name="JobStatus" PropertyName="Text" />
                        <asp:QueryStringParameter Name="SolutionApplied" QueryStringField="null" />
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
