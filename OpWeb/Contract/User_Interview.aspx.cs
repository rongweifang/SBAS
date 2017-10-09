using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class User_Interview : System.Web.UI.Page
    {
        private string UID;
        public string Card_Name;
        public string M_CreditType;
        public string M_Use;
        public string M_GuaranteeType;
        public string M_Source;
        private bool IsExist = false;
        private string key;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            this.InitData();
            IsExist = DataFactory.SqlDataBase().IsExist("User_Interview", "UID", UID) > 0 ? true : false;

            if (!IsPostBack)
            {
                if (IsExist)
                {
                    BindData();
                }
            }
           
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_OneCard", "UID", UID);
            Card_Name = ht["CARD_NAME"].ToString();
            M_CreditType = ht["M_CREDITTYPE"].ToString();
            M_Use = ht["M_USE"].ToString();
            M_GuaranteeType = ht["M_GUARANTEETYPE"].ToString();
            M_Source = ht["M_SOURCE"].ToString();


            // bool isexist = DataFactory.SqlDataBase().IsExist("");
        }
        private void BindData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("User_Interview", "UID", UID);
            if (ht.Count>0)
            {
                if (!string.IsNullOrEmpty(ht["UV_DATE"].ToString()))
                {
                    DateTime NewDate;
                    NewDate = DateTime.Parse(ht["UV_DATE"].ToString());
                    ht["UV_DATE"] = NewDate.ToString("yyyy-MM-dd");
                }

                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht = ControlBindHelper.GetWebControls(this.Page);
            if (IsExist)
            {
                key = this.UID;
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["ModifyDate"] = DateTime.Now.ToString();
            }
            else
            {
                ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["UID"] = UID;
            }

            if (string.IsNullOrEmpty(this.UV_Date.Value.Trim()) || string.IsNullOrEmpty(this.UV_Address.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("User_Interview", "UID", this.key, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}