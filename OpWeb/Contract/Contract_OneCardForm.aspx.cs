using Busines;
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

namespace OpWeb.Contract
{
    public partial class Contract_OneCardForm : System.Web.UI.Page
    {
        private string UID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];

            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this.UID))
                {
                    this.InitData();
                }
            }
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_OneCard", "UID", this.UID);
            if (ht.Count > 0 && ht != null)
            {
                DateTime NewDate;
                if (!string.IsNullOrEmpty(ht["M_REPLY_BEGIN"].ToString()))
                {
                    NewDate = DateTime.Parse(ht["M_REPLY_BEGIN"].ToString());
                    ht["M_REPLY_BEGIN"] = NewDate.ToString("yyyy-MM-dd");
                }

                if (!string.IsNullOrEmpty(ht["M_REPLY_END"].ToString()))
                {
                    NewDate = DateTime.Parse(ht["M_REPLY_END"].ToString());
                    ht["M_REPLY_END"] = NewDate.ToString("yyyy-MM-dd");
                }

                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["ModifyUserID"] = RequestSession.GetSessionUser().UserId.ToString();
            ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            ht["ModifyDate"] = DateTime.Now.ToString();
            if (string.IsNullOrEmpty(this.M_Loan.Value.Trim()) || string.IsNullOrEmpty(this.M_CardNO.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_OneCard", "UID", this.UID, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','2000');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}