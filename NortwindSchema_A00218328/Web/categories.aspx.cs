using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class categories : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                string imgs = @"Images\products";

                DataTable pro = u.GetTable("select  * from products where Status='True' and CategoryId="+ Request.QueryString["cid"] + " order by systemdate desc");

                if (pro != null && pro.Rows.Count > 0)
                {                 
                    string html = string.Empty;
                    foreach (DataRow dr in pro.Rows)
                    {
                        html += @"<div class='col-md-3 col-xs-6'>
<a href='product.aspx?pid=" + dr["Id"].ToString() + "' class='thumbnail'>";
                        string ppic = imgs + "\\" + dr["Id"].ToString() + "\\" + dr["Id"].ToString() + ".jpg";
                        if (System.IO.File.Exists(Server.MapPath(ppic)))
                        {
                            html += "<img src ='" + ppic + "' width='265px' height='265px' />";
                        }
                        else
                        {
                            html += "<img src ='images/no-image.jpg'  />";
                        }
                        html += "</a> <div class='caption text-center'><h5><a href='product.aspx?pid=" + dr["Id"].ToString() + "'>" + dr["Title"].ToString() + "</a></h5> <p>";

                        if (!string.IsNullOrEmpty(dr["OldPrice"].ToString()))
                        {
                            if (Convert.ToDecimal(dr["OldPrice"]) > 0)
                            {
                                html += "CAD. <span style='text-decoration: line-through'>" + Convert.ToDecimal(dr["OldPrice"]).ToString("0,00") + "</span>";
                            }
                        }

                        html += " <strong>CAD. " + Convert.ToDecimal(dr["NewPrice"]).ToString("0,00") + "</strong></p></div></div>";
                    }

                    this.lbl_new.Text += html;
                }
                else
                {
                    this.lbl_new.Text="<h4 CLASS='TEXT-CENTER'>NO PRODUCT FOUND</h4>";
                }

            }
        }
    }
}