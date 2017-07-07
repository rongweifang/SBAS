using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase.Model;
using DataBase.Dal;
namespace OpWeb.RMBase.SysBase
{
    public partial class CustomTypeManage : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindData();
            }
        }

        private void BindData() {
            var searchData = this.txt_Search.Value.Trim();
            CustomTypeService service = new CustomTypeService();
            var typeList = service.GetCustomTypeList(searchData);
            this.rp_Item.DataSource = typeList;
            this.rp_Item.DataBind();
        }

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }
    }
}