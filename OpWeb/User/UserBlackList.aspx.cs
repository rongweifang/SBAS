using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase.Dal;
namespace OpWeb.User
{
    public partial class UserBlackList : System.Web.UI.Page
    {
        private BlackUserService blackService = new BlackUserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);
            if (!base.IsPostBack)
            {
                this.BindSelect();
            }
        }

        private void BindSelect()
        {
            bindData();
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            bindData();
        }

        public void bindData() {
            var searchData = this.txt_Search.Value.Trim();
            var recordCount = 0;
            var data = this.blackService.getBlackUsers(searchData, searchData, this.PageControl1.PageIndex, this.PageControl1.PageSize, out recordCount);
            this.PageControl1.RecordCount = recordCount;
            this.PageControl1.PageChecking();
            this.rp_Item.DataSource = data;
            this.rp_Item.DataBind();
        }

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.bindData();
        }
    }
}