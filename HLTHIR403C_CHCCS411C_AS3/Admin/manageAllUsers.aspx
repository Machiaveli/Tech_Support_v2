<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageAllUsers.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.AccountManagement.manageAllUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>User Administration</h1>
    <div style="width: 900px; margin-left: auto; margin-right:auto;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID" DataSourceID="SqlDataSource1" Font-Size="Medium" ForeColor="#333333" GridLines="None" style="text-align: center" Width="900px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" ReadOnly="True" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" ReadOnly="True" SortExpression="LastName" />
                        <asp:TemplateField HeaderText="UserType" SortExpression="UserType">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("UserType") %>'>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Support Officer</asp:ListItem>
                                    <asp:ListItem>Technician</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccountStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridView1" />
            </Triggers>
        </asp:UpdatePanel>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([UserID], [UserName], [FirstName], [LastName], [AccountStatus], [UserType]) VALUES (@UserID, @UserName, @FirstName, @LastName, @AccountStatus, @UserType)" SelectCommand="SELECT [UserID], [UserName], [FirstName], [LastName], [AccountStatus], [UserType] FROM [Users]" UpdateCommand="UPDATE [Users] SET [AccountStatus] = @AccountStatus, [UserType] = @UserType WHERE [UserID] = @UserID">
            <DeleteParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="AccountStatus" Type="String" />
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </div>
</asp:Content>
