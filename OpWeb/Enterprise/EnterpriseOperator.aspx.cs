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
    public partial class EnterpriseOperator : System.Web.UI.Page
    {
        private string _key;
        public string LoadJs = string.Empty;
        bool IsEdit = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["E_enterpriseID"];
            IsEdit = DataFactory.SqlDataBase().IsExist("EnterpriseOperator", "E_enterpriseID", this._key) > 0 ? true : false;
            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    if (IsEdit)
                    {
                        this.InitData();
                        LoadJs = "";
                    }
                    else
                    {
                        LoadJs = "onload=\"Load()\" onunload=\"Unload()\"";
                    }
                }
            }
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("EnterpriseOperator", "E_enterpriseID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            if (string.IsNullOrEmpty(this.Card_Name.Value.Trim()) || string.IsNullOrEmpty(this.Card_ID.Value.Trim()) || string.IsNullOrEmpty(this.U_Age.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
            ht = ControlBindHelper.GetWebControls(this.Page);
            if (IsEdit)
            {
                ht["ModifyDate"] = DateTime.Now.ToString();
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();

                ht["U_Tel"] = this.U_Tel.Value.Trim();
            }
            else
            {
                ht["E_enterpriseID"] = this._key;
                ht["User_ID"] = RequestSession.GetSessionUser().UserId.ToString();
                ht["Organization_ID"] = RequestSession.GetSessionUser().OrganizationID.ToString();
            }
            string id = IsEdit ? this._key : "";
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("EnterpriseOperator", "E_enterpriseID", id, ht);
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