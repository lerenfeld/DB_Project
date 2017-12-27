using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;


public partial class showSales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            DBservices DBservices = new DBservices();
            SqlConnection con = DBservices.connect("ProductsDBConnectionString");

            SqlCommand cmd = new SqlCommand("select * from category", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            CategoryDropDownList.DataSource = dt;
            CategoryDropDownList.DataBind();




            GridView grdv = new GridView(); // create a new datagrid
            grdv.ForeColor = Color.Gray;
            grdv.BackColor = Color.White;
            grdv.ControlStyle.BorderStyle = BorderStyle.Double;
            grdv.ControlStyle.BorderWidth = 10;

            string selectquery = "select [Sale_id],[Sale_userName],[Sale_date],[Sale_payment]," +
                "[productN_name],[ProductInSale_amount],[ProductInSale_product_total_price]" +
    "from [dbo].[Sale] inner join [dbo].[ProductInSale] on [Sale_id] = [ProductInSale_sale_id]" +
    "inner join [dbo].[productN] on [ProductInSale_product_id] =[productN_id]";
            DBservices = DBservices.searchItemsInDataBase("ProductsDBConnectionString", selectquery);
            grdv.DataSource = DBservices.dt;
            grdv.DataBind();               // bind the control view to the data

            Page.Form.Controls.Add(grdv);

        }


    }


    protected void SelectCategoryButtun_Click(object sender, EventArgs e)
    {
        DBservices dbs = new DBservices();

        GridView grdv = new GridView(); // create a new datagrid
        grdv.ForeColor = Color.Gray;
        grdv.BackColor = Color.White;
        grdv.ControlStyle.BorderStyle = BorderStyle.Double;
        grdv.ControlStyle.BorderWidth = 10;

        string selectquery = "select [Sale_id],[Sale_userName],[Sale_date],[Sale_payment]," +
            "[productN_name],[ProductInSale_amount],[ProductInSale_product_total_price]" +
"from [dbo].[Sale] inner join [dbo].[ProductInSale] on [Sale_id] = [ProductInSale_sale_id]" +
"inner join [dbo].[productN] on [ProductInSale_product_id] =[productN_id] where [productN_category]='" + CategoryDropDownList.SelectedValue + "'";
        dbs = dbs.searchItemsInDataBase("ProductsDBConnectionString", selectquery);
        grdv.DataSource = dbs.dt;
        grdv.DataBind();               // bind the control view to the data

        Page.Form.Controls.Add(grdv);
    }
}