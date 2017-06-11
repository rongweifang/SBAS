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
using System.Windows.Forms;

namespace Zhaopin.UserCenter
{
    public partial class award : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string awardID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.awardID = base.Request["ID"];
            if (!this.IsPostBack)
            {
                employee_process.showHtml(7);
                this.BindAwardLevel("");
                initData();

                if (!string.IsNullOrEmpty(this.awardID))
                {
                    this.lb_title.Text = "编辑";
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Award", "AwardID", this.awardID);
                    if (ht.Count > 0 && ht != null)
                    {
                        ControlBindHelper.SetWebControls(this.Page, ht);
                        this.GetDate.Value = Convert.ToDateTime(ht["GETDATE"].ToString()).ToString("yyyy-MM-dd");
                    }
                }
            }
        }
        private void BindAwardLevel(string value)
        {
            DataTable dt = peridal.getAwardLevel(value);
            ControlBindHelper.BindHtmlSelect(dt, this.AwardLevel, "NAME", "VALUE", "请选择");
        }

        public void initData()
        {
            DataTable dt = peridal.GetAward();
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
            if (string.IsNullOrEmpty(this.AwardName.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.AwardLevel.Value))
            {
                return;
            }
            if (string.IsNullOrEmpty(this.GetDate.Value))
            {
                return;
            }
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();


            if (string.IsNullOrEmpty(this.awardID))
            {
                DataTable dt = peridal.GetAward();
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count >= 5)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最多只能上传5条记录！');</script>");
                        return;
                    }
                }
                ht["AWARDID"] = CommonHelper.GetGuid;
            }

            if (this.AwardUrl.HasFile)
            {
                string filename = this.AwardUrl.FileName;
                string result = UploadHelper.UserFileUpload(this.AwardUrl, ref filename);
                if (result.Equals("上传成功"))
                {
                    // ht["AWARDSIZE"] = this.AwardUrl.PostedFile.ContentLength / 1024;
                    ht["AWARDURL"] = peridal.GetUserWebPath() + filename;
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('" + result + "！');</script>");
                   // MessageBox.Show("附件上传失败");
                    return;
                }
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Award", "AwardID", this.awardID, ht);
            if (IsOk)
            {
                peridal.ChangeStepT("step7");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = document.URL;</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}