using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.user
{
    public partial class Orders : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("OrderNumber");
            dt.Columns.Add("OrderDate");
            dt.Columns.Add("TotalItems");
            dt.Columns.Add("TotalPrice");
            dt.Columns.Add("Status");

            DataTable temp = u.GetTable("select * from orders as o left join order_items as oi on o.oid=oi.oid left join products as p on oi.itemid=p.id left join venders as v on p.venderId=v.id where p.venderId='" + Session["vid"]+"'");
            if(temp!=null && temp.Rows.Count>0)
            {
                foreach(DataRow dr2 in temp.Rows)
                {
                    DataRow dr = dt.NewRow();
                    dr["OrderNumber"] = dr2["oid"].ToString();
                    dr["OrderDate"] = dr2["odate"].ToString();

                    DataTable i = u.GetTable("select * from order_items as oi left join products as p on oi.itemid=p.id where oid='"+dr2["oid"].ToString()+"'");

                    dr["TotalItems"] = i.Rows.Count.ToString();
                    int price = 0;
                    foreach (DataRow i2 in i.Rows)
                    {
                        price += Convert.ToInt32(i2["NewPrice"]);
                    }

                    dr["TotalPrice"] = price;
                        dr["Status"] = dr2["Status"].ToString();
                    dt.Rows.Add(dr);
                }
            }
            //DataRow dr = dt.NewRow();

            //dr["OrderNumber"] = "172508001";
            //dr[1] = "25/08/2017";
            //dr[2] = "1";
            //dr[3] = "500";
            //dr[4] = "InProcess";

            //dt.Rows.Add(dr);

            //DataRow dr2 = dt.NewRow();
            //dr2["OrderNumber"] = "172508002";
            //dr2[1] = "25/08/2017";
            //dr2[2] = "2";
            //dr2[3] = "1500";
            //dr2[4] = "InProcess";       
            //dt.Rows.Add(dr2);

            //DataRow dr3 = dt.NewRow();
            //dr3["OrderNumber"] = "172508003";
            //dr3[1] = "25/08/2017";
            //dr3[2] = "2";
            //dr3[3] = "2000";
            //dr3[4] = "Confirmed";
            //dt.Rows.Add(dr3);

            //DataRow dr4 = dt.NewRow();
            //dr4["OrderNumber"] = "172508003";
            //dr4[1] = "25/08/2017";
            //dr4[2] = "2";
            //dr4[3] = "2000";
            //dr4[4] = "Delivered";
            //dt.Rows.Add(dr4);


            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink hl = (HyperLink)e.Row.FindControl("btn_details");
                
                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                string id = row["OrderNumber"].ToString();


                hl.NavigateUrl = "orderdetails.aspx?oid=" + id;
               
            }
        }
    }
}