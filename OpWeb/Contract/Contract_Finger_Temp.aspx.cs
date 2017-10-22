using Busines;
using Common.DotNetUI;
using OpWeb.App_Code;
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
    public partial class Contract_Finger_Temp : PageBase
    {
        private string _Contract_Type;
        private string _txt_Search;
        protected void Page_Load(object sender, EventArgs e)
        {
            InitContractType();
            if (base.IsPostBack)
            {
                this._Contract_Type = base.Request["ContractType"];
                this._txt_Search = base.Request["txt_Search"];
                BindData();
            }
            this.DataBindGrid();
        }
        private void BindData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_Type", "ContractType", this._Contract_Type);
            ControlBindHelper.SetWebControls(this.Page, ht);
            txt_Search.Value = this._txt_Search.Trim();
        }
        private void InitContractType()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("Contract_Type");

            ControlBindHelper.BindHtmlSelect(dt, this.ContractType, "ContractName", "ContractType", "全部");

        }
        private void DataBindGrid()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CFT.*,BUC.UserClass,CT.ContractName FROM Contract_Finger_Temp CFT LEFT JOIN Base_User_Class BUC ON CFT.ClassID=BUC.ClassID LEFT JOIN Contract_Type CT ON CFT.ContractType=CT.ContractType WHERE 1=1");

            if (!string.IsNullOrEmpty(this.ContractType.Value))
            {
                sb.AppendFormat(" AND CT.ContractType='{0}'", this.ContractType.Value.Trim());
            }

            if (!string.IsNullOrEmpty(this.txt_Search.Value))
            {
                sb.AppendFormat(" AND CFT.FingerName Like '%{0}%'", this.txt_Search.Value.Trim());
            }

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);

        }
        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
    }
}