using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Busines;

namespace OpWeb.Contract
{
    public partial class Contract_Print : System.Web.UI.Page
    {
        private string HUID;
        public string PageContent = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.HUID = base.Request["HUID"];
            if (string.IsNullOrEmpty(this.HUID))
            {
                return;
            }
                this.InitData();
        }
        private void InitData()
        {

            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_History", "HUID", this.HUID);
            if (ht.Count > 0 && ht != null)
            {
                PageContent = ht["CONTRACTCONTENT"].ToString();
                PageContent = Microsoft.JScript.GlobalObject.unescape(PageContent);
                PageContent= Contract_Manage.GetReportExchange(ht["UID"].ToString(), PageContent);
                PageContent = Contract_Manage.ClearHtmlExchange(PageContent);//清除标记
            }
        }
    }
}