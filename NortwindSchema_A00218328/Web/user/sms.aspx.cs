using GsmComm.GsmCommunication;
using GsmComm.PduConverter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.user
{
    public partial class sms : System.Web.UI.Page
    {
        Utilities u = new Utilities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                this.lbl_product.Text = Request.QueryString["p"];

                DataTable dt = new Utilities().GetTable("select * from users where type='u'");
                if (dt != null && dt.Rows.Count > 0)
                {
                    this.lbl_total.Text = dt.Rows.Count.ToString();
                }
                else
                {
                    this.lbl_total.Text = "0";
                    this.btn_send.Enabled = false;
                }
            }
        }

        public GsmCommMain comm2;

        private void SendSMS(string number, string message)
        {
            //MessageBox.Show(message);
            // if (comm2.IsConnected())
            {
                try
                {
                    //Cursor.Current = Cursors.WaitCursor;
                    SmsSubmitPdu pdu_single = new SmsSubmitPdu();
                    byte tcs;

                    tcs = DataCodingScheme.NoClass_7Bit;
                    pdu_single = new SmsSubmitPdu(message, number, tcs);

                    comm2.Open();
                    comm2.SendMessage(pdu_single);
                    comm2.Close();
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new Utilities().GetTable("select * from users where type='u'");

                // ManagementObjectSearcher mos = new ManagementObjectSearcher("SELECT * FROM Win32_POTSModem");
                //        public Int16 Comm_Port = 0;
                //public Int32 Comm_BaudRate = 0;
                //public Int32 Comm_TimeOut = 750;

                this.comm2 = new GsmCommMain("COM10",19200);
        
                foreach (DataRow dr in dt.Rows)
                {
                    string phone = dr["phone"].ToString();
                    string msg = Request.QueryString["p"] +" is also available now for order";
                    this.SendSMS(phone, msg);
                }
                Response.Redirect("products.aspx");
            }
            catch (Exception ex)
            {                
            }
        }
    }
}