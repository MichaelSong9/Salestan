using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class AdminPages_Settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Settings");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        switch (Request.QueryString["Mode"])
        {
            case "Styles":
                {
                    PanelStyles.Visible = true;
                    Page.Title = "Salestan : تغییر فایل استایل";

                    string inputString;
                    using (StreamReader streamReader = File.OpenText(Server.MapPath("~") + @"\Styles\Styles.css"))
                    {
                        inputString = streamReader.ReadLine();
                        while (inputString != null)
                        {
                            TextBoxStyles.Text += inputString;
                            inputString = streamReader.ReadLine();
                        }
                    }

                    break;
                }
        }
    }
}