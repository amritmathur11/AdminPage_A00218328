using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class login : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(Request.QueryString["logout"]))
            {
                Session["uid"] = string.Empty;
                Session["uname"] = string.Empty;
                Session.Remove("uid");
                Session.Remove("uname");

                Session.Remove("l");
                Session.Remove("admin");
                Session.Remove("vid");


                Response.Redirect("Default.aspx");
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.cmb_type.Text.Equals("User"))
                {
                    DataTable dt = u.GetTable("select * from users where email='" + this.txt_username.Text + "' and password='" + this.txt_pass.Text + "' and type='u'");
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        Session["uid"] = dr["id"].ToString();
                        Session["uname"] = dr["firstname"].ToString();
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        this.lbl_msg.Text = "invalid username or password";
                    }
                }
                else
                {
                    DataTable dt = u.GetTable("select * from venders where email='" + this.txt_username.Text + "' and password='" + this.txt_pass.Text + "' and status='true'");
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        Session["vid"] = dr["id"].ToString();
                        Session["name"] = dr["shop"].ToString();
                        Response.Redirect("~/user/Default.aspx");
                    }
                    else
                    {
                        this.lbl_msg.Text = "invalid username or password or account is disabled";
                    }
                }
            }
            catch ( Exception ex)
            {

                
            }
        }
    }
}