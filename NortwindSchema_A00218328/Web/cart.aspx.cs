using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class cart : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Session["ShoppingCart"] != null)
                {
                    var products = (List<Cart>)Session["ShoppingCart"];
                    if (products.Count > 0)
                    {
                        this.lbl_empty.Visible = false;
                        this.lbl_cart.Text = @"<div class='panel panel-warning'><div class='panel-heading'><span class='glyphicon glyphicon-shopping-cart'></span> CART";
                        this.lbl_cart.Text += @"</div><div class='panel-body'>";
                        int total = 0;
                        this.lbl_cart.Text += "<table class='table table-striped'>";
                        string html = @"<thead><tr><th>&nbsp;</th><th>Product</th><th> Quantity</th><th>Price</th><th>Sub-Total</th></tr></thead>";
                        foreach (Cart c in products)
                        {
                            DataTable dt = u.GetTable("select * from products where id="+c.Id);
                            DataRow dr = dt.Rows[0];

                            html += "<tr>";
                            html += "<td><a href='remove.aspx?id="+c.Id+"&ReturnUrl="+Request.Url.OriginalString+"' runat='server'><span class='glyphicon glyphicon-remove-sign'></span></a></td>";
                            html += "<td>"+dr["Title"].ToString()+"</td>";
                            html += "<td>"+c.quantity+"</td>";
                            html += "<td>"+Convert.ToInt32(dr["NewPrice"])+"</td>";
                            html += "<td>"+c.quantity* Convert.ToInt32(dr["NewPrice"]) + "</td>";
                            html += "</tr>";

                            total += c.quantity * Convert.ToInt32(dr["NewPrice"]);


                        }
                        html += "<tr  class='bg-warning'>";
                        html += "<td class='text-right' colspan='4'><strong>Total Amount</strong></td>";                        
                        html += "<td><strong>" + total+ "</strong></td>";
                        html += "</tr>";


                        this.lbl_cart.Text += html;
                        this.lbl_cart.Text += "</table></div><div class='panel-footer text-right'>";

                        this.lbl_cart.Text += "<a href='checkout.aspx' class='btn btn-warning'>CHECK OUT</a>";
                        this.lbl_cart.Text +="</div></div>";
                    }                    
                }
            }
        }
    }
}