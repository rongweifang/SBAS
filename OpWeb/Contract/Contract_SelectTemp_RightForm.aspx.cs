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
    public partial class Contract_SelectTemp_RightForm : System.Web.UI.Page
    {
        private string _key;
        private string SL_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];
            this.SL_ID= base.Request["SL_ID"];

            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["SL_ID"] = SL_ID;
            ht["SL_Checked"] = this.SL_Checked_0.Checked;
            ht["SL_ISBREAK"] = this.SL_IsBreak_0.Checked;
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_SelectSub", "SL_SubID", this._key, ht);
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
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_SelectSub", "SL_SubID", this._key);
            this.SL_IsBreak_0.Checked = bool.Parse(ht["SL_ISBREAK"].ToString());
            this.SL_IsBreak_1.Checked = !bool.Parse(ht["SL_ISBREAK"].ToString());
            this.SL_Checked_0.Checked= bool.Parse(ht["SL_CHECKED"].ToString());
            this.SL_Checked_1.Checked= !bool.Parse(ht["SL_CHECKED"].ToString());
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
    }
}