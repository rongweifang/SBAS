using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetData;
using Common.DotNetUI;
using Busines;
using Busines.DAL;
using Busines.IDAO;

namespace OpWeb.Contract
{
    public partial class User_GuaranteeForm1 : System.Web.UI.Page
    {
        private string action;
        private string UGID;
        public string UID;
        private Contract_IDAO ciDal = new Contract_Dal();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];

            this.action = base.Request["action"];
            this.UGID = base.Request["UGID"];
            if (!base.IsPostBack)
            {
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
            //StringBuilder sb = new StringBuilder();
            //sb.Append("SELECT * FROM User_Guarantee WHERE UID=@UID");
            //SqlParam[] para = new SqlParam[] { new SqlParam("@UID", UID) };
            //DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, para);
            DataTable dt = ciDal.GetUserGuaranteeByUID(UID);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        }
        private void BindEdit()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("User_Guarantee", "UGID", this.UGID);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this.UGID))
            {
                DataTable dt = ciDal.GetUserGuaranteeByUID(UID);
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count >= 5)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最多只能上传5条！');</script>");
                        return;
                    }
                }
            }
            if (!string.IsNullOrEmpty(this.UGID))
            {
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["ModifyDate"] = DateTime.Now.ToString();
            }
            else
            {
                ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["UID"] = UID;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("User_Guarantee", "UGID", this.UGID, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = '/Contract/User_GuaranteeForm1.aspx?UID="+UID+"';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}