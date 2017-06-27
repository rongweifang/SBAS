using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase.Dal;
using DataBase.Model;
using Common.DotNetBean;
using DataBase.Enums;
namespace OpWeb.UserControl
{
    public partial class WorkFlowInfo : System.Web.UI.UserControl
    {
        public string WorkFlowID { get; set; }
        WorkFlowService flowService = new WorkFlowService();
        protected List<WF_Activity> allActivity = new List<WF_Activity>();
        public int step = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                InitData();
            }
        }

        private void InitData() {
            var workFlow = flowService.GetWorkFlow(this.WorkFlowID);
            if (workFlow == null) {
                return;
            }
            allActivity = flowService.GetWorkActivity(workFlow.WorkInfoId);
            var workFlowProcess = flowService.GetProcessByWorkFlowId(this.WorkFlowID, 0);
            if (workFlowProcess != null && workFlowProcess.Count > 0) {
                step = workFlowProcess.FirstOrDefault().Step;
            }
            InitControl(workFlow, workFlowProcess);
        }

        private void InitControl(WF_WorkFlow workFlow,List<WF_Process> currApprovers) {
            if (workFlow.IsFinish) {
                return;
            }
            var currentUser = RequestSession.GetSessionUser();
            if (currentUser == null) {
                return;
            }
            if (workFlow.Requester.Equals(currentUser.UserId.ToString()))
            {
                if (workFlow.WFStatus == (int)OperateEnum.Reject || workFlow.WFStatus == (int)OperateEnum.Cancel)
                {
                    btn_resubmit.Visible = true;
                }
                btn_cancel.Visible = true;
            }
            else {
                var currApprover = currApprovers.Where(c => currentUser.Equals(c.ApproverID)).FirstOrDefault();
                if (currApprover != null) {
                    btn_approve.Visible = true;
                    btn_return.Visible = true;
                }
            }
        }

    }
}