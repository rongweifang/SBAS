using Busines.DAL;
using Busines.IDAO;
using Common.DotNetData;
using OpWeb.App_Code;
using System;
using System.Data;
using System.Text;

namespace OpWeb.Contract
{
    public partial class Contract_SelectTemp_Left : System.Web.UI.Page
    {
        public StringBuilder strHtml = new StringBuilder();
        private Contract_IDAO cidal = new Contract_Dal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.InitInfo();
            }
        }
        public void InitInfo()
        {
            DataTable Ctype = this.cidal.GetContractTypeList();
            if (DataTableHelper.IsExistRows(Ctype))
            {
                foreach (DataRow dr in Ctype.Rows)
                {
                    this.strHtml.Append("<li>");
                    this.strHtml.Append("<div>" + dr["ContractName"].ToString());
                    this.strHtml.Append("<span style='display:none'>" + dr["ContractType"].ToString() + "</span></div>");
                    this.strHtml.Append(this.GetTreeNode(dr["ContractType"].ToString()));
                    this.strHtml.Append("</li>");
                }
            }
            else
            {
                this.strHtml.Append("<li>");
                this.strHtml.Append("<div><span style='color:red;'>暂无数据</span></div>");
                this.strHtml.Append("</li>");
            }
        }
        public string GetTreeNode(string ContractType)
        {
            StringBuilder sb_TreeNode = new StringBuilder();

            StringBuilder sbWhere = new StringBuilder();
            sbWhere.AppendFormat(" WHERE ContractType='{0}'", ContractType);
            DataTable dt = cidal.GetContract_SelectList(sbWhere);
            if (DataTableHelper.IsExistRows(dt))
            {
                sb_TreeNode.Append("<ul>");
                foreach (DataRow dr in dt.Rows)
                {
                    sb_TreeNode.Append("<li>");
                    sb_TreeNode.Append("<div>" + dr["SL_Desc"].ToString());
                    sb_TreeNode.Append("<span style='display:none'>" + dr["SL_ID"].ToString() + "</span></div>");
                    sb_TreeNode.Append("</li>");
                }
                sb_TreeNode.Append("</ul>");
            }
           
            return sb_TreeNode.ToString();
        }

    }
}