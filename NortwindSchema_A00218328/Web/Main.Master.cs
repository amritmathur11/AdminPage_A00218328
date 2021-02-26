using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Main : System.Web.UI.MasterPage
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                DataTable feat = u.GetTable("select * from categories where status='True' order by Name");

                if (feat != null && feat.Rows.Count > 0)
                {                    
                    string html = string.Empty;
                    foreach (DataRow dr in feat.Rows)
                    {
                        html += @"<a href='categories.aspx?cid="+ dr["Id"].ToString() + @"' class='list-group-item list-group-item-warning'>"+dr["Name"].ToString()+"</a>";
                    }

                    this.lbl_categories.Text = html;
                }               
            }
            if (Session["ShoppingCart"] != null)
            {
                var products = (List<Cart>)Session["ShoppingCart"];
                this.lbl_items.InnerText = products.Count.ToString();
            }

            if(Session["uid"]!=null)
            {
                this.lbl_name.Text = Session["uname"].ToString();
                //this.lbl_name.Visible = true;
                this.btn_logout.Visible = true;
                this.btn_login.Visible = false;
                this.btn_signup.Visible = false;
                this.btn_vendor.Visible = false;

            }
            else
            {
                //this.lbl_name.Visible = false;
                this.btn_logout.Visible = false;
                this.btn_login.Visible = true;
                this.btn_signup.Visible = true;
                this.btn_vendor.Visible = true;
            }
        }


        protected  void Page_LoadComplete(object sender, EventArgs e)
        {

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
             
        }

        //protected override void 
        //{

        //}
    }
}