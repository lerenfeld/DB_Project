using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

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

        }


    }

  
}