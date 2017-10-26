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

namespace OpWeb.Contract
{
    public partial class Contract_LDZJMGInfoForm1 : System.Web.UI.Page
    {
        //private string action;
        //private string PEID;
        public string UID;
        private string _key;
        bool IsEdit = false;
        protected void Page_Load(object sender, EventArgs e)
        {

            this._key = base.Request["UID"];
            IsEdit = DataFactory.SqlDataBase().IsExist("Pledge_Estate", "UID", this._key) > 0 ? true : false;
            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    if (IsEdit)
                    {
                        this.InitData();
                    }
                    else
                    {
                        this.InitDefaultData();
                    }
                }
            }

            //if (string.IsNullOrEmpty(base.Request["UID"]))
            //{
            //    return;
            //}
            //this.UID = base.Request["UID"];

            //this.action = base.Request["action"];
            //this.PEID = base.Request["PEID"];
            //if (!base.IsPostBack)
            //{
            //    if (this.action == "edit")
            //    {
            //        //this.lb_title.Text = "编辑";
            //        this.BindEdit();
            //    }
            //    else
            //    {
            //        //this.lb_title.Text = "新增";
            //    }
            //    this.InitData();
            //}
        }
        private void InitDefaultData()
        {
            Hashtable ht= DataFactory.SqlDataBase().GetHashtableById("Contract_LDZJ", "UID", this._key);
            this.PE_Pledgor.Value = ht["MG_NAME1"].ToString();
            this.PE_User.Value = ht["MG_NAME1"].ToString();
            this.PE_Name.Value = ht["MG_PAWN1"].ToString();
            this.PE_Preserver.Value = ht["MG_NAME1"].ToString();
            this.PE_HPlace.Value = ht["MG_ADDRESS1"].ToString(); 
            this.PE_LPlace.Value = ht["MG_ADDRESS1"].ToString(); 
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Pledge_Estate", "UID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }

        //private void InitData()
        //{
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append("SELECT * FROM Pledge_Estate WHERE UID=@UID");
        //    SqlParam[] para = new SqlParam[] { new SqlParam("@UID", UID) };
        //    DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, para);
        //    ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        //}
        //private void BindEdit()
        //{
        //    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Pledge_Estate", "PEID", this.PEID);
        //    if (ht.Count > 0 && ht != null)
        //    {
        //        ControlBindHelper.SetWebControls(this.Page, ht);
        //    }
        //}
        protected void btn_save_Click(object sender, EventArgs e)
        {
            

            //Hashtable ht = new Hashtable();
            //ht = ControlBindHelper.GetWebControls(this.Page);

            //if (string.IsNullOrEmpty(this.PEID))
            //{
            //    StringBuilder sb = new StringBuilder();
            //    sb.Append("SELECT * FROM Pledge_Estate WHERE UID=@UID");
            //    SqlParam[] para = new SqlParam[] { new SqlParam("@UID", UID) };
            //    DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, para);
            //    if (DataTableHelper.IsExistRows(dt))
            //    {
            //        if (dt.Rows.Count >= 5)
            //        {
            //            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('最多只能上传5条！');</script>");
            //            return;
            //        }
            //    }
            //}
            //if (!string.IsNullOrEmpty(this.PEID))
            //{
            //    ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            //    ht["ModifyDate"] = DateTime.Now.ToString();
            //}
            //else
            //{
            //    ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
            //    ht["UID"] = UID;
            //}

            //bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Pledge_Estate", "PEID", this.PEID, ht);
            //if (IsOk)
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！'); window.location.href = '/Contract/Contract_LDZJMGInfoForm1.aspx?UID=" + UID + "';</script>");
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            //}
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (!IsEdit)
            {
                ht["PEID"] = this._key;
            }
            string id = IsEdit ? this._key : "";
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Pledge_Estate", "UID", id, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','2000');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}