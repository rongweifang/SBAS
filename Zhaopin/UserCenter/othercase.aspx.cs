using Busines;
using Common.DotNetBean;
using Common.DotNetCode;
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
    public partial class othercase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }

            if (!this.IsPostBack)
            {
                employee_process.showHtml(9);
                this.InitData();
            }
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Step9", "User_ID", RequestSession.GetSessionUser().UserId.ToString());
            this.UserMemo.InnerText = ht["OTHERCASE"].ToString();
            //ControlBindHelper.SetWebControls(this.Page, ht);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = this.UserMemo.InnerText;
            str = SqlFilterHelper.Filter(SqlFilterHelper.Filter(str));

            Hashtable ht = new Hashtable();

            ht["othercase"] = str;
            if (string.IsNullOrEmpty(str) || str == "无")
            {
                ht["STEP9"] = "0";
            }
            else
            {
                ht["STEP9"] = "1";
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("View_Step9", "User_ID", RequestSession.GetSessionUser().UserId.ToString(), ht);
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