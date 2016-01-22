using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for SiteInformation
/// </summary>
public class SiteInformation
{
    public string[] getInformation()
    {
        DataTable dt = new DataTable();
        DataTable dtComments = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_settingsInformationInfo", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.Fill(ds);
        dt = ds.Tables[0];

        string[] returnFields = new string[] 
        { 
            dt.Rows[0]["SiteName"].ToString(), 
            dt.Rows[0]["SiteUrl"].ToString(), 
            dt.Rows[0]["DefaultTitle"].ToString(), 
            dt.Rows[0]["SocialFacebook"].ToString(), 
            dt.Rows[0]["SocialTwitter"].ToString(), 
            dt.Rows[0]["SocialYoutube"].ToString() 
        };

        return returnFields;
	}
}