<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="showSales.aspx.cs" Inherits="showSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        #showSales {
            background-color: black;
        }

            #showSales a {
                color: white;
            }


        h4 {
            color: white;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <table>
        <tr>
            <td>
                <h4>Filter by category  : </h4>
            </td>
            <td>
                <asp:DropDownList ID="CategoryDropDownList" runat="server" DataTextField="Category_name" DataValueField="Category_name">

                </asp:DropDownList></td>

            <td>
                <asp:Button ID="SelectCategoryButtun" runat="server" Text="Filter" OnClick="SelectCategoryButtun_Click" />
            </td>
        </tr>
    </table>


    <asp:SqlDataSource ID="SalesDB" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsDBConnectionString %>" SelectCommand="select [Sale_id],[Sale_userName],[Sale_date],[Sale_payment],[productN_name],[ProductInSale_amount],[ProductInSale_product_total_price]
from [dbo].[Sale] inner join [dbo].[ProductInSale] on 
[Sale_id] = [ProductInSale_sale_id] inner join [dbo].[productN] on 
 [ProductInSale_product_id] =[productN_id]
" ></asp:SqlDataSource>

    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Sale_id" DataSourceID="SalesDB" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Sale_id" HeaderText="Sale_id" InsertVisible="False" ReadOnly="True" SortExpression="Sale_id" />
            <asp:BoundField DataField="Sale_userName" HeaderText="Sale_userName" SortExpression="Sale_userName" />
            <asp:BoundField DataField="Sale_date" HeaderText="Sale_date" SortExpression="Sale_date" />
            <asp:BoundField DataField="Sale_payment" HeaderText="Sale_payment" SortExpression="Sale_payment" />
            <asp:BoundField DataField="productN_name" HeaderText="productN_name" SortExpression="productN_name" />
            <asp:BoundField DataField="ProductInSale_amount" HeaderText="ProductInSale_amount" SortExpression="ProductInSale_amount" />
            <asp:BoundField DataField="ProductInSale_product_total_price" HeaderText="ProductInSale_product_total_price" SortExpression="ProductInSale_product_total_price" />
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
    </asp:GridView>--%>
</asp:Content>


