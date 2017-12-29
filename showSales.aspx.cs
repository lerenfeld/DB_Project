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

        if (!IsPostBack)
        {
            if (Session["logedInUser"] == null)
            {//unsigned user
                Response.Redirect("login.aspx");
            }
            if (Session["logedInUser"] != null)
            {//signed user
                User logedInUser = (User)Session["logedInUser"];
                if (logedInUser.Type == "user")//customer user
                    Response.Redirect("showProducts.aspx");
                else {
                    initialPage();
                
                }
            }
        }
    }


    protected void initialPage()
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

            string selectquery = "select [Sale_id],[Sale_productId],[Sale_productTotalPrice],[Sale_amount],[Sale_userName],[Sale_date],[Sale_payment]" +
    "from [dbo].[Sale] inner join [dbo].[productN] on [Sale_productId]= [productN_id] inner join [dbo].[Category] on [Category_name] =[productN_category]" +
    "where [Category_name] = '" + CategoryDropDownList.SelectedValue + "'";
            DBservices = DBservices.searchItemsInDataBase("ProductsDBConnectionString", selectquery);
            grdv.DataSource = DBservices.dt;
            //grdv.Columns[6].DefaultCellStyle.Format = "MM/dd/yyyy";

            grdv.DataBind();               // bind the control view to the data

            Page.Form.Controls.Add(grdv);

        
    }

    


    protected void SelectCategoryButtun_Click(object sender, EventArgs e)
    {
        DBservices dbs = new DBservices();

        GridView grdv = new GridView(); // create a new datagrid
        grdv.ForeColor = Color.Gray;
        grdv.BackColor = Color.White;
        grdv.ControlStyle.BorderStyle = BorderStyle.Double;
        grdv.ControlStyle.BorderWidth = 10;

        string selectquery = "select [Sale_id],[Sale_productId],[Sale_productTotalPrice],[Sale_amount],[Sale_userName],[Sale_date],[Sale_payment]" +
"from [dbo].[Sale] inner join [dbo].[productN] on [Sale_productId]= [productN_id] inner join [dbo].[Category] on [Category_name] =[productN_category]" +
"where [Category_name] = '" + CategoryDropDownList.SelectedValue + "'";
        dbs = dbs.searchItemsInDataBase("ProductsDBConnectionString", selectquery);
        grdv.DataSource = dbs.dt;
        grdv.DataBind();               // bind the control view to the data

        Page.Form.Controls.Add(grdv);
    }
}



