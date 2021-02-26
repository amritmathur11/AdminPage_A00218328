using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Web
{
    public class Cart
    {
        public int Id { get; set; }
        public int quantity { get; set; }

        public int price { get; set; }
    }
    public class Utilities
    {

        public string getNewOrderNumber()
        {
            DateTime d = DateTime.Now;
            DataTable dt = this.GetTable("select count(*) from orders where convert(date,odate) = '" + d.Year+"-"+d.Month.ToString("00")+"-"+d.Day.ToString("00")+"'");
            //DataTable dt = this.GetTable("select count(*) from orders where convert(date, odate )= '" + d.Date+"'");
            int num = Convert.ToInt32(dt.Rows[0][0])+1;
            string id = DateTime.Now.Year.ToString().Substring(2) + DateTime.Now.Month.ToString("00") + DateTime.Now.Day.ToString("00") + num.ToString("000");

            return id;
        }

        public static string ConnectionString;

        public static string ReturnConnectionString()
        {
            try
            {
                //if (ConnectionString != null)
                //    return ConnectionString;// @"Server=ruz-pc\sql2k8;Database=MobileShop;User Id=sa;Password=sa123;"; //Settings.Default["MyString"].ToString();
                //return @"Server=ruz-pc\sql2k16;Database=pca;User Id=sa;Password=sa123;"; //Settings.Default["MyString"].ToString();
                return @"Server=.\SQLEXPRESS;Database=pca;Trusted_Connection=True;"; //Settings.Default["MyString"].ToString();
                //else
                //    return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable GetTable(string query)
        {
            SqlConnection con;
            try
            {
                con = new SqlConnection(Utilities.ReturnConnectionString());
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //  if (con != null)
                //    con.Close();
            }
        }


        public DataTable GetTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection con = new SqlConnection(Utilities.ReturnConnectionString());
                cmd.Connection = con;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ExecuteQuery(string query)
        {
            SqlTransaction t = null;
            try
            {
                SqlConnection con = new SqlConnection(Utilities.ReturnConnectionString());
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                t = con.BeginTransaction();
                cmd.Transaction = t;
                cmd.ExecuteScalar();
                t.Commit();
                con.Close();
            }
            catch (Exception ex)
            {
                t.Rollback();
                throw ex;
            }
        }

        public void ExecuteMultipleQueries(List<SqlCommand> queries)
        {
            SqlTransaction t = null;
            SqlConnection con = new SqlConnection(Utilities.ReturnConnectionString());
            try
            {
                con.Open();
                t = con.BeginTransaction();
                foreach (SqlCommand query in queries)
                {
                    query.Connection = con;
                    query.Transaction = t;
                    query.ExecuteNonQuery();
                }
                t.Commit();
                con.Close();
            }
            catch (Exception ex)
            {
                t.Rollback();
                throw new Exception(ex.Message + ": Some thing wrong in queries");
            }
            finally
            {
                //if(con!=null)
                con.Close();
            }
        }

        public void ExecuteQuery(SqlCommand cmd)
        {
            SqlTransaction t = null;
            try
            {
                SqlConnection con = new SqlConnection(Utilities.ReturnConnectionString());
                cmd.Connection = con;
                con.Open();
                t = con.BeginTransaction();
                cmd.Transaction = t;
                cmd.ExecuteScalar();
                t.Commit();
                con.Close();
            }
            catch (Exception ex)
            {
                t.Rollback();
                throw ex;
            }
        }

        public int ExecuteQueryReturnId(SqlCommand cmd)
        {
            SqlTransaction t = null;
            try
            {
                int Id = -1;
                SqlConnection con = new SqlConnection(Utilities.ReturnConnectionString());
                cmd.Connection = con;
                con.Open();
                t = con.BeginTransaction();
                cmd.Transaction = t;
                Object a = cmd.ExecuteScalar();
                
                t.Commit();
                con.Close();
                if (a != null)
                    Id = Convert.ToInt32(a);
                return Id;
            }
            catch (Exception ex)
            {
                t.Rollback();
                throw ex;
            }
        }

    }
}