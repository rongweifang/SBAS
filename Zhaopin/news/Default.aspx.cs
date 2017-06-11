using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
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

namespace Zhaopin.news
{
    public partial class Default : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.PageControl.pageHandler += new EventHandler(this.pager_PageChanged);
            }

        }
        private void pager_PageChanged(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
        private void DataBindGrid()
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            SqlWhere.Append(" AND newsTypeID=2");
            IList<SqlParam> IList_param = new List<SqlParam>();
            DataTable dt = this.peridal.GetNewsListPage(SqlWhere, IList_param, this.PageControl.PageIndex, this.PageControl.PageSize, ref count);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            this.PageControl.RecordCount = Convert.ToInt32(count);
            this.PageControl.PageChecking();
        }

    }
}