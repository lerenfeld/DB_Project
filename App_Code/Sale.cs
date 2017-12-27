using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sale
/// </summary>
public class Sale
{
    public Sale()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int productID;
    float productTotalPrice;
    int amount;
    string userName;

    public int ProductID
    {
        get
        {
            return productID;
        }

        set
        {
            productID = value;
        }
    }

    public float ProductTotalPrice
    {
        get
        {
            return productTotalPrice;
        }

        set
        {
            productTotalPrice = value;
        }
    }

    public int Amount
    {
        get
        {
            return amount;
        }

        set
        {
            amount = value;
        }
    }

    public string UserName
    {
        get
        {
            return userName;
        }

        set
        {
            userName = value;
        }
    }
}