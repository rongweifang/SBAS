using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
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
    public partial class language : System.Web.UI.Page
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
                employee_process.showHtml(3);
                initData();
            }
        }
        public void initData()
        {
            DataTable dt = peridal.GetLanguage();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Language);

            DataTable dt2 = peridal.GetComputerLevel();
            ControlBindHelper.BindRepeaterList(dt2, this.rp_Computer);

            DataTable dt3 = peridal.GetCertOther();
            ControlBindHelper.BindRepeaterList(dt3, this.rp_CertOther);
        }
    }
}