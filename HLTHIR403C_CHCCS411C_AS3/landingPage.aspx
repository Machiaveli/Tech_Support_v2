<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="landingPage.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.landingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="AccountStatus" HeaderText="AccountStatus" SortExpression="AccountStatus" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserID], [UserName], [AccountStatus] FROM [Users] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblUserName" Name="UserName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
<br />
<br />

</asp:Content>


