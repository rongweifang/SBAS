using Busines;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Data;
using System.Collections;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_SelectListForm : System.Web.UI.Page
    {
        private string _key;
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

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_Select", "SL_ID", this._key, ht);
            if (IsOk)
            {
                ShowMsgHelper.AlertMsg("操作成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_Select", "SL_ID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }

    }
}