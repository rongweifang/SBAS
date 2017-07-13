using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class User_Guardian2 : System.Web.UI.Page
    {
        private string Card_ID;
        private string _key;
        public string LoadJs = string.Empty;
        private const string DataSql = "(SELECT * FROM Base_User_Guarantee WHERE Ord=2) G";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["Card_ID"]))
            {
                return;
            }
            this.Card_ID = base.Request["Card_ID"];

            _key = DataFactory.SqlDataBase().IsExist(DataSql, "Card_ID", this.Card_ID) > 0 ? Card_ID : "";
            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this.Card_ID))
                {
                    if (!string.IsNullOrEmpty(this._key))
                    {
                        this.InitData();
                        LoadJs = "";
                    }
                    else
                    {
                        LoadJs = "onload=\"Load()\" onunload=\"Unload()\"";
                    }
                }
            }
        }
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById(DataSql, "Card_ID", this.Card_ID);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }
        private bool SaveData()
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this.UG_Card_ID.Value.Trim()) || string.IsNullOrEmpty(this.Card_ID) || string.IsNullOrEmpty(this.UG_Card_Name.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return false;
            }

            if (!string.IsNullOrEmpty(this._key))
            {
                ht.Remove("UG_CARD_ID");
                ht.Remove("UG_CARD_NAME");
                ht["ModifyDate"] = DateTime.Now.ToString();
            }
            else
            {
                ht["Ord"] = 2;
                ht["Card_Id"] = this.Card_ID;
            }
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Base_User_Guarantee", "Card_ID", this._key, ht);
            if (IsOk)
            {
                // string Url = PageHelper.UrlEncrypt(this.Card_ID);
                //  ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>self.location='User_Guardian2.aspx?Card_ID=" + Url + "';</script>");
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！')</script>");
                return true;

            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
                return false;
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            SaveData();
        }
    }
}