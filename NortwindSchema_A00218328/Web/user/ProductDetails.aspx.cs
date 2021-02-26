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
    public partial class ProductDetails : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        string action = "new";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Request.QueryString["pid"]))
            {
                this.btn_submit.Visible =false;
                this.btn_update.Visible = true;
            }
            else
            {
                this.btn_submit.Visible = true;
                this.btn_update.Visible = false;
            }

                if (!Page.IsPostBack)
            {
                DataTable dt = u.GetTable("select * from categories where status='True' order by Name");
                this.cmb_categories.DataSource = dt;
                this.cmb_categories.DataTextField = "Name";
                this.cmb_categories.DataValueField = "Id";
                this.cmb_categories.DataBind();

                if(!string.IsNullOrEmpty(Request.QueryString["pid"]))
                {
                    action = "update";

                    DataTable pro = u.GetTable("select * from products where id="+Request.QueryString["pid"]);
                    if(pro!=null && pro.Rows.Count>0)
                    {
                        DataRow dr = pro.Rows[0];

                        this.txt_title.Text = dr["Title"].ToString();
                        this.txt_old.Text = dr["OldPrice"].ToString();
                        this.txt_new.Text = dr["NewPrice"].ToString();
                        this.txt_short.Text = dr["ShortDescription"].ToString();
                        this.txt_long.Text = dr["Description"].ToString();
                        this.chk_status.Checked = Convert.ToBoolean(dr["status"]);
                        this.chk_featured.Checked = Convert.ToBoolean(dr["featured"]);
                        this.cmb_categories.SelectedValue = dr["CategoryId"].ToString();
                    }
                    else
                    {
                        Response.Redirect("products.aspx");
                    }
                }
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand usr = new SqlCommand();
                
                    usr.Parameters.AddWithValue("@val0", this.txt_title.Text);
                    usr.Parameters.AddWithValue("@val1", this.txt_old.Text);
                    usr.Parameters.AddWithValue("@val2", this.txt_new.Text);
                    usr.Parameters.AddWithValue("@val3", this.txt_short.Text);
                    usr.Parameters.AddWithValue("@val4", this.txt_long.Text);
                    usr.Parameters.AddWithValue("@val5", this.chk_status.Checked);
                    usr.Parameters.AddWithValue("@val6", this.chk_featured.Checked);
                    usr.Parameters.AddWithValue("@val7", this.cmb_categories.SelectedItem.Value);
                    usr.Parameters.AddWithValue("@val8", Request.QueryString["pid"]);
                    usr.CommandText = "update products set title=@val0,oldprice=@val1,newprice=@val2,shortdescription=@val3,description=@val4,status=@val5,featured=@val6,categoryid=@val7 where id=@val8";
                    u.ExecuteQuery(usr);
                    Response.Redirect("products.aspx");                

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand usr = new SqlCommand();                                    
                    usr.Parameters.AddWithValue("@val0", this.txt_title.Text);
                    usr.Parameters.AddWithValue("@val1", this.txt_old.Text);
                    usr.Parameters.AddWithValue("@val2", this.txt_new.Text);
                    usr.Parameters.AddWithValue("@val3", this.txt_short.Text);
                    usr.Parameters.AddWithValue("@val4", this.txt_long.Text);
                    usr.Parameters.AddWithValue("@val5", this.chk_status.Checked);
                    usr.Parameters.AddWithValue("@val6", this.chk_featured.Checked);
                    usr.Parameters.AddWithValue("@val7", this.cmb_categories.SelectedItem.Value);
                    usr.Parameters.AddWithValue("@val8", Session["vid"].ToString());
                    usr.CommandText = "insert into products(title,oldprice,newprice,shortdescription,description,status,featured,categoryid,venderid) values(@val0,@val1,@val2,@val3,@val4,@val5,@val6,@val7,@val8);";
                    u.ExecuteQuery(usr);
                    Response.Redirect("products.aspx");                
                
            }
            catch ( Exception ex)
            {
                throw ex;
            }
        }
    }
}