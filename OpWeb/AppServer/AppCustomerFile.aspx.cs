using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using Busines;
using Common.DotNetData;
using Common.DotNetCode;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.AppServer
{
    public partial class AppCustomerFile : System.Web.UI.Page
    {
        private string _key;
        public StringBuilder SM = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["Card_ID"];
            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    InitData();
                }
            }
        }
        private void InitData()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * FROM UserPicture WHERE Card_ID=@Card_ID");
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, new SqlParam[] { new SqlParam("@Card_ID", _key) });
            if (DataTableHelper.IsExistRows(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    SM.AppendFormat("<a href=\"/User/ShowUserDatas.aspx?UPID={0}\" title=\"{1}\" data-gallery=\"\">", dr["UPID"].ToString(), dr["PhotoMemo"].ToString());
                    SM.AppendFormat(" <img src=\"data:image/jpg;base64,{0}\">", dr["PhotoBase"].ToString());

                    SM.Append("</a>");
                }
            }
        }

    }
}