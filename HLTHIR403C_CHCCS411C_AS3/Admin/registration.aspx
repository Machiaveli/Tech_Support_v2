<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.registration1" %>
<script runat="server">
private void InsertUser (object source, EventArgs e) {
    try
    {
        SqlDataSource1.Insert();
        Response.Redirect("manageAllUsers.aspx");
    }
    catch (Exception ex)
    {
        lblError.Text = ex.Message;
    }
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            height: 382px;
        }
        .auto-style3 {
            width: 160px;
        }
        #Text1 {
            width: 200px;
        }
        #Text2 {
            width: 200px;
        }
        #txtPassword {
            width: 200px;
        }
        #txtConfirm {
            width: 200px;
        }
        #Password1 {
            width: 200px;
        }
        #Password2 {
            width: 200px;
        }
        #pwPassword {
            width: 200px;
        }
        #pwConfirm {
            width: 200px;
        }
        .auto-style4 {
            width: 160px;
            height: 29px;
        }
        .auto-style5 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
&nbsp;<table style="width:100%;">
    <tr>

        <td>User ID:</td>
        <td>                
            <asp:TextBox ID="txtUserID" runat="server" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ControlToValidate="txtUserID" ErrorMessage="User ID is a required field." style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
    </tr>    
    <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserType" runat="server" Text="User Type:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlUser" runat="server">
                    <asp:ListItem>Support Officer</asp:ListItem>
                    <asp:ListItem>Technician</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First Name is a required field." ControlToValidate="txtFirstName" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td class="auto-style3">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last Name is a required field." ControlToValidate="txtLastName" style="color: #FF0000"></asp:RequiredFieldValidator>
             </td>
        </tr>
      <tr>
            <td class="auto-style3">
                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is a required field." ControlToValidate="txtEmail" style="color: #FF0000"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please input a valid email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" style="color: #FF0000"></asp:RegularExpressionValidator>
            </td>
        </tr>
      <tr>
            <td class="auto-style3">
                <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
             </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is a required field." style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
      <tr>
            <td class="auto-style4">
                <asp:Label ID="lblConfirm" runat="server" Text="Confirm Password:"></asp:Label>
             </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Confirm Password is a required field." style="color: #FF0000"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="compareConfirm" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" ErrorMessage="Please ensure both passwords are the same." style="color: #FF0000"></asp:CompareValidator>
                </td>
        </tr>
    <tr>
        <td>
            <asp:Button ID="btnAddUser" runat="server" Text="Add User" onclick="InsertUser" />
        </td>
        <td>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                InsertCommand="INSERT INTO Users(UserID, UserType, FirstName, LastName, Email, Password) VALUES (@UserID, @UserType, @FirstName, @LastName, @Email, @Password)" 
                SelectCommand="SELECT FROM Users">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtUserID" Name="UserID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddlUser" Name="UserType" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtFirstName" Name="FirstName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLastname" Name="LastName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text"/>
                    <asp:ControlParameter ControlID="txtConfirm" Name="Password" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
        &nbsp;<asp:Label ID="lblError" runat="server" style="color: #FF0000"></asp:Label>
        </td>
    </tr>
    </table>
&nbsp;
</asp:Content>
