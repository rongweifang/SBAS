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

namespace OpWeb.User
{
    public partial class UserForm : PageBase
    {
        private string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["key"]))
            {
                return;
            }
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
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Base_User", "Card_ID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["User_ID"] = RequestSession.GetSessionUser().UserId.ToString();
            ht["User_Name"] = RequestSession.GetSessionUser().UserName.ToString();
            if (string.IsNullOrEmpty(this.Card_Name.Value.Trim()) ||string.IsNullOrEmpty(this.Card_ID.Value.Trim()) ||string.IsNullOrEmpty(this.U_Age.Value.Trim()) )
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
            if (!string.IsNullOrEmpty(this._key))
            {
                ht["ModifyDate"] = DateTime.Now.ToString();
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Base_User", "Card_ID", this._key, ht);
            if (IsOk)
            {
                string Url = PageHelper.UrlEncrypt( this.Card_ID.Value.Trim());
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>self.location='User_Extra.aspx?Card_ID=" + Url + "';</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}