<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addProduct.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.addProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 146px;
        }
        .auto-style4 {
            width: 146px;
            height: 31px;
        }
        .auto-style5 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table style="width:100%;">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblCode" runat="server" Text="Product Code:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Product Code is a required field." ControlToValidate="txtCode" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblName" runat="server" Text="Product Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Product Name is a required field." ControlToValidate="txtName" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
                <tr>
            <td class="auto-style3">
                <asp:Label ID="lblVersion" runat="server" Text="Product Version:"></asp:Label>
                    </td>
            <td>
                <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ErrorMessage="Product Version is a required field." ControlToValidate="txtVersion" style="color: #FF0000"></asp:RequiredFieldValidator>
                    </td>
        </tr>
                <tr>
            <td class="auto-style4">
                <asp:Label ID="lblRelease" runat="server" Text="Release Date:"></asp:Label>
                    </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtRelease" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvRelease" runat="server" ErrorMessage="Release Date is a required field." ControlToValidate="txtRelease" style="color: #FF0000"></asp:RequiredFieldValidator>
                    </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td>
           
    
    <asp:Button ID="btnAdd" runat="server" Text="Add Product" />
            </td>
        </tr>
    </table>
           
</asp:Content>
