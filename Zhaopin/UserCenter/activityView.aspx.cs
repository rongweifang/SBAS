using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
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

namespace Zhaopin.UserCenter
{
    public partial class activityView : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string MsgID;
        public string MsgTitle;
        public string TypeName;
        public string MsgContent;
        public string SendDate;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }

            this.MsgID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this.MsgID))
                {
                    if (ValidateUtil.IsGuid(this.MsgID))
                    {
                        peridal.UpdateMessage(MsgID);
                        StringBuilder strSql = new StringBuilder();
                        strSql.Append("SELECT *   FROM View_UserMessage WHERE USER_ID=@USER_ID AND ID=@ID ORDER BY CREATEDATE DESC");
                        SqlParam[] para = new SqlParam[]
			{
				new SqlParam("@USER_ID", RequestSession.GetSessionUser().UserId.ToString()),
				new SqlParam("@ID", MsgID)
			};
                        DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);

                        if (DataTableHelper.IsExistRows(dt))
                        {
                            this.MsgTitle = dt.Rows[0]["MsgTitle"].ToString();
                            this.TypeName = dt.Rows[0]["TypeName"].ToString();
                            this.SendDate = dt.Rows[0]["SendDate"].ToString();
                            this.MsgContent = dt.Rows[0]["MsgContent"].ToString();
                        }
                    }
                }
            }
        }
    }
}