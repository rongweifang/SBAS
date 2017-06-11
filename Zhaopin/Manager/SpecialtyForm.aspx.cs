using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.Manager
{
    public partial class SpecialtyForm : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string CompyID;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CompyID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                this.BindCompany();
                if (!string.IsNullOrEmpty(this.CompyID))
                {
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Language", "ID", this.CompyID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                    }
                }
            }
        }

        private void BindCompany()
        {
            DataTable dt = peridal.GetCompany();
            ControlBindHelper.BindHtmlSelect(dt, this.CompanyID, "companyName", "companyID", "请选择");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this.specName.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('专业名称不能为空！');</script>");
                return;
            }


            if (string.IsNullOrEmpty(this.acceptNum.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('需求人数不能为空！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.CompanyID.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择所属机构！');</script>");
                return;
            }
            ht.Remove("acceptLevel");
            ht.Add("acceptLevel", StringHelper.FormatTextArea(this.acceptLevel.Value));
           // ht["ACCEPTLEVEL"] = StringHelper.FormatTextArea(this.acceptLevel.Value);
            if (string.IsNullOrEmpty(this.CompyID))
            {
                
                ht["ID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Specialty", "ID", this.CompyID, ht);
            if (IsOk)
            {
               // ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>window.opener=null;window.open('','_self');window.close();parent.location.reload();layer.msg('保存成功！');</script>");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = document.URL;</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}