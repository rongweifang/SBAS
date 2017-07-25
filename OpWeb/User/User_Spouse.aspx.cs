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
    public partial class User_Spouse : System.Web.UI.Page
    {
        private string Card_ID;
        private string _key;
        public string LoadJs = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["Card_ID"]))
            {
                return;
            }
            this.Card_ID = base.Request["Card_ID"];
            _key = DataFactory.SqlDataBase().IsExist("Base_User_Spouses", "Card_ID", this.Card_ID) > 0 ? Card_ID : "";
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
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Base_User_Spouses", "Card_ID", this.Card_ID);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this.US_Card_ID.Value.Trim()) || string.IsNullOrEmpty(this.Card_ID) || string.IsNullOrEmpty(this.US_Card_Name.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
           
            if (!string.IsNullOrEmpty(this._key))
            {
                ht["ModifyDate"] = DateTime.Now.ToString();
            }
            else
            {
                ht["Card_Id"] = this.Card_ID;
            }
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Base_User_Spouses", "Card_ID", this._key, ht);
            if (IsOk)
            {
               // string Url = PageHelper.UrlEncrypt(this.Card_ID);
               ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>self.location='User_Spouse2.aspx?Card_ID=" + this.Card_ID + "';</script>");
               // ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','2000');</script>");

            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('操作失败！');</script>");
            }
        }
    }
}