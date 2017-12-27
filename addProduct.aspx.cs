using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
        if (Session["logedInUser"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (Session["logedInUser"] != null)
        {
            User logedInUser = (User)Session["logedInUser"];
            if (logedInUser.Type == "administrator")
            {
                initialCategoryList();
            }
            else
                Response.Redirect("showProducts.aspx");
        }
        }
    }

    private void initialCategoryList()
    {
        DBservices dbs = new DBservices();
        try
        {
            dbs = dbs.searchItemsInDataBase("ProductsDBConnectionString", "select Category_name from category");
        }
        catch (Exception ex)
        {
            Response.Write("Unable to read from the database " + ex.Message);
            return;
        }

        List<string> categoryList = new List<string>();
        foreach (DataRow dr in dbs.dt.Rows)
        {
            categoryList.Add((string)dr["Category_name"]);
        }
        productCategoryDDL.DataSource = categoryList;
        DataBind(); //must call this method in order to bind the data to the control and render the HTML
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        Product product;
        try
        { 
            string productName = productNameTB.Text;
            double productPrice = Convert.ToDouble(productPriceTB.Text);
            string CategoryName = productCategoryDDL.SelectedValue;
            int productInventory = Convert.ToInt32(productInventoryTB.Text);
            string name = FileUpload.FileName;
            string SavedFileName = Server.MapPath(".") + "/assets/images/" + name;
            string ProductFilePath = "assets/images/" + name;
            FileUpload.SaveAs(SavedFileName);
            bool productStatus;
            if (statusCB.Checked == true)
            {
                productStatus = true;
            }
            else
            {
                productStatus = false;
            }
            product = new Product(productName, productPrice, CategoryName, productInventory, ProductFilePath, productStatus);
        }
        catch (Exception ex)
        {
            messageLBL.Text = "invalid argoments inserted " + ex.Message;
            return;
        }
        try
        {
            int numEffected = product.insertProduct();
            messageLBL.Text = "you added " + numEffected.ToString() + " new product";
        }
        catch (Exception ex)
        {
            messageLBL.Text = "An error accured " + ex.Message;
        }
    }
}