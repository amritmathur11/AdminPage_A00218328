using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.user
{
    public partial class user : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["vid"] = "1";
            if(Session["vid"]==null || Session["name"]==null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                this.lbl_name.Text = Session["name"].ToString();
            }

            
        }
    }
}