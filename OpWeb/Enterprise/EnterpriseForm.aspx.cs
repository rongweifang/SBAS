using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Enterprise
{
    public partial class EnterpriseForm : System.Web.UI.Page
    {
        private string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];

            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();
                }
            }
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Enterprise", "E_enterpriseID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            if (string.IsNullOrEmpty(this.E_enterpriseName.Value.Trim()) || string.IsNullOrEmpty(this.E_creditCode.Value.Trim()) || string.IsNullOrEmpty(this.E_frName.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
            ht = ControlBindHelper.GetWebControls(this.Page);
            if (!string.IsNullOrEmpty(this._key))
            {
                ht["ModifyDate"] = DateTime.Now.ToString();
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserId.ToString();
            }
            else
            {
                ht["User_ID"] = RequestSession.GetSessionUser().UserId.ToString();
                ht["Organization_ID"] = RequestSession.GetSessionUser().OrganizationID.ToString();
            }
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Enterprise", "E_enterpriseID", this._key, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','3000');</script>");
            }
            else
            {
               // ShowMsgHelper.Alert_Error("操作失败！");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('操作失败！');</script>");
            }
        }
    }
}