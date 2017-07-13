using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OpWeb.Approve
{
    public partial class WorkFlow_PointManageForm : System.Web.UI.Page
    {
        private string PID;
        private string FlowInfoId;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PID = base.Request["PID"];
            this.FlowInfoId = base.Request["FlowInfoId"];
            if (!base.IsPostBack)
            {
                DataTable dt = DataFactory.SqlDataBase().GetDataTable("Base_Roles");
                ControlBindHelper.BindHtmlSelect(dt, this.RoleId, "Roles_Name", "Roles_ID", "审批角色");

                if (!string.IsNullOrEmpty(this.PID))
                {
                    this.InitData();
                }
            }
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("WF_Activity", "id", this.PID);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht = ControlBindHelper.GetWebControls(this.Page);
            //ht["ModifyUserID"] = RequestSession.GetSessionUser().UserId.ToString();
            //ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            //ht["ModifyDate"] = DateTime.Now.ToString();
            if (string.IsNullOrEmpty(this.ActName.Value.Trim()) || string.IsNullOrEmpty(this.Step.Value.Trim()) || string.IsNullOrEmpty(this.RoleId.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.PID))
            {
                ht["FlowInfoId"] = FlowInfoId;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("WF_Activity", "id", this.PID, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}