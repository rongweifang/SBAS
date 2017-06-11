using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetData;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Zhaopin.UserCenter
{
    public partial class family : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string familyID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.familyID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                employee_process.showHtml(4);
                this.BindCallType("");
                initData();

                if (!string.IsNullOrEmpty(this.familyID))
                {
                    this.lb_title.Text = "编辑";
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Step4", "ID", this.familyID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                    }
                }
            }
        }
        private void BindCallType(string value)
        {
            DataTable dt = peridal.getFamilyCall(value);
            ControlBindHelper.BindHtmlSelect(dt, this.CallType, "NAME", "VALUE", "请选择");
        }

        public void initData()
        {
            DataTable dt = peridal.GetFamily();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            if (DataTableHelper.IsExistRows(dt))
            {
                if (dt.Rows.Count > 5)
                {
                    this.Button1.Enabled = false;
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.CallType.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.Name.Value))
            {
                return;
            }
           
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();

            if (string.IsNullOrEmpty(this.familyID))
            {
                DataTable dt = peridal.GetFamily();
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count >= 5)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最多只能添加5条记录！');</script>");
                        return;
                    }
                }
                ht["ID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("View_Step4", "ID", this.familyID, ht);
            if (IsOk)
            {
                //change step
                peridal.ChangeStepT("step4");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = document.URL;</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }



    }
}