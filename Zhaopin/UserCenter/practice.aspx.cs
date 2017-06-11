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
    public partial class practice : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string WorkID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.WorkID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                employee_process.showHtml(5);
                this.BindWorkType("");
                initData();

                if (!string.IsNullOrEmpty(this.WorkID))
                {
                    this.lb_title.Text = "编辑";
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Work", "WorkID", this.WorkID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                        this.BeginDate.Value = Convert.ToDateTime(ht["BEGINDATE"].ToString()).ToString("yyyy-MM-dd");
                        this.EndDate.Value = Convert.ToDateTime(ht["ENDDATE"].ToString()).ToString("yyyy-MM-dd");
                    }
                }
            }
        }

        private void BindWorkType(string value)
        {
            DataTable dt = peridal.getWorkType(value);
            ControlBindHelper.BindHtmlSelect(dt, this.WorkType, "NAME", "VALUE", "请选择");
        }

        public void initData()
        {
            DataTable dt = peridal.GetWork();
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
            if (string.IsNullOrEmpty(this.CompName.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请填写单位名称！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.Job.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.WorkType.Value))
            {
                return;
            }
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();

          
            if (string.IsNullOrEmpty(this.WorkID))
            {
                DataTable dt = peridal.GetWork();
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count >= 5)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最多只能添加5条记录！');</script>");
                        return;
                    }
                }
                ht["WORKID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Work", "WorkID", this.WorkID, ht);
            if (IsOk)
            {
                peridal.ChangeStepT("step5");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = document.URL;</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }


    }
}