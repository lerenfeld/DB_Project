﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="showSales.aspx.cs" Inherits="showSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        #showSales {
            background-color: black;
        }

            #showSales a {
                color: white;
            }


        h4, h2 {
            color: white;
        }

        td {
            padding: 5px;
        }

        table {
            margin: 0 auto;
            text-align:center;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <table>
        <tr>
            <td colspan="2">
                <h2>Sales</h2>
            </td>
        </tr>
        <tr>
            <td>
                <h4>Choose a filter category  : </h4>
            </td>
            <td>
                <asp:DropDownList ID="CategoryDropDownList" runat="server" DataTextField="Category_name" AutoPostBack="true" DataValueField="Category_name" OnSelectedIndexChanged="CategoryDropDownList_SelectedIndexChanged">
                </asp:DropDownList></td>
        </tr>
    </table>
   
                <asp:SqlDataSource ID="SaleDB" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsDBConnectionString %>" SelectCommand="select [Sale_id],[Sale_productId],[Sale_productTotalPrice],[Sale_amount],[Sale_userName],[Sale_date],[Sale_payment]
from [dbo].[Sale] inner join [dbo].[productN] on [Sale_productId]= [productN_id] inner join [dbo].[Category] on [Category_name] =[productN_category]"></asp:SqlDataSource>

                 <asp:GridView ID="SaleGridView" runat="server" AllowSorting="True" DataSourceID="SaleDB" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnRowDataBound="subStringDate" >
                     <AlternatingRowStyle BackColor="White" />
                     <EditRowStyle BackColor="#7C6F57" />
                     <FooterStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#E3EAEB" />
                     <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#F8FAFA" />
                     <SortedAscendingHeaderStyle BackColor="#246B61" />
                     <SortedDescendingCellStyle BackColor="#D4DFE1" />
                     <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

</asp:Content>


