<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddCustomerSuccessPage.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.AddCustomerSuccessPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <asp:Label ID="lblH1" runat="server" CssClass="centered" Font-Size="X-Large" Font-Underline="True" Text="Customer Successfully Added!" Width="100%"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblID" runat="server" CssClass="centered" Text="Label" Width="100%" Font-Size="Medium"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblName" runat="server" CssClass="centered" Text="Label" Width="100%" Font-Size="Medium"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblAddress" runat="server" CssClass="centered" Text="Label" Width="100%" Font-Size="Medium"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblPhone" runat="server" CssClass="centered" Text="Label" Width="100%" Font-Size="Medium"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblEmail" runat="server" CssClass="centered" Text="Label" Width="100%" Font-Size="Medium"></asp:Label>
    </p>
    <asp:SqlDataSource ID="DataSourceAddedCustomerDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CustomerID, FirstName, LastName, Address, City, State, ZipCode, Phone, Email, AccountStatus FROM Customers WHERE (FirstName = @custFirstName) AND (LastName = @lastName) AND (Email = @email)">
        <SelectParameters>
            <asp:SessionParameter Name="custFirstName" SessionField="custFirstName" />
            <asp:SessionParameter Name="lastName" SessionField="custLastName" />
            <asp:SessionParameter Name="email" SessionField="custEmail" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
        &nbsp;</p>
    <br />
    <br />
    <hr />
</asp:Content>
