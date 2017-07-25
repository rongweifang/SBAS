using OpWeb.App_Code;
using Busines.DAL;
using Busines.IDAO;
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
    public partial class Contract_PrintForm : PageBase
    {
        private string HUID;
        public string CTContents;
        private Contract_IDAO cidal = new Contract_Dal();
        private bool isApprove;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.HUID = base.Request["HUID"];
            if (string.IsNullOrEmpty(this.HUID))
            {
                return;
            }
            if (!base.IsPostBack)
            {
                this.InitData();
            }
        }
        private void InitData()
        {

            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_History", "HUID", this.HUID);
            if (ht.Count > 0 && ht != null)
            {
                // ControlBindHelper.SetWebControls(this.Page, ht);
                this.CTContent.Value = ht["CONTRACTCONTENT"].ToString();
                isApprove = cidal.IsApproving(ht["UID"].ToString());
                this.Save.Visible = isApprove;
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {

            Hashtable ht = new Hashtable();

            ht["CONTRACTCONTENT"] = this.CTContent.Value;
            ht["ModifyDate"] = DateTime.Now.ToString();
            ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_History", "HUID", this.HUID, ht);
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