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
    public partial class WorkFlow_Manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.DataBindGrid();
            }
        }
        private void DataBindGrid()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("WF_WorkFlowInfo");
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);

        }
    }
}