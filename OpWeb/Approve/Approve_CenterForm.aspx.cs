using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Approve
{
    public partial class Approve_CenterForm : System.Web.UI.Page
    {

        //CID
        private string CID;
        //private string WorFlowId;
        //private string ActivityId;
        //private string Step;
        Hashtable ht = new Hashtable();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CID = base.Request["CID"];

            //if (!base.IsPostBack)
            //{
                if (!string.IsNullOrEmpty(this.CID))
                {
                    this.InitData();

                }
           // }
        }
        private void InitData()
        {
            ht = DataFactory.SqlDataBase().GetHashtableById("View_Approve", "Id", this.CID);
            LB_Name.Text = ht["CARD_NAME"].ToString();
            LB_Card.Text = ht["CARD_ID"].ToString();
            LB_Loan.Text = ht["M_LOAN_CAP"].ToString();
            LB_Months.Text = ht["M_LOAN_MONTHS"].ToString();
            //if (ht.Count > 0 && ht != null)
            //{
            //    ControlBindHelper.SetWebControls(this.Page, ht);
            //}
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Save.Enabled = false;
            InsertProcess();
            if (RB1.Checked)
            {
                string sqltable = string.Format(" (SELECT TOP 1 * FROM  WF_Activity WHERE FlowInfoId='{0}' AND Step>{1}) B ", ht["WORKINFOID"].ToString(), ht["STEP"].ToString());

                Hashtable hb = DataFactory.SqlDataBase().GetHashtableById(sqltable, "FlowInfoId", ht["WORKINFOID"].ToString());
                if (hb.Count > 0 && hb.Contains("FLOWINFOID"))
                {
                    //2、更新WF_WorkFlow
                    //3、更新View_Contract
                    StringBuilder sb = new StringBuilder();
                    sb.AppendFormat("UPDATE WF_WorkFlow SET CurrentActivityId='{0}' WHERE Id='{1}'", hb["ID"].ToString(), this.CID);

                    int count = DataFactory.SqlDataBase().ExecuteBySql(sb);
                    if (count > 0)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批成功！');setTimeout('OpenClose()','100');</script>");

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批失败！');</script>");
                        Save.Enabled = true;
                    }

                }
                else
                {
                    //结束
                    StringBuilder sb = new StringBuilder();
                    sb.AppendFormat("UPDATE WF_WorkFlow SET IsFinish=1,WFStatus=6,CurrentActivityId='' WHERE Id='{0}'", this.CID);

                    int count = DataFactory.SqlDataBase().ExecuteBySql(sb);
                    if (count > 0)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批结束！');setTimeout('OpenClose()','100');</script>");

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批结束失败！');</script>");
                        Save.Enabled = true;

                    }

                }


            }

        }

        private bool InsertProcess()
        {
            Hashtable ha = new Hashtable();
            ha["APPROVERID"] = RequestSession.GetSessionUser().UserId.ToString();
            ha["WORFLOWID"] = ht["ID"];
            ha["ACTIVITYID"] = ht["ACTIVITYID"];
            ha["Operate"] = Operat.Value.Trim();
            ha["STEP"] = ht["STEP"];
            ha["OPERATETIME"] = DateTime.Now.ToString();
            ha["ISPASS"] = RB1.Checked ? "1" : "0";
            //Operate
            return DataFactory.SqlDataBase().Submit_AddOrEdit("WF_Process", "id", "", ha);

        }
    }
}