<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addProduct.aspx.cs" Inherits="addProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #addProduct {
            background-color: black;

        }

            #addProduct a {
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="Headers">טופס הכנסת מוצר חדש</h1>
    <div class="formClass">
        <!-- ==BEGIN Table == -->
        <br />
        <br />
        <table class="createProductTable">
            <tr>
                <td>Name 
                </td>
                <td>
                    <asp:TextBox ID="productNameTB" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredProductNameldValidator" ControlToValidate="productNameTB" runat="server" ErrorMessage="Please insert product name" Style="color: #FF0000"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td>Price</td>
                <td>
                    <asp:TextBox ID="productPriceTB" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredProductPriceValidator" ControlToValidate="productPriceTB" runat="server" ErrorMessage="Please insert product price" Style="color: #FF0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ProductPriceExpressionValidator" ControlToValidate="productPriceTB" runat="server" ErrorMessage="Numbers Only" ValidationExpression="^[0-9]*$" Style="color: #FF0000"></asp:RegularExpressionValidator>
                </td>

            </tr>
            <tr>
                <td>Product Category 
                </td>
                <td>
                    <asp:DropDownList ID="productCategoryDDL" runat="server">
                        <asp:ListItem>Select product Category</asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator InitialValue="Select product Category" ID="RequiredProductCategorValidator" ControlToValidate="productCategoryDDL" runat="server" ErrorMessage="Please choose product category" Style="color: #FF0000"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Inventory 
                </td>
                <td>
                    <asp:TextBox ID="productInventoryTB" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredProductInventoryValidator" ControlToValidate="productInventoryTB" runat="server" ErrorMessage="Please insert product inventory" Style="color: #FF0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ProductInventoryExpressionValidator" ControlToValidate="productInventoryTB" runat="server" ErrorMessage="Numbers Only" ValidationExpression="^[0-9]*$" Style="color: #FF0000"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Image </td>
                <td>
                    <asp:FileUpload ID="FileUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFileUploadValidator" ControlToValidate="FileUpload" runat="server" ErrorMessage="please upload image" Style="color: #FF0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Is product active?</td>
                <td>
                    <asp:CheckBox ID="statusCB" Checked="true" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="messageLBL" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <!-- ==END Table == -->
        <br />
        <asp:Button ID="Submit" runat="server" Text="add product" OnClick="Submit_Click" />


    </div>

</asp:Content>

