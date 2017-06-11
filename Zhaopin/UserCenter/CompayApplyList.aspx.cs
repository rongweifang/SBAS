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

namespace Zhaopin.UserCenter
{
    public partial class CompayApplyList : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
                this.Response.Redirect("/UserCenter/Login.aspx");

            this.DataBindGrid();
        }
      
        private void DataBindGrid()
        {
            DataTable dt = this.peridal.GetCompany();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        }
       
    }
}