using OpWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_PrintView : PageBase
    {
        private string UID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];

            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this.UID))
                {
                    this.InitData();
                }
            }
        }

        private void InitData()
        {
            Contract_Manage.CreateMortgageFile(UID, "1");
        }

    }
}