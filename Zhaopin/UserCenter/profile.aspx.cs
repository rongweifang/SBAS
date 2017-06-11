using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
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
    public partial class profile : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            if (!this.IsPostBack)
            {
                employee_process.showHtml(1);
                this.Bindpolity("01");
                this.BindNation("");
                this.Bindmarriage("");
                this.Bindgradtype("");
                this.InitData();
            }
        }

        private void Bindpolity(string value)
        {
            DataTable dt = peridal.getpolity(value);
            ControlBindHelper.BindHtmlSelect(dt, this.polity, "name", "value", "请选择");

        }
        private void BindNation(string value)
        {
            DataTable dt = peridal.getNation(value);
            ControlBindHelper.BindHtmlSelect(dt, this.Nation, "name", "value", "请选择");
        }
        private void Bindmarriage(string value)
        {
            DataTable dt = peridal.getmarriage(value);
            ControlBindHelper.BindHtmlSelect(dt, this.marriage, "name", "value", "请选择");
        }
        private void Bindgradtype(string value)
        {
            DataTable dt = peridal.getgradtype(value);
            ControlBindHelper.BindHtmlSelect(dt, this.gradtype, "name", "value", "请选择");
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Step1", "User_ID", RequestSession.GetSessionUser().UserId.ToString());
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
                if (!string.IsNullOrEmpty(ht["GRADDATE"].ToString()))
                {
                    this.gradDate.Value = Convert.ToDateTime(ht["GRADDATE"].ToString()).ToString("yyyy-MM-dd");
                    if (string.IsNullOrEmpty(ht["HEADPHOTO"].ToString().Trim()))
                    {
                        this.blogimgsees.Src = "/themes/default/images/me_icon_04.gif";
                        
                    }
                    else
                    {
                        this.blogimgsees.Src = ht["HEADPHOTO"].ToString().Trim();
                    }
                }
                if (ht["HEALTHY"].ToString().Equals("1"))
                {
                    this.healthy.Checked = true;
                }
                else
                {
                    this.healthy.Checked = false;
                }
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            //gradDate

            //  ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('注册失败，请刷新本页面重新注册！');</script>");
            if (string.IsNullOrEmpty(this.z00hrsyd.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择生源地！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.gradDate.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择（预计）毕业时间！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.gradtype.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择毕业生类型！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.Nation.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择生民族！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.marriage.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择婚姻状况！');</script>");
                return;
            }

            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["STEP1"] = "1";
            ht["HEALTHY"] = this.healthy.Checked ? "1" : "0";
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("View_Step1", "User_ID", RequestSession.GetSessionUser().UserId.ToString(), ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = '/UserCenter/education.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
     
    }
}