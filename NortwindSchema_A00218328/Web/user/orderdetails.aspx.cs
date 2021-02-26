using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.user
{
    public partial class orderdetails : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["oid"];

            System.Data.DataTable dt = u.GetTable("select * from orders as o left join order_items as oi on o.oid = oi.oid left join products as p on oi.itemid = p.id left join venders as v on p.venderId = v.id left join users as u on o.uid=u.id where oi.oid = '" + id+"'");

            if (dt!=null)
            {
                DataRow dr2 = dt.Rows[0];
                string html = "<b>Order Number: </b>"+dr2["oid"]+ "<br/>";
                html+= "<b>Order Date: </b>"+dr2["odate"].ToString()+ "<br/> ";
                html += "<b>Order Status: </b>" + dr2["status"].ToString() + "<br/>"; 

                html+="<b>Order Details</b><hr/>";

                html+="<table class='table table-striped'>";
                html += @"<thead><tr><th>&nbsp;</th><th>Product</th><th> Quantity</th><th>Price</th><th>Sub-Total</th></tr></thead>";
                int total = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    html += "<tr>";
                    html += "<td>&nbsp;</td>";
                    html += "<td>" + dr["Title"].ToString() + "</td>";
                    html += "<td>" + dr["quantity"].ToString() + "</td>";
                    html += "<td>" + Convert.ToInt32(dr["NewPrice"]) + "</td>";
                    html += "<td>" + Convert.ToInt32(dr["quantity"]) * Convert.ToInt32(dr["NewPrice"]) + "</td>";
                    html += "</tr>";

                    total += Convert.ToInt32(dr["quantity"]) * Convert.ToInt32(dr["NewPrice"]);
                }

                html += "<tr  class='bg-warning'>";
                html += "<td class='text-right' colspan='4'><strong>Total Amount</strong></td>";
                html += "<td><strong>" + total + "</strong></td>";
                html += "</tr>";                
                html+= "</table>";


                html += "<b>User Details</b><hr/>";
                html += "<table class='table table-striped'>";
                html += @"<thead><tr><th>Name</th><th>Address</th><th>City</th><th>Phone</th><th>Email</th></tr></thead>";               
                
                {
                    html += "<tr>";
                    html += "<td>"+dr2["firstname"].ToString() +" " + dr2["lastname"].ToString()+"</td>";
                    html += "<td>" + dr2["address"].ToString() + "</td>";
                    html += "<td>" + dr2["city"].ToString() + "</td>";
                    html += "<td>" +dr2["Phone"].ToString() + "</td>";
                    html += "<td>" + dr2["Email"].ToString() + "</td>";
                    html += "</tr>";
                }                
                html += "</table>";

                this.txt_id.Text = id;
                                
                this.lbl_details.Text = html;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //SqlCommand cmd = new SqlCommand();

            u.ExecuteQuery("update orders set status='" + this.DropDownList1.SelectedItem.Value + "' where oid='" + this.txt_id.Text + "'");
            Response.Redirect("orders.aspx");
        }
    }
}