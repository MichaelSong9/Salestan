using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CheckLogin
/// </summary>
public class CheckLogin
{
    public bool checkLogin(int UserId)
    {
        if (UserId == 0)
        {
            return false;
        }
        else
        {
            return true;
        }
	}
}