using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetData;
using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Busines;

namespace MeterAPPServer
{
    public partial class Main : System.Web.UI.Page
    {
        //private RM_UserInfo_IDAO uidal = new RM_UserInfo_Dal();

        public string Tyear, TMonth, UTotal, UUserNum, UOver, UNever, U0, Urate, Fwater, FNum, FFee;

        public string[] Items;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
                this.Response.Redirect("/AppServer/Login.aspx");

            this.TMonth = DateTime.Now.Month.ToString();
            if (!this.IsPostBack)
            {
                initdata();
            }
        }

        private void initdata()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"--合同数
SELECT COUNT(1) FROM View_Contract WHERE datediff(month,CreateDate,getdate())=0

--待审批
SELECT COUNT(1) FROM View_Approve VA , Base_UserRole BUR WHERE VA.RoleId=BUR.Roles_ID AND WFStatus=1 AND BUR.User_ID='{0}'

--已审批
SELECT COUNT(1) FROM WF_Process WHERE ApproverID='' AND  datediff(month,CreateTime,getdate())=0

--作废审批

SELECT COUNT(1) FROM View_Approve VA , Base_UserRole BUR WHERE VA.RoleId=BUR.Roles_ID AND WFStatus=4 AND BUR.User_ID='{0}'
--申请贷款
SELECT SUM(CONVERT(int,M_Loan)) FROM View_Contract WHERE datediff(month,CreateDate,getdate())=0

--发放贷款
SELECT SUM(M_Loan) FROM View_Contract VC LEFT JOIN WF_WorkFlow WF ON VC.UID=WF.ContractId WHERE datediff(month,CreateDate,getdate())=0 AND WF.IsFinish=1
--等额本金
SELECT SUM(CONVERT(int,M_Loan)) FROM View_Contract WHERE datediff(month,CreateDate,getdate())=0 AND M_Replay_Type='等额本金'


--等额本息

SELECT SUM(CONVERT(int,M_Loan)) FROM View_Contract WHERE datediff(month,CreateDate,getdate())=0 AND M_Replay_Type='等额本息'
--统计时间
SELECT GETDATE() ",RequestSession.GetSessionUser().UserId.ToString());


            DataSet ds = DataFactory.SqlDataBase().GetDataSetBySQL(sb);
            Items = new string[ds.Tables.Count];
            for (int i = 0; i < ds.Tables.Count; i++)
            {
                Items[i] = ds.Tables[i].Rows[0][0].ToString();
            }

        }
    }
}