using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class ChangePassword : System.Web.UI.Page
    
{
    DataClassesDataContext context = new DataClassesDataContext();

    String VCod;
    protected void Page_Load(object sender, EventArgs e)
    {
        //check login status
        CheckLogin cl = new CheckLogin();
        bool LoginStatus = cl.checkLogin(Convert.ToInt32(Session["UserId"]));
        if (LoginStatus)
        {
            Response.Redirect("~/Panel.aspx");
        }

        lblsucces.Visible = false;
        Imageok.Visible = false;
     
        VCod = Convert.ToString(Request.QueryString["VCode"]);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

        
        if (txtNewPass.Text!="" && txtNewPassRepeat.Text!="")
        {
            Literal1.Text = "";
            var query1 = context.ForgotPasswords.Where(v => v.VerificationCode == VCod).FirstOrDefault();
            int UserId = query1.UserId;
            var query = context.Users.Where(u => u.UserId == UserId).SingleOrDefault();

            string NewPass = txtNewPass.Text;
            string RpNewPass = txtNewPassRepeat.Text;



            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();

            Byte[] hashedBytes;

            UTF8Encoding encoder = new UTF8Encoding();

            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(NewPass));

            if (NewPass == RpNewPass)
            {

                query.Password = hashedBytes;
                context.SubmitChanges();


                context.ForgotPasswords.DeleteOnSubmit(query1);
                context.SubmitChanges();

                lblsucces.Visible = true;
                Imageok.Visible = true;

            }
            else
            {
                Literal1.Text = "<p class='FormValidation'>کلمه عبور و تکرار آن را  وارد نمایید!</p>";
            }

        }
        }
        catch (Exception)
        {

            Response.Redirect("~/Default.aspx");
        }
    
        }
      


    }