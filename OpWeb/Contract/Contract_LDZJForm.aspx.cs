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
namespace OpWeb.Contract
{
    public partial class Contract_LDZJForm : System.Web.UI.Page
    {
        private string _key;
        bool IsEdit = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["UID"];
            IsEdit = DataFactory.SqlDataBase().IsExist("Contract_LDZJ", "UID", this._key) > 0 ? true : false;
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
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_LDZJ", "UID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            if (string.IsNullOrEmpty(this.E_Loan.Value.Trim()) || string.IsNullOrEmpty(this.E_Use.Value.Trim()) || string.IsNullOrEmpty(this.E_Earn.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
            ht = ControlBindHelper.GetWebControls(this.Page);
            if (IsEdit)
            {
                ht["ModifyDate"] = DateTime.Now.ToString();
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            }
            else
            {
                ht["User_ID"] = RequestSession.GetSessionUser().UserId.ToString();
                ht["User_Name"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["Organization_ID"] = RequestSession.GetSessionUser().OrganizationID.ToString();
            }
            string id = IsEdit ? this._key : "";
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_LDZJ", "UID", id, ht);
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