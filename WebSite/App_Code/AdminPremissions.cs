using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminPremissions
/// </summary>
public class AdminPremissions
{
    public bool getAdminPremissions(int AdminId, string Section)
    {
        DataClassesDataContext context = new DataClassesDataContext();
        Admin queryVerify;

        switch (Section)
        {
            case "Admins":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremAdmins == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Ads":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremAds == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Blog":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremBlog == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Charity":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremCharity == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Companies":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremCompanies == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Content":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremContent == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Coupons":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremCoupons == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Credit":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremCredit == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Locations":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremLocations == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Newsletter":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremNewsletter == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Offers":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremOffers == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Settings":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremSettings == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Stats":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremStats == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Support":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremSupport == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            case "Users":
                {
                    queryVerify = context.Admins.Where(r => r.UserId == AdminId && r.PremUsers == true && r.Status == 1).FirstOrDefault();
                    break;
                }
            default:
                {
                    queryVerify = null;
                    break;
                }
        }

        if (queryVerify == null)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
}