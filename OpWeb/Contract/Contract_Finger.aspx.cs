using Busines;
using Common.DotNetBean;
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
    public partial class Contract_Finger : System.Web.UI.Page
    {
        private string UID, ClassID;
        public string _Vis = "block";
        public string FistFingerName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]) || string.IsNullOrEmpty(base.Request["ClassID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            this.ClassID = base.Request["ClassID"];

            if (!base.IsPostBack)
            {
                    this.InitData();
            }
        }


        private void InitData()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT * FROM Contract_Finger WHERE [UID]='{0}' AND ClassID='{1}'",this.UID,this.ClassID);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            if (DataTableHelper.IsExistRows(dt))
            {
                ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
                this.FID.Value = dt.Rows[0]["FID"].ToString();
                this.FistFingerName = dt.Rows[0]["FingerName"].ToString();
            }
            else
            {
                this.FReg.Visible = false;
                _Vis = "none";
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["ModifyUserID"] = RequestSession.GetSessionUser().UserId.ToString();
            ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            ht["ModifyDate"] = DateTime.Now.ToString();
            if (string.IsNullOrEmpty(this.FID.Value.Trim()) || string.IsNullOrEmpty(this.FingerBase.Value.Trim()) || string.IsNullOrEmpty(this.SignBase.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
            ht.Remove("FID");
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_Finger", "FID", this.FID.Value.Trim(), ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
                InitData();
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }



    }
}