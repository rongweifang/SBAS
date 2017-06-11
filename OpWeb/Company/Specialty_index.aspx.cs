using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Company
{
    public partial class Specialty_index : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);
            if (!base.IsPostBack)
            {
                this.BindSelect();
            }
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }

        private void BindSelect()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("Company");
            ControlBindHelper.BindHtmlSelect(dt, this.companyName, "companyName", "companyName", "公司名称");


            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT specName  FROM Specialty  group by specName");
            DataTable dtSpecialty = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            ControlBindHelper.BindHtmlSelect(dtSpecialty, this.specName, "specName", "specName", "申报专业");
            //DataTable dtEduBack = DataFactory.SqlDataBase().GetDataTable("Specialty");
            //ControlBindHelper.BindHtmlSelect(dtEduBack, this.specName, "specName", "specName", "专业名称");

            DataTable dtUserStatus = DataFactory.SqlDataBase().GetDataTable("Keys");
            ControlBindHelper.BindHtmlSelect(dtUserStatus, this.isLock, "value", "keys", "锁定状态");
        }
        private void DataBindGrid()
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            IList<SqlParam> IList_param = new List<SqlParam>();
            SqlWhere.Append(" WHERE 1=1 ");
            if (!string.IsNullOrEmpty(this.companyName.Value))
            {
                SqlWhere.AppendFormat(" AND companyName='{0}' ", this.companyName.Value);
            }
            if (!string.IsNullOrEmpty(this.specName.Value))
            {
                SqlWhere.AppendFormat(" AND specName='{0}' ", this.specName.Value);
            }
            if (!string.IsNullOrEmpty(this.isLock.Value))
            {
                SqlWhere.AppendFormat(" AND isLock='{0}' ", this.isLock.Value);
            }
            

            DataTable dt = this.peridal.GetSpecialtyListPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            this.PageControl1.RecordCount = Convert.ToInt32(count);
            this.PageControl1.PageChecking();
        }
        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }

      
        private string getApplyNum(string specID)
        {
            StringBuilder struser = new StringBuilder();
            struser.AppendFormat("SELECT COUNT(*) FROM Personinfo WHERE specID='{0}'", specID);
            string UsergradDate = DataFactory.SqlDataBase().GetDataTableBySQL(struser).Rows[0][0].ToString();

            return UsergradDate;
        }

        protected void rp_Item_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                System.Web.UI.WebControls.Label lblock = e.Item.FindControl("lblock") as System.Web.UI.WebControls.Label;
                if (lblock != null)
                {
                    string text = lblock.Text;
                    text = text.Replace("1", "锁定");
                    text = text.Replace("0", "-");
                    lblock.Text = text;

                }
                System.Web.UI.WebControls.Label lbNum = e.Item.FindControl("lbNum") as System.Web.UI.WebControls.Label;
                if (lbNum != null)
                {
                    string text = lbNum.Text;
                    text = this.getApplyNum(text);
                    lbNum.Text = text;

                }
            }
        }

    }
}