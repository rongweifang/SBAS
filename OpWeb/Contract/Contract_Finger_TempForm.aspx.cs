using Busines;
using Common.DotNetData;
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
    public partial class Contract_Finger_TempForm : System.Web.UI.Page
    {
        private string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];
            if (!base.IsPostBack)
            {
                InitContractType();
                InitClassID();
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

        private void InitClassID()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("Base_User_Class");

            ControlBindHelper.BindHtmlSelect(dt, this.ClassID, "UserClass", "ClassID", "");
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_Finger_Temp", "FTID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_Finger_Temp", "FTID", this._key, ht);
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