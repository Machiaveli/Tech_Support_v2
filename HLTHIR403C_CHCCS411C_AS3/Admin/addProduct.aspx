

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addProduct.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.addProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 556px;
            height: 26px;
        }
        .auto-style7 {
            width: 556px;
            height: 29px;
        }
        .auto-style8 {
            height: 29px;
            width: 436px;
        }
        .auto-style9 {
            width: 1673px;
        }
        .auto-style10 {
            width: 1673px;
            height: 26px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Product</h1>
    <table style="width: 400px; margin-left: auto; margin-right:auto; font-weight: 600;">
        <tr>
            <td class="auto-style9">
                <asp:Label ID="lblCode" runat="server" Text="Product Code:"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Product Code is a required field." ControlToValidate="txtCode" style="color: Yellow">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="lblName" runat="server" Text="Product Name:"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Product Name is a required field." ControlToValidate="txtName" style="color: yellow">*</asp:RequiredFieldValidator>
            </td>
        </tr>
                <tr>
            <td class="auto-style9">
                <asp:Label ID="lblVersion" runat="server" Text="Product Version:"></asp:Label>
                    </td>
            <td class="auto-style8">
                <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ErrorMessage="Product Version is a required field." ControlToValidate="txtVersion" style="color: yellow">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please ensure that you have entered a numerical value." ForeColor="Yellow" ControlToValidate="txtVersion" ValidationExpression="^[1-9]\d*(\.\d+)?$">*</asp:RegularExpressionValidator>
                    </td>
        </tr>
                <tr>
            <td class="auto-style9">
                <asp:Label ID="lblRelease" runat="server" Text="Release Date (MM/DD/YYYY):"></asp:Label>
                    </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtRelease" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfvRelease" runat="server" ErrorMessage="Release Date is a required field." ControlToValidate="txtRelease" style="color: yellow">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRelease" ErrorMessage="Please enter a valid date." ForeColor="Yellow" ValidationExpression="((1[0-2])|(0?[1-9]))/((0?\d)|([1-2]\d)|(3[0-1]))/(\d{4})">*</asp:RegularExpressionValidator>
                    </td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style7">
           
    
    <asp:Button ID="btnAdd" runat="server" Text="Add Product" OnClick="InsertProduct" />
   
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    InsertCommand="INSERT INTO Products(ProductCode, Name, Version, ReleaseDate,ProductSupported ) VALUES (@ProductCode, @Name, @Version, @ReleaseDate, 'Yes')" 
                    SelectCommand="SELECT * FROM [Products]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtCode" Name="ProductCode" PropertyName="Text"/>
                        <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtVersion" Name="Version" PropertyName="Text"/>
                        <asp:ControlParameter ControlID="txtRelease" Name="ReleaseDate" PropertyName="Text"/>
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="margin-left: auto; margin-right:auto; font-weight: 600; text-align:left" ForeColor="Yellow" Width="250px" />
    <br />
           
</asp:Content>
