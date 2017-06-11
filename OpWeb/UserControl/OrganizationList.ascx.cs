using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetData;
using Common.DotNetUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.UserControl
{
    public partial class OrganizationList : System.Web.UI.UserControl
    {
        private SR_Tickets_IDal systemidal = new SR_Tickets_Dal();
        public event EventHandler SelectedHandler;
        private string Organization_IDs = "";
        public string OrganizationID
        {
            set
            {
                this.Organization_ID.Value = value.ToString();
            }
            get
            {
                return this.Organization_ID.Value;
            }
            }
        protected void Page_Load(object sender, EventArgs e)
        {
          //  string s = Page.GetPostBackEventReference(Organization_ID);
               
            if (!base.IsPostBack)
            {
                this.InitParentId();
              //  Organization_ID.Attributes.Add("onchange", s);
            }
        }

        private void InitParentId()
        {
            DataTable dt = this.systemidal.GetOrgaizationList();
            if (DataTableHelper.IsExistRows(dt))
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (!string.IsNullOrEmpty(Organization_IDs))
                    {
                        Organization_IDs = Organization_IDs + ",'" + dt.Rows[i]["Organization_ID"].ToString() + "'";
                    }
                    else
                    {
                        Organization_IDs = "'" + dt.Rows[i]["Organization_ID"].ToString() + "'";
                    }
                }
                ControlBindHelper.BindHtmlSelect(dt, this.Organization_ID, "Organization_Name", "Organization_ID", "请选择");
            }
           // OrganizationID=this.Organization_ID.Value ;
        }

        protected void Organization_ID_ServerChange(object sender, EventArgs e)
        {
            //OrganizationID = this.Organization_ID.Value;
            this.SelectedHandler(sender, e);
        }
    }
}