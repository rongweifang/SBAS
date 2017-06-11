using Busines.DAL;
using Busines.IDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserControl
{
    
    public partial class employee_left : System.Web.UI.UserControl
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        public StringBuilder sb = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (peridal.IsUserCheck())
            {
                //sb.Append("<div class=\"left\">");
                //sb.Append("    <dl>");
                //sb.Append("  <dt>我的简历</dt>");
                //sb.Append("<dd><a href=\"/UserCenter/profile.aspx\">简历登记</a></dd>");
                //sb.Append("<dd><a href=\"/UserCenter/preview.aspx\">简历预览及确认</a></dd>");
                //sb.Append(" </dl>");
                //sb.Append("<dl>");
                //sb.Append(" <dt>我的求职</dt>");
                //sb.Append("  <dd><a href=\"/UserCenter/favorites.aspx\">我的收藏</a></dd>");
                //sb.Append(" <dd><a href=\"/UserCenter/apply.aspx\">我的工作申请</a></dd>");
                //sb.Append(" </dl>");
                //sb.Append("<dl>");
                //sb.Append("<dt>待办事项</dt>");
                //sb.Append("<dd><a href=\"/UserCenter/activity.aspx\">我的消息</a></dd>");
                //sb.Append("<dd><a href=\"/UserCenter/actresult.aspx\">成绩查询</a></dd>");
                //sb.Append("</dl>");
                //sb.Append(" <dl>");
                //sb.Append(" <dt>个人设置</dt>");
                //sb.Append(" <dd><a href=\"/UserCenter/degree_authcode.aspx\">学籍认证</a></dd>");
                //sb.Append("<dd><a href=\"/UserCenter/password.aspx\">修改密码</a></dd>");
                //sb.Append(" </dl>");
                //sb.Append("</div>");
                sb.Append("<div class=\"left\">");
                sb.Append("    <dl>");
                sb.Append("  <dt>我的简历</dt>");
                sb.Append("<dd><a href=\"/UserCenter/preview.aspx\">简历预览及确认</a></dd>");
                sb.Append(" </dl>");
                sb.Append("<dl>");
                sb.Append(" <dt>我的求职</dt>");
                //sb.Append("  <dd><a href=\"/UserCenter/favorites.aspx\">我的收藏</a></dd>");
                sb.Append(" <dd><a href=\"/UserCenter/apply.aspx\">我的工作申请</a></dd>");
                sb.Append(" </dl>");
                sb.Append("<dl>");
                sb.Append("<dt>待办事项</dt>");
                sb.Append("<dd><a href=\"/UserCenter/activity.aspx\">我的消息</a></dd>");
                sb.Append("<dd><a href=\"/UserCenter/actresult.aspx\">成绩查询</a></dd>");
                sb.Append("</dl>");
                sb.Append(" <dl>");
                sb.Append(" <dt>个人设置</dt>");
                //sb.Append(" <dd><a href=\"/UserCenter/degree_authcode.aspx\">学籍认证</a></dd>");
                sb.Append("<dd><a href=\"/UserCenter/password.aspx\">修改密码</a></dd>");
                sb.Append(" </dl>");
                sb.Append("</div>");
            }
            else
            {
                sb.Append("<div class=\"left\">");
                sb.Append("    <dl>");
                sb.Append("  <dt>我的简历</dt>");
                sb.Append("<dd><a href=\"/UserCenter/profile.aspx\">简历登记</a></dd>");
                sb.Append("<dd><a href=\"/UserCenter/preview.aspx\">简历预览及确认</a></dd>");
                sb.Append(" </dl>");
                sb.Append("<dl>");
                sb.Append(" <dt>我的求职</dt>");
                sb.Append(" <dd><a href=\"/UserCenter/apply.aspx\">我的工作申请</a></dd>");
                //sb.Append("  <dd><a href=\"/UserCenter/favorites.aspx\">我的收藏</a></dd>");
                sb.Append(" </dl>");
                sb.Append("<dl>");
                sb.Append("<dt>待办事项</dt>");
                sb.Append("<dd><a href=\"/UserCenter/activity.aspx\">我的消息</a></dd>");
                sb.Append("</dl>");
                sb.Append(" <dl>");
                sb.Append(" <dt>个人设置</dt>");
                //sb.Append(" <dd><a href=\"/UserCenter/degree_authcode.aspx\">学籍认证</a></dd>");
                sb.Append("<dd><a href=\"/UserCenter/password.aspx\">修改密码</a></dd>");
                sb.Append(" </dl>");
                sb.Append("</div>");
            }
        }
    }
}