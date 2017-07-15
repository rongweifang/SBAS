using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.DotNetCode;
using Common.DotNetData;

namespace OpWeb.User
{
    public partial class User_DatasView : System.Web.UI.Page
    {
        private string _key;
        public StringBuilder SM = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];
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