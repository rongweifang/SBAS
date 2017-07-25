using OpWeb.App_Code;
using Busines.DAL;
using Busines.IDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_PrintView : PageBase
    {
        private string UID;
        public string PageContent = string.Empty;
        private string documentType;
        private string documentSize;
        private bool isApprove = false;
        private Contract_IDAO cidal = new Contract_Dal();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            this.documentType = Request["documentType"];
            this.documentSize = string.IsNullOrEmpty(Request["documentSize"]) ? "A4" : Request["documentSize"];

            if (!string.IsNullOrEmpty(this.UID) && !string.IsNullOrEmpty(documentType))
            {
                isApprove = cidal.IsApproving(UID);
                Btn_Create.Visible = isApprove;
                this.InitData();
            }
        }

        private void InitData()
        {
            //Contract_Manage.CreateMortgageFile(UID, "1");

            PageContent = Contract_Manage.GetHtmlContent(UID, documentType, documentSize);

        }

        protected void Btn_A4_Click(object sender, EventArgs e)
        {
            PageContent = Contract_Manage.GetHtmlContent(UID, documentType, "A4");
        }

        protected void Btn_A3_Click(object sender, EventArgs e)
        {
            PageContent = Contract_Manage.GetHtmlContent(UID, documentType, "A3");
        }

        protected void Btn_Create_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(UID) || string.IsNullOrEmpty(PageContent))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('操作失败，请重新登录！');</script>");
                return;
            }
            Btn_Create.Visible = false;
            //判断是否审批中
            if (!isApprove)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('操作失败：合同审批中！');</script>");
                return;
            }
            else
            {
                PageContent = Contract_Manage.GetHtmlContent(UID, documentType, documentSize,false);
                //保存合同
                bool ISOK = cidal.CreateContract(UID, PageContent);
                string result = ISOK ? "保存成功:请在【合同打印】里进行查看打印" : "生成失败";

                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('" + result + "');</script>");
            }
        }
    }
}