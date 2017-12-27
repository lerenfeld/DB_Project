<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="showSales.aspx.cs" Inherits="showSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        #showSales {
            background-color: black;
        }

            #showSales a {
                color: white;
            }


        h4,h2 {
            color: white;
        }
        td{
            padding: 5px;
        }
     
    </style>



</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <table>
        <tr>
            <td>
                <h2>sales</h2>
            </td>
        </tr>
        <tr>

            <td>
                <h4>Choose a filter category  : </h4>
            </td>
            <td>
                <asp:DropDownList ID="CategoryDropDownList" runat="server" DataTextField="Category_name" DataValueField="Category_name">
                </asp:DropDownList></td>

            <td>
                <asp:Button ID="SelectCategoryButtun" runat="server" Text="Filter Sales" OnClick="SelectCategoryButtun_Click" />
            </td>
        </tr>
    </table>


    <asp:SqlDataSource ID="SalesDB" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsDBConnectionString %>" SelectCommand="select [Sale_id],[Sale_userName],[Sale_date],[Sale_payment],[productN_name],[ProductInSale_amount],[ProductInSale_product_total_price]
from [dbo].[Sale] inner join [dbo].[ProductInSale] on 
[Sale_id] = [ProductInSale_sale_id] inner join [dbo].[productN] on 
 [ProductInSale_product_id] =[productN_id]
"></asp:SqlDataSource>


</asp:Content>


