using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetData;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class academy : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            if (!this.IsPostBack)
            {
                employee_process.showHtml(6);
                initData();
            }
        }
        public void initData()
        {
            DataTable dt = peridal.GetPaper();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Paper);

            DataTable dtResearch = peridal.GetResearch();
            ControlBindHelper.BindRepeaterList(dtResearch, this.rp_Research);
        }

    }
}