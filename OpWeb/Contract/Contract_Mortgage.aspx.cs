using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_Mortgage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);

            
            if (!base.IsPostBack)
            {
            }
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
        }
        protected void lbtSearch_Click(object sender, EventArgs e)
        {

        }
    }
}