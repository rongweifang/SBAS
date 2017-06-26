using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase.Dal;
using DataBase.Model;
namespace OpWeb.UserControl
{
    public partial class WorkFlowInfo : System.Web.UI.UserControl
    {
        public string WorkFlowID { get; set; }
        WorkFlowService flowService = new WorkFlowService();
        protected List<WF_Activity> allActivity = new List<WF_Activity>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                InitData();
            }
        }

        private void InitData() {
            var workFlow = flowService.GetWorkFlow(this.WorkFlowID);
            allActivity = flowService.GetWorkActivity(workFlow.WorkInfoId);
        }
    }
}