using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using Busines;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OpWeb.Contract;
using Common.DotNetCode;
using Common.DotNetData;
using System.Collections;
using Busines.DAL;
using Busines.IDAO;

namespace OpWeb.AppServer
{
    public partial class AppCustomer : System.Web.UI.Page
    {
        private string UID;
        public string PageContent = string.Empty;
        private string documentType;
        private string _key;
        private string CID;
        public StringBuilder SM = new StringBuilder();
        private Contract_IDAO peridal = new Contract_Dal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            this.documentType = Request["documentType"];
            this._key = base.Request["key"];

            if (!string.IsNullOrEmpty(this.UID) && !string.IsNullOrEmpty(documentType))
            {
                InitInfo();

            }

            if (!base.IsPostBack)
            {
               
            }
        }
        private void InitInfo()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Approve", "UID", this.UID);
            if (ht.Count > 0 && ht != null)
            {
                this.CID = ht["ID"].ToString();
                this.InitData(ht["UID"].ToString(), ht["DOCUMENTTYPE"].ToString());
                InitDataPicture(ht["CARD_ID"].ToString());
            }


        }
        private void InitData(string UID,string documentType)
        {
            PageContent = Contract_Manage.GetHtmlContent(UID, documentType);

        }

        private void InitDataPicture(string Card_ID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * FROM UserPicture WHERE Card_ID=@Card_ID");
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, new SqlParam[] { new SqlParam("@Card_ID", Card_ID) });
            if (DataTableHelper.IsExistRows(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    SM.AppendFormat("<a href=\"/User/ShowUserDatas.aspx?UPID={0}\" title=\"{1}\" data-gallery=\"\">", dr["UPID"].ToString(), dr["PhotoMemo"].ToString());
                    SM.AppendFormat(" <img src=\"data:image/jpg;base64,{0}\">", dr["PhotoBase"].ToString());

                    SM.Append("</a>");
                }
            }
        }

        protected void Btn_Pass_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.SignBase.Value.Trim()))
            {
                return;
            }
            string Sign = this.SignBase.Value.Trim();
            Sign = Sign.Split(',')[1];
            Btn_Pass.Enabled = false;
            //int ApproveDisose(string CID,bool IsPass,string Operat,string SignBase)
            int result = peridal.ApproveDisose(this.CID, true, Operat.Value.Trim(), Sign);
            ShowResult(result);
        }

        protected void Btn_NoPass_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.SignBase.Value.Trim()))
            {
                return;
            }
            string Sign = this.SignBase.Value.Trim();
            Sign = Sign.Split(',')[1];

            bool result= peridal.InsertProcess(this.CID, true, Operat.Value.Trim(), Sign);
            if (result)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
        private void ShowResult(int result)
        {
            switch (result)
            {
                case 0:
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
                    Btn_Pass.Enabled = true;
                    break;
                case 1:
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批成功！');setTimeout(self.location=main.aspx,'100');</script>");
                    break;
                case 2:
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批失败！');</script>");
                    break;
                case 3:
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批结束失败！');</script>");
                    break;
                case 4:
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批结束！');setTimeout(self.location=main.aspx,'100');</script>");
                    break;
                default:
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批失败！');</script>");
                    Btn_Pass.Enabled = true;
                    break;
            }
        }
    }
}