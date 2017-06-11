using Busines;
using Common.DotNetCode;
using Common.DotNetData;
using Common.DotNetEamil;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void Button1_Click1(object sender, EventArgs e)
        {
            var uName = this.name.Value;
            var uLoginName = this.loginName.Value;
            var uemail = this.email.Value;
            var vCode = this.rand.Value;
            if (string.IsNullOrEmpty(uName))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('用户名不能为空！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(uLoginName))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('身份证号不能为空！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(uemail))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('邮箱不能为空！');</script>");
                return;
            }
            if (!Session["dt_session_code"].ToString().Equals(vCode, StringComparison.CurrentCultureIgnoreCase))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('验证码错误！');</script>");
                return;
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from Personinfo where [name]=@name and loginName=@loginName and email=@email");
            SqlParam[] para = new SqlParam[]
			{
                new SqlParam("@name", uName),
				new SqlParam("@loginName", uLoginName),
                new SqlParam("@email", uemail)
			};
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
            if (!DataTableHelper.IsExistRows(dt))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('您输入的信息有误，请重新核实！');</script>");
                return;
            }
            else
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("{0}:<br/>", dt.Rows[0]["name"].ToString());
                sb.Append("您好，欢迎注册内蒙古电力（集团）有限责任公司招聘系统！<br/>");
                sb.AppendFormat("你的登录账号:{0},登录密码:{1},邮箱:{2}", dt.Rows[0]["loginName"].ToString(), dt.Rows[0]["password"].ToString(), dt.Rows[0]["email"].ToString());
                sb.Append("<br/><br/><br/>");
                sb.Append("---------------------------------------------------------------------------<br/<br/>");
                sb.Append("内蒙古电力（集团）有限责任公司  人力资源部<br/>");
                sb.AppendFormat("{0}", DateTime.Now.ToString());

                SMTPManager.MailSending(dt.Rows[0]["email"].ToString(), "密码找回-内蒙古电力（集团）有限责任公司", sb.ToString(), "");
                this.d_userInfo.Style["display"] = "none";
                this.tipMsg.Style["display"] = "";
                this.ClientScript.RegisterStartupScript(typeof(Page), "tip", "setTimeout(\"returnLoginPage()\", 5000);", true);
            }
        }

      
    }
}