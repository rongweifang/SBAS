using OpWeb.App_Code;
using Busines.DAL;
using Busines.IDAO;
using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Busines;
using OpWeb.Contract;

namespace OpWeb.AppServer
{
    public partial class AppCustomerView : System.Web.UI.Page
    {
        private string UID;
        public string PageContent = string.Empty;
        private Contract_IDAO cidal = new Contract_Dal();
        private string documentType;
        public int pageNum = 0;
        public StringBuilder sbDiv = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];

            if (!string.IsNullOrEmpty(this.UID))
            {
                this.InitData();
            }
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Contract", "UID", UID);
            if (ht.Count > 0 && ht != null)
            {
                documentType = ht["DOCUMENTTYPE"].ToString();
                pageNum = Contract_Manage.GetPageNum(documentType);
                PageContent = Contract_Manage.GetHtmlContent(UID, documentType, "A4");
                for (int i = 0; i < pageNum; i++)
                {
                    sbDiv.Append("<div></div>");
                }
            }

            // PageContent = Contract_Manage.GetHtmlContent(UID, documentType, documentSize);

        }
    }
}