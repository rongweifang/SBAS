using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Company
{
    public partial class Specialty_form : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];
            if (!base.IsPostBack)
            {
                this.BindSelect();

                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();
                }
            }
        }
        private void BindSelect()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("Company");
            ControlBindHelper.BindHtmlSelect(dt, this.CompanyID, "companyName", "CompanyID", "公司名称");

            DataTable dtEduBack = DataFactory.SqlDataBase().GetDataTable("EduBack");
            ControlBindHelper.BindHtmlSelect(dtEduBack, this.EduBack, "name", "value", "选择学历");

            DataTable dtUserStatus = DataFactory.SqlDataBase().GetDataTable("Keys");
            ControlBindHelper.BindHtmlSelect(dtUserStatus, this.isLock, "value", "keys", "锁定状态");
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Specialty", "ID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                string into = ht["ACCEPTLEVEL"].ToString();
                ht.Remove("ACCEPTLEVEL");
                ControlBindHelper.SetWebControls(this.Page, ht);
                this.acceptLevel.Value = StringHelper.FormatTextAreaCHG(into);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht.Remove("acceptLevel");
            ht["acceptLevel"] = StringHelper.FormatTextArea(this.acceptLevel.Value);
            if (string.IsNullOrEmpty(this._key))
            {
                ht["ID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Specialty", "ID", this._key, ht);
            if (IsOk)
            {
                ShowMsgHelper.ParmAlertMsg("操作成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}