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
    public partial class VendorSignup : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            DataTable dt = u.GetTable("select * from venders where email='" + this.txt_email.Text + "'");
            if (dt != null && dt.Rows.Count > 0)
            {
                this.lbl_msg.Text = "Email Address already in use";
            }
            else
            {
                SqlCommand usr = new SqlCommand();
                usr.Parameters.AddWithValue("@val0", this.txt_shop.Text);
                usr.Parameters.AddWithValue("@val1", this.txt_lastname.Text);
                usr.Parameters.AddWithValue("@val2", this.txt_address.Text);
                usr.Parameters.AddWithValue("@val3", this.txt_city.Text);
                usr.Parameters.AddWithValue("@val4", this.txt_phone.Text);
                usr.Parameters.AddWithValue("@val5", this.txt_email.Text);
                usr.Parameters.AddWithValue("@val7", this.txt_pass.Text);
                usr.Parameters.AddWithValue("@val6", false);
                usr.CommandText = "insert into venders(shop,name,address,city,phone,email,status,password) values(@val0,@val1,@val2,@val3,@val4,@val5,@val6,@val7);";
                u.ExecuteQuery(usr);
                Response.Redirect("login.aspx");
            }
        }
    }
}