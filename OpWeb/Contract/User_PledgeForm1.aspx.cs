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
    public partial class User_PledgeForm1 : System.Web.UI.Page
    {
        private string UID;
        private bool IsExist = false;
        private string key;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            IsExist = DataFactory.SqlDataBase().IsExist("User_Interview", "UID", UID) > 0 ? true : false;

            if (!IsPostBack)
            {
                if (IsExist)
                {
                    BindData();
                }
            }
        }
        private void BindData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("User_Interview", "UID", UID);
            if (ht.Count > 0)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht = ControlBindHelper.GetWebControls(this.Page);
            if (IsExist)
            {
                key = this.UID;
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["ModifyDate"] = DateTime.Now.ToString();
            }
            else
            {
                ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["UID"] = UID;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("User_Interview", "UID", this.key, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}