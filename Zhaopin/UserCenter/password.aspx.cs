using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Zhaopin.UserCenter
{
    public partial class password : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.origPass.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.newpassword.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.rpassword.Value))
            {
                return;
            }
            if (!this.newpassword.Value.Equals(this.rpassword.Value))
            {
                return;
            }
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Password", "User_ID", RequestSession.GetSessionUser().UserId.ToString());
            if (ht.Count > 0 && ht != null)
            {
                if (!ht["PASSWORD"].Equals(this.origPass.Value))
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('原密码错误！');</script>");
                    return;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('密码修改失败，请重新登录后再试！');</script>");
                return;
            }
            Hashtable htt = new Hashtable();
            htt["MODIFYDATE"] = DateTime.Now.ToString();
            htt["PASSWORD"] = this.newpassword.Value.Trim();
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("View_Password", "User_ID", RequestSession.GetSessionUser().UserId.ToString(), htt);
            if (IsOk)
            {
                this.Session.Abandon();
                this.Session.Clear();
                //base.Response.Redirect("/UserCenter/Login.aspx");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = document.URL;</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}