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
            if (RequestSession.GetSessionUser()!=null)
            {
                UserName = RequestSession.GetSessionUser().UserName.ToString();
                User_Account = RequestSession.GetSessionUser().User_Account.ToString();
            }
            else
            {
                Response.Redirect("/login.html", false); 
            }
        }
    }
}