using Busines;
using Common.DotNetBean;
using Common.DotNetData;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace OpWeb.Contract
{
    public partial class HtmlToImage : System.Web.UI.Page
    {
        private string FID;
        private static Regex MortageRegexAll = new Regex(@"{Mortage+\w{0,6}:+[\w]+}");//所有标签
        public string HtmlBody;
        public string CssUrl;
        public string documentType;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.FID = base.Request["FID"];
            if (!string.IsNullOrEmpty(FID))
            {
                this.documentType = base.Request["documentType"];
                CssUrl = string.Format("<link href=\"/css/{0}.css\" rel=\"stylesheet\" /> <link href=\"/css/{0}_Print.css\" media=\"print\" rel=\"stylesheet\" /> ", documentType);

                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("SELECT CTContent FROM View_ContractPage WHERE FID='{0}'", this.FID);
                DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
                if (DataTableHelper.IsExistRows(dt))
                {
                    HtmlBody = Microsoft.JScript.GlobalObject.unescape(dt.Rows[0][0].ToString());
                    HtmlBody = ClearHtmlExchange(HtmlBody);
                }
               
            }
        }

        public static string ClearHtmlExchange(string HtmlContent)
        {
            MatchCollection userMatchColl = MortageRegexAll.Matches(HtmlContent);
            if (userMatchColl.Count > 0)
            {
                foreach (Match matchItem in userMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string FieldDeal = ContentDeal.Replace("{Mortage", "").Replace("}", "");

                    HtmlContent = HtmlContent.Replace(ContentDeal, "");
                }
            }
            return HtmlContent;
        }

    }
}