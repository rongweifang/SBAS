using Busines.DAL;
using Busines.IDAO;
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

namespace OpWeb.Contract
{
    public partial class Contract_LDZJ : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);
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

            DataTable dt = this.peridal.GetLDZJListPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
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