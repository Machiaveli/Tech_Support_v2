﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.newCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<asp:Label ID="lblSearchRecords" runat="server" Text="Search all customers: "></asp:Label>
    &nbsp;<asp:TextBox ID="txtSearchQuery" runat="server" style="margin-bottom: 0px" Width="181px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="dropDownSearchFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropDownSearchFilter_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="customerLastName">Last Name</asp:ListItem>
        <asp:ListItem Value="customerID">Customer ID</asp:ListItem>
        <asp:ListItem Value="ListAllCustomers">List All Customers</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" />
    <br />
    <asp:GridView ID="GridViewCustomers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="margin-top: 0px" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            
            <asp:TemplateField HeaderText="CustomerID" InsertVisible="False" SortExpression="CustomerID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First name is required" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Last name is required" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Address is required" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("City") %>'>></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="City is required" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="State">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="State is required" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Zip code is required" Display="Dynamic" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Phone number is required" Display="Dynamic" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="Email address is required" Display="Dynamic" ValidationGroup="insertValid">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Customers] ([FirstName], [LastName], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@FirstName, @LastName, @Address, @City, @State, @ZipCode, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customers] ORDER BY [LastName]" UpdateCommand="UPDATE [Customers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="original_CustomerID" Type="Int32" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
            <br />
            <asp:Label ID="lblCustomerRegistrationResults" runat="server" Font-Size="Large" Text="The following customers matched your search:"></asp:Label>

    <asp:GridView ID="GridViewDisplayCustomers" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="DataSourceSearchCustByLastName" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewDisplayCustomers_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
            <asp:SqlDataSource ID="DataSourceSearchCustByLastName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE ([LastName] LIKE '%' + @LastName + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="LastName" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DataSourceSearchCustByID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchQuery" Name="CustomerID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="insertValid" />
    <br />
    <br />
&nbsp;
</asp:Content>
