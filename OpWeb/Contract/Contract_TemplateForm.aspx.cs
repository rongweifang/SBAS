using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_TemplateForm : System.Web.UI.Page
    {
        private string _key;
        public string CTContents;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];
            if (!base.IsPostBack)
            {
                InitContractType();
                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();

                }
            }
        }

        private void InitContractType()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("Contract_Type");

            ControlBindHelper.BindHtmlSelect(dt, this.ContractType, "ContractName", "ContractType", "");
        }

        private void InitData()
        {
           string sqlstr=("(SELECT CT.CTID,CT.CONTRACTTYPE,CT.CTCONTENT,CT.CTPAGE,CT.CREATEDATE,CT.CREATEUSER,CT.MODIFYUSER,CT.MODIFYDATE ,CTY.ContractName FROM Contract_Template CT LEFT JOIN Contract_Type CTY ON CT.ContRACTTYPE=CTY.ContractType) T");

           Hashtable ht = DataFactory.SqlDataBase().GetHashtableById(sqlstr, "CTID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this._key))
            {
                ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
            }
            else
            {

                ht["ModifyDate"] = DateTime.Now.ToString();
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_Template", "CTID", this._key, ht);
            if (IsOk)
            {
                ShowMsgHelper.AlertMsg("操作成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}