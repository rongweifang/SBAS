using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.DotNetData;

namespace OpWeb.AppServer
{
    public partial class MyCenter : System.Web.UI.Page
    {
        private RM_UserInfo_IDAO user_idao = new RM_UserInfo_Dal();
        public StringBuilder Login_InfoHtml = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindLogin_Info();
        }

        public void BindLogin_Info()
        {
            int count = 0;
            DataTable dt = this.user_idao.GetLogin10_Info(ref count);
            Login_InfoHtml.Append(" <ul class=\"lists\">");
            this.Login_InfoHtml.Append("<li>本月登录总数：" + count + " 次</li>");
            if (count != 0)
            {
                //this.Login_InfoHtml.Append("本次登录IP：" + dt.Rows[0]["SYS_LOGINLOG_IP"].ToString() + "<br />");
                //this.Login_InfoHtml.Append("本次登录时间：" + dt.Rows[0]["SYS_LOGINLOG_TIME"].ToString() + "<br />");
                //if (dt.Rows.Count != 1)
                //{
                //    this.Login_InfoHtml.Append("上次登录IP：" + dt.Rows[1]["SYS_LOGINLOG_IP"].ToString() + "<br />");
                //    this.Login_InfoHtml.Append("上次登录时间：" + dt.Rows[1]["SYS_LOGINLOG_TIME"].ToString() + "<br />");
                //}
                foreach (DataRow dr in dt.Rows)
                {
                    Login_InfoHtml.AppendFormat("<li>登录IP：{0}；登录时间：{1}</li>", dr["SYS_LOGINLOG_IP"].ToString(), dr["Sys_LoginLog_Time"].ToString());

                }
            }
            Login_InfoHtml.Append("</ul>");

        }

    }
}