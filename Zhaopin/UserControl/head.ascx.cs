using Common.DotNetBean;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserControl
{
    public partial class head : System.Web.UI.UserControl
    {
        public StringBuilder MenuHtml = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            // string UserId = RequestSession.GetSessionUser().UserId.ToString();
            //string UserName = RequestSession.GetSessionUser().UserName.ToString();
            if (RequestSession.GetSessionUser() == null)
            {
                this.MenuHtml.Append("<div class=\"head\">");
                this.MenuHtml.Append("    <div class=\"logobox\">");
                this.MenuHtml.Append("        <div class=\"logo\">");
                this.MenuHtml.Append("            <img src=\"/themes/index/image/logo.png\" width=\"622\" height=\"70\" />");
                this.MenuHtml.Append("        </div>");
                this.MenuHtml.Append("        <div class=\"sign_button_1\">");
                this.MenuHtml.Append("            <div class=\"button_1\">");
                this.MenuHtml.Append("                <a href=\"/UserCenter/register_xz.aspx\">注册</a>");
                this.MenuHtml.Append("            </div>");
                this.MenuHtml.Append("            <div class=\"button_1\">");
                this.MenuHtml.Append("                <a href=\"/UserCenter/login.aspx\">登录</a>");
                this.MenuHtml.Append("            </div>");
                this.MenuHtml.Append("        </div>");
                this.MenuHtml.Append("    </div>");
                this.MenuHtml.Append("    <div class=\"nav\">");
                this.MenuHtml.Append("        <ul>");
                this.MenuHtml.Append("            <li><a href=\"/\">返回首页</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/company/\">企业简介</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/news/\">招聘动态</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/guide/\">应聘指南</a></li>");
                // this.MenuHtml.Append("            <li><a href=\"/Notice/\">公司公告</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/help/\">帮助中心</a></li>");
                this.MenuHtml.Append("        </ul>");
                this.MenuHtml.Append("    </div>");
                this.MenuHtml.Append("</div>");
            }
            else
            {
                this.MenuHtml.Append("<div class=\"head\">");
                this.MenuHtml.Append("    <div class=\"logobox\">");
                this.MenuHtml.Append("        <div class=\"logo\">");
                this.MenuHtml.Append("            <img src=\"/themes/index/image/logo.jpg\" width=\"664\" height=\"70\">");
                this.MenuHtml.Append("        </div>");
                this.MenuHtml.Append("        <div class=\"sign_button_1\">");
                this.MenuHtml.Append("            <div class=\"sign_text\">");
                this.MenuHtml.AppendFormat("                <span><a href=\"/UserCenter/\" style=\"color: #006f6b; font-weight: bold;\">{0}</a>，您好！&nbsp;</span>", RequestSession.GetSessionUser().UserName.ToString());
                this.MenuHtml.Append("                <span><a href=\"/UserCenter/logout.aspx\" style=\"color: #d36408; font-weight: bold;\">退出</a></span>");
                this.MenuHtml.Append("            </div>");
                this.MenuHtml.Append("        </div>");
                this.MenuHtml.Append("    </div>");
                this.MenuHtml.Append("    <div class=\"nav\">");
                this.MenuHtml.Append("        <ul>");
                this.MenuHtml.Append("            <li><a href=\"/\">返回首页</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/UserCenter/\">个人中心</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/UserCenter/CompayApplyList.aspx\">招聘一览</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/news/\">招聘动态</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/guide/\">应聘指南</a></li>");
                //this.MenuHtml.Append("            <li><a href=\"/Notice/\">公司公告</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/help/\">帮助中心</a></li>");
                this.MenuHtml.Append("            <li><a href=\"/UserCenter/feedback.aspx\">意见反馈</a></li>");
                this.MenuHtml.Append("        </ul>");
                this.MenuHtml.Append("    </div>");
                this.MenuHtml.Append("</div>");
            }
        }
    }
}