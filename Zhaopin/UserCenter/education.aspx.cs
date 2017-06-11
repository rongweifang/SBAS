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
    public partial class education : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string action;
        private string eduid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            this.action = base.Request["action"];
            this.eduid = base.Request["eduid"];
            employee_process.showHtml(2);
            if (!base.IsPostBack)
            {
                this.BindeduType("");
                this.BindeduBack("");
                this.Bindedubatch("");
                this.BindSchool_Area("");
                this.BindDegree("");
                this.BindgradeType("");

                if (this.action == "edit")
                {
                    this.lb_title.Text = "编辑";
                    this.BindEdit();
                }
                else
                {
                    this.lb_title.Text = "新增";
                }
                this.InitData();
            }
        }
        private void InitData()
        {
            DataTable dt = peridal.getEducation();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        }
        private void BindEdit()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Education", "EduID", this.eduid);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);

                this.Is211.Checked = (ht["IS211"].ToString() == "1") ? true : false;
                this.Is985.Checked = (ht["IS985"].ToString() == "1") ? true : false;
                this.isfirst.Checked = (ht["ISFIRST"].ToString() == "1") ? true : false;
                this.IsFullDay.Checked = (ht["ISFULLDAY"].ToString() == "1") ? true : false;
                this.BeginDate.Value = Convert.ToDateTime(ht["BEGINDATE"].ToString()).ToString("yyyy-MM-dd");
                this.EndDate.Value = Convert.ToDateTime(ht["ENDDATE"].ToString()).ToString("yyyy-MM-dd");
            }
        }
        private void BindeduType(string value)
        {
            DataTable dt = peridal.geteduType(value);
            ControlBindHelper.BindHtmlSelect(dt, this.eduType, "NAME", "VALUE", "请选择");
        }
        private void BindeduBack(string value)
        {
            DataTable dt = peridal.geteduBack(value);
            ControlBindHelper.BindHtmlSelect(dt, this.eduBack, "NAME", "VALUE", "请选择");
        }
        private void Bindedubatch(string value)
        {
            DataTable dt = peridal.getedubatch(value);
            ControlBindHelper.BindHtmlSelect(dt, this.edubatch, "NAME", "VALUE", "请选择");
        }
        private void BindDegree(string value)
        {
            DataTable dt = peridal.getDegree(value);
            ControlBindHelper.BindHtmlSelect(dt, this.Degree, "NAME", "VALUE", "请选择");
        }
        private void BindgradeType(string value)
        {
            DataTable dt = peridal.getgradeType(value);
            ControlBindHelper.BindHtmlSelect(dt, this.gradeType, "NAME", "VALUE", "请选择");
        }
        private void BindSchool_Area(string value)
        {
            DataTable dt = peridal.getSchool_Area(value);
            ControlBindHelper.BindHtmlSelect(dt, this.School_Area, "NAME", "VALUE", "请选择");
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            bool havefist = false;
            if (string.IsNullOrEmpty(this.eduid))
            {
                DataTable dt = peridal.getEducation();
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count >= 5)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最多只能上传5条学习经历！');</script>");
                        return;
                    }
                }
            }

            if (string.IsNullOrEmpty(this.SchoolID.Value) || this.SchoolID.Value == "0")
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择院校！');</script>");
                return;
            }
            //if (string.IsNullOrEmpty(this.eduType.Value))
            //{
            //    return;
            //}
            if (string.IsNullOrEmpty(this.BeginDate.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择入学时间！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.EndDate.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择毕业时间！');</script>");
                return;
            }
            DateTime dtbegin = Convert.ToDateTime(this.BeginDate.Value);
            DateTime dtend = Convert.ToDateTime(this.EndDate.Value);
            if (DateTime.Compare(dtbegin, dtend) > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('入学时间不能早于毕业时间！');</script>");
                return;
            }

            DataTable dtfirst = peridal.getFirstEducation(this.eduid);
            bool isexist = DataTableHelper.IsExistRows(dtfirst);
            if (this.isfirst.Checked)
            {
                //比较预计毕业时间
                //判断只能有一条最高学历
                if (isexist)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最高学历只有一个！');</script>");
                    return;
                }
                else
                {
                    DateTime dtmold = Convert.ToDateTime(peridal.GetUserInfo().Rows[0]["gradDate"].ToString());
                    DateTime dtmnew = Convert.ToDateTime(this.EndDate.Value);
                    if (DateTime.Compare(dtmold, dtmnew) != 0)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('预计毕业时间和个人信息中预计毕业时间不符！');</script>");
                        return;
                    }
                }
                havefist = true;
            }
            else
            {
                if (isexist)
                {
                    havefist = true;
                }
                else
                {
                    havefist = false;
                }
            }
            if (string.IsNullOrEmpty(this.eduType.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择学习形式！');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.eduBack.Value))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择学历！');</script>");
                return;
            }

           

            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["USER_ID"] = RequestSession.GetSessionUser().UserId.ToString();
            if (!this.isfirst.Checked)
            {
                ht["ISFIRST"] = 0;
            }
            if (!this.Is985.Checked)
            {
                ht["IS985"] = 0;
            }
            if (!this.Is211.Checked)
            {
                ht["IS211"] = 0;
            }
            if (!this.IsFullDay.Checked)
            {
                ht["ISFULLDAY"] = 0;
            }
            //ht["IS985"] = this.Is985.Checked ? 1 : 0;
            //ht["ISFIRST"] = this.isfirst.Checked ? 1 : 0;
            //ht["IS211"] = this.Is211.Checked ? 1 : 0;
            //ht["ISFULLDAY"] = this.IsFullDay.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(this.eduid))
            {
                ht["MODIFYDATE"] = DateTime.Now.ToString();
            }
            else
            {
                ht["EDUID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Education", "EduID", this.eduid, ht);
            if (IsOk)
            {
                if (havefist)
                {
                    peridal.ChangeStepT("step2");
                }
                else
                {
                    peridal.ChangeStepF("step2");
                }

                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = '/UserCenter/education.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }

        protected void rp_Item_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                System.Web.UI.WebControls.Label Lb_isfirst = e.Item.FindControl("Lb_isfirst") as System.Web.UI.WebControls.Label;
                if (Lb_isfirst != null)
                {
                    string text = Lb_isfirst.Text;
                    text = text.Replace("1", "是");
                    text = text.Replace("0", "否");
                    Lb_isfirst.Text = text;
                }
            }
        }

       

    }
}