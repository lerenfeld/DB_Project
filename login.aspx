<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Login</h1>
            <table>
                <tr>
                    <td>User name 
                    </td>
                    <td>
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredNameValidator" ControlToValidate="UserName"
                            runat="server" ErrorMessage="You must enter a user name"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Password  
                    </td>
                    <td>
                        <asp:TextBox ID="UserPassword" runat="server"> </asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredPasswordValidator" runat="server" ControlToValidate="UserPassword"
                            ErrorMessage="You must enter a password"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Remember me </td>
                    <td>
                        <asp:CheckBox ID="rememberMeCB" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="submit" runat="server" Text="Log-in" OnClick="submit_Click" />
                    </td>


                </tr>
            </table>
            <asp:Label ID="LogIn_Massage" runat="server" Text="" Visible="false"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
