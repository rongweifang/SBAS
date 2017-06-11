using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class apply : System.Web.UI.Page
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
                DataTable dt = peridal.GetApply();
                ControlBindHelper.BindRepeaterList(dt, this.rp_Apply);
            }
        }
    }
}