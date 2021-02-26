using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.user
{
    public partial class ProductImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["pid"];
            string imgs = @"..\Images\products";
            string path = Server.MapPath(imgs + "\\" + id + "\\");
            this.lbl_images.Text = string.Empty;
            string url = Request.Url.AbsoluteUri.Replace(Request.Url.Query, String.Empty);

            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["a"]))
                {
                    ///Delete Image
                    ///
                    string filename = Request.QueryString["f"];
                    FileInfo fi = new FileInfo(path + filename);
                    fi.Delete();

                    Response.Redirect(url+"?pid="+id);
                }
            }

            

            if (System.IO.Directory.Exists(path))
            {
                if (Directory.GetFiles(path).Length == 0)
                {
                    this.lbl_images.Text = @"NO IMAGE FOUND";
                }
                else
                {                    
                    string[] files = Directory.GetFiles(path);
                    string path2 = imgs + "\\" + id + "\\";

                    foreach (string s in files)
                    {
                        string f = path2 + Path.GetFileName(s);
                        this.lbl_images.Text += @"<div class='col-md-4'>";
                        this.lbl_images.Text += @"<img src ='" + f + @"' class='img-thumbnail img-responsive' />
<div><a href='"+Request.Url.OriginalString+@"&a=1&f="+ Path.GetFileName(s) + @"'><span class='glyphicon glyphicon-remove'></span></a></div>     
                                </div>";
                    }             
                }
            }
            else
            {
                this.lbl_images.Text = @"NO IMAGES FOUND";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);

                    string id = Request.QueryString["pid"];
                    string imgs = @"..\Images\products";
                    string path = Server.MapPath(imgs + "\\" + id + "\\");
                    //string path2 = imgs + "\\" + id + "\\";
                    if(!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    FileUpload1.SaveAs(path + filename);
                    Response.Redirect(Request.Url.OriginalString);                   
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}