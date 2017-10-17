using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Busines;
using System.Text;

namespace OpWeb.Contract
{
    public partial class Contract_Print : System.Web.UI.Page
    {
        private string HUID;
        public string PageContent = string.Empty;
        public string CssUrl;
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
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("SELECT DocumentType FROM View_Contract WHERE UID='{0}'", ht["UID"].ToString());
               object ContractType = DataFactory.SqlDataBase().GetObjectValue(sb);
                CssUrl = string.Format("<link href=\"/css/{0}.css\" rel=\"stylesheet\" /> <link href=\"/css/{0}_Print.css\" media=\"print\" rel=\"stylesheet\" /> ", ContractType);
                PageContent = ht["CONTRACTCONTENT"].ToString();
                PageContent = Microsoft.JScript.GlobalObject.unescape(PageContent);
                PageContent= Contract_Manage.GetReportExchange(ht["UID"].ToString(), PageContent);
                PageContent = Contract_Manage.ClearHtmlExchange(PageContent);//清除标记
            }
        }
    }
}