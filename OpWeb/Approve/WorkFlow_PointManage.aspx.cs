using Busines;
using Common.DotNetCode;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Approve
{
    public partial class WorkFlow_PointManage : System.Web.UI.Page
    {
        public string _key;

        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];
            if (string.IsNullOrEmpty(_key))
            {
                return;
            }
            if (!base.IsPostBack)
            {
                this.DataBindGrid();
            }
        }

        private void DataBindGrid()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT WA.*,BR.Roles_Name FROM WF_Activity WA LEFT JOIN Base_Roles BR ON WA.RoleId=BR.Roles_ID WHERE FlowInfoId='{0}' ORDER BY STEP", _key);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);

        }
    }
}