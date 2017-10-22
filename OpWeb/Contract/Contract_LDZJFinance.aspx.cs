using Busines;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_LDZJFinance : System.Web.UI.Page
    {
        private string _key;
        bool IsEdit = false;
        public string Type;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["UID"];
            IsEdit = DataFactory.SqlDataBase().IsExist("EnterpriseFinance", "UID", this._key) > 0 ? true : false;

            StringBuilder sb = new StringBuilder();
            SqlParam[] param = new SqlParam[] {new SqlParam("@UID", _key) };
            sb.Append("SELECT E_GuaranteeType From Contract_LDZJ WHERE UID=@UID");

            object obj = DataFactory.SqlDataBase().GetObjectValue(sb,param);
            if (string.IsNullOrEmpty(obj.ToString()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('基础信息不完整！');OpenClose();</script>");
                return;
            }
            Type = obj.ToString();
            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    if (IsEdit)
                    {
                        this.InitData();
                    }
                }
            }
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("EnterpriseFinance", "UID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {

            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (!IsEdit)
            {
                ht["UID"] = this._key;
            }
            string id = IsEdit ? this._key : "";
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("EnterpriseFinance", "UID", id, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','2000');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}