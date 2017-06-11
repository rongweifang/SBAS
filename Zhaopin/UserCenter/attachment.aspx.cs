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
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Zhaopin.UserCenter
{
    public partial class attachment : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string AttaID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.AttaID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                employee_process.showHtml(8);
                this.BindAttachmentType("");
                initData();

                if (!string.IsNullOrEmpty(this.AttaID))
                {
                    this.lb_title.Text = "编辑";
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Attachment", "AttaID", this.AttaID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                    }
                }
            }
        }

        private void BindAttachmentType(string value)
        {
            DataTable dt = peridal.getAttachmentType(value);
            ControlBindHelper.BindHtmlSelect(dt, this.AttachmentType, "NAME", "VALUE", "请选择");
        }

        public void initData()
        {
            DataTable dt = peridal.GetAttachment();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            if (DataTableHelper.IsExistRows(dt))
            {
                if (dt.Rows.Count  >= 10)
                {
                    this.Button1.Enabled = false;
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.AttachmentType.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择附件类型！');</script>");
               // MessageBox.Show("请选择附件类型");
                return;
            }
            StringBuilder str = new StringBuilder();
            


            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();

            if (peridal.ExistAttaIDCard(RequestSession.GetSessionUser().UserId.ToString()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('每人只能上传一次身份证扫描件，如果上传错误，请先删除后再上传！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.AttaID))
            {
                DataTable dt = peridal.GetAttachment();
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count >= 10)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('每人最多只能上传10个附件！');</script>");
                        //MessageBox.Show("每人最多只能上传10个附件");
                        return;
                    }
                }
                ht["ATTAID"] = CommonHelper.GetGuid;

                if (!this.FileUpload1.HasFile)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择要上传的文件！');</script>");
                   // MessageBox.Show("请选择要上传的文件");
                    return;
                }
            }
            if (this.FileUpload1.HasFile)
            {
                string filename = this.FileUpload1.FileName;
                string result = UploadHelper.UserFileUpload(this.FileUpload1, ref filename);
                if (result.Equals("上传成功"))
                {
                    ht["ATTASIZE"] = this.FileUpload1.PostedFile.ContentLength / 1024;
                    ht["ATTAPATH"] = peridal.GetUserWebPath() + filename;
                }
                else
                {
                    // MessageBox.Show("附件上传失败");
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('附件上传失败！');</script>");
                    return;
                }
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Attachment", "AttaID", this.AttaID, ht);
            if (IsOk)
            {
                peridal.ChangeStepT("step8");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = document.URL;</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}