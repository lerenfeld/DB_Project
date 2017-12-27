using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Category
{
	public Category()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int id;

    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    public Category(string _name)
    {
        name = _name;
    }


    //----------------------------------------------------
    //second method:dataAdapter
    //-----------------------------------------------------
    public DataTable readCategorysDB()
    {
        DBservices dbs = new DBservices();
        dbs = dbs.searchItemsInDataBase("ProductsDBConnectionString", "SELECT * FROM category");
        // save the dataset in a session object
        HttpContext.Current.Session["categoryDataSet"] = dbs;
        return dbs.dt;
    }


    //------------------------------------------------------------------------
    // update the dataset with a new car record
    //------------------------------------------------------------------------
    public void updateTable()
    {
        if (HttpContext.Current.Session["categoryDataSet"] == null) return;
        DBservices dbs = (DBservices)HttpContext.Current.Session["categoryDataSet"];
        DataRow dr = dbs.dt.NewRow();
        dr["Category_name"] = name;
        dbs.dt.Rows.Add(dr);

    }
    //---------------------------------------------------------------------------------
    // update the database
    //---------------------------------------------------------------------------------
    public void updateDatabase()
    {
        if (HttpContext.Current.Session["categoryDataSet"] == null) return;
        DBservices dbs = (DBservices)HttpContext.Current.Session["categoryDataSet"];
        dbs.Update();
    }
}