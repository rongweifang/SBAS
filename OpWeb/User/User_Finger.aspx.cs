using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class User_Finger : System.Web.UI.Page
    {
        private string Card_ID;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (string.IsNullOrEmpty(base.Request["Card_ID"]))
            {
                return;
            }
            this.Card_ID = PageHelper.UrlDecrypt(base.Request["Card_ID"]);

        }
    }
}