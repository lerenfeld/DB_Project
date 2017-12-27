using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    int originalPrice;
    
    
    string lastLabelid = null;
    double totalPrice = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        initialPage();
        //CartSubmitButton.UseSubmitBehavior = false;
    }
   
        
    protected void initialPage() {
        if (Session["checkedProductsList"] != null)
        {
            List<Product> checkedProductsList = (List<Product>)Session["checkedProductsList"];
            if (checkedProductsList == null || checkedProductsList.Count < 1)
            {
                cartPh.Controls.Add(new LiteralControl("<h2>No products chose</h2>"));
            }
            else
                foreach (var product in checkedProductsList)
                {
                    //create controllers
                    Image ProductImage = new Image();
                    Label ProductTitle = new Label();
                    Label ProductPrice = new Label();
                    CheckBox ProductCheckBox = new CheckBox();
                    TextBox amountTB = new TextBox();
                    Label amountAlertLBL = new Label();
                    RegularExpressionValidator regex = new RegularExpressionValidator();

                    //set controllers
                    ProductCheckBox.ID = "CartProductCheckBox" + Convert.ToString(product.Id);
                    ProductCheckBox.Checked = true;
                    ProductCheckBox.Text = "Remove from cart";
                    ProductTitle.Text = "<h3 class='content'>" + Convert.ToString(product.ProductName) + "</h3>";
                    ProductImage.ImageUrl = product.ImagePath;
                    ProductCheckBox.AutoPostBack = true;
                    ProductCheckBox.CheckedChanged += CheckedChangedFunc;
                    ProductPrice.Text = Convert.ToString(product.Price);
                    ProductPrice.ID = "ProductPrice" + Convert.ToString(product.Id);
                    amountTB.Text = "1";
                    amountTB.Columns = 1;
                    amountTB.TextChanged += amountTB_TextChanged;
                    amountTB.ID = "CartProductAmount" + Convert.ToString(product.Id);
                    amountAlertLBL.ID="ProductAmountError" + Convert.ToString(product.Id);
                    regex.ControlToValidate = amountTB.ID;
                    regex.ValidationExpression = "^[0-9]*$";
                    regex.ErrorMessage = "numbers only!";
                    


                    //insert all info to page
                    cartPh.Controls.Add(new LiteralControl("<div class='col-lg-3 col-md-6 col-xs-12'>"));
                    cartPh.Controls.Add(new LiteralControl("<div class='jumbotron'>"));
                    cartPh.Controls.Add(ProductImage);
                    cartPh.Controls.Add(new LiteralControl("<br />"));
                    cartPh.Controls.Add(ProductTitle);
                    cartPh.Controls.Add(new LiteralControl("Price:"));
                    cartPh.Controls.Add(ProductPrice);
                    cartPh.Controls.Add(new LiteralControl("<br />"));
                    cartPh.Controls.Add(ProductCheckBox);
                    cartPh.Controls.Add(new LiteralControl("<br /> Amount: "));
                    cartPh.Controls.Add(amountTB);
                    cartPh.Controls.Add(new LiteralControl("<br />"));
                    cartPh.Controls.Add(regex);
                    cartPh.Controls.Add(amountAlertLBL);
                    cartPh.Controls.Add(new LiteralControl("</div> </div>"));
                    totalPrice += product.Price;
                }
            tatalCartPrice.Controls.Add(new LiteralControl("<h2>Total Price: " + totalPrice + "</h2>"));
            if (Request.Cookies["CartChanged"] != null)
            {
                if (Request.Cookies["CartChanged"].Value == "1")
                {
                    CartMessageArea.Text = "<h2>The changes have been saved</h2>";
                    Response.Cookies["CartChanged"].Value = "0";

                }
            }
        }
        else cartPh.Controls.Add(new LiteralControl("<h2>You didn't chose product yet!</h2>"));
    
    
    
    
    }

    void amountTB_TextChanged(object sender, EventArgs e)//check inventory, and update the message if more then 5 or more then inventory
    {
        //if (lastLabelid != null && totalPrice!=0)
        //{
        //    Label OldAlertLBL = (Label)cartPh.FindControl("ProductAmountError" + Convert.ToString(lastLabelid));
        //    OldAlertLBL.Text = "";
        //    Label OldPrice=(Label)cartPh.FindControl("ProductPrice" + Convert.ToString(lastLabelid));
        //    OldPrice.Text = Convert.ToString(originalPrice);
        //}
        DBservices dbs = new DBservices();
        TextBox TB = (TextBox)sender;
        string name = TB.ID;
        int productId = Convert.ToInt32(name.Replace("CartProductAmount", ""));
        try
        {
            string selectquery="select productN_inventory from productN where productN_id="+productId;
            dbs = dbs.searchItemsInDataBase("ProductsDBConnectionString", selectquery);
        }
        catch (Exception ex)
        {
            Response.Write("Unable to read from the database " + ex.Message);
            return;
        }

        foreach (DataRow dr in dbs.dt.Rows)
        {
            
            int productInventory = (int)dr["productN_inventory"];
            Label AlertLBL = (Label)cartPh.FindControl("ProductAmountError" + Convert.ToString(productId));

            if (Convert.ToInt32(TB.Text) > productInventory)
            {
                AlertLBL.Text = "<h6 class='alert'>Inventory is " + productInventory + "<h6>";
                TB.Text = "1";
                lastLabelid = "ProductAmountError" + Convert.ToString(productId);

            }
            else if (Convert.ToInt32(TB.Text)>5)
            {
                AlertLBL.Text = "<h6 class='alert'>if you'll buy up to 5 products you'll get discount of 10% off<h6>";
                Label ProductPricetLBL = (Label)cartPh.FindControl("ProductPrice" + Convert.ToString(productId));
                originalPrice = Convert.ToInt32(ProductPricetLBL.Text);
                double newPrice=Convert.ToInt32(ProductPricetLBL.Text) * 0.9;
                ProductPricetLBL.Text =Convert.ToString(newPrice);
                ProductPricetLBL.CssClass = "alert";
                lastLabelid = "ProductAmountError" + Convert.ToString(productId);
            }
            else if (Convert.ToInt32(TB.Text) < 6) {
                AlertLBL.Text = "";

            
            }
        }


    }



    void CheckedChangedFunc(object sender, EventArgs e)
    {
        CheckBox cb = sender as CheckBox;
        if (!cb.Checked)
        {
            int id = Convert.ToInt32(cb.ID.Replace("CartProductCheckBox", ""));
            Product currentProduct = null;
            if (Session["checkedProductsList"] != null)
            {
                List<Product> checkedProductsList = (List<Product>)Session["checkedProductsList"];
                if (checkedProductsList.Exists(product => product.Id == id))
                {
                    currentProduct = checkedProductsList.Find(p => p.Id == id);
                    checkedProductsList.Remove(currentProduct);
                    Session["checkedProductsList"] = checkedProductsList;
                    Response.Cookies["CartChanged"].Value = "1";
                    Response.Redirect("Cart.aspx");

                }
            }
        }

    }
    protected void CartSubmitButton_Click(object sender, EventArgs e)
    {
        Session["TotalAmount"] = totalPrice;
        Response.Redirect("Payment.aspx");
    }

}