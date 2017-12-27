using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
	public Product()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    int id;
    string categoryName;
    string productName;
    string imagePath;
    double price;
    int inventory;
    bool status;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    public string ProductName
    {
        get { return productName; }
        set { productName = value; }
    }
    public bool Status
    {
        get { return status; }
        set { status = value; }
    }

    public string CategoryName
    {
        get { return categoryName; }
        set { categoryName = value; }
    }

    public string ImagePath
    {
        get { return imagePath; }
        set { imagePath = value; }
    }

    public double Price
    {
        get { return price; }
        set { price = value; }
    }

    public int Inventory
    {
        get { return inventory; }
        set { inventory = value; }
    }


    public Product(string _productName, double _price, string _categoryName, int _inventory, string _imagePath, bool _status)
    {
        ProductName = _productName;
        Price = _price;
        CategoryName = _categoryName;
        Inventory = _inventory;
        ImagePath = _imagePath;
        Status=_status;
    }
    public Product(string _productName, double _price, string _categoryName, int _inventory, string _imagePath, bool _status, int _id)
    {
        ProductName = _productName;
        Price = _price;
        CategoryName = _categoryName;
        Inventory = _inventory;
        ImagePath = _imagePath;
        Status = _status;
        Id = _id;
    }
    public int insertProduct()
    {
        DBservices db = new DBservices();
        int numAffected = db.insertProduct(this);
        return numAffected;

    }
}