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
    public partial class Contract_LDZJPGInfoForm1 : System.Web.UI.Page
    {
        private string action;
        private string PSID;
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
            this.PSID = base.Request["PSID"];
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
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * FROM Pledge_Security WHERE UID=@UID");
            SqlParam[] para = new SqlParam[] { new SqlParam("@UID", UID) };
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, para);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        }
        private void BindEdit()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Pledge_Security", "PSID", this.PSID);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this.PSID))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("SELECT * FROM Pledge_Security WHERE UID=@UID");
                SqlParam[] para = new SqlParam[] { new SqlParam("@UID", UID) };
                DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, para);
                if (DataTableHelper.IsExistRows(dt))
                {
                    if (dt.Rows.Count >= 5)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最多只能上传5条！');</script>");
                        return;
                    }
                }
            }
            if (!string.IsNullOrEmpty(this.PSID))
            {
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["ModifyDate"] = DateTime.Now.ToString();
            }
            else
            {
                ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["UID"] = UID;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Pledge_Security", "PSID", this.PSID, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = '/Contract/Contract_LDZJPGInfoForm1.aspx?UID=" + UID + "';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}