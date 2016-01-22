using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminCompanies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check premissions
        AdminPremissions ap = new AdminPremissions();
        bool AdminPremission = ap.getAdminPremissions(Convert.ToInt32(Session["UserId"]), "Companies");
        if (!AdminPremission)
        {
            Response.Redirect("~/Error.aspx?Code=404");
        }

        //insert log
        if (!IsPostBack)
        {
            AdminLogInsert ali = new AdminLogInsert();
            ali.insertAdminLog(Convert.ToInt32(Session["UserId"]), 1400, 0, "0");
        }
    }
    protected void LinkButtonManage_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = true;
        PanelAdd.Visible = false;
        PanelTypes.Visible = false;
        LinkButtonManage.Enabled = false;
        LinkButtonAdd.Enabled = true;
        LinkButtonTypes.Enabled = true;
    }
    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = false;
        PanelAdd.Visible = true;
        PanelTypes.Visible = false;
        LinkButtonManage.Enabled = true;
        LinkButtonAdd.Enabled = false;
        LinkButtonTypes.Enabled = true;
    }
    protected void LinkButtonTypes_Click(object sender, EventArgs e)
    {
        PanelManage.Visible = false;
        PanelAdd.Visible = false;
        PanelTypes.Visible = true;
        LinkButtonManage.Enabled = true;
        LinkButtonAdd.Enabled = true;
        LinkButtonTypes.Enabled = true;
    }
    protected void ImageButtonAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            bool hasPhoto = false;
            if (FileUploadLogo.HasFile)
            {
                hasPhoto = true;
            }

            // Get Values from CheckBoxList
            String Locations = "";
            for (int i = 0; i < CheckBoxListLocations.Items.Count; i++)
            {
                if (CheckBoxListLocations.Items[i].Selected)
                {
                    Locations += CheckBoxListLocations.Items[i].Value + ",";
                }
            }

            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlCommand sqlCmd = new SqlCommand("sp_companyAdd", sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Add("@OwnerId", SqlDbType.Int).Value = TextBoxOwnerId.Text;
            sqlCmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = TextBoxName.Text;
            sqlCmd.Parameters.Add("@About", SqlDbType.NVarChar).Value = TextBoxAbout.Text;
            sqlCmd.Parameters.Add("@TypeId", SqlDbType.VarChar).Value = DropDownListType.SelectedValue;
            sqlCmd.Parameters.Add("@FieldId", SqlDbType.VarChar).Value = DropDownListField.SelectedValue;
            sqlCmd.Parameters.Add("@Tel", SqlDbType.VarChar).Value = TextBoxPhone.Text;
            sqlCmd.Parameters.Add("@Fax", SqlDbType.VarChar).Value = TextBoxFax.Text;
            sqlCmd.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = TextBoxMobile.Text;
            sqlCmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = TextBoxEmail.Text;
            sqlCmd.Parameters.Add("@Website", SqlDbType.NVarChar).Value = TextBoxWebsite.Text;
            sqlCmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = TextBoxAddress.Text;
            sqlCmd.Parameters.Add("@GoogleMap", SqlDbType.VarChar).Value = TextBoxGoogleMap.Text;
            sqlCmd.Parameters.Add("@Locations", SqlDbType.VarChar).Value = Locations;
            sqlCmd.Parameters.Add("@Photo", SqlDbType.Bit).Value = hasPhoto;

            sqlConn.Open();
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            sqlConn.Dispose();

            LabelAddMessage.Visible = true;
            LabelAddMessage.Text = "شغل مورد نظر اضافه گردید.";
            LabelAddMessage.CssClass = "SuccessMessage";



            //    if (FileUploadAddPhoto.HasFile)
            //    {
            //        //use WebManager to get the file, and save it
            //        IImageInfo img = WebManager.GetImageInfo(FileUploadAddPhoto);
            //        img.Path = "photos";
            //        img.FileName = Session["UserId"].ToString() + ".jpg";

            //        //now create resized versions, and save them
            //        IImageInfo imgResize = img.ResizeMe(120, 120);		//constrain to 120 pixels wide
            //        imgResize.Save("photos/links");
            //        IImageInfo imgResizeSmall = img.ResizeMe(80, 80);		//constrain to 80 pixels wide
            //        imgResize.Save("photos/links/small");
            //    }
        }
    }
    protected void ImageButtonTypeAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (!captchaType.Decide())
        {
            captchaType.message = "پاسخ اشتباه است!";
        }
        else
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_companyTypeAddCheckExists", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add("@TypeId", SqlDbType.VarChar).Value = TextBoxTypeId.Text;
            sda.SelectCommand.Parameters.Add("@TypeName", SqlDbType.NVarChar).Value = TextBoxTypeName.Text;
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count == 0) //user doesn't exist
            {
                SqlCommand sqlCmd = new SqlCommand("sp_companyTypeAdd", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@TypeId", SqlDbType.VarChar).Value = TextBoxTypeId.Text;
                sqlCmd.Parameters.Add("@TypeName", SqlDbType.NVarChar).Value = TextBoxTypeName.Text;

                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();

                GridViewTypes.DataBind();

                sqlCmd.Dispose();
                sqlConn.Dispose();
                sda.Dispose();

                LabelAddTypeMessage.Visible = true;
                LabelAddTypeMessage.Text = "نوع با مشخصات وارد شده اضافه گردید.";
                LabelAddTypeMessage.CssClass = "SuccessMessage";
            }
            else //user exists as an admin
            {
                LabelAddTypeMessage.Visible = true;
                LabelAddTypeMessage.Text = "نوع با مشخصات وارد شده موجود می باشد.";
                LabelAddTypeMessage.CssClass = "ErrorMessage";

                sda.Dispose();
                sqlConn.Close();
            }
        }
    }
    protected void ImageButtonOwner_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("sp_userFullNameByUserId", sqlConn);
        sda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sda.SelectCommand.Parameters.Add("@UserId", SqlDbType.Int).Value = Convert.ToInt32(TextBoxOwnerId.Text);
        sda.Fill(ds);
        dt = ds.Tables[0];

        if (dt.Rows.Count == 0) //user doesn't exist
        {
            LabelName.Text = "کاربری با این شناسه موجود نمی باشد!";
        }
        else //user exists
        {
            LabelName.Text = dt.Rows[0]["FullName"].ToString();
        }
        sda.Dispose();
        sqlConn.Close();
    }
    protected void ImageButtonFieldAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (!captcha.Decide())
        {
            captcha.message = "پاسخ اشتباه است!";
        }
        else
        {
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ShopConnectionString"].ConnectionString);

            SqlDataAdapter sda = new SqlDataAdapter("sp_companyFieldAddCheckExists", sqlConn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.Add("@FieldId", SqlDbType.VarChar).Value = TextBoxFieldId.Text;
            sda.SelectCommand.Parameters.Add("@FieldName", SqlDbType.NVarChar).Value = TextBoxFieldName.Text;
            sda.Fill(ds);
            dt = ds.Tables[0];

            if (dt.Rows.Count == 0) //user doesn't exist
            {
                SqlCommand sqlCmd = new SqlCommand("sp_companyFieldAdd", sqlConn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Add("@FieldId", SqlDbType.VarChar).Value = TextBoxFieldId.Text;
                sqlCmd.Parameters.Add("@FieldName", SqlDbType.NVarChar).Value = TextBoxFieldName.Text;

                sqlConn.Open();
                sqlCmd.ExecuteNonQuery();

                GridViewFields.DataBind();

                sqlCmd.Dispose();
                sqlConn.Dispose();
                sda.Dispose();

                LabelAddFieldMessage.Visible = true;
                LabelAddFieldMessage.Text = "زمینه با مشخصات وارد شده اضافه گردید.";
                LabelAddFieldMessage.CssClass = "SuccessMessage";
            }
            else //user exists as an admin
            {
                LabelAddFieldMessage.Visible = true;
                LabelAddFieldMessage.Text = "زمینه با مشخصات وارد شده موجود می باشد.";
                LabelAddFieldMessage.CssClass = "ErrorMessage";

                sda.Dispose();
                sqlConn.Close();
            }
        }
    }
    protected string ShowDate(Object SubmitDate)
    {
        DateTime Date = Convert.ToDateTime(SubmitDate);
        TimeClass tc = new TimeClass();
        return tc.ConvertToIranTimeString(Date);
    }
}