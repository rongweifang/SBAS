using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
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
    public partial class Contract_Template : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string _Contract_Type;
        private string _txt_Search;
        //private string 
        protected void Page_Load(object sender, EventArgs e)
        {
            InitContractType();
            if (base.IsPostBack)
            {
                this._Contract_Type = base.Request["ContractType"];
                this._txt_Search = base.Request["txt_Search"];
                BindData();
            }
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);
        }
        private void BindData()
        {
           // DataTable dt = DataFactory.SqlDataBase().GetDataTable("Contract_Type", "ContractType", this._Contract_Type);
            Hashtable ht= DataFactory.SqlDataBase().GetHashtableById("Contract_Type", "ContractType", this._Contract_Type);
            ControlBindHelper.SetWebControls(this.Page, ht);

            txt_Search.Value = this._txt_Search.Trim();
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
        private void InitContractType()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("Contract_Type");

            ControlBindHelper.BindHtmlSelect(dt, this.ContractType, "ContractName", "ContractType", "全部");
            
        }
        private void DataBindGrid()
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            IList<SqlParam> IList_param = new List<SqlParam>();
            SqlWhere.Append(" WHERE 1=1 ");
            if (!string.IsNullOrEmpty(this.ContractType.Value))
            {
                SqlWhere.AppendFormat("AND ContractType='{0}' ", this.ContractType.Value.Trim());
            }
            if (!string.IsNullOrEmpty(this.txt_Search.Value))
            {
                SqlWhere.AppendFormat("AND CTPage='{0}'", this.txt_Search.Value.Trim());
            }
            DataTable dt = this.peridal.GetContract_TemplateListPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            this.PageControl1.RecordCount = Convert.ToInt32(count);
            this.PageControl1.PageChecking();
        }

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
    }
}