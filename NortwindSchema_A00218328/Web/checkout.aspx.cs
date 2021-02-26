using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class checkout : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["uid"] != null)
            {
                this.loginform.Visible = false;
                this.guestform.Visible = false;          
            }

            if (!Page.IsPostBack)
            {
                if (Session["ShoppingCart"] != null)
                {
                    var products = (List<Cart>)Session["ShoppingCart"];
                    if (products.Count > 0)
                    {                                              
                        int total = 0;
                        this.lbl_cart.Text += "<table class='table table-striped'>";
                        string html = @"<thead><tr><th>&nbsp;</th><th>Product</th><th> Quantity</th><th>Price</th><th>Sub-Total</th></tr></thead>";
                        foreach (Cart c in products)
                        {
                            DataTable dt = u.GetTable("select * from products where id=" + c.Id);
                            DataRow dr = dt.Rows[0];

                            html += "<tr>";
                            html += "<td>&nbsp;</td>";
                            html += "<td>" + dr["Title"].ToString() + "</td>";
                            html += "<td>" + c.quantity + "</td>";
                            html += "<td>" + Convert.ToInt32(dr["NewPrice"]) + "</td>";
                            html += "<td>" + c.quantity * Convert.ToInt32(dr["NewPrice"]) + "</td>";
                            html += "</tr>";

                            total += c.quantity * Convert.ToInt32(dr["NewPrice"]);


                        }
                        html += "<tr  class='bg-warning'>";
                        html += "<td class='text-right' colspan='4'><strong>Total Amount</strong></td>";
                        html += "<td><strong>" + total + "</strong></td>";
                        html += "</tr>";


                        this.lbl_cart.Text += html;
                        this.lbl_cart.Text += "</table>";                        
                    }
                }
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {

            if (Session["uid"] != null)
            {
                //this.loginform.Visible = false;
                //this.guestform.Visible = false;
            }
            List<SqlCommand> queries = new List<SqlCommand>();
            string uid = string.Empty;
            string oid = u.getNewOrderNumber();  //"123456";            

            if(Session["uid"]!=null)
            {
                uid = Session["uid"].ToString();
            }
            else
            {
                SqlCommand usr = new SqlCommand();
                usr.Parameters.AddWithValue("@val0",this.txt_firstname.Text);
                usr.Parameters.AddWithValue("@val1",this.txt_lastname.Text);
                usr.Parameters.AddWithValue("@val2",this.txt_address.Text);
                usr.Parameters.AddWithValue("@val3",this.txt_city.Text);
                usr.Parameters.AddWithValue("@val4",this.txt_phone.Text);
                usr.Parameters.AddWithValue("@val5",this.txt_email.Text);
                usr.Parameters.AddWithValue("@val6",'w');

                usr.CommandText = "insert into users(firstname,lastname,address,city,phone,email,type) values(@val0,@val1,@val2,@val3,@val4,@val5,@val6);  select SCOPE_IDENTITY();";

                uid = u.ExecuteQueryReturnId(usr).ToString();
            }

            SqlCommand cmd = new SqlCommand();            
            cmd.Parameters.AddWithValue("@val0",oid);
            cmd.Parameters.AddWithValue("@val1",uid);
            cmd.Parameters.AddWithValue("@val2",DateTime.Now);
            cmd.Parameters.AddWithValue("@val3","Pending");
            cmd.CommandText = "insert into orders(oid,uid,odate,status) values (@val0,@val1,@val2,@val3)";
            queries.Add(cmd);

            var products = (List<Cart>)Session["ShoppingCart"];
            foreach(Cart c in products)
            {
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Parameters.AddWithValue("@val0",oid);
                cmd2.Parameters.AddWithValue("@val1", c.Id);
                cmd2.Parameters.AddWithValue("@val2", c.price);
                cmd2.Parameters.AddWithValue("@val3", c.quantity);
                cmd2.CommandText="insert into order_items(oid,itemid,quantity,price) values(@val0,@val1,@val3,@val2)";
                queries.Add(cmd2);
            }

            u.ExecuteMultipleQueries(queries);
            Session["ShoppingCart"] = null;
            Response.Redirect("thankyou.aspx?id=" + oid);

        }
    }
}