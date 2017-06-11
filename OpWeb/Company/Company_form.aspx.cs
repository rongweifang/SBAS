using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Company
{
    public partial class Company_form : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
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
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Company", "companyID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                string into = ht["INTRODUCTION"].ToString();
                ht.Remove("INTRODUCTION");
                ControlBindHelper.SetWebControls(this.Page, ht);
                this.Introduction.Value = StringHelper.FormatTextAreaCHG(into);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            // ht = ControlBindHelper.GetWebControls(this.Page);
            ht["COMPANYNAME"] = this.companyName.Value;
            ht["COMPANYTYPE"] = this.companyType.Value;
            ht["BEGINDATE"] = this.BeginDate.Value;
            ht["ENDDATE"] = this.EndDate.Value;
            ht["DELETEMARK"] = this.DeleteMark.Value;
            ht["INTRODUCTION"] = StringHelper.FormatTextArea(this.Introduction.Value);
            if (string.IsNullOrEmpty(this._key))
            {
                ht["companyID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Company", "companyID", this._key, ht);
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