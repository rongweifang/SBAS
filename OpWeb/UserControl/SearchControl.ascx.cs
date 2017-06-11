using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetData;
using Common.DotNetUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.UserControl
{
    public partial class SearchControl : System.Web.UI.UserControl
    {
        private SR_Tickets_IDal systemidal = new SR_Tickets_Dal();
        public event EventHandler SearchHandler;
        public string Organization_IDs { get; set; }
        public string TicketState { get; set; }
        public string SelectMonth { get; set; }
        public string SelectOrganizationID { get; set; }
        public StringBuilder SqlWhere { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.BindState();
                this.InitParentId();
            }
        }
        private void BindState()
        {
            DataTable dt = this.systemidal.GetStateList();
            ControlBindHelper.BindHtmlSelect(dt, this.Ticket_States, "States_Name", "States_ID", "所有");
        }

        private void InitParentId()
        {
            DataTable dt = this.systemidal.GetOrgaizationList(RequestSession.GetSessionUser().UserId.ToString());
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
        }

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            TicketState = this.Ticket_States.Value;
            SelectMonth = this.SL_Month.Value;
            SelectOrganizationID = this.Organization_ID.Value;

            this.SearchHandler(sender, e);
        }

    }
}