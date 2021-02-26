using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.UserControls
{
    public partial class RelatedProducts : System.Web.UI.UserControl
    {
        Utilities u = new Utilities();

        public string VenderId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable pro = u.GetTable("select top 4 * from products where Status='True' and VenderId='"+this.VenderId+"' order by newid()");

            if (pro != null && pro.Rows.Count > 0)
            {                
                string html = "<h4 class='page-header'>RELATED PRODUCTS</h4>";
                foreach (DataRow dr in pro.Rows)
                {
                    html += @"<div class='col-md-3 col-xs-6'>
<a href='#' class='thumbnail'>
<img src='images/no-image.jpg'>
</a> <div class='caption text-center'><h5><a href='product.aspx?pid=" + dr["Id"].ToString() + "'>" + dr["Title"].ToString() + "</a></h5> <p>";

                    if (!string.IsNullOrEmpty(dr["OldPrice"].ToString()))
                    {
                        if (Convert.ToDecimal(dr["OldPrice"]) > 0)
                        {
                            html += "Rs. <span style='text-decoration: line-through'>" + Convert.ToDecimal(dr["OldPrice"]).ToString("0,00") + "</span>";
                        }
                    }
                    html += " <strong>Rs. " + Convert.ToDecimal(dr["NewPrice"]).ToString("0,00") + "</strong></p></div></div>";
                }

                this.lbl_products.Text = html;
            }
        }
    }
}