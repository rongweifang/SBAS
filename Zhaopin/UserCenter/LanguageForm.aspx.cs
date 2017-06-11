using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetData;
using Common.DotNetFile;
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
    public partial class LanguageForm : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string LangID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.LangID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                this.BindLanguageName("");
                this.BindLanguageLevel("");
                if (!string.IsNullOrEmpty(this.LangID))
                {
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Language", "ID", this.LangID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                        this.GetDate.Value = Convert.ToDateTime(ht["GETDATE"].ToString()).ToString("yyyy-MM-dd");
                    }
                }
            }
        }
        private void BindLanguageName(string value)
        {
            DataTable dt = peridal.getLanguageName(value);
            ControlBindHelper.BindHtmlSelect(dt, this.LanguageName, "NAME", "VALUE", "请选择");
        }
        private void BindLanguageLevel(string value)
        {
            DataTable dt = peridal.getLanguageLevel(value);
            ControlBindHelper.BindHtmlSelect(dt, this.LanguageLevel, "NAME", "VALUE", "请选择");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();

            if (string.IsNullOrEmpty(this.LanguageName.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择语种名称！');</script>");
                return;
            }
            if (this.LanguageName.Value.Equals("1"))
            {
                if (string.IsNullOrEmpty(this.LanguageLevel.Value))
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择外语水平级别！');</script>");
                    return;
                }
            }
            if (!((this.LanguageLevel.Value=="99") ||(this.LanguageLevel.Value=="90")))
            {
                if (string.IsNullOrEmpty(this.GetDate.Value))
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择证书获得时间！');</script>");
                    return;
                }
                if (string.IsNullOrEmpty(this.Certbody.Value))
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请填写认证机构！');</script>");
                    return;
                }
            }

            if (string.IsNullOrEmpty(this.LangID))
            {
                DataTable dt = peridal.GetLanguage();
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

            if (this.FileUpload1.HasFile)
            {
                string filename = this.FileUpload1.FileName;
                string result = UploadHelper.UserFileUpload(this.FileUpload1, ref filename);
                if (result.Equals("上传成功"))
                {
                    ht["CERTSIZE"] = this.FileUpload1.PostedFile.ContentLength / 1024;
                    ht["CERTFILEPATH"] = peridal.GetUserWebPath() + filename;
                }
                else
                {
                    // MessageBox.Show("附件上传失败");
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('附件上传失败！');</script>");
                    return;
                }
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Language", "ID", this.LangID, ht);
            if (IsOk)
            {
                peridal.ChangeStepT("step3");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>window.opener=null;window.open('','_self');window.close();parent.location.reload();layer.msg('保存成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}