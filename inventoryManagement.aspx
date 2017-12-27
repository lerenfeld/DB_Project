<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="inventoryManagement.aspx.cs" Inherits="inventoryManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        #inventoryManagement {
            background-color: black;
        }

         #inventoryManagement a {
            color: white;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ProductsDBConnectionString %>" DeleteCommand="DELETE FROM [productN] WHERE [productN_id] = @original_productN_id AND [productN_name] = @original_productN_name AND [productN_imagePath] = @original_productN_imagePath AND [productN_price] = @original_productN_price AND [productN_inventory] = @original_productN_inventory AND [productN_status] = @original_productN_status AND [productN_category] = @original_productN_category" InsertCommand="INSERT INTO [productN] ([productN_name], [productN_imagePath], [productN_price], [productN_inventory], [productN_status], [productN_category]) VALUES (@productN_name, @productN_imagePath, @productN_price, @productN_inventory, @productN_status, @productN_category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [productN]" UpdateCommand="UPDATE [productN] SET [productN_inventory] = @productN_inventory, [productN_status] = @productN_status WHERE [productN_id] = @original_productN_id AND [productN_name] = @original_productN_name AND [productN_imagePath] = @original_productN_imagePath AND [productN_price] = @original_productN_price AND [productN_inventory] = @original_productN_inventory AND [productN_status] = @original_productN_status AND [productN_category] = @original_productN_category">
        <DeleteParameters>
            <asp:Parameter Name="original_productN_id" Type="Int32" />
            <asp:Parameter Name="original_productN_name" Type="String" />
            <asp:Parameter Name="original_productN_imagePath" Type="String" />
            <asp:Parameter Name="original_productN_price" Type="Double" />
            <asp:Parameter Name="original_productN_inventory" Type="Int32" />
            <asp:Parameter Name="original_productN_status" Type="Boolean" />
            <asp:Parameter Name="original_productN_category" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productN_name" Type="String" />
            <asp:Parameter Name="productN_imagePath" Type="String" />
            <asp:Parameter Name="productN_price" Type="Double" />
            <asp:Parameter Name="productN_inventory" Type="Int32" />
            <asp:Parameter Name="productN_status" Type="Boolean" />
            <asp:Parameter Name="productN_category" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="productN_name" Type="String" />
            <asp:Parameter Name="productN_imagePath" Type="String" />
            <asp:Parameter Name="productN_price" Type="Double" />
            <asp:Parameter Name="productN_inventory" Type="Int32" />
            <asp:Parameter Name="productN_status" Type="Boolean" />
            <asp:Parameter Name="productN_category" Type="String" />
            <asp:Parameter Name="original_productN_id" Type="Int32" />
            <asp:Parameter Name="original_productN_name" Type="String" />
            <asp:Parameter Name="original_productN_imagePath" Type="String" />
            <asp:Parameter Name="original_productN_price" Type="Double" />
            <asp:Parameter Name="original_productN_inventory" Type="Int32" />
            <asp:Parameter Name="original_productN_status" Type="Boolean" />
            <asp:Parameter Name="original_productN_category" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" DataKeyNames="productN_id" DataSourceID="SqlDataSource1" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="productN_id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="productN_id" >
            <ControlStyle Width="100px" />
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="productN_name" HeaderText="Name"  ReadOnly="True" SortExpression="productN_name" >
            <ControlStyle Width="100px" />
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="productN_price" HeaderText="Price"  ReadOnly="True" SortExpression="productN_price" >
            <ControlStyle Width="100px" />
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="productN_inventory" HeaderText="Inventory" SortExpression="productN_inventory" >
            <ControlStyle Width="100px" />
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="productN_status" HeaderText="Status"  SortExpression="productN_status" >
            <ControlStyle Width="100px" />
            <HeaderStyle Width="100px" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="productN_category" HeaderText="Category"  ReadOnly="True" SortExpression="productN_category" >
            <ControlStyle Width="100px" />
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="productN_imagePath" HeaderText="Image" ReadOnly="True">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#000000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
   
</asp:Content>

