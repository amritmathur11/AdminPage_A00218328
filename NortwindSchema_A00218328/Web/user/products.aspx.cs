using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.user
{
    public partial class products : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
            DataTable dt = u.GetTable("select c.Name as Category, p.* from products as p left join categories as c on p.CategoryId=c.id where p.VenderId=" + Session["vid"].ToString());

            if (dt != null && dt.Rows.Count > 0)
            {
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }
                else
                {
                    this.GridView1.EmptyDataText = "NO RECORD FOUND";
                }

        }
            


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink hl = (HyperLink)e.Row.FindControl("btn_detail");
                HyperLink h2 = (HyperLink)e.Row.FindControl("btn_images");
                HyperLink h3 = (HyperLink)e.Row.FindControl("btn_sms");

                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                string id = row["Id"].ToString();


                hl.NavigateUrl = "productdetails.aspx?pid="+id;
                h2.NavigateUrl = "productimages.aspx?pid=" + id;
                h3.NavigateUrl = "sms.aspx?pid=" + id+"&p="+row["Title"].ToString();
            }
        }
    }
}