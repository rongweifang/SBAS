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

namespace OpWeb.User
{
    public partial class UserList : System.Web.UI.Page
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
        private void BindSelect()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("School_Area");
            ControlBindHelper.BindHtmlSelect(dt, this.AreaName, "AreaName", "AreaName", "院校所在地");

            DataTable dtEduBack = DataFactory.SqlDataBase().GetDataTable("EduBack");
            ControlBindHelper.BindHtmlSelect(dtEduBack, this.EduBackName, "name", "name", "学历");

            DataTable dtEduType = DataFactory.SqlDataBase().GetDataTable("EduType");
            ControlBindHelper.BindHtmlSelect(dtEduType, this.EduTypeName, "name", "name", "教育类型");

            DataTable dtCompany = DataFactory.SqlDataBase().GetDataTable("Company");
            ControlBindHelper.BindHtmlSelect(dtCompany, this.CompanyID, "companyName", "companyID", "申报单位");

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT specName  FROM Specialty  group by specName");
            DataTable dtSpecialty = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            ControlBindHelper.BindHtmlSelect(dtSpecialty, this.specName, "specName", "specName", "申报专业");

            DataTable dtUserStatus = DataFactory.SqlDataBase().GetDataTable("UserStatus");
            ControlBindHelper.BindHtmlSelect(dtUserStatus, this.status, "status", "status", "审核状态");

            DataTable dtChecks = DataFactory.SqlDataBase().GetDataTable("Keys");
            ControlBindHelper.BindHtmlSelect(dtChecks, this.Checks, "value", "value", "确认简历");

        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
        private void DataBindGrid()
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            IList<SqlParam> IList_param = new List<SqlParam>();
            SqlWhere.Append(" WHERE 1=1 ");
            if (!string.IsNullOrEmpty(this.AreaName.Value))
            {
                SqlWhere.AppendFormat(" AND AreaName='{0}' ", this.AreaName.Value);
            }
            if (!string.IsNullOrEmpty(this.EduBackName.Value))
            {
                SqlWhere.AppendFormat(" AND EduBackName='{0}' ", this.EduBackName.Value);
            }
            if (!string.IsNullOrEmpty(this.EduTypeName.Value))
            {
                SqlWhere.AppendFormat(" AND EduTypeName='{0}' ", this.EduTypeName.Value);
            }
            if (!string.IsNullOrEmpty(this.CompanyID.Value))
            {
                SqlWhere.AppendFormat(" AND CompanyID='{0}' ", this.CompanyID.Value);
            }
            if (!string.IsNullOrEmpty(this.specName.Value))
            {
                SqlWhere.AppendFormat(" AND specName='{0}' ", this.specName.Value);
            }
            if (!string.IsNullOrEmpty(this.status.Value))
            {
                SqlWhere.AppendFormat(" AND status='{0}' ", this.status.Value);
            }
            if (!string.IsNullOrEmpty(this.Checks.Value))
            {
                SqlWhere.AppendFormat(" AND Checks='{0}' ", this.Checks.Value);
            }
            if (!string.IsNullOrEmpty(this.sexText.Value))
            {
                SqlWhere.AppendFormat(" AND sexText='{0}' ", this.sexText.Value);
            }
            if (!string.IsNullOrEmpty(this.txt_Search.Value))
            {
                SqlWhere.Append(" AND U." + this.Searchwhere.Value + " like @obj ");
                IList_param.Add(new SqlParam("@obj", '%' + this.txt_Search.Value.Trim() + '%'));
            }

            DataTable dt = this.peridal.GetUserListPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            this.PageControl1.RecordCount = Convert.ToInt32(count);
            this.PageControl1.PageChecking();
        }
        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {



            // peridal.ExportExcelFilebyUserID(user_ID);
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            IList<SqlParam> IList_param = new List<SqlParam>();
            SqlWhere.Append("SELECT *  ");
            SqlWhere.Append("FROM View_UserList U");
            SqlWhere.Append(" WHERE 1=1 ");
            if (!string.IsNullOrEmpty(this.AreaName.Value))
            {
                SqlWhere.AppendFormat(" AND AreaName='{0}' ", this.AreaName.Value);
            }
            if (!string.IsNullOrEmpty(this.EduBackName.Value))
            {
                SqlWhere.AppendFormat(" AND EduBackName='{0}' ", this.EduBackName.Value);
            }
            if (!string.IsNullOrEmpty(this.EduTypeName.Value))
            {
                SqlWhere.AppendFormat(" AND EduTypeName='{0}' ", this.EduTypeName.Value);
            }
            if (!string.IsNullOrEmpty(this.CompanyID.Value))
            {
                SqlWhere.AppendFormat(" AND CompanyID='{0}' ", this.CompanyID.Value);
            }
            if (!string.IsNullOrEmpty(this.specName.Value))
            {
                SqlWhere.AppendFormat(" AND specName='{0}' ", this.specName.Value);
            }
            if (!string.IsNullOrEmpty(this.status.Value))
            {
                SqlWhere.AppendFormat(" AND status='{0}' ", this.status.Value);
            }
            if (!string.IsNullOrEmpty(this.Checks.Value))
            {
                SqlWhere.AppendFormat(" AND Checks='{0}' ", this.Checks.Value);
            }
            if (!string.IsNullOrEmpty(this.sexText.Value))
            {
                SqlWhere.AppendFormat(" AND sexText='{0}' ", this.sexText.Value);
            }

            // peridal.ExportExcelFilebyUserID(user_ID);
            string webpath = peridal.ExportExcelFilebySQL(SqlWhere);

            if (webpath != "0")
            {
                ShowMsgHelper.Alert("导出成功！请登录服务器下载。文件位置：D:\\ExcelFiles");
            }
            else
            {
                ShowMsgHelper.Alert("导出失败！请联系技术人员。电话：18638956262");
            }
        }
    }
}