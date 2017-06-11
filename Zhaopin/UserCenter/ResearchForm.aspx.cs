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
using System.Windows.Forms;

namespace Zhaopin.UserCenter
{
    public partial class ResearchForm : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string ResearchID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.ResearchID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                this.BindResearchLevel("");

                if (!string.IsNullOrEmpty(this.ResearchID))
                {
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Research", "ReseID", this.ResearchID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                        this.BeginDate.Value = Convert.ToDateTime(ht["BEGINDATE"].ToString()).ToString("yyyy-MM-dd");
                        this.EndDate.Value = Convert.ToDateTime(ht["ENDDATE"].ToString()).ToString("yyyy-MM-dd");
                    }
                }
            }

        }
        private void BindResearchLevel(string value)
        {
            DataTable dt = peridal.getResearchLevel(value);
            ControlBindHelper.BindHtmlSelect(dt, this.ResearchLevel, "NAME", "VALUE", "请选择");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.ReseName.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.ResearchLevel.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.BeginDate.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.EndDate.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.ResaCompany.Value))
            {
                return;
            }
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();


            if (string.IsNullOrEmpty(this.ResearchID))
            {
                DataTable dt = peridal.GetResearch();
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count > 5)
                    {
                        return;
                    }
                }
                ht["RESEID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Research", "ReseID", this.ResearchID, ht);
            if (IsOk)
            {
                peridal.ChangeStepT("step6");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>window.opener=null;window.open('','_self');window.close();parent.location.reload();layer.msg('保存成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}