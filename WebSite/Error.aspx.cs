using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageImage.ImageUrl = "~/images/error/default.png";
        Page.Title = "Salestan : خطایی رخ داد";

        try
        {
            if (Request.QueryString["Code"].ToString() != null)
            {
                switch (Request.QueryString["Code"].ToString())
                {
                    case "404":
                        ImageImage.ImageUrl = "~/images/error/404.png";
                        Page.Title = "Salestan : صفحه مورد نظر پیدا نشد";
                        break;
                    case "NotFound":
                        ImageImage.ImageUrl = "~/images/error/404.png";
                        Page.Title = "Salestan : صفحه مورد نظر پیدا نشد";
                        break;
                    default:
                        ImageImage.ImageUrl = "~/images/error/default.png";
                        Page.Title = "Salestan : خطایی رخ داد";
                        break;
                }
            }
        }
        catch (Exception)
        {

        }
    }
}