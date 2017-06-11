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
    public partial class PaperForm : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string paperID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.paperID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                this.BindPaperLevel("");

                if (!string.IsNullOrEmpty(this.paperID))
                {
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Paper", "PaperID", this.paperID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                        this.Pubdate.Value = Convert.ToDateTime(ht["PUBDATE"].ToString()).ToString("yyyy-MM-dd");
                    }
                }
            }
        }

        private void BindPaperLevel(string value)
        {
            DataTable dt = peridal.getPaperLevel(value);
            ControlBindHelper.BindHtmlSelect(dt, this.PaperLevel, "NAME", "VALUE", "请选择");
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.PaperLevel.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.PaperName.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.Pubdate.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.Press.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.Period.Value))
            {
                return;
            }
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();


            if (string.IsNullOrEmpty(this.paperID))
            {
                DataTable dt = peridal.GetPaper();
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count > 5)
                    {
                        return;
                    }
                }
                ht["PAPERID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Paper", "PaperID", this.paperID, ht);
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