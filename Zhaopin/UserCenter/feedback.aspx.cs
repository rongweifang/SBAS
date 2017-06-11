using Busines;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Zhaopin.UserCenter
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.title.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请输入标题！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.content.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请输入内容！');</script>");
                return;
            }

            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT COUNT(*) FROM Feedback WHERE User_ID=@User_ID AND CONVERT(NVARCHAR,CreateDate,112) = CONVERT(NVARCHAR,GETDATE(),112)");
            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@User_ID", RequestSession.GetSessionUser().UserId.ToString())
            };
            int num = int.Parse(DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para).Rows[0][0].ToString());

            if (num >= 5)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('提交失败，每天最多提交5条！');</script>");
                return;
            }

            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();

            ht["ID"] = CommonHelper.GetGuid;

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Feedback", "ID", "", ht);
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