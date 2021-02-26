using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Default : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                string imgs = @"Images\products";

                DataTable feat=u.GetTable("select * from products where featured='True'");

                if (feat != null && feat.Rows.Count > 0)
                {
                    this.lbl_featured.Text = "<h4 class='page-header'>FEATURED PRODUCTS</h4>";
                    string html = string.Empty;
                    foreach (DataRow dr in feat.Rows)
                    {
                        html += @"<div class='col-md-3 col-xs-6'>
<a href='product.aspx?pid=" + dr["Id"].ToString() + @"' class='thumbnail'>";


                        string ppic = imgs + "\\" + dr["Id"].ToString();// + "\\";// + dr["Id"].ToString() + ".jpg";
                        if (System.IO.Directory.Exists(Server.MapPath(ppic)))
                        {
                            string[] f = System.IO.Directory.GetFiles(Server.MapPath(ppic));
                            if (f.Length > 0)
                                html += "<img src ='" + ppic + "\\" + System.IO.Path.GetFileName(f[0]) + "' width='265px' height='265px' />";
                            else
                                html += "<img src ='images/no-image.jpg'  />";
                        }
                        else
                        {
                            html += "<img src ='images/no-image.jpg'  />";
                        }

                        html +=@"</a> <div class='caption text-center'><h5><a href='#'>" + dr["Title"].ToString() + "</a></h5> <p>";

                        if(!string.IsNullOrEmpty(dr["OldPrice"].ToString()))
                        {
                            if(Convert.ToDecimal(dr["OldPrice"])>0)
                            {
                                html += "CAD. <span style='text-decoration: line-through'>" + Convert.ToDecimal(dr["OldPrice"]).ToString("0,00") + "</span>";
                            }
                        }

                        html+= " <strong>CAD. " + Convert.ToDecimal(dr["NewPrice"]).ToString("0,00")+"</strong></p></div></div>";
                    }

                    this.lbl_featured.Text += html;
                }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                DataTable pro = u.GetTable("select top 12 * from products where featured='False' and Status='True' order by systemdate desc");

                if (pro != null && pro.Rows.Count > 0)
                {
                    this.lbl_new.Text = "<h4 class='page-header'>NEW PRODUCTS</h4>";
                    string html = string.Empty;
                    foreach(DataRow dr in pro.Rows)
                    {
                        html += @"<div class='col-md-3 col-xs-6'>
<a href='product.aspx?pid=" + dr["Id"].ToString() + "' class='thumbnail'>";
                        //string ppic = imgs +"\\" + dr["Id"].ToString() + "\\" + dr["Id"].ToString()+".jpg";
                        string ppic = imgs + "\\" + dr["Id"].ToString();// + "\\";// + dr["Id"].ToString() + ".jpg";
                         if (System.IO.Directory.Exists(Server.MapPath(ppic)))
                        {
                            string[] f = System.IO.Directory.GetFiles(Server.MapPath(ppic));
                            if(f.Length>0)
                            html += "<img src ='"+ ppic+"\\"+ System.IO.Path.GetFileName( f[0])+"' width='265px' height='265px' />";
                            else
                                html += "<img src ='images/no-image.jpg'  />";
                        }
                        else {
                            html += "<img src ='images/no-image.jpg'  />";
                        }
html+="</a> <div class='caption text-center'><h5><a href='product.aspx?pid="+ dr["Id"].ToString() + "'>" + dr["Title"].ToString() + "</a></h5> <p>";

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


}
        }
    }
}