using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.user
{
    public partial class stock : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = u.GetTable("select * from products as p where p.VenderId=" + Session["vid"].ToString());

                DataTable final = new DataTable();
                final.Columns.Add("Product");
                final.Columns.Add("Sold");
                final.Columns.Add("Current");

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach(DataRow dr in dt.Rows)
                    {
                        DataRow temp = final.NewRow();

                        temp["Product"] =dr["Title"].ToString();

                        int sold = 0;
                        int current = 0;

                        DataTable s = u.GetTable("select sum(quantity) from order_items where itemid="+dr["Id"].ToString());
                        if(s.Rows[0][0]!=DBNull.Value)
                            sold = Convert.ToInt32(s.Rows[0][0]);
                                               
                        temp["Sold"] =sold;

                        DataTable c = u.GetTable("select sum(stock) from stock where pid=" + dr["Id"].ToString());
                        if (c.Rows[0][0] != DBNull.Value)
                            current = Convert.ToInt32(c.Rows[0][0]);


                        temp["Current"] =current- sold;
                        final.Rows.Add(temp);
                    }
                    this.GridView1.DataSource =final;
                    this.GridView1.DataBind();

                    this.DropDownList1.DataSource = dt.Copy();
                    this.DropDownList1.DataValueField = "id";
                    this.DropDownList1.DataTextField = "Title";
                    this.DropDownList1.DataBind();

                }
                else
                {
                    this.GridView1.EmptyDataText = "NO RECORD FOUND";
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                u.ExecuteQuery("insert into stock (pid,stock) values(" + this.DropDownList1.SelectedItem.Value + "," + this.txt_quantity.Text + ")");
                Response.Redirect(Request.Url.OriginalString);
            }
            catch(Exception ex)
            {

            }
        }
    }
}