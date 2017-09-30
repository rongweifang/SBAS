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
    public partial class Contract_LDZJPrintView : System.Web.UI.Page
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
            this.documentType = base.Request["documentType"];
            this.documentSize = string.IsNullOrEmpty(Request["documentSize"]) ? "A4" : Request["documentSize"];

            if (!string.IsNullOrEmpty(this.UID))
            {
                isApprove = cidal.IsApproving(UID);
                Btn_Create.Visible = isApprove;
                this.InitData();
            }
        }
        private void InitData()
        {
            PageContent = Contract_LDZJ_Change.GetHtmlContent(UID, documentType, documentSize);
            PageContent = Contract_LDZJ_Change.GetHtmlExchange(UID, PageContent, documentType);
            PageContent = Contract_LDZJ_Change.ClearHtmlExchange(PageContent);
        }

        protected void Btn_A4_Click(object sender, EventArgs e)
        {
            PageContent = Contract_LDZJ_Change.GetHtmlContent(UID, documentType, "A4");

            PageContent = Contract_LDZJ_Change.GetHtmlExchange(UID, PageContent, documentType);
            PageContent = Contract_LDZJ_Change.ClearHtmlExchange(PageContent);
        }

        protected void Btn_A3_Click(object sender, EventArgs e)
        {
            PageContent = Contract_LDZJ_Change.GetHtmlContent(UID, documentType, "A3");
            PageContent = Contract_LDZJ_Change.GetHtmlExchange(UID, PageContent, documentType);
            PageContent = Contract_LDZJ_Change.ClearHtmlExchange(PageContent);
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
                PageContent = Contract_LDZJ_Change.GetHtmlContent(UID, documentType, documentSize, false);
                PageContent = Contract_LDZJ_Change.GetHtmlExchange(UID, PageContent, documentType);
                PageContent = Contract_LDZJ_Change.ClearHtmlExchange(PageContent);

                //保存合同
                bool ISOK = cidal.CreateContract(UID, PageContent);
                string result = ISOK ? "保存成功:请在【合同打印】里进行查看打印" : "生成失败";

                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('" + result + "');</script>");
            }
        }
    }
}