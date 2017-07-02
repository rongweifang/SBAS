using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase.Model;
using DataBase.Dal;
using Common.DotNetBean;

namespace OpWeb.RMBase.SysBase
{
    public partial class ModifyCustomType : System.Web.UI.Page
    {
        CustomTypeService customService = new CustomTypeService();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindData();
            }
        }

        private void BindData() {
            if (!string.IsNullOrWhiteSpace(this.Request["id"]))
            {
                var id = 0;
                int.TryParse(this.Request["id"], out id);
                var customType = customService.GetCustomTypeById(id);
                if (customType == null)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('该客户类型不存在');OpenClose();", true);
                    return;
                }
                this.type_Name.Value = customType.Name;
                this.type_ID.Value = customType.TypeNo;
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            this.lab_msg.InnerText = "";
            var typeNo = this.type_ID.Value;
            var typeName = this.type_Name.Value;
            var currUser = RequestSession.GetSessionUser();
            if (currUser == null)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "top.location.href='/Login.html';", true);
                return;
            }
            var typeId = 0;
            if (!string.IsNullOrEmpty(this.Request["id"])) {
                int.TryParse(this.Request["id"], out typeId);
            }

            CustomType customType = new CustomType()
            {
                CreateTime = DateTime.Now,
                Id = typeId,
                Name = typeName,
                TypeNo = typeNo
            };
            var execResult = 0;
            if (customType.Id>0)
            {
                execResult = customService.ModifyCustomType(customType);
            }
            else
            {
                execResult = customService.AddCustomeType(customType);
            }
            if (execResult <= 0)
            {
                this.lab_msg.InnerText = "保存失败";
                return;
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "OpenClose();", true);
                return;
            }
        }
    }
}