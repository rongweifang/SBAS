using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using OpWeb.App_Code;
using OpWeb;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_SelectTemp_Right : System.Web.UI.Page
    {
        private Contract_IDAO cidal = new Contract_Dal();
        public string SL_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(base.Request["SL_ID"]))
            {
                this.SL_ID = base.Request["SL_ID"].Trim('\'') ;
                this.DataBindGrid();
            }
            
        }

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
        private void DataBindGrid()
        {
            DataTable dt = this.cidal.GetContract_SelectSubList(SL_ID);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        }
    }
}