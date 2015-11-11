<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HLTHIR403C_CHCCS411C_AS3._default1" %>

<!DOCTYPE html>
<link href="Styles/Style.css" rel="stylesheet" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

a:link, a:visited {
    color: #00FFFF;
    text-align: left;
}

        .auto-style2 {
            font-size: medium;
        }
        .auto-style3 {
            font-size: x-large;
            color: #FFFFFF;
        }

        .auto-style4 {
            font-size: 20pt;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       
        <br />
        <br />
        <table class="auto-style1" width="100%" style="border-width: 0px; border-style: none; border-spacing: 0px;">
            <tr>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">&nbsp;</td>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">
                    &nbsp;</td>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">&nbsp;</td>
            </tr>
            <tr>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">&nbsp;</td>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/tech support logo.png" style="text-align: left" />
                </td>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">&nbsp;</td>
            </tr>
            <tr>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">&nbsp;</td>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">
                    &nbsp;</td>
                <td width="33.3%" style="border-color: #FFFFFF; border-style: none; background-color: #FFFFFF;">&nbsp;</td>
            </tr>
            <tr>
                <td width="33.3%">&nbsp;</td>
                <td width="33.3%">&nbsp;</td>
                <td width="33.3%">&nbsp;</td>
            </tr>
            <tr>
                <td width="33.3%">&nbsp;</td>
                <td width="33.3%">&nbsp;</td>
                <td width="33.3%">&nbsp;</td>
            </tr>
            <tr>
                <td width="33.3%">&nbsp;</td>
                <td width="33.3%" align="center"> 
                    
    <asp:Login ID="Login5" runat="server" Height="229px" Width="454px" CreateUserUrl="~/Admin/registration.aspx" DestinationPageUrl="~/landingPage.aspx" DisplayRememberMe="False" OnLoggedIn="Login5_LoggedIn">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:229px;width:454px; margin-right: 0px;">
                            <tr>
                                <td align="center" colspan="2" class="auto-style3"><strong><span class="auto-style4">Business Management System</span><br />
                                    <br />
                                    </strong></td>
                            </tr>
                            <tr>
                                <td colspan="1">

                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>

                                </td>
                                <td>

                                    <asp:TextBox ID="UserName" runat="server" style="text-align: left" Width="170px" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." Display="Dynamic">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>

                            <tr>
                                <td colspan="1">
                                    
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>

                                </td>
                                <td ;>
                                       <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="170px" style="text-align: left" TabIndex="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." Display="Dynamic">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
    <tr>
       <td></td><td><asp:Button ID="LoginButton0" runat="server" CommandName="Login" Text="Log In" style="text-align: right; margin-left: 0px" Height="27px" TabIndex="3" /></td>
         
    </tr>                        
                          
                            <tr>
                                <td align="center" colspan="2" style="color:yellow; text-align: center;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                          
                            </tr>
                            
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Yellow" style="text-align: left" />
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
                </td>
                <td width="33.3%">&nbsp;</td>
                
            </tr>
            <tr>
                <td width="33.3%">&nbsp;</td>
                <td align="center" width="33.3%" >
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <span class="auto-style2">&copy; 2015 TechSupport PTY LTD </span> </td>
                <td width="33.3%">&nbsp;</td>
                
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
