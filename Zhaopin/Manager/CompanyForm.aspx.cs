using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.Manager
{
    public partial class CompanyForm : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string CompID;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CompID = base.Request["ID"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht["COMPANYNAME"] = this.companyName.Value;
            ht["COMPANYTYPE"] = this.companyType.Value;
            ht["BEGINDATE"] = this.BeginDate.Value;
            ht["ENDDATE"] = this.EndDate.Value;
            ht["INTRODUCTION"] = StringCS.HtmlEncode(this.Introduction.Value);
            ht["NOTICE"] = StringCS.HtmlEncode(this.notice.Value);
            if (string.IsNullOrEmpty(this.CompID))
            {

                ht["companyID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Company", "companyID", this.CompID, ht);
            if (IsOk)
            {
              
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}