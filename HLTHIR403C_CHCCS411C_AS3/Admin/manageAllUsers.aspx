<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageAllUsers.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.AccountManagement.manageAllUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>User Administration</h1>
    <div style="width: 900px; margin-left: auto; margin-right:auto; font-weight: 700;">
        <asp:Label ID="lblSearch" runat="server" Text="Search users:"></asp:Label>

    &nbsp;<asp:TextBox ID="txtSearch" runat="server" style="margin-bottom: 0px" Width="181px"></asp:TextBox>

    &nbsp;&nbsp;<asp:DropDownList ID="dropDownSearchFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropDownSearchFilter_SelectedIndexChanged">
                <asp:ListItem Value="userLastName" Selected="True">Last Name</asp:ListItem>
                <asp:ListItem Value="userID">User ID</asp:ListItem>
                               <asp:ListItem Value="ListAllUsers">List All Users</asp:ListItem>
            </asp:DropDownList>
    &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                &nbsp;<asp:Label ID="lblUserType" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblMatch" runat="server" Font-Size="Large" Text="The following users matched your search:" Visible="False"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="text-align: center" Width="900px" OnRowUpdating="GridView1_RowUpdating1" OnRowEditing="GridView1_RowEditing" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>

                        <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First Name is a required field." ForeColor="Red" ValidationGroup="editUser">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Last name is a required field." ForeColor="Red" ValidationGroup="editUser">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Email is a required field." ForeColor="Red" ValidationGroup="editUser">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please provide a valid email." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="editUser">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserType" SortExpression="UserType">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("UserType") %>'>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Support Officer</asp:ListItem>
                                    <asp:ListItem>Technician</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AccountStatus" SortExpression="AccountStatus">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("AccountStatus") %>'>
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("AccountStatus") %>'></asp:Label>
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
                <br />
                <asp:GridView ID="GridViewDisplayUsers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID" DataSourceID="sqlSearchLastName" ForeColor="#333333" GridLines="None" OnRowEditing="GridViewDisplayUsers_RowEditing" OnRowUpdating="GridViewDisplayUsers_RowUpdating" Visible="False" Width="900px" OnRowDataBound="GridViewDisplayUsers_RowDataBound" style="text-align: center">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="First Name is Required" ForeColor="Red" ValidationGroup="userDetails">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="Last name is a required field." ForeColor="Red" ValidationGroup="userDetails">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Email is a required field." ForeColor="Red" ValidationGroup="userDetails">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Please enter a valid email." ForeColor="Red" ValidationGroup="userDetails">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserType" SortExpression="UserType">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("UserType") %>'>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Support Officer</asp:ListItem>
                                    <asp:ListItem>Technician</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AccountStatus" SortExpression="AccountStatus">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" SelectedValue='<%# Bind("AccountStatus") %>'>
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("AccountStatus") %>'></asp:Label>
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
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="userDetails" />
                <br />
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridView1" />
                <asp:AsyncPostBackTrigger ControlID="GridViewDisplayUsers" />
            </Triggers>

        </asp:UpdatePanel>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([UserType] = @original_UserType) OR ([UserType] IS NULL AND @original_UserType IS NULL)) AND (([AccountStatus] = @original_AccountStatus) OR ([AccountStatus] IS NULL AND @original_AccountStatus IS NULL))" InsertCommand="INSERT INTO [Users] ([UserID], [FirstName], [LastName], [Email], [UserType], [AccountStatus]) VALUES (@UserID, @FirstName, @LastName, @Email, @UserType, @AccountStatus)" SelectCommand="SELECT [UserID], [FirstName], [LastName], [Email], [UserType], [AccountStatus] FROM [Users]" UpdateCommand="UPDATE [Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [UserType] = @UserType, [AccountStatus] = @AccountStatus WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([UserType] = @original_UserType) OR ([UserType] IS NULL AND @original_UserType IS NULL)) AND (([AccountStatus] = @original_AccountStatus) OR ([AccountStatus] IS NULL AND @original_AccountStatus IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_UserType" Type="String" />
                <asp:Parameter Name="original_AccountStatus" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_UserType" Type="String" />
                <asp:Parameter Name="original_AccountStatus" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>



        <asp:SqlDataSource ID="sqlSearchLastName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [UserID], [FirstName], [LastName], [Email], [UserType], [AccountStatus] FROM [Users] WHERE ([LastName] LIKE @LastName + '%') ORDER BY [LastName]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([UserType] = @original_UserType) OR ([UserType] IS NULL AND @original_UserType IS NULL)) AND (([AccountStatus] = @original_AccountStatus) OR ([AccountStatus] IS NULL AND @original_AccountStatus IS NULL))" InsertCommand="INSERT INTO [Users] ([UserID],[FirstName], [LastName], [Email], [UserType], [AccountStatus]) VALUES (@UserID, @FirstName, @LastName, @Email, @UserType, @AccountStatus)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [UserType] = @UserType, [AccountStatus] = @AccountStatus WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([UserType] = @original_UserType) OR ([UserType] IS NULL AND @original_UserType IS NULL)) AND (([AccountStatus] = @original_AccountStatus) OR ([AccountStatus] IS NULL AND @original_AccountStatus IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_UserType" Type="String" />
                <asp:Parameter Name="original_AccountStatus" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="LastName" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_UserType" Type="String" />
                <asp:Parameter Name="original_AccountStatus" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlSearchUserID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [UserID], [FirstName], [LastName], [Email], [UserType], [AccountStatus] FROM [Users] WHERE ([UserID] = @UserID) ORDER BY [UserID]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([UserType] = @original_UserType) OR ([UserType] IS NULL AND @original_UserType IS NULL)) AND (([AccountStatus] = @original_AccountStatus) OR ([AccountStatus] IS NULL AND @original_AccountStatus IS NULL))" InsertCommand="INSERT INTO [Users] ([UserID],[FirstName], [LastName], [Email], [UserType], [AccountStatus]) VALUES (@UserID, @FirstName, @LastName, @Email, @UserType, @AccountStatus)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [UserType] = @UserType, [AccountStatus] = @AccountStatus WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([UserType] = @original_UserType) OR ([UserType] IS NULL AND @original_UserType IS NULL)) AND (([AccountStatus] = @original_AccountStatus) OR ([AccountStatus] IS NULL AND @original_AccountStatus IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_UserType" Type="String" />
                <asp:Parameter Name="original_AccountStatus" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="UserID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_UserType" Type="String" />
                <asp:Parameter Name="original_AccountStatus" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
