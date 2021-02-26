using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;

namespace Web
{
    public partial class product : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["pid"]))
                {
                    System.Data.DataTable pro = u.GetTable("select * from products where id="+ Request.QueryString["pid"]);

                    if(pro!=null && pro.Rows.Count>0)
                    {
                        DataRow dr = pro.Rows[0];
                        /////////////////imagegallery///////////////

                        string imgs = @"Images\products";
                        string path = Server.MapPath( imgs + "\\" + dr["Id"].ToString()+"\\");

                        //Response.Write(Server.MapPath(path));

                        if (System.IO.Directory.Exists(path))
                        {
                            if (Directory.GetFiles(path).Length == 0)
                            {
                                this.lbl_images.Text = @"<img src='Images\no-image.jpg' class='img-responsive' />";
                            }
                            else
                            {
                                this.lbl_images.Text = @"<div class='demo'>

        <div class='item'>            
            <div class='clearfix' >
                <ul id = 'image-gallery' class='gallery list-unstyled cS-hidden'>";

                                string[] files = Directory.GetFiles(path);
                                string path2 = imgs +"\\"+ dr["Id"].ToString() + "\\";

                                foreach (string s in files)
                                {

                                    string f=path2+ Path.GetFileName(s);

                                    this.lbl_images.Text += @"<li data-thumb='"+f+@"'> 
                              <img src ='"+f+ @"' class='img-thumbnail img-responsive' />       
                                </li>";
                                }
                                this.lbl_images.Text += @"</ul>
            </div>
        </div>
    </div> ";

                            }
                        }
                        else
                        {
                            this.lbl_images.Text = @"<img src='Images\no-image.jpg' class='img-responsive' />";
                        }

                        ////////////////////////////////////////////////


                        this.lbl_title.Text = dr["Title"].ToString();

                        this.lbl_price.Text = "CAD." + Convert.ToDecimal(dr["NewPrice"]).ToString("0,00");
                        DataTable cat = u.GetTable("select * from categories where id="+ dr["CategoryId"].ToString());
                        if(cat!=null && cat.Rows.Count>0)
                            this.lbl_category.Text="<a href=categories.aspx?cid="+dr["CategoryId"].ToString()+">"+cat.Rows[0]["Name"].ToString()+"</a>";


                        DataTable ven = u.GetTable("select * from venders where id=" + dr["VenderId"].ToString());
                        if (ven != null && ven.Rows.Count > 0)
                            this.lbl_vendor.Text = ven.Rows[0]["Name"].ToString();



                        this.lbl_description.Text = dr["Description"].ToString();

                        //this.RelatedProducts1.VenderId = dr["VenderId"].ToString();
                    }

                    

                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }

        protected void btn_cart_Click(object sender, EventArgs e)
        {
            try
            {
                if(Session["ShoppingCart"] == null)
                { 
                    Session["ShoppingCart"] = new List<Cart>();
                }
                this.lbl_msg.Visible = true;
                var products = (List<Cart>)Session["ShoppingCart"];

                Cart c = new Cart();

                c.Id = Convert.ToInt32(Request.QueryString["pid"]);
                c.quantity = Convert.ToInt32(this.txt_number.Value);
                c.price = 0;// Convert.ToInt32(this.lbl_price.Text.Substring(3).Trim());
                products.Add(c);

                Session["ShoppingCart"] = products;

                //LiteralControl lbl_it = this.Master.FindControl("lbl_items") as LiteralControl;
                //lbl_it.Text = products.Count.ToString();
                //this.Master.Controls.Add(lbl_it);
                //lbl_it.Text

                //var span = new HtmlGenericControl("lbl_items");
                //span.InnerHtml = "he";

             //   foreach (var item in this.Master.Controls)
                {
//                    Response.Write(item.ToString());
  //                  HtmlControl
                }

                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}