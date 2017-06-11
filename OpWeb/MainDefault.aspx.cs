using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.DotNetBean;

namespace OpWeb
{
    public partial class MainDefault : System.Web.UI.Page
    {
        public string UserName = string.Empty;
        public string User_Account = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserName = Common.DotNetBean.RequestSession.GetSessionUser().UserName.ToString();
            User_Account = Common.DotNetBean.RequestSession.GetSessionUser().User_Account.ToString();
        }
    }
}