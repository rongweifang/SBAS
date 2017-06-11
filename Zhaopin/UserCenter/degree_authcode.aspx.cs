using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class degree_authcode : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            if (!this.IsPostBack)
            {
                Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Degree_Authcode", "User_ID", RequestSession.GetSessionUser().UserId.ToString());
                if (ht.Count > 0 && ht != null)
                {
                    ControlBindHelper.SetWebControls(this.Page, ht);
                    if (!string.IsNullOrEmpty(ht["DEGREEOVERDATE"].ToString()))
                    {
                        this.DegreeOverdate.Value = Convert.ToDateTime(ht["DEGREEOVERDATE"].ToString()).ToString("yyyy-MM-dd");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.DegreeAuthcode.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('学籍认证码不能为空！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.DegreeOverdate.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('学籍认证码有效期不能为空！');</script>");
                return;
            }

            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("View_Degree_Authcode", "User_ID", RequestSession.GetSessionUser().UserId.ToString(), ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = document.URL;</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}