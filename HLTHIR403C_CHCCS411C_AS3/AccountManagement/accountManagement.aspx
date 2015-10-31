<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="accountManagement.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.accountManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Account Management</h1>

    <div style="width: 400px; margin-left: auto; margin-right:auto;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="Medium" ForeColor="#333333" GridLines="None" style="text-align: center" Width="410px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="UserType" HeaderText="User Type" SortExpression="UserType" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName], [FirstName], [LastName], [UserType] FROM [Users] WHERE ([UserName] = @UserName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblUserName" Name="UserName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="lblUserName" runat="server"></asp:TextBox>
                <br />
                <asp:ChangePassword ID="ChangePassword3" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="Medium" ForeColor="#003366" style="text-align: left" CancelDestinationPageUrl="~/landingPage.aspx" ContinueDestinationPageUrl="~/landingPage.aspx" Width="400px">
                    <CancelButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <ChangePasswordButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <PasswordHintStyle Font-Italic="True" ForeColor="#888888" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:ChangePassword>
            </div>
    <br/>
    <br/>
    <br/>
    <br/>
</asp:Content>
