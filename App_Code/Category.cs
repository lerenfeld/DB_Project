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



    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    

    private int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    public Category(string _name)
    {
        name = _name;

    }


    //--------------------------------------------
    //first method:datareader + CCEC
    //--------------------------------------------
    //public int insert()
    //{
    //    DBservices dbs = new DBservices();
    //    int numAffected = dbs.insert(this);
    //    return numAffected;
    //}
    ////---------------------------------------------------

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
    //---------------------------------------------------

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