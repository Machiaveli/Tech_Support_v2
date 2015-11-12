<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="link.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3.Admin.link" %>

<script runat="server">

    private void Page_Load(object source, EventArgs e)
    {
        txtDate.Text = DateTime.Now.ToString("MM/dd/yyyy"); // Puts the current date into textbox
        if (Session["selectedCustomer"] != null)
        {
            txtCustomerID.Text = Session["selectedCustomer"].ToString(); // Gets the selected customersID from previous page
        }
        else
            Response.Redirect("customers.aspx"); // ensures this page cannot be accessed unless going through customers.aspx 
        
    }

    // Method that gets the insert query from the sqlDataSource and then rediriects the user to the customers page. Is linked with button on_click
    private void RegisterProduct(object source, EventArgs e)
    {
        try
        {
            SqlDataSource2.Insert();
            Response.Redirect("customers.aspx");
        }
        catch (Exception)
        {
            lblError.Text = "This product is already registered to this customer";
        }
        
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 302px;
        }
        .auto-style5 {
            width: 302px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <table class="auto-style3">
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtCustomerID" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblProductCode" runat="server" Text="Product Code:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="dLProductCode" runat="server" Height="19px" Width="126px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ProductCode" DataValueField="ProductCode">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductCode] FROM [Products]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblRegistrationDate" runat="server" Text="Registration Date:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDate" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="btnRegisterProduct" runat="server" Text="Register Product" OnClick="RegisterProduct" Width="114px" />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Registrations (CustomerID, ProductCode, RegistrationDate) VALUES (@CustomerID, @ProductCode, @RegistrationDate)" SelectCommand="SELECT * FROM [Registrations]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="dLProductCode" Name="ProductCode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtDate" Name="RegistrationDate" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
